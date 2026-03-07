# Site Review Findings — Gilfoyle

**Date:** 2025-07-10
**Scope:** Security, reliability, and App Insights audit of sdolgin.github.io
**Related Issue:** #24

---

## Security Findings

### ✅ No Secrets in Repo
- `_config.yml` contains no credentials — only Giscus public IDs (not secrets)
- `.env.example` has placeholder values only
- `_plugins/environment.rb` is a stub — does nothing
- `.gitignore` correctly excludes `.env.local`, `.env.production`, `_config_secrets.yml`, `_config.local.yml`, `_config.production.yml`
- GitHub Secrets (`APPINSIGHTS_CONNECTION_STRING`, `APPINSIGHTS_INSTRUMENTATION_KEY`, `APPINSIGHTS_WORKSPACE`) are properly configured and injected at build time

### ✅ Giscus Configuration
- Uses public repo/category IDs (not secrets)
- `crossorigin="anonymous"` is set
- Lazy loading enabled
- No security concerns

### ⚠️ App Insights Connection String in Client HTML
- The full connection string (including InstrumentationKey) is rendered in the live HTML
- This is **by design** — App Insights is a client-side SDK, the key enables write-only telemetry
- Microsoft documents this as expected behavior. Not a vulnerability, but worth noting.

### 🔶 Stale Dependabot Branches (4)
- `dependabot/bundler/faraday-2.14.1`
- `dependabot/bundler/nokogiri-1.19.1`
- `dependabot/bundler/rexml-3.4.2`
- `dependabot/bundler/uri-1.0.4`
- PRs are closed but branches remain. Should be pruned per DEC-002.

**Severity: LOW.** No active vulnerabilities found. Housekeeping items only.

---

## Reliability Findings

### ✅ Live Site
- Homepage, blog posts, AI use cases, about page all load correctly
- Sitemap at `/sitemap.xml` is valid — 10 URLs indexed
- RSS feed at `/feed.xml` is valid Atom feed
- SEO tags present: Open Graph, Twitter cards, JSON-LD structured data, canonical URLs

### ✅ Deployment Pipeline
- `jekyll-gh-pages.yml` is well-configured: checkout → setup → build with production overlay → deploy
- Concurrency controls prevent overlapping deployments
- Permissions are minimal (contents: read, pages: write, id-token: write)
- Graceful fallback if App Insights secrets are missing

### ✅ GitHub Pages Compatibility
- Uses `github-pages` gem (correct)
- Plugins are all GH Pages compatible: jekyll-feed, jekyll-sitemap, jekyll-seo-tag
- Theme: minima (supported)

**Severity: NONE.** Site is healthy and deploying correctly.

---

## Application Insights Status

**Verdict: OPERATIONAL but with misleading documentation and dead code.**

### What Works
- Secrets are set in GitHub → workflow generates `_config.production.yml` → Jekyll merges it → Liquid conditional renders the SDK → telemetry should be flowing to East US App Insights resource

### What's Broken
1. `_plugins/environment.rb` is dead code (comment-only file)
2. `_config.yml` comments claim the plugin loads env vars — it doesn't
3. `dotenv` gem in Gemfile serves no purpose if the plugin is unused
4. The `_config.production.yml` heredoc in the workflow may have indentation issues

### Filed
Issue #24 tracks the cleanup and verification work.

---

## Recommended Next Actions

1. **Prune stale Dependabot branches** — `git push origin --delete dependabot/bundler/*` (4 branches)
2. **Fix App Insights docs** — correct `_config.yml` comments, decide fate of `environment.rb` (#24)
3. **Verify telemetry** — confirm data is arriving in Azure Monitor portal
4. **Consider security headers** — no custom headers are configured (e.g., CSP, X-Frame-Options). GitHub Pages provides some defaults, but a `_headers` file or meta tags could harden the site further. Low priority for a blog.

---

**Decision:** No blocking issues found. Site is secure and reliable. App Insights cleanup tracked in #24. Stale branches should be pruned at next convenience.

**Affects:** Gilfoyle (cleanup), all agents (awareness)
