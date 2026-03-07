# Ceremonies

> Team meetings that happen before or after work. Each squad configures their own.

## Design Review

| Field | Value |
|-------|-------|
| **Trigger** | auto |
| **When** | before |
| **Condition** | multi-agent task involving 2+ agents modifying shared systems |
| **Facilitator** | lead |
| **Participants** | all-relevant |
| **Time budget** | focused |
| **Enabled** | ✅ yes |

**Agenda:**
1. Review the task and requirements
2. Agree on interfaces and contracts between components
3. Identify risks and edge cases
4. Assign action items

---

## Retrospective

| Field | Value |
|-------|-------|
| **Trigger** | auto |
| **When** | after |
| **Condition** | build failure, test failure, or reviewer rejection |
| **Facilitator** | lead |
| **Participants** | all-involved |
| **Time budget** | focused |
| **Enabled** | ✅ yes |

**Agenda:**
1. What happened? (facts only)
2. Root cause analysis
3. What should change?
4. Action items for next iteration

---

## Publish Readiness

| Field | Value |
|-------|-------|
| **Trigger** | manual |
| **When** | before |
| **Condition** | post moving from `post/*` branch to `publish/*` branch |
| **Facilitator** | lead |
| **Participants** | Richard, Erlich, Monica |
| **Time budget** | focused |
| **Enabled** | ✅ yes |

**Checklist:**
1. Visual brief exists on the `post/*` branch (Erlich)
2. All approved visuals have embed codes integrated into the post markdown — not just in the `.squad/` brief
3. Images saved to `assets/images/` are committed to the `publish/*` branch
4. Every image has alt text and proper attribution (CC license, XKCD source link, AI generation note)
5. Monica has reviewed the post with visuals in place
6. Any pending visuals (e.g., diagrams needing rendering, AI art needing generation) are tracked as HTML comments in the post
