# Personal Blog

A Jekyll-powered personal blog hosted on GitHub Pages.

## About

This is a personal blog built with Jekyll, featuring:

- Clean, responsive design using the Minima theme
- Blog post management with categories and tags
- About page
- SEO optimization
- RSS feed
- Social media integration

## Local Development

To run this site locally:

1. **Install dependencies:**
   ```bash
   bundle install
   ```

2. **Serve the site:**
   ```bash
   bundle exec jekyll serve
   ```

3. **View the site:**
   Open your browser to `http://localhost:4000`

## Writing Posts

To create a new blog post:

1. Create a new file in the `_posts` directory
2. Name it using the format: `YYYY-MM-DD-title.md`
3. Add YAML front matter at the top:
   ```yaml
   ---
   layout: post
   title: "Your Post Title"
   date: YYYY-MM-DD HH:MM:SS -0000
   categories: category1 category2
   tags: [tag1, tag2, tag3]
   excerpt: "A brief description of your post"
   ---
   ```
4. Write your content in Markdown below the front matter

## Customization

### Site Configuration

Edit `_config.yml` to customize:
- Site title and description
- Author information
- Social media links
- SEO settings

### Styling

Customize the appearance by editing `assets/main.scss` or adding new stylesheets.

### Layouts

Modify the layout files in `_layouts/` to change the structure of your pages.

## Deployment

This site is configured for GitHub Pages. Simply push your changes to the `main` branch, and GitHub Pages will automatically build and deploy your site.

## File Structure

```
├── _config.yml          # Site configuration
├── _posts/              # Blog posts
├── _layouts/            # Page templates
├── _includes/           # Reusable page elements
├── assets/              # CSS, images, etc.
├── index.html           # Homepage
├── about.md             # About page
├── blog.md              # Blog listing page
├── Gemfile              # Ruby dependencies
└── README.md            # This file
```

## Support

If you encounter any issues or have questions, feel free to open an issue on GitHub.

---

Built with ❤️ using Jekyll and GitHub Pages.
