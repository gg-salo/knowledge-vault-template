---
name: agents-root
type: reference
scope: all
description: >
  Agent-facing write-authorization contract. Defines the four-zone authorship
  model and global rules that apply across all agent operations on this vault.
  Per-folder AGENTS.md files override these rules within their scope.
status: validated
last_updated: YYYY-MM-DD
---

# AGENTS.md — Root Write Authorization

> Agent-facing counterpart to [[_RULES]]. Where _RULES is the human-readable constitution, this file is the machine-readable write contract. Read by every agent before any vault write.

---

## The Four Zones

Every file in this vault belongs to one of four zones. Each zone has different write authorization rules.

| Zone | Who writes | Example paths |
|------|-----------|---------------|
| **1. Understanding** | Human only. Agent may suggest in chat, never silently edit. | `/me/doctrine.md`, `/me/voice.md`, `/me/profile.md`, `/me/obsidian-strategy.md` |
| **2. Co-authored** | Agent + human. Agent updates in place with audit trail. | `/projects/*-context.md`, `/me/vault-todo.md`, `/me/system-patterns.md` |
| **3. Synthesis** | Agent-authored, human-curated. Every claim cites Zone 1 or `/reading/`. | `/me/playbooks/` (compound), agent-authored synthesis |
| **4. Disposable** | Agent or minion. Safe to delete and regenerate. | Future `/outputs/` for briefs, lint reports |

**Zones are about authorship, not value.**

---

## Global Rules (apply unless overridden)

1. **Routing plan mandatory.** Before ANY vault write, show where files will be written and wait for explicit confirmation. Per [[_RULES#1]].
2. **Frontmatter is mandatory** per [[_RULES#10]].
3. **`/reading/` is IMMUTABLE.** Annotations go in sidecar files. Per `/reading/AGENTS.md`.
4. **Skills go to `/skills/inbox/` first.** Promotion to `/skills/library/` requires human review + real-usage gotcha + `composition_level` set.
5. **Workflows go to `/workflows/inbox/` first.** Promotion requires N real-session uses + at least one gotcha.
6. **Composition levels mandatory** per [[_RULES#6c]].
7. **Ontology shape diagnostic mandatory** before creation. Six shapes per [[_RULES#6b]].
8. **Multi-abstraction layers required** per [[_RULES#11]].
9. **Backlinks required** per [[_RULES#5]].
10. **The Worthiness Gate applies at every intake.** Per [[doctrine|The Worthiness Gate]] (if doctrine.md is populated).
11. **No duplicates.** Check for existing coverage before creating.

---

## Per-Folder Override Hierarchy

Each top-level folder has its own AGENTS.md that overrides or extends these global rules:

- `/me/AGENTS.md` — Zone 1 rules
- `/projects/AGENTS.md` — Zone 2 rules
- `/skills/AGENTS.md` — Worthiness rubric + composition_level enforcement
- `/workflows/AGENTS.md` — Vault-coupled, promotion gate
- `/reading/AGENTS.md` — Immutable raw sources
- `/agents/AGENTS.md` — Sub-agent definition governance; fork-context vs inherit-context diagnostic

When a per-folder rule conflicts with this root file, the per-folder rule wins within its scope.

---

## Schema Reference

For frontmatter axes, entity types, relation types, naming conventions, and per-shape write rules, see [[_SCHEMA]] at root.

---

## Connected Files

- [[_RULES]] — vault constitution (human-facing)
- [[_SCHEMA]] — entity/relation/frontmatter consolidated reference
- [[obsidian-strategy]] — why the four-zone model
- [[vault-consistency-check]] — workflow that audits AGENTS.md hierarchy resolution
