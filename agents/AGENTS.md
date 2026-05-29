---
name: agents-folder
type: reference
scope: all
description: >
  Per-folder write authorization for /agents/. Inbox-only writes for new
  agent definitions. Promotion to library requires N real spawn sessions
  + at least one real-usage gotcha + persona/tools/termination spec
  populated + composition_level set.
status: validated
last_updated: YYYY-MM-DD
---

# AGENTS.md — /agents/ (Sub-Agent Definition Governance)

> Agents are configured personas spawned with their own context, tool restrictions, scope, and termination criterion. The artifact IS the persona definition. They differ from skills in one load-bearing way: agents fork context; skills inherit the running agent's context.

---

## The Rule

**New agent definitions go to `/agents/inbox/` only. Never `/agents/library/` directly.**

Promotion from inbox to library requires:

1. **Human review** — explicit operator decision
2. **At least one real-usage gotcha** — documented failure or surprise from spawning
3. **`composition_level` set** — atom (default), molecule, or compound. Per [[_RULES#6c]].
4. **Persona / tools / termination spec populated** — frontmatter `role`, `allowed_tools`, `context_isolation`, `spawn_pattern`, `termination_criterion` all filled
5. **N real spawn sessions** — analogous to workflow's "used in N real sessions" gate

---

## Skill vs Agent — The Critical Diagnostic

Before creating an agent, run the §6b diagnostic. If you can't answer YES to BOTH below, it's probably a skill, not an agent:

- **Does this fork context?** Agent runs in a separate context window from the spawning agent.
- **Does the persona have its own SYSTEM PROMPT distinct from the parent's?** Agents have their own identity.

**Anti-pattern:** filing skills as agents because they describe a "review pattern." If the procedure runs in the same context with the same identity as the calling agent, it's a skill.

---

## Default Composition Level

**`composition_level: atom`** unless the agent definition explicitly orchestrates other agents (e.g., multi-persona spawn pattern → molecule).

---

## Frontmatter Schema

Per [[_SCHEMA]] §4 Agent frontmatter. All agent files must include:

- `type: agent`
- `role` — the persona's identity
- `allowed_tools` — tool restrictions array
- `context_isolation: fork | inherit`
- `spawn_pattern: one-shot | parallel-N | sequential`
- `termination_criterion`
- `spawning_mechanism: slash | orchestrator-driven | hook`

Plus standard fields (name, description, abstraction block, metadata block with composition_level + status).

---

## Body Structure (per [[_TEMPLATE]] in this folder)

1. **PURPOSE / WHEN TO SPAWN**
2. **PERSONA** (system prompt material)
3. **BEHAVIORS / ANTI-BEHAVIORS**
4. **OUTPUT FORMAT**
5. **GOTCHAS** (TODO from real usage)
6. **Connected Files**

---

## Mirror to `.claude/agents/`

Claude Code reads agent definitions from `.claude/agents/` at runtime. Vault `/agents/library/` is the source of truth + version control + governance. After promotion, symlink:

```bash
ln -s [vault]/agents/library/[name].md ~/.claude/agents/[name].md
```

---

## Anti-Patterns

- ❌ Filing skills as agents because they involve "evaluation" or "review" (run the fork-context diagnostic)
- ❌ Creating agents without clear termination criterion
- ❌ Agent definitions without `allowed_tools` restrictions
- ❌ Multi-stage compounds with no human gate

---

## Connected Files

- [[AGENTS]] (root) — global write authorization
- [[_RULES]] §6b — 7-shape ontology
- [[_SCHEMA]] §4 — Agent frontmatter spec
- [[_TEMPLATE]] in this folder
- [[_INDEX]] in this folder
- [[skills/AGENTS]] — sibling for skills (inherit-context counterpart)
