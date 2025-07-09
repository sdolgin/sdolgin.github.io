# Giscus Comments Setup Guide

This Jekyll blog now supports Giscus comments, a modern commenting system that uses GitHub Discussions as the backend.

## Prerequisites

1. Your repository must have GitHub Discussions enabled
2. The Giscus app must be installed on your repository
3. You need to configure the Giscus settings in `_config.yml`

## Step-by-Step Setup

### 1. Enable GitHub Discussions

1. Go to your repository on GitHub
2. Click on **Settings** tab
3. Scroll down to **Features** section
4. Check the **Discussions** checkbox

### 2. Install Giscus App

1. Visit [giscus.app](https://giscus.app/)
2. Enter your repository in the format `owner/repo` (e.g., `sdolgin/sdolgin.github.io`)
3. Follow the configuration wizard to get your settings
4. Install the Giscus app on your repository when prompted

### 3. Configure Giscus in _config.yml

Edit the `_config.yml` file and update the Giscus section:

```yaml
giscus:
  enabled: true  # Set to true to enable comments
  repository: "your-username/your-repo"  # Your GitHub repository
  repository_id: "R_your_repo_id"  # From Giscus setup (optional but recommended)
  category: "General"  # Discussion category name
  category_id: "DIC_your_category_id"  # From Giscus setup (optional but recommended)
  mapping: "pathname"  # How to map pages to discussions
  strict: "0"  # Use strict title matching
  reactions_enabled: "1"  # Enable reactions
  emit_metadata: "0"  # Emit discussion metadata
  input_position: "bottom"  # Comment input position
  theme: "preferred_color_scheme"  # Theme
  lang: "en"  # Language
  loading: "lazy"  # Loading mode
```

### 4. Configuration Options

- **repository**: Your GitHub repository in format "owner/repo"
- **repository_id**: Repository ID from Giscus (optional but recommended for security)
- **category**: Name of the Discussion category to use
- **category_id**: Category ID from Giscus (optional but recommended for security)
- **mapping**: How to map pages to discussions:
  - `pathname` (recommended): Use page pathname
  - `url`: Use page URL
  - `title`: Use page title
  - `og:title`: Use page Open Graph title
- **theme**: Comment widget theme:
  - `preferred_color_scheme` (recommended): Follows user's system preference
  - `light`: Light theme
  - `dark`: Dark theme
  - Many other themes available

### 5. Test Your Setup

1. Build your site locally: `bundle exec jekyll serve`
2. Navigate to any blog post
3. Check that the comments section appears at the bottom
4. Verify that comments can be posted and displayed

## Customization

The comments will appear at the bottom of every blog post. The styling will automatically match your site's theme when using `preferred_color_scheme`.

## Privacy and Moderation

- Comments are stored in GitHub Discussions
- Users must have a GitHub account to comment
- You can moderate comments through GitHub Discussions interface
- Privacy-friendly: No third-party tracking beyond GitHub's standard practices

## Troubleshooting

- Ensure GitHub Discussions are enabled on your repository
- Verify that the Giscus app is installed and has proper permissions
- Check that your repository and category names are correct
- Make sure your repository is public (Giscus requires public repositories)