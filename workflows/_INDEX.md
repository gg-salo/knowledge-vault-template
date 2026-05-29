---
name: workflows-index
type: reference
scope: personal
description: >
  Governance hub for all workflows in the vault. Tracks lifecycle state
  (library vs inbox), and distinguishes workflows from skills. Claude reads
  this when asked about workflows in aggregate or when deciding where a
  new vault-operating procedure fits.
---

# Workflows Index

> The canonical registry of every workflow in the vault. Workflows are vault-operating procedures — they read/write vault files and apply vault governance. They are NOT portable.

---

## Workflow vs Skill

| | Skill | Workflow |
|---|---|---|
| **Shape** | Agent instruction set | Vault-operating procedure |
| **Portability** | Works in any agent system | Requires this vault's file layout |
| **Location** | `/skills/library/` or `/skills/inbox/` | `/workflows/library/` or `/workflows/inbox/` |
| **Example** | `voice.md` — writing directives any agent can apply | `gobble.md` — ingests sources into THIS vault's `/reading/` structure |
| **Test** | "Could another agent system use this as-is?" → Yes | "Does this operate on vault files?" → Yes |

See [[_RULES#6b ONTOLOGY]] for the full 5-shape diagnostic.

---

## Library (Validated)

These workflows are production-ready. They operate on the vault's file structure and have been refined through actual use.

### Pre-installed from the template

| Workflow | Type | Purpose |
|---|---|---|
| [[gobble]] | process | Ingest external sources (repos, articles, threads, videos, playbooks) into `/reading/` as structured nodes |
| [[distill]] | process | Route raw text (conversations, notes) to canonical vault locations |
| [[skillify]] | process | Classify ontology, apply rubric if skill, extract transferable principles |
| [[sync-context]] | process | Sync a project's vault context file against the current state of its codebase; preserves vault-native sections |
| [[vault-consistency-check]] | review | Scan governance files for cross-file structural drift; 11-check audit |

### Added by you

*(As you create and promote workflows, list them here.)*

---

## Inbox (Candidates)

Workflow candidates waiting for validation. Same promotion criteria as skills:
1. At least one real-usage gotcha from actual use
2. Backlinks wired to all relevant vault files
3. Human review confirming it's not redundant with an existing library workflow

*(As you write new workflows, they appear here.)*

| Workflow | Type | Purpose |
|---|---|---|
| [[review-prd]] | process | Review PRDs against vault intelligence (doctrines, project contexts, skill gaps); every suggestion cites a vault file |
| [[converge]] | process | Vault-wide weekly synthesis: surfaces ranked publishable opportunities from accumulated material across doctrine, system-patterns, projects, reading, dreams, _INBOX, and journey. Replaces `/inverse-search` and `/surface-content-ideas`. |
| [[dream]] | process | Cross-candidate batch synthesis on fresh material → /me/dreams/ proposals (vault-insight or content-angle). Reads vault at 3 abstraction levels, finds non-obvious connections that no single source surfaces alone. |
| [[harvest]] | process | Weekly vault sweep collecting scattered content-flavored material (drafts, journey, unexpressed doctrines/patterns, project silence, _INBOX content-flagged) into a flat chat inventory for review. |
| [[brief]] | process | Strategist→Writer handoff: takes picked angle (in-context, _INBOX ref, or free-text), expands into writer-ready package, saves to `/me/drafts/[slug].md` Brief section. |

---

## Deprecated Workflows

*(When you deprecate a library workflow, move it to `/workflows/archived/` and log the reason here with a date.)*

---

## Connected Files

- [[_RULES]] — vault constitution (Section 6b covers the ontology that separates workflows from skills)
- [[_TEMPLATE]] — skill writing standard (the ontology check at the top routes non-skills to workflows)
- [[skills/_INDEX]] — the sibling index for portable skills
