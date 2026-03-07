# Issue #27: Publish App Insights Data Into a Stats Page

**Author:** Gilfoyle (Site Engineer)
**Date:** 2025-07-18
**Status:** Proposal — awaiting owner review

---

## Problem

The owner wants a retro-style stats page on the blog,
powered by real App Insights data. Think "you are
visitor #12,847" energy. The site is static (Jekyll on
GitHub Pages), so there's no server to query at runtime
unless we build one.

## Current State

App Insights is fully wired up:

- JS SDK snippet in `_includes/application-insights.html`
- Connection string injected via GitHub Secrets at build
- Tracks: page views, reading progress, time on page,
  external link clicks, internal navigation, JS errors
- The `ApplicationId` field exists in the connection
  string (needed for API queries)

The data is there. We just need to get it out.

---

## Options Considered

### Option A: Client-Side JS Calling App Insights REST API

The browser hits the App Insights API directly using
an API key.

**How it works:**
- Embed an App Insights API key in the page JS
- Call `https://api.applicationinsights.io/v1/apps/{appId}/query`
  with KQL queries on page load
- Render results in the DOM

**Pros:**
- Always fresh data — real-time queries
- No infrastructure to maintain
- No build pipeline changes

**Cons:**
- API key is exposed in client-side JavaScript.
  Read-only keys exist, but it's still a public
  credential that can be abused for rate limiting
  or data scraping
- CORS works (the API supports it), but you're
  trusting every visitor with query access
- Rate limits: 30 requests/minute per API key.
  A popular page could burn through this fast
- Cold start latency on page load

**Verdict:** Technically possible but a security
smell. Not recommended.

---

### Option B: GitHub Actions Scheduled Workflow → JSON File

A GitHub Actions workflow runs on a cron schedule,
queries App Insights, writes the results to a JSON
file, commits it, and triggers a site rebuild.

**How it works:**
- Scheduled Action (e.g., every 6 hours) runs a script
- Script uses `az monitor app-insights query` or the
  REST API with a secret API key
- Writes results to `assets/data/stats.json`
- Commits and pushes to `main` (triggering rebuild)
- Stats page reads the static JSON file — no API calls
  from the browser

**Pros:**
- API key stays in GitHub Secrets — never exposed
- Zero client-side auth concerns
- Data is static JSON — loads instantly, cacheable
- Fits the existing deployment model perfectly
- No new infrastructure or Azure spend
- Stats page works even if App Insights API is down

**Cons:**
- Data is stale by up to 6 hours (configurable)
- Automated commits add noise to git history
  (mitigated by a dedicated bot commit message)
- Workflow needs `contents: write` permission

**Verdict:** This is the right answer.

---

### Option C: Azure Function as API Proxy

A lightweight Azure Function sits between the
browser and App Insights, handling auth server-side.

**How it works:**
- Azure Function with HTTP trigger
- Browser calls the Function URL
- Function queries App Insights with managed identity
  or stored API key
- Returns formatted JSON to the browser

**Pros:**
- Real-time data
- API key is server-side
- Can add caching, rate limiting, CORS control

**Cons:**
- New infrastructure to deploy and maintain
- Azure costs (minimal, but nonzero)
- Another thing that can break
- Overkill for a personal blog
- Adds latency to page load

**Verdict:** Overengineered for this use case.

---

### Option D: Azure Logic App / Power Automate

A Logic App queries App Insights on a schedule and
pushes data somewhere the site can consume it.

**How it works:**
- Logic App runs on schedule
- Queries App Insights, formats data
- Writes to a blob, or commits to GitHub via API

**Pros:**
- Low-code, visual designer
- Built-in App Insights connector

**Cons:**
- Another Azure resource to manage
- Logic App pricing (per-execution)
- More complex than a 20-line shell script in
  GitHub Actions
- The GitHub Actions approach does the same thing
  with tools already in the pipeline

**Verdict:** A worse version of Option B.

---

## Recommended Approach: Option B

**GitHub Actions scheduled workflow writing a
static JSON file.**

It's the simplest thing that works. No new
infrastructure. No exposed credentials. No Azure
spend. The data being a few hours stale is a feature,
not a bug — nobody needs real-time analytics on a
personal blog. And it fits perfectly into the existing
deploy pipeline.

---

## Implementation Outline

### Phase 1: Data Pipeline (Medium effort)

1. Create an App Insights API key (read-only) and
   store it in GitHub Secrets (`APPINSIGHTS_API_KEY`)
2. Confirm the `ApplicationId` from the connection
   string is stored or add it as a secret
3. Write a GitHub Actions workflow
   (`.github/workflows/stats-update.yml`):
   - Trigger: `schedule` (every 6 hours) +
     `workflow_dispatch` (manual)
   - Steps: query App Insights REST API, write
     `assets/data/stats.json`, commit and push
