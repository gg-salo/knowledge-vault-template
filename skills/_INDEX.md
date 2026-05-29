---
name: skills-index
type: reference
scope: personal
description: >
  Governance hub for all portable skills in the vault. Tracks lifecycle state
  (library vs inbox), promotion criteria, and overlap resolution
  decisions. Claude reads this when asked about skills in aggregate
  or when deciding where a new skill fits.
  Note: vault-operating procedures (gobble, distill, skillify) are WORKFLOWS,
  not skills. See /workflows/_INDEX.md for those.
---

# Skills Index

> The canonical registry of every portable skill in the vault. Library = validated, ready to use. Inbox = candidates awaiting real-usage gotchas before promotion.
>
> **Ontology note (2026-04-16):** Vault-operating procedures (`gobble`, `distill`, `skillify`) were moved to `/workflows/library/`. They operate on this vault's specific file structure and are not portable — making them workflows, not skills. See [[_RULES#6b ONTOLOGY]] for the 5-shape diagnostic. For the workflow registry, see [[workflows/_INDEX]].

---

## Library (Validated)

These skills are production-ready. They've been used, refined, and have at least one real-usage gotcha backing them. Skills are **portable** — they work in any agent system without vault-specific references.

**Inventory: 1 validated skill**

### Pre-installed from the template

| Skill | Type | Purpose |
|---|---|---|
| [[voice]] | process | Personal writing voice directives — applied to all public-facing content |

### Added by you

*(As you promote skills from inbox to library, list them here.)*

---

## Inbox (Candidates)

Skill candidates waiting for validation. Promotion criteria:
1. At least one real-usage gotcha from actual use
2. Backlinks wired to all relevant projects
3. Human review confirming it's not redundant with an existing library skill

**Before creating a new skill candidate:** run the Section 6b ontology check. If the content operates on vault files → it's a workflow, not a skill. Route to `/workflows/inbox/` instead.

### Pre-installed from the template

| Skill | Status | Notes |
|---|---|---|
| [[example-skill]] | reference | Example shape only — kept as a permanent reference, not for promotion |

### Added by you

*(As you write new skills or skillify sources, they appear here.)*

---

## Worthiness Rubric

Before writing any new skill, score it:

| Filter | Question | Pass |
|---|---|---|
| **Reusability** | Applies to 2+ projects? | Yes |
| **Non-triviality** | Claude gets this wrong without it? | Yes |
| **Stability** | Pattern settled enough to encode? | Yes |
| **Delta** | Pushes agent out of default behavior? | Yes |

**3/4 minimum to build. 4/4 = high priority. Under 3/4 = it's a note, not a skill.**

See [[skillify]] for the full extraction workflow.

---

## Overlap Resolution Decisions

*(As you resolve conflicts between skills, log the decisions here. One-line entries with dates.)*

---

## Deprecated Skills

*(When you deprecate a library skill, move it to `/skills/archived/` and log the reason here with a date.)*

---

## Connected Files

- [[_RULES]] — vault constitution (Section 6 covers skill governance, Section 6b covers ontology)
- [[_TEMPLATE]] — skill writing standard (includes ontology check at top)
- [[workflows/_INDEX]] — sibling index for vault-operating procedures
- [[vault-guide]] — onboarding context
