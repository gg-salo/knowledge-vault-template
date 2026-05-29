---
name: agents-workflows
type: reference
scope: all
description: >
  Per-folder write authorization for /workflows/. Vault-coupled procedures.
  Not portable. Promotion gate: used in N real sessions without breaking,
  with at least one real-usage gotcha.
status: validated
last_updated: 2026-04-26
---

# AGENTS.md — /workflows/ (Vault-Coupled, Not Portable)

> Workflows are vault-operating procedures. They read/write vault files, apply vault governance, and only work because this specific vault's file structure exists. They are NOT portable.

---

## The Rule

**New workflows go to `/workflows/inbox/` only. Promotion to `/workflows/library/` requires N real-session uses without breaking + at least one real-usage gotcha.**

Workflows differ from skills in promotion criteria:
- **Skills** promote on real-usage gotchas — failure-mode learning
- **Workflows** promote on real-session counts — repetition without breakage

---

## Vault-Coupled vs Portable — Critical Pre-Check

Before creating any workflow, ask: **could this run in another vault with a different file structure?**

- YES → it's a skill, not a workflow. Route to `/skills/inbox/`.
- NO → it's a workflow. Route here.

A workflow that says "read /me/doctrine.md, scan /skills/inbox/" is vault-coupled. A workflow that says "scan an inbox, apply a worthiness rubric" is portable — that's a skill.

**Anti-pattern:** writing a workflow with `[adapt to your vault structure]` placeholders. Never both vault-coupled and portable.

---

## Composition Level

Per [[_RULES#6c]]: default new workflows to `atom` unless they explicitly orchestrate.

Workflows can be any tier:
- **Atom** — single-purpose vault operation
- **Molecule** — chain atoms (e.g., weekly-content-pipeline)
- **Compound** — orchestrate molecules (rare; usually playbook-shape)

---

## Promotion Workflow

1. Confirm N real-session uses (suggested N=3)
2. Confirm at least one real-usage gotcha documented
3. Verify `composition_level` is set
4. Verify still vault-coupled (hasn't drifted toward portability)
5. Move file: inbox → library
6. Update frontmatter: `status: candidate` → `status: validated`, add `promoted: YYYY-MM-DD`
7. Update [[_INDEX|workflows _INDEX]]
8. Run [[vault-consistency-check]]

---

## Currently in Library (template baseline)

distill, gobble, skillify, sync-context, vault-consistency-check (5 workflows)

---

## Connected Files

- [[AGENTS]] (root)
- [[_INDEX|workflows _INDEX]]
- [[_RULES]] — vault constitution
