---
name: "project-conventions"
description: "Core conventions and patterns for this codebase"
domain: "project-conventions"
confidence: "medium"
source: "template"
---

## Context

Jekyll blog hosted on GitHub Pages. Content-focused repo with squad-based AI agent workflow.

## Patterns

### Content Workflow

- All post ideas tracked as GitHub Issues with labels (status, category, priority)
- Pipeline: `idea` → `researched` → `writing` → `in-review` → `ready-to-publish` → `published`
- Research briefs produced before drafting; drafts reviewed before publishing

### Branching & PRs

- Never commit directly to `main`
- Branch naming: `post/{slug}` for posts, `fix/{desc}` for fixes, `feat/{desc}` for features
- PRs reference the GitHub Issue they address
- Content PRs reviewed by Monica (quality) and Gilfoyle (technical)

### File Structure

- `_posts/` — Blog posts (`YYYY-MM-DD-slug.md`)
- `_layouts/` — Jekyll layouts (default, post, page, home, ai-usecase)
- `_includes/` — Reusable template partials
- `_plugins/` — Jekyll plugins
- `assets/images/` — Images
- `.squad/` — Squad agent configs, research, decisions

### Front Matter

```yaml
---
layout: post
title: "Post Title Here"
date: YYYY-MM-DD 12:00:00 -0000
categories: category1 category2
tags: [tag1, tag2, tag3]
excerpt: "A one-sentence summary for social sharing and RSS."
---
```

### Writing Style

- See `.squad/style-guide.md` for full editorial guidelines
- Voice: approachable, conversational, first-person singular
- Models: Joel Spolsky, Jeff Atwood, Scott Hanselman
- Link generously — internal cross-links and external citations
- Humor welcome but must land with humans

### Dependencies

- GitHub Pages compatible plugins only: jekyll-feed, jekyll-sitemap, jekyll-seo-tag
- Theme: minima
- Dependabot PRs merged promptly

## Anti-Patterns

- **Committing to main** — All changes go through branches and PRs.
- **Orphaned content** — No dead links, broken images, or unused files.
- **Corporate speak** — Never "In this blog post, we will explore..."
- **Fabricated sources** — If you can't verify it, don't cite it.
- **Ignoring Dependabot** — Stale dependency PRs are a security risk.
