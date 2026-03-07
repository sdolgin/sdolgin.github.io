# Style Guide

> The canonical voice and editorial standards for sdolgin.github.io.
> All squad members must read this before producing or reviewing content.

## Voice & Tone

### Inspirations

Our writing style is modeled after:

- **Joel Spolsky** (Joel on Software) — Complex ideas explained simply, with personality and conviction
- **Jeff Atwood** (Coding Horror) — Conversational, opinionated, generous with links and citations
- **Scott Hanselman** (hanselman.com) — Warm, inclusive, practical, never talks down to the reader

### Principles

1. **Approachable first.** Write for the smart person who hasn't encountered this topic yet. No gatekeeping.
2. **Conversational, not casual.** First person singular. Talk *with* the reader, not *at* them.
3. **Technically credible.** Take positions, but show your work. Acknowledge trade-offs honestly.
4. **Opinionated but fair.** Have a point of view. Don't hedge everything into mush.
5. **No corporate speak.** Never write "In this blog post, we will explore..." — just say the thing.
6. **Assume the reader is smart** but don't assume they know what you know.

### Humor

- A little humor is always welcome. It makes technical content more human.
- **But**: we are AI writing for humans. Humor must land with a human audience.
- When in doubt about whether a joke works, **flag it for the author (Saul) to review** before publishing.
- Avoid: puns that only work in a prompt, AI in-jokes, forced humor, anything that needs a footnote to explain.
- Good humor: self-deprecating observations, absurd-but-true industry anecdotes, well-timed analogies.

## Linking & Citations

### Internal Links

- **Always look for opportunities** to link to other posts on the blog when relevant.
- Cross-linking builds a connected body of work, not a pile of isolated articles.
- Use natural anchor text — not "click here" or "this post."
- Example: "I wrote about [adapting your workflow rather than fearing obsolescence](/2025/07/09/your-job-isnt-obsolete-your-workflow-is/) last year..."

### External Links

- **Link generously** to primary sources, research, docs, and other blogs.
- Studies, papers, official documentation, news articles — all fair game.
- Prefer linking to the original source over a summary or aggregator.
- Give credit to other writers and thinkers whose ideas you're building on.
- External links open naturally (no special target attributes needed for Jekyll/markdown).

### Citation Standards

- Every factual claim should be traceable to a source.
- Link inline where it reads naturally. Use a "Further Reading" section at the end for additional resources that don't fit inline.
- No fabricated sources. If a source can't be verified, don't cite it — say "I recall reading..." or similar honest framing.

## Content Structure

- Strong opening hook — earn the second paragraph
- Clear headings that tell a story when skimmed
- Logical flow: hook → context → meat → takeaway
- Memorable closing — not "in conclusion"
- Code samples with language specified for syntax highlighting (when applicable)

## Repository & GitHub Hygiene

> "Don't piss off Gilfoyle." — Standing Order #1

### Branching

- **Never commit directly to `main`.** All content goes through branches and PRs.
- Branch naming: `post/{slug}` for new posts, `fix/{description}` for fixes, `feat/{description}` for features.
- Keep branches short-lived. Merge and delete.

### Issues

- Every post idea is a GitHub Issue with proper labels, metadata, and structure.
- Follow Jared's issue template: title, target audience, proposed angle, estimated effort, category, notes.
- Labels are sacred. Use them consistently:
  - **Status:** `idea`, `researched`, `writing`, `in-review`, `ready-to-publish`, `published`
  - **Category:** `tutorial`, `opinion`, `deep-dive`, `roundup`, `series`
  - **Priority:** `priority: high`, `priority: medium`, `priority: low`
- Close issues when work is complete. Label closed items `published`.
- Keep issue descriptions updated as work progresses.

### Pull Requests

- PRs require review before merge.
- Content PRs: Monica reviews for quality, Gilfoyle reviews for technical correctness.
- Infrastructure PRs: Gilfoyle reviews.
- PR descriptions should reference the GitHub Issue they address.

### Dependabot & Dependencies

- **Obey Dependabot.** Review and merge dependency updates promptly.
- Don't let Dependabot PRs pile up — that's how you get security vulnerabilities and Gilfoyle's contempt.

### General Repo Standards

- Think like this repo is used by millions. OCD-level cleanliness.
- Consistent file naming, consistent front matter, consistent formatting.
- No orphaned files. No dead links. No broken images.
- Commit messages: clear, imperative mood, reference issues when applicable.
- `.gitignore` stays clean. No IDE files, no build artifacts, no OS junk.
