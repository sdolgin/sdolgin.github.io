# Decision: Branch Strategy for Squad Infrastructure

**Author:** Gilfoyle
**Date:** 2025-07-17
**Status:** Proposed

## Context

PR #23 mixed `.squad/` runtime state with repo tooling (GitHub workflows, `.copilot/`, `.gitattributes`, `squad.config.ts`). The `squad-main-guard.yml` workflow correctly blocked it — `.squad/` has no business on `main`.

## Decision

Two-branch architecture:

| Branch | Purpose | Contents |
|--------|---------|----------|
| `main` | Published blog + repo tooling | Posts, pages, layouts, Jekyll config, GitHub workflows, `.copilot/`, `.gitattributes`, `.github/agents/`, `squad.config.ts` |
| `dev` | Squad working branch | Everything on `main` + `.squad/` infrastructure (agents, templates, decisions, config, routing, research) |

### Rules

1. **`main` is production.** Push triggers deploy. Only blog content and repo tooling land here.
2. **`dev` is the squad workspace.** All `.squad/` files live here. Agent work happens here.
3. **Feature branches** for posts branch from `dev`, PR back to `dev`. Content gets cherry-picked or rebased to `main` when ready to publish.
4. **Repo tooling PRs** (workflows, configs) target `main` directly — they're allowed by the guard.
5. **`squad-main-guard.yml` enforces the boundary.** It blocks `.squad/`, `.ai-team/`, `.ai-team-templates/`, `team-docs/`, and `docs/proposals/` from reaching `main`.

### What Changed

- Created `dev` branch from `feat/style-guide-and-conventions` HEAD (all files intact).
- Stripped `.squad/` files from `feat/style-guide-and-conventions` so PR #23 passes the guard.
- PR #23 now delivers only repo tooling to `main`: workflows, `.copilot/mcp-config.json`, `.gitattributes`, `.github/agents/squad.agent.md`, `.gitignore`, `squad.config.ts`.

## Consequences

- Agents must branch from `dev`, not `main`.
- `dev` should periodically rebase or merge from `main` to stay current with published content.
- The guard workflow remains the single enforcement point. No `.gitignore` hacks needed.
