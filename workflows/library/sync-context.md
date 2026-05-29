---
name: sync-context
description: >
  Syncs a project's vault context file against the current state of its
  codebase. Use when a codebase has evolved since the last context sync.
  Triggers on: sync-context [project], sync context, update context for
  [project], refresh [project] context. Reads the existing context file,
  explores the codebase, diffs what changed, presents a routing plan,
  and applies updates on confirmation. Preserves vault-specific sections
  (insights, strategies, reading connections, relationships) — only
  updates codebase-derived sections.
capabilities: [context-sync, codebase-analysis, diff-detection, project-documentation]
outputs: updated /projects/[name]-context.md with codebase-derived sections refreshed and "Last synced" date bumped
cost: medium
speed: 3-8 min per project (scales with codebase size)
requires: []
parallelizable: true
human_gate: true
metadata:
  version: 1.0.0
  type: process
  scope: all
  projects: [all]
  status: validated
abstraction:
  concrete: "Reads a project codebase and updates its vault context file to reflect the current state, preserving vault-native knowledge (insights, strategies, relationships)"
  abstract: "Selective synchronization between a live system and its documentation, updating derived facts while preserving human-authored interpretation"
  fundamental: "The map-territory reconciliation problem — keeping a model accurate to its subject without destroying the model's unique analytical value"
  matches: [cartographic surveys updating maps, medical chart reconciliation, financial audit against ledger, museum catalog vs. collection inventory]
---

## 1. PURPOSE

**Prevents context files from drifting into fiction.** Project context files blend two kinds of knowledge: codebase-derived facts (tech stack, module status, architecture) and vault-native insight (strategic decisions, doctrine connections, reading pile cross-references). Without sync-context, the codebase-derived facts rot within weeks while the vault-native insight remains valid — creating a file that's half-true and fully unreliable.

**Why this exists:**
- Claude defaults to rewriting the entire context file from scratch, destroying accumulated vault insight
- Without explicit diffing, Claude doesn't know what changed — it either over-updates (rewriting unchanged sections) or under-updates (missing real changes)
- The "Last synced" date is the only signal that tells future sessions whether to trust the context file

---

## 2. WHEN TO USE / WHEN NOT TO USE

### Trigger conditions
- User says "sync context on [project]", "update [project] context", "refresh context"
- User provides a codebase path and says to sync it
- A project context file's "Last synced" date is 2+ weeks old and work has been done
- User starts a build session and the context file looks stale

### Anti-triggers (do NOT apply when)
- No context file exists yet — use the **create** workflow instead (Step 3 alt path below)
- User wants to add vault-native insight (strategic decision, doctrine connection) — that's a manual edit or [[distill]]
- User wants a code review — sync-context captures state, not quality
- Codebase hasn't changed since last sync — check git log before proceeding

### Related skills
- [[gobble]] — for external repos you don't own; sync-context is for your own projects
- [[distill]] — for adding vault-native insight to an existing context file
- [[skillify]] — if sync reveals new patterns worth encoding

---

## 3. CORE INSTRUCTIONS

### Step 0: Read `_RULES.md`
Load `/vault/_RULES.md` before making any routing decisions.

### Step 1: Locate Context File
Check `/vault/projects/[project-name]-context.md`.
- If exists → **update workflow** (Step 2)
- If missing → **create workflow** (Step 3)

### Step 2: Update Workflow

#### 2a. Read existing context file
Read the full file. Note the "Last synced" date. Identify which sections are **codebase-derived** vs **vault-native**:

