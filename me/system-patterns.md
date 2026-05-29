---
name: system-patterns
type: reference
description: >
  Architectural patterns observed in the wild or in own projects.
  Outward-facing — these describe how systems work, not how this vault works.
  Organized by domain. Each pattern has a description, where observed, and
  cross-domain matches.
last_updated: 2026-04-16
---

# System Patterns

> Architectural patterns about systems — agent architecture, memory tiering, permission cascades, orchestration models, safety patterns, any reusable system shape. Outward-facing: these describe how systems in general work, not how this vault specifically works.
>
> For vault-specific architectural decisions, see [[obsidian-strategy]].
> For named principles with empirical evidence, see [[doctrine]].

---

## Agent Architecture

*(Patterns about how agents are structured, composed, and deployed.)*

---

## Memory & Context

*(Patterns about how systems store, retrieve, and manage context across sessions.)*

---

## Safety & Permissions

*(Patterns about access control, safety boundaries, permission cascades, trust models.)*

---

## Orchestration & Coordination

*(Patterns about how multiple agents or components coordinate work.)*

---

## Parallel Execution

*(Patterns about concurrent work, fan-out/fan-in, task decomposition.)*

---

## Tool & Prompt Design

*(Patterns about how tools are designed, how prompts are structured, interface design for agents.)*

---

## How to Add a New Pattern

Each pattern entry follows this format:

```markdown
### [Pattern Name]

**What it is:** [1-2 sentence description]

**Where observed:** [Project, repo, article, or experience where you first saw this]

**How it works:** [Brief architectural description — how the pieces fit together]

**Matches:** [Cross-domain connections — where does this same shape appear?]

**Connected:** [[relevant-project]] | [[relevant-reading]] | [[relevant-skill]]
```

If a pattern doesn't fit any existing section, create a new section header. The sections above are starting points, not a fixed taxonomy.

---

## Connected Files

- [[_RULES]] — Section 6b defines when content routes here vs. skills, workflows, or doctrine
- [[obsidian-strategy]] — inward-facing architectural decisions (complements this file)
- [[doctrine]] — named principles with evidence (complements this file)
