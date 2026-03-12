# Session Log

## 2026-03-12 — Workflow Audit Option B

- **Agents:** Gilfoyle (Site Engineer)
- **Issue:** #32 (Audit GitHub Actions Workflows for Squad Framework Drift)
- **Branch:** `fix/workflow-audit-option-b` (from `dev`)
- **PR:** #33 → `main`, closes #32

### Changes

- Deleted 6 dead-weight Node.js/npm workflows: `squad-ci`, `squad-docs`, `squad-insider-release`, `squad-preview`, `squad-promote`, `squad-release` (−431 lines)
- Removed `RELEASE_LABELS` array from `sync-squad-labels.yml`
- Fixed stale `preview` branch reference in `squad-main-guard.yml` error message
- Confirmed `ref: dev` checkout fixes and `COPILOT_ASSIGN_TOKEN` fallback already applied on `dev` from prior sessions
- Validated all 7 remaining workflows as correct YAML

### Key Decision

Option B confirmed — keep `.squad/` off `main`, fix workflows to reach `dev`.
