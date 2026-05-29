---
name: agents-index
type: reference
scope: personal
description: >
  Governance hub for all sub-agent definitions in the vault. Tracks
  lifecycle state (library vs inbox), and distinguishes agents from
  skills (the inherit-context counterpart). Read when asked about
  agents in aggregate or when deciding whether a new spawn-shaped
  artifact is an agent or a skill.
last_updated: 2026-04-29
---

# Agents Index

> The canonical registry of every sub-agent definition in the vault. Agents are configured personas spawned with their own context, tool restrictions, scope, and termination criterion. They are NOT portable instruction sets — those are skills.

---

## Agent vs Skill — The Critical Distinction

| | Skill | Agent |
|---|---|---|
| **Context** | Inherits parent agent's context | Forks new context |
| **Identity** | Parent agent stays in role | Spawned persona has its own role |
| **Tools** | Same as parent agent | Restricted per `allowed_tools` |
| **Termination** | Parent agent decides | Explicit `termination_criterion` |
| **Output** | The procedure's result | A structured deliverable returned to parent |
| **Test** | "Could the calling agent execute this in-place?" → Yes = skill | "Does this need fork-context to work?" → Yes = agent |

See [[_RULES#6b]] for the 7-shape diagnostic. See [[AGENTS]] in this folder for the write-authorization rules.

---

## Library (Validated)

These agent definitions are production-ready. They've been spawned in multiple real sessions and have populated `5. Gotchas` sections.

| Agent | Role | Spawn pattern | Composition |
|---|---|---|---|
| *(empty in template — populated as you author and validate agents)* | | | |

---

## Inbox (Candidates)

Sub-agent definition candidates awaiting validation.

| # | Agent | Role | Spawn pattern | Source |
|---|---|---|---|---|
| *(empty in template — populated as you author agent candidates)* | | | | |

---

## Spawn Patterns (Reference)

| Pattern | Description |
|---|---|
| **one-shot** | Single spawn, returns one deliverable |
| **parallel-N** | Spawn N personas in parallel, synthesize results |
| **sequential** | Chain of spawned personas, each handing to next (rare) |

---

## Promotion Workflow

When an agent is ready for promotion:

1. Confirm ≥1 real-usage gotcha documented in §5
2. Verify `composition_level` is set
3. Verify all required frontmatter fields populated (role, allowed_tools, context_isolation, spawn_pattern, termination_criterion)
4. Move file: inbox → library
5. Update frontmatter: `status: candidate` → `status: validated`, add `promoted: YYYY-MM-DD`
6. Update this _INDEX.md — remove from inbox table, add to library table
7. Symlink to `~/.claude/agents/[name].md` if Claude Code should spawn it
8. Run [[vault-consistency-check]] to verify no drift

---

## Mirror to `.claude/agents/`

Claude Code reads agent definitions from `~/.claude/agents/` at runtime. The vault `/agents/library/` is the source of truth + version control + governance.

After promotion, symlink each library agent:
```bash
ln -s [vault]/agents/library/[name].md ~/.claude/agents/[name].md
```

---

## Connected Files

- [[_RULES]] — vault constitution (§6b 7-shape ontology, §6b.1 sibling pattern, §6c composition levels)
- [[_SCHEMA]] §4 — Agent frontmatter spec
- [[AGENTS]] in this folder — per-folder write authorization
- [[_TEMPLATE]] in this folder — agent definition template
- [[skills/_INDEX|skills _INDEX]] — sibling index for inherit-context counterparts
- [[workflows/_INDEX|workflows _INDEX]] — sibling for vault-coupled procedures
