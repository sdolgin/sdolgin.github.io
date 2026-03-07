# Squad Decisions

## Active Decisions

### DEC-001: Editorial Voice & Style (2026-03-06)

**Decision:** All blog content follows the style guide at `.squad/style-guide.md`.

**Key points:**
- Voice modeled after Joel Spolsky, Jeff Atwood, and Scott Hanselman — approachable, conversational, technically credible
- Generous internal and external linking is mandatory — cross-link posts, cite sources, link to studies/research/news
- Humor welcome but must land with humans — flag uncertain jokes for author review
- No corporate speak, no gatekeeping, assume the reader is smart

**Affects:** Richard (writing), Monica (reviewing), Dinesh (source gathering), all agents

### DEC-002: Repository Hygiene Standards (2026-03-06)

**Decision:** Repo operates at open-source-project-for-millions standards. OCD cleanliness.

**Key points:**
- All work goes through branches and PRs — never commit to `main` directly
- Branch naming: `post/{slug}`, `fix/{desc}`, `feat/{desc}`
- GitHub Issues are the single source of truth for the backlog with proper labels
- Dependabot PRs are reviewed and merged promptly
- Gilfoyle is the final authority on technical repo standards

**Affects:** All agents, especially Gilfoyle (enforcement) and Jared (issue hygiene)

## Governance

- All meaningful changes require team consensus
- Document architectural decisions here
- Keep history focused on work, decisions focused on direction
