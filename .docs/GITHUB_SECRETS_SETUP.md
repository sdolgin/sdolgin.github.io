# GitHub Secrets Setup for Application Insights

To enable Application Insights tracking in your GitHub Pages deployment, you need to configure repository secrets.

## Setting Up GitHub Secrets

1. Go to your GitHub repository
2. Click on **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add each of the following secrets:

### Required Secrets

| Secret Name | Value |
|------------|-------|
| `APPINSIGHTS_CONNECTION_STRING` | Your Application Insights connection string |
| `APPINSIGHTS_INSTRUMENTATION_KEY` | Your Application Insights instrumentation key |
| `APPINSIGHTS_WORKSPACE` | Your Application Insights workspace name |

### Example Values

```
APPINSIGHTS_CONNECTION_STRING="InstrumentationKey=your-key;IngestionEndpoint=your-endpoint;LiveEndpoint=your-live-endpoint;ApplicationId=your-app-id"

APPINSIGHTS_INSTRUMENTATION_KEY="your-instrumentation-key"

APPINSIGHTS_WORKSPACE="your-workspace-name"
```

## How It Works

1. **Secure by Default**: If secrets are not configured, the site builds without analytics (graceful fallback)
2. **Production Ready**: Secrets are only used in the production GitHub Actions build
3. **No Local Impact**: Local development uses `_config.local.yml` (not committed to git)

## Verification

After setting up the secrets:

1. Push changes to the `main` branch
2. Go to **Actions** tab in your repository
3. Watch the "Deploy Jekyll with GitHub Pages" workflow
4. Check that the "Create production config" step shows: "Creating production Application Insights configuration..."
5. Once deployed, view your site's source code to verify Application Insights tracking is present

## Troubleshooting

- **Workflow shows warning**: This is normal if secrets aren't set yet - the site will build without analytics
- **Analytics not working**: Check that all three secrets are set with correct values
- **Build fails**: Verify the secret values don't contain special characters that need escaping
