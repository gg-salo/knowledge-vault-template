---
name: agents-projects
type: reference
scope: all
description: >
  Per-folder write authorization for /projects/. Zone 2 — Co-authored.
  Update in place with audit trail. Append decisions; never silently delete.
status: validated
last_updated: 2026-04-26
---

# AGENTS.md — /projects/ (Zone 2: Co-authored)

> Project context files are the live operational state of every active project. Update in place with discipline.

---

## The Rule

**Update in place. Append decisions. Never silently delete. Audit trail mandatory.**

Project context files (`/projects/[name]-context.md`) are co-authored: agents update codebase-derived sections during sync passes; humans own strategic and vault-native sections.

---

## Section-Level Authorization

### Codebase-derived (sync-context owns)
Agents may update these in place after presenting a routing plan:

- Current State (status, completion percentages, last activity)
- Tech Stack table
- Architecture / Core Services
- Module Completion tables
- CLI Commands
- Potentially Outdated / Uncertain

### Vault-native (human-owned)
Agents do NOT rewrite these:

- Abstraction Layers per [[_RULES#11]]
- Key Decisions (numbered, append-only, supersede via new entry)
- Strategic Decisions sections
- Insights from external analysis
- Positioning sections
- Relationships (typed: powers / shares-dna / depends-on / parallel-bet / supersedes / feeds / planned-depends-on)
- Sections marked `> Source: distilled from...`

---

## The Audit Trail

Every agent update requires:

1. "Last synced" date bumped
2. Routing plan shown before write
3. Diff visible — what changed, what stayed
4. Source reference when appending decisions

Never silently delete a decision. Mark superseded with `superseded_by:` link; keep the original.

---

## Anti-Patterns

- ❌ Rewriting the entire context file from scratch during sync
- ❌ Updating Current State without bumping the date
- ❌ Removing items from "Potentially Outdated" without verification
- ❌ Editing relationships without explaining why

---

## Connected Files

- [[AGENTS]] (root) — global write authorization
- [[sync-context]] — workflow that operates on project context files
- [[_RULES]] — vault constitution