**Codebase-derived** (sync these):
- What It Is (if the project's purpose changed)
- Current State (status, test coverage, completion percentages, last activity)
- Tech Stack table
- Architecture / Core Services
- Module Completion tables
- Dashboard / UI features
- CLI Commands
- Potentially Outdated / Uncertain

**Vault-native** (preserve these — do NOT rewrite):
- Abstraction Layers
- Key Decisions (unless new decisions visible in code)
- Strategic Decisions sections
- Insights from external analysis
- Positioning sections
- Content & Reading Connections
- Relationships
- Any section with `> Source: distilled from...` headers

#### 2b. Explore codebase
Use an Explore agent (thorough) against the codebase path. Target:
1. Top-level docs: CLAUDE.md, README.md, ARCHITECTURE.md, ROADMAP.md
2. Directory structure scan
3. Git log (last 20 commits) — what changed since last sync?
4. Tech stack detection (package.json, Cargo.toml, go.mod, etc.)
5. Key architecture files
6. Test count / coverage if measurable

#### 2c. Diff against existing context
Compare what the codebase shows now vs what the context file says. Categorize changes:
- **Status changes** (completion percentages, phase progress)
- **New features/modules** (not in context file at all)
- **Removed/killed features** (in context but no longer in codebase)
- **Scale changes** (test count, file count, LOC)
- **Architecture changes** (new services, new plugins, new patterns)

#### 2d. Present routing plan
Show:
- Which sections will be updated and what changes
- Any new sections to add
- Anything being removed/corrected
- Last synced date being bumped to today

**Wait for explicit confirmation before writing.**

#### 2e. Apply updates
Edit the context file:
- Update codebase-derived sections
- Bump "Last synced" date to today
- Preserve all vault-native sections exactly as they are
- If a vault-native section references something now contradicted by the codebase (e.g., "ModuleA is 20% complete" in a strategic section), add a brief inline correction: `(now 100% — see Current State)`

### Step 3: Create Workflow (No Existing Context)

If no context file exists:

#### 3a. Explore codebase
Same as Step 2b — full Explore agent pass.

#### 3b. Draft context file
Follow the standard project context structure:

```markdown
# [Project Name]

## What It Is
[One paragraph — what this project does]

## Abstraction Layers
- **Abstract:** [domain-agnostic pattern]
- **Fundamental:** [deepest level]
- **Matches:** [comma-separated domains]

## Current State
> Last synced against codebase: [today's date]
- **Status**: [current state]
- [key metrics: test count, LOC, deployment status, etc.]

## Tech Stack
| Layer | Technology |
|-------|-----------|
| ... | ... |

## Architecture
[Key services, patterns, data flow]

## Key Decisions
[Numbered list of architectural/strategic decisions visible in the code]

## Potentially Outdated / Uncertain
[Things that may change or are unclear from codebase alone]

## Relationships
- [[project]] — relationship-type
```

Add Abstraction Layers per [[_RULES]] Section 11.

#### 3c. Present routing plan
Show the full file that will be created and its destination path.
**Wait for explicit confirmation before writing.**

#### 3d. Write file
Create at `/vault/projects/[project-name]-context.md`.

---

## 4. REFERENCE MATERIAL

### Section Classification Heuristic

When unsure whether a section is codebase-derived or vault-native, ask:
- "Could I regenerate this section by reading only the codebase?" → codebase-derived
- "Does this section reference vault files, doctrines, reading pile entries, or strategic analysis?" → vault-native
- "Does this section contain the word 'distilled', 'Source:', or reference another vault file?" → vault-native

### Multi-Project Batch Sync

When syncing multiple projects in one session:
- Launch Explore agents in parallel (one per codebase)
- Read all existing context files in parallel
- Present one combined routing plan covering all projects
- Apply all updates after single confirmation

---

## 5. GOTCHAS

| # | Gotcha | What goes wrong | What to do instead |
|---|--------|-----------------|-------------------|
| 1 | Rewriting vault-native sections | Strategic insights, doctrine connections, and reading pile cross-references get destroyed | Classify every section before editing — only touch codebase-derived sections |
| 2 | No git log check | Can't tell what actually changed, so either miss real changes or rewrite everything | Always check git log since last sync date to scope the diff |
| 3 | Module completion percentages without evidence | Guessing "~80%" when code shows empty stubs or full implementation | Read actual files — count implementations vs stubs, check test coverage |
| 4 | Context file too large to read in one pass | Read tool truncates, missing later sections | Read in offset chunks, or grep for section headers first |
| 5 | Destroying the "Potentially Outdated" section | Removing uncertainty notes that are still genuinely uncertain | Only remove items you can confirm resolved; add new uncertain items |

---

## 6. EXAMPLES

### Good routing plan output
```
## Routing Plan — sync-context: ProjectA

### ProjectA (`project-a-context.md`) — UPDATE
**Last synced:** 2026-03-24 → **Now:** 2026-04-06

| Section | Change |
|---------|--------|
| Current State | "Pre-build" → Phases 1-4 complete |
| Module Completion | ModuleA: 20% → 100%, ModuleB: 0% → 100% |
| Tests | 4 files → 176 files |
| NEW: Frontend UI | 6 pages added |
| Potentially Outdated | 5 items resolved, 3 new items |

Vault-native sections preserved (no changes):
- Abstraction Layers, Origin, Strategic Decisions,
  Ecosystem Mapping, Relationships

Confirm to proceed?
```

### Bad output (anti-pattern)
```
I've rewritten the entire project-a-context.md from scratch based on
the current codebase.
[DESTROYS: strategic context, doctrine connections, reading pile
cross-references, origin history — none recoverable from code]
```

---

## 9. QUICK REFERENCE

```
SYNC-CONTEXT = codebase → diff → update context file
READ existing context → EXPLORE codebase → DIFF changes → PRESENT routing plan → WAIT for confirmation → APPLY updates
PRESERVE vault-native sections (strategies, insights, relationships, reading connections)
UPDATE codebase-derived sections (state, stack, architecture, modules, tests)
ALWAYS bump "Last synced" date
ALWAYS present routing plan before writing
If no context file exists → CREATE workflow (full Explore + draft + confirm)
Read _RULES.md before routing
```

---

## Connected Files
- [[_RULES]] — vault constitution (read before routing)
- [[gobble]] — sibling skill for external repos (gobble captures, sync-context updates)
- [[distill]] — sibling skill for adding vault-native insight
- [[_TEMPLATE]] — standard this skill follows