4. Define the KQL queries for the data we want
   (see "What to Show" below)

### Phase 2: Stats Page (Small effort)

1. Create `stats.md` (Jekyll page at `/stats`)
2. Build a simple layout with vanilla JS that
   reads `/assets/data/stats.json` on page load
3. Render the retro counter and stats widgets
4. Style it with CSS — chunky pixel fonts, green
   on black, maybe a `<marquee>` if we're feeling
   dangerous

### Phase 3: Footer Link (Small effort)

1. Add a link to `/stats` in `_includes/footer.html`
2. Style it like an old-school "web counter" badge
3. Show the total visitor count inline in the footer
   (pulled from the same JSON file)

---

## What to Show on the Stats Page

Listed by "interesting" factor:

- **Total page views** — the classic hit counter,
  big and ugly and beautiful
- **Total unique visitors** — "you are visitor
  #12,847"
- **Top 5 posts by views** — what people actually
  read
- **Views over last 30 days** — a simple sparkline
  or bar chart (no heavy chart libraries — keep it
  lightweight, maybe CSS-only bars)
- **Top referrers** — where traffic comes from
- **Top countries** — geographic distribution
  (App Insights tracks `client_CountryOrRegion`)
- **Last updated timestamp** — so visitors know
  the data freshness

### Sample KQL Queries

```kql
// Total page views (all time)
pageViews
| count

// Unique users (last 30 days)
pageViews
| where timestamp > ago(30d)
| summarize dcount(user_Id)

// Top 5 pages
pageViews
| where timestamp > ago(30d)
| summarize views = count() by name
| top 5 by views

// Daily views (last 30 days, for sparkline)
pageViews
| where timestamp > ago(30d)
| summarize views = count() by bin(timestamp, 1d)
| order by timestamp asc

// Top referrers
pageViews
| where timestamp > ago(30d)
| where isnotempty(url)
| extend referrer = tostring(customDimensions["referrer"])
| where isnotempty(referrer)
| summarize count() by referrer
| top 5 by count_

// Top countries
pageViews
| where timestamp > ago(30d)
| summarize count() by client_CountryOrRegion
| top 5 by count_
```

---

## Retro Design Direction

The stats page should look like it was built in 1997
and is proud of it.

- Dark background (#000 or dark green)
- Monospace / pixel font (e.g., "Press Start 2P"
  from Google Fonts, or just `Courier`)
- The hit counter as an odometer-style digit display
- Borders made of `═══════` or ASCII art
- Optional: a "this site best viewed in Netscape
  Navigator" badge (because why not)
- Mobile-friendly despite the aesthetic — CSS Grid
  handles this fine

The footer link should be a small badge, like the
old GeoCities counters: `[ 👁 12,847 visitors ]`

---

## Open Questions

1. **Data retention:** How far back does the current
   App Insights instance go? If it's 90 days
   (default), we may want to persist cumulative
   totals in the JSON file across runs so the
   "all time" counter doesn't reset.

2. **API key vs. service principal:** A simple API
   key is easiest. Does the owner have preferences
   on auth method? (Azure AD app registration is
   more robust but more setup.)

3. **Update frequency:** Every 6 hours seems right.
   More frequent = more commit noise. Less frequent
   = staler data. Owner's call.

4. **What counts as a "visitor"?** App Insights
   `user_Id` is cookie-based. Should we show unique
   users or total page views as the hero number?

5. **Scope of "all time" data:** Do we want stats
   from before App Insights was added? (Answer: no,
   we don't have that data. But we could set an
   arbitrary starting number for vibes.)

6. **Chart library:** CSS-only bars, or a tiny
   library like Chart.css / sparkline.js? I'd prefer
   zero dependencies but open to discussion.

---

## Effort Estimate

| Phase | Effort | Notes |
|-------|--------|-------|
| Data Pipeline | Medium | Workflow + KQL + JSON schema |
| Stats Page | Small | Static page + vanilla JS |
| Footer Link | Small | HTML + CSS only |
| **Total** | **Medium** | ~2-3 focused sessions |

---

## Risks

- **App Insights API deprecation:** Microsoft is
  pushing toward Log Analytics workspace queries.
  The REST API (`api.applicationinsights.io`) still
  works but monitor for deprecation notices. The
  alternative endpoint (`api.loganalytics.io`) uses
  the same KQL.

- **GitHub Actions minutes:** The scheduled workflow
  uses Actions minutes. On a free plan, this is
  2,000 min/month. A 1-minute job running 4x/day =
  ~120 min/month. Not a concern.

- **Commit noise:** Automated commits every 6 hours.
  Use a `[skip ci]` tag or a separate branch to
  avoid triggering unnecessary rebuilds. Actually —
  we *want* the rebuild. So just accept the commits.

---

*No code was harmed in the making of this proposal.*
