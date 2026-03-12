# Research Brief: Conway's Law Meets Agentic AI

**Researcher:** Dinesh Chugtai
**Date:** 2025-07-10
**Issue:** #31

---

## 1. Topic

How Conway's Law and decades of organizational design research provide a surprisingly accurate lens for understanding how AI agent teams should be structured — and what happens when you get the org chart wrong, even if none of your employees eat lunch.

---

## 2. What's the angle?

**Why this post, why now, what's different:**

Everyone is building multi-agent AI systems right now. Microsoft shipped Magentic-One. Anthropic published their "Building Effective Agents" guide. AutoGen, CrewAI, LangGraph — the frameworks are multiplying. But almost nobody is connecting the dots to 60 years of organizational design literature that predicted *exactly* these patterns.

Conway's Law (1968) tells us that systems mirror the communication structures of their creators. Team Topologies (2019) gives us a vocabulary for team types and interaction modes. Brooks' Law (1975) warns us about adding headcount. Accelerate (2018) proves that loosely coupled architectures win. Will Larson's *An Elegant Puzzle* (2019) gives concrete sizing heuristics.

**The gap:** Most writing on multi-agent AI treats agent orchestration as a novel computer science problem. Almost none of it references the organizational design canon that already solved many of these problems for human teams. The few pieces that mention Conway's Law do so in passing — nobody has written the definitive "here's the mapping" post.

**The meta hook:** This blog itself runs on `@bradygaster/squad` — a multi-agent framework where AI agents (Dinesh, Richard, Monica, Gilfoyle, etc.) collaborate via shared state in `.squad/`. This is a living, self-referential case study. We can show the reader exactly how Conway's Law plays out in our own agent team structure.

**Why now:** We're at an inflection point where "just throw more agents at it" is becoming the new "just hire more engineers." The org design literature has a lot to say about why that doesn't work.

---

## 3. Key facts

### Conway's Law (1968)

