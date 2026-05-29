---
name: agents-skills
type: reference
scope: all
description: >
  Per-folder write authorization for /skills/. Inbox-only writes for new
  skills. Promotion to library requires human review + real-usage gotcha
  + composition_level set.
status: validated
last_updated: 2026-04-26
---

# AGENTS.md — /skills/ (Worthiness Gate Enforcement)

> Skills are portable agent instruction sets. Atoms by default. Promotion is a gate, not a default.

---

## The Rule

**New skills go to `/skills/inbox/` only. Never `/skills/library/` directly.**

Promotion from inbox to library requires:

1. **Human review** — explicit operator decision
2. **At least one real-usage gotcha** — documented failure from running the skill
3. **`composition_level` set** — atom (default), molecule, or compound. Per [[_RULES#6c]]
4. **Worthiness rubric passed** — Reusability + Non-triviality + Stability + Delta, score 3/4 minimum

---

## Default Composition Level

**`composition_level: atom`** unless the skill explicitly orchestrates other skills.

If a candidate appears to be molecule or compound tier, evaluate whether it's actually a workflow or playbook instead.

---

## Ontology Pre-Filter (mandatory before /skills/inbox/ write)

Run [[_RULES#6b]] diagnostic before creating any skill:

1. Operates on vault files? → workflow
2. Named principle with evidence? → doctrine
3. Decision about how this vault works? → vault-strategy
4. Architectural pattern about systems? → system-pattern
5. Long-form multi-module operational framework? → playbook
6. Instruction set an agent executes? → **skill** ✓

Anything other than 6 → route elsewhere.

---

## Skill Template

All new skills follow [[_TEMPLATE]] (`/skills/_TEMPLATE.md`).

---

## Promotion Workflow

1. Operator runs the worthiness rubric — show all four scores
2. Confirm `composition_level` is set
3. Verify ≥1 gotcha documented
4. Move file: inbox → library
5. Update frontmatter: `status: candidate` → `status: validated`
6. Update [[_INDEX|skills _INDEX]]
7. Run [[vault-consistency-check]]

---

## Connected Files

- [[AGENTS]] (root)
- [[skillify]] — workflow that creates skill candidates
- [[_TEMPLATE]] — skill standard
- [[_INDEX|skills _INDEX]]
- [[_RULES]] — vault constitution
