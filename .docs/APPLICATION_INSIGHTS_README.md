# Application Insights Analytics Implementation

This Jekyll site has been configured with Azure Application Insights to provide detailed analytics tracking.

## Configuration

The Application Insights configuration is managed through separate config files for security:

### Local Development
Create a `_config.local.yml` file in the project root (automatically excluded from version control):

```yaml
application_insights:
  connection_string: "InstrumentationKey=your-key;IngestionEndpoint=your-endpoint;LiveEndpoint=your-live-endpoint;ApplicationId=your-app-id"
  instrumentation_key: "your-instrumentation-key"
  workspace: "your-workspace-name"
```

### Required Files
- `_config.yml`: Main configuration (no sensitive data)
- `_config.local.yml`: Local development secrets (gitignored)
- `.env.example`: Template for environment setup

## Usage

### Development
Use the provided development script which automatically loads local configuration:

```bash
./dev-server.sh
```

Or manually specify both config files:

```bash
bundle exec jekyll serve --config _config.yml,_config.local.yml
```

### Production Deployment
For production deployments, use environment-specific config files or CI/CD secrets:

```bash
# Create production config file with your secrets
# Then build with both configs
bundle exec jekyll build --config _config.yml,_config.production.yml
```

### GitHub Actions Example
```yaml
- name: Build site
  run: |
    echo "application_insights:" > _config.production.yml
    echo "  connection_string: \"${{ secrets.APPINSIGHTS_CONNECTION_STRING }}\"" >> _config.production.yml
    echo "  instrumentation_key: \"${{ secrets.APPINSIGHTS_INSTRUMENTATION_KEY }}\"" >> _config.production.yml
    echo "  workspace: \"${{ secrets.APPINSIGHTS_WORKSPACE }}\"" >> _config.production.yml
    bundle exec jekyll build --config _config.yml,_config.production.yml
```

### GitHub Pages Deployment
For GitHub Pages with GitHub Actions, you need to set up repository secrets:

1. Follow the instructions in [`GITHUB_SECRETS_SETUP.md`](GITHUB_SECRETS_SETUP.md)
2. Set up the three required secrets in your repository settings
3. The GitHub Actions workflow will automatically use these secrets for production builds

The workflow includes graceful fallback - if secrets aren't configured, the site builds without analytics.

## Tracking Features

### Page Views
- **Granular Tracking**: Each blog post is tracked individually with unique identifiers
- **Page Types**: Differentiates between blog posts, pages, and home page
- **Metadata**: Captures title, URL, categories, author, and publication date

### Blog Post Analytics
- **Individual Post Views**: Track views for each specific blog post
- **Reading Progress**: Tracks when users reach 25%, 50%, 75%, and 100% of content
- **Time on Page**: Measures engagement duration
- **Author Attribution**: Links views to specific authors

### User Engagement
- **Internal Navigation**: Tracks clicks between pages on your site
- **External Link Clicks**: Monitors clicks to external websites
- **Link Context**: Captures link text and source page information

### Error Tracking
- **JavaScript Errors**: Automatically captures client-side errors
- **Unhandled Promise Rejections**: Tracks async operation failures
- **Error Context**: Includes page information and error details

## Data Structure

### Page View Events
```javascript
{
  name: "Page Title",
  uri: "/page/path",
  properties: {
    pageType: "blog-post|page|home",
    pageTitle: "Actual Page Title",
    pageUrl: "/page/url",
    // For blog posts only:
    postTitle: "Blog Post Title",
    postDate: "2025-07-09",
    postCategories: "category1,category2",
    author: "Author Name"
  }
}
```

### Custom Events
- `ReadingProgress`: Blog post reading milestones
- `TimeOnPage`: Time spent on each page
- `InternalNavigation`: Navigation between site pages
- `ExternalLinkClick`: Clicks to external sites

## Azure Application Insights Dashboard

You can view your analytics data in the Azure portal:
1. Navigate to your Application Insights resource
2. Use the connection string provided above to identify your resource
3. View telemetry in real-time or create custom dashboards

## Querying Data

Use KQL (Kusto Query Language) to analyze your data:

```kql
// Most viewed blog posts in the last 30 days
pageViews
| where timestamp > ago(30d)
| where customDimensions.pageType == "blog-post"
| summarize Views = count() by PostTitle = tostring(customDimensions.postTitle)
| order by Views desc

// Reading completion rates
customEvents
| where name == "ReadingProgress"
| where timestamp > ago(7d)
| summarize count() by ProgressPercent = toint(customDimensions.progressPercent), PostTitle = tostring(customDimensions.postTitle)
| order by PostTitle, ProgressPercent

// Average time spent on blog posts
customEvents
| where name == "TimeOnPage"
| where customDimensions.pageType == "blog-post"
| where timestamp > ago(30d)
| summarize AvgTimeSeconds = avg(toint(customDimensions.timeSpentSeconds)) by PostTitle = tostring(customDimensions.postTitle)
| order by AvgTimeSeconds desc
```

## Implementation Details

The tracking is implemented through:
- `_includes/application-insights.html`: Main tracking script
- `_includes/head.html`: Includes the tracking script in all pages
- `_config.yml`: Configuration storage

The implementation follows Azure best practices:
- Uses the official Application Insights JavaScript SDK
- Implements proper error handling
- Separates configuration from code
- Provides granular, actionable analytics data