- Melvin Conway's original paper "How Do Committees Invent?" was published in *Datamation* in April 1968 after being rejected by *Harvard Business Review* as not having been proven. ([Source: melconway.com](http://www.melconway.com/Home/Committees_Paper.html))
- Original formulation: "Organizations which design systems are constrained to produce designs which are copies of the communication structures of these organizations." ([Source: Conway, 1968](http://www.melconway.com/Home/Committees_Paper.html))
- The term "Conway's Law" was coined at the 1968 National Symposium on Modular Programming by participants who considered it sufficiently universal. ([Source: Wikipedia](https://en.wikipedia.org/wiki/Conway%27s_law))
- Conway's own author's note (added 42 years later) highlights the principle's applicability far beyond software engineering — he cites poverty, housing, education, and healthcare as examples. ([Source: melconway.com](http://www.melconway.com/Home/Committees_Paper.html))
- A 2011 MIT/Harvard Business School study by MacCormack, Baldwin, and Rusnak found "strong evidence to support the mirroring hypothesis" — loosely coupled organizations produced significantly more modular products than tightly coupled ones. ([Source: Wikipedia, citing MacCormack et al. 2011](https://en.wikipedia.org/wiki/Conway%27s_law))
- A Microsoft/University of Maryland study by Nagappan, Murphy, and Basili provided additional supporting evidence. ([Source: Wikipedia](https://en.wikipedia.org/wiki/Conway%27s_law))

### The Inverse Conway Maneuver

- Coined by ThoughtWorks and featured on their Technology Radar in 2014–2015 as a "Trial" technique. ([Source: ThoughtWorks Radar](https://www.thoughtworks.com/radar/techniques/inverse-conway-maneuver))
- The recommendation: "evolving your team and organizational structure to promote your desired architecture." ([Source: ThoughtWorks Radar](https://www.thoughtworks.com/radar/techniques/inverse-conway-maneuver))
- This is the deliberate inversion — don't let your org chart accidentally dictate your architecture; instead, design your org chart to *produce* the architecture you want.

### Team Topologies (Skelton & Pais, 2019)

- Four fundamental team types: **Stream-aligned**, **Enabling**, **Complicated-subsystem**, and **Platform**. ([Source: teamtopologies.com](https://teamtopologies.com/key-concepts))
- Three interaction modes: **Collaboration** (working together for a defined period), **X-as-a-Service** (one provides, one consumes), and **Facilitation** (one helps/mentors another). ([Source: teamtopologies.com](https://teamtopologies.com/key-concepts))
- Nine principles include "Respect Cognitive Limits," "Eliminate Team Dependencies," and "Keep Teams Together." ([Source: teamtopologies.com](https://teamtopologies.com/key-concepts))
- Key insight: "Nothing kills productivity faster than one team waiting on another team." ([Source: teamtopologies.com](https://teamtopologies.com/key-concepts))

### The Mythical Man-Month (Brooks, 1975)

- Brooks's Law: "Adding manpower to a late software project makes it later." ([Source: Wikipedia](https://en.wikipedia.org/wiki/The_Mythical_Man-Month))
- Communication overhead grows combinatorially: n(n−1)/2 channels for n people. 50 developers = 1,225 communication channels. ([Source: Brooks, 1975](https://en.wikipedia.org/wiki/The_Mythical_Man-Month))
- "No Silver Bullet" (1986, added to anniversary edition): "There is no single development, in either technology or management technique, which by itself promises even one order of magnitude improvement within a decade." ([Source: Brooks, 1986](https://en.wikipedia.org/wiki/The_Mythical_Man-Month))
- **Conceptual integrity** requires a single chief architect or small team. "To make a user-friendly system, the system must have conceptual integrity, which can only be achieved by separating architecture from implementation." ([Source: Brooks, 1975](https://en.wikipedia.org/wiki/The_Mythical_Man-Month))

### Accelerate (Forsgren, Humble & Kim, 2018)

- Based on 23,000+ data points across organizations of various sizes. Won the Shingo Prize. ([Source: Wikipedia](https://en.wikipedia.org/wiki/DevOps_Research_and_Assessment))
- Four key DORA metrics: Change Lead Time, Deployment Frequency, Change Failure Rate, Mean Time to Recovery. ([Source: DORA](https://en.wikipedia.org/wiki/DevOps_Research_and_Assessment))
- Two of 24 key capabilities directly relevant: **"Use a Loosely Coupled Architecture"** and **"Architect for Empowered Teams."** ([Source: Wikipedia](https://en.wikipedia.org/wiki/DevOps_Research_and_Assessment))
- The 2024 DORA State of DevOps Report found AI is having broad impact on software development, with positive results for flow and productivity, but "reductions to software delivery performance" and "a reported decrease in time spent doing valuable work." ([Source: DORA 2024](https://en.wikipedia.org/wiki/DevOps_Research_and_Assessment))

### An Elegant Puzzle (Will Larson, 2019)

- Published by Stripe Press, May 2019. ([Source: lethain.com](https://lethain.com/elegant-puzzle/))
- Team sizing heuristics from [Larson's "Sizing Engineering Teams"](https://lethain.com/sizing-engineering-teams/):
  - Managers should support 6–8 engineers
  - Small teams (<4 members) "are not teams" — they're leaky abstractions
  - Teams should be 6–8 during steady state
  - To create a new team: grow an existing team to 8–10, then bud into two teams of 4–5
  - Never create empty teams
  - On-call rotations want 8 engineers for 24/7 coverage
- Key quote: "I've sponsored quite a few 1-2 person teams, and each time I've regretted it. To repeat: I have regretted it every single time." ([Source: lethain.com](https://lethain.com/sizing-engineering-teams/))

### Org Design for Design Orgs (Merholz & Skinner, 2016)

- Published by O'Reilly Media, 2016. Full title: *Org Design for Design Orgs: Building and Scaling Design Teams*.
- Advocates for role specialization within design organizations — distinct roles for research, interaction design, visual design, content strategy, etc.
- Key argument: generalist teams hit a ceiling; specialization enables depth, but requires deliberate coordination structures.
- *Note: Primary source page was unavailable during research. Summary based on known secondary sources and book description. I'm flagging this honestly per charter — I did not fabricate details.*

### Multi-Agent AI Frameworks and Research

- **AutoGen** (Microsoft Research, 2023): Open-source framework enabling multi-agent conversation for LLM applications. Agents are customizable, conversable, and operate in modes combining LLMs, human inputs, and tools. ([Source: arXiv:2308.08155](https://arxiv.org/abs/2308.08155))
- **Magentic-One** (Microsoft Research, 2024): Generalist multi-agent system with an **Orchestrator** agent directing four specialized agents (WebSurfer, FileSurfer, Coder, ComputerTerminal). The Orchestrator implements two loops — an outer loop for planning (Task Ledger) and an inner loop for progress tracking (Progress Ledger). ([Source: Microsoft Research Blog](https://www.microsoft.com/en-us/research/blog/magentic-one-a-generalist-multi-agent-system-for-solving-complex-tasks/))
- **Anthropic's "Building Effective Agents"** (2024): Identifies five workflow patterns: Prompt Chaining, Routing, Parallelization, Orchestrator-Workers, and Evaluator-Optimizer. Key insight: "the most successful implementations weren't using complex frameworks or specialized libraries. Instead, they were building with simple, composable patterns." ([Source: anthropic.com](https://www.anthropic.com/engineering/building-effective-agents))
- **LangGraph Multi-Agent Workflows** (LangChain, 2024): Defines three multi-agent patterns — Collaboration (shared scratchpad), Agent Supervisor (central router), and Hierarchical Agent Teams (nested graphs). ([Source: LangChain Blog](https://blog.langchain.dev/langgraph-multi-agent-workflows/))
- **Survey of LLM-based Multi-Agent Systems** (Guo et al., 2024): Comprehensive academic survey covering agent profiling, communication mechanisms, and capability growth. ([Source: arXiv:2402.01680](https://arxiv.org/abs/2402.01680))

### The Squad Framework — Our Own Case Study

- `@bradygaster/squad` is a framework for creating AI agent teams through GitHub Copilot. ([Source: GitHub](https://github.com/bradygaster/squad))
- Agents persist as files in `.squad/`, accumulate knowledge via `history.md`, and share decisions via `decisions.md`. "Everything is in git." ([Source: GitHub](https://github.com/bradygaster/squad))
- This blog uses Squad with character casting from *Silicon Valley* (HBO) — each agent has a distinct role (Researcher, Writer, Editor, etc.) with its own charter, tools, and boundaries.
- Agents work in parallel: "When you give a task, the coordinator launches every agent that can usefully start — simultaneously." ([Source: GitHub](https://github.com/bradygaster/squad))
- Squad's architecture mirrors Magentic-One's Orchestrator pattern: a coordinator routes tasks, specialist agents execute, and shared state (decisions.md) provides the coordination layer.

---

## 4. Interesting angles

### Angles not yet well-covered:

1. **"Conway's Law for Agents"** — The system your agents produce will mirror the communication structure you gave them. If your researcher can't talk to your writer, you'll get a post that doesn't match the research. This is exactly what Conway predicted, just with LLMs instead of humans.

2. **Brooks's Law scales differently for agents** — Adding a human to a team adds n(n−1)/2 communication overhead. But agent communication can be structured as shared state (like `.squad/decisions.md`) rather than pairwise channels. Does Brooks's Law still apply when communication is async, structured, and cheap? *Partially* — context window limits and token costs are the new "communication overhead."

3. **Team Topologies maps cleanly to agent roles:**
   - **Stream-aligned team** → The core content pipeline (Researcher → Writer → Editor → Publisher)
   - **Platform team** → Infrastructure agents (Gilfoyle managing builds, CI/CD, deployment)
   - **Enabling team** → Agents that temporarily boost others (e.g., Dinesh providing research to unblock Richard's writing)
   - **Complicated-subsystem team** → Specialized agents for complex domains (e.g., a KQL expert agent)

4. **The Inverse Conway Maneuver for agents** — If you want modular, loosely coupled AI outputs, structure your agent team to be modular and loosely coupled. The Squad framework does this implicitly: each agent has its own charter, tools, and boundaries. The architecture of the content (independent posts, clean separation of concerns) mirrors the agent structure.

5. **Larson's "small teams are not teams" applied to agents** — A single-agent system is fragile in the same way a 1-person team is fragile. It has no redundancy, no specialization, and no ability to parallelize. But unlike human teams, agent teams don't need 6–8 members for morale — the sizing heuristic shifts from "enough humans for coverage" to "enough agents for separation of concerns."

6. **Accelerate's loosely coupled architecture applied to agents** — The DORA research says high-performing teams have loosely coupled architectures that enable independent deployment. Multi-agent systems that achieve this (agents can be swapped, upgraded, or added without rebuilding the whole system) should outperform monolithic single-agent approaches. Magentic-One's "plug-and-play" design explicitly cites this benefit.

7. **The "conceptual integrity" problem** — Brooks argued that conceptual integrity requires a chief architect. In multi-agent systems, who provides conceptual integrity? The Orchestrator/Coordinator pattern is the answer — and it maps directly to Brooks's recommendation for a surgical team with one "chief programmer."

8. **Role specialization vs. generalism** — Merholz & Skinner's argument that generalist teams hit a ceiling applies directly. A single "do-everything" AI agent will perform worse than specialized agents with clear boundaries. Anthropic confirms this: "An agent is more likely to succeed on a focused task than if it has to select from dozens of tools."

---

## 5. Notable quotes

> "Organizations which design systems are constrained to produce designs which are copies of the communication structures of these organizations."
> — Melvin Conway, "How Do Committees Invent?" (1968)

> "There is no such thing as a design group which is both organized and unbiased."
> — Melvin Conway, "How Do Committees Invent?" (1968)

> "Adding manpower to a late software project makes it later."
> — Fred Brooks, *The Mythical Man-Month* (1975)

> "There is no single development, in either technology or management technique, which by itself promises even one order of magnitude improvement within a decade in productivity, in reliability, in simplicity."
> — Fred Brooks, "No Silver Bullet" (1986)

> "Nothing kills productivity faster than one team waiting on another team."
> — Team Topologies (teamtopologies.com)

> "I've sponsored quite a few 1-2 person teams, and each time I've regretted it. To repeat: I have regretted it every single time."
> — Will Larson, "Sizing Engineering Teams" (2018)

> "The most successful implementations weren't using complex frameworks or specialized libraries. Instead, they were building with simple, composable patterns."
> — Anthropic, "Building Effective Agents" (2024)

> "Multi-agent designs allow you to divide complicated problems into tractable units of work that can be targeted by specialized agents and LLM programs."
> — LangChain Blog, "LangGraph Multi-Agent Workflows" (2024)

> "When you give a task, the coordinator launches every agent that can usefully start — simultaneously."
> — `@bradygaster/squad` README (2025)

---

## 6. Existing coverage

### What's already out there:

- **Anthropic's "Building Effective Agents"** — Excellent practical guide to agent workflow patterns, but does not reference org design literature at all. Pure CS/ML framing.
- **LangChain's multi-agent blog** — Good technical comparison of patterns (collaboration, supervisor, hierarchical), but no connection to Conway's Law or Team Topologies.
- **Microsoft's Magentic-One blog** — Mentions modular design benefits ("similar to object-oriented programming") but does not cite org design canon.
- **Academic surveys on multi-agent LLM systems** (arXiv) — Focus on agent profiling, communication protocols, and benchmarks. No org design framing.
- **Team Topologies community** — Some discussion of how Team Topologies applies to platform engineering, but no mapping to AI agent teams.
- **Various "Conway's Law" blog posts** — Mostly explain the law and the inverse maneuver in the context of microservices. None apply it to agent teams.

### The gap we'd fill:

Nobody has written the post that bridges the org design canon (Conway, Brooks, Skelton/Pais, Forsgren/Humble/Kim, Larson) with the emerging multi-agent AI literature — and then uses a *real, running agent team* (this blog's own Squad setup) as the concrete case study. That's the post.

---

## 7. Existing posts check

✅ **Confirmed: No duplication with existing `_posts/`.**

Current posts in `_posts/`:
1. `2025-04-27-surprising-kql-functions.md` — KQL tutorial, no overlap
2. `2025-07-08-slos-for-reliability-part-1.md` — SLO/SRE guide, no overlap
3. `2025-07-09-your-job-isnt-obsolete-your-workflow-is.md` — AI and workflows. Tangentially related (discusses AI impact on work) but takes a completely different angle (macro job market vs. workflow refactoring). No duplication. Could be a good cross-link target ("we wrote about AI refactoring workflows; now let's talk about how to structure the AI teams themselves").

---

## 8. Primary sources

### Papers & Books
- Conway, M.E. (1968). "How Do Committees Invent?" *Datamation*, 14(5), 28–31. [PDF](http://www.melconway.com/Home/pdf/committees.pdf) | [HTML](http://www.melconway.com/Home/Committees_Paper.html)
- Brooks, F.P. (1975/1995). *The Mythical Man-Month: Essays on Software Engineering*. Addison-Wesley. ISBN 978-0-201-83595-3.
- Forsgren, N., Humble, J., & Kim, G. (2018). *Accelerate: The Science of Lean Software and DevOps*. IT Revolution. ISBN 9781942788331.
- Skelton, M. & Pais, M. (2019). *Team Topologies: Organizing Business and Technology Teams for Fast Flow*. IT Revolution. ISBN 978-1942788812.
- Larson, W. (2019). *An Elegant Puzzle: Systems of Engineering Management*. Stripe Press. ISBN 978-1732265189.
- Merholz, P. & Skinner, K. (2016). *Org Design for Design Orgs: Building and Scaling Design Teams*. O'Reilly Media. ISBN 978-1491938409.

### Research Papers
- Wu, Q. et al. (2023). "AutoGen: Enabling Next-Gen LLM Applications via Multi-Agent Conversation." arXiv:2308.08155. [Link](https://arxiv.org/abs/2308.08155)
- Guo, T. et al. (2024). "Large Language Model based Multi-Agents: A Survey of Progress and Challenges." arXiv:2402.01680. [Link](https://arxiv.org/abs/2402.01680)
- MacCormack, A., Baldwin, C., & Rusnak, J. (2011). "Exploring the Duality between Product and Organizational Architectures." Harvard Business School Working Paper.

### Blog Posts & Industry Sources
- Anthropic. (2024). "Building Effective Agents." [Link](https://www.anthropic.com/engineering/building-effective-agents)
- Microsoft Research. (2024). "Magentic-One: A Generalist Multi-Agent System for Solving Complex Tasks." [Link](https://www.microsoft.com/en-us/research/blog/magentic-one-a-generalist-multi-agent-system-for-solving-complex-tasks/)
- LangChain. (2024). "LangGraph Multi-Agent Workflows." [Link](https://blog.langchain.dev/langgraph-multi-agent-workflows/)
- ThoughtWorks. (2014). "Inverse Conway Maneuver." Technology Radar. [Link](https://www.thoughtworks.com/radar/techniques/inverse-conway-maneuver)
- Larson, W. (2018). "Sizing Engineering Teams." [Link](https://lethain.com/sizing-engineering-teams/)
- Team Topologies. "Key Concepts." [Link](https://teamtopologies.com/key-concepts)
- Wikipedia. "Conway's Law." [Link](https://en.wikipedia.org/wiki/Conway%27s_law)
- Wikipedia. "The Mythical Man-Month." [Link](https://en.wikipedia.org/wiki/The_Mythical_Man-Month)
- DORA / Wikipedia. "DevOps Research and Assessment." [Link](https://en.wikipedia.org/wiki/DevOps_Research_and_Assessment)

### Repos & Tools
- `@bradygaster/squad` — AI agent team framework for GitHub Copilot. [Link](https://github.com/bradygaster/squad)
- Microsoft AutoGen — Multi-agent framework. [Link](https://github.com/microsoft/autogen)
- LangGraph — LangChain's multi-agent graph framework. [Link](https://github.com/langchain-ai/langgraph)

---

*Brief prepared by Dinesh Chugtai, Researcher. I found it first. I just want that on the record.*
