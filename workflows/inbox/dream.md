---
name: dream
description: >
  Cross-candidate batch synthesis on fresh material. Reads vault at 3
  abstraction levels and finds non-obvious connections that no single
  source surfaces alone. Outputs proposals to /me/dreams/ — never writes
  to vault directly. Triggers on: dream, dream this batch, run dream,
  synthesize fresh material, OR auto-fires when 5+ fresh gobbles have
  accumulated since last run (suppressed during active gobble session).
  Do NOT use for Librarian ranking (that's [[converge]]) or per-gobble
  surface (deprecated — dream operates batch-wise only).
capabilities: [cross-candidate-synthesis, non-obvious-connection-discovery, sandboxed-proposal, abstraction-layer-traversal]
outputs: one file per batch run at /me/dreams/[YYYY-MM-DD]-[slug].md containing N proposals — each is either a vault insight proposal (with routing plan) OR a content angle (for /converge ranking later)
cost: high
speed: 5-10 min per batch
requires: [/me/dreams/ directory exists]
parallelizable: false
human_gate: true
metadata:
  version: 0.1.0
  type: process
  scope: personal
  projects: [all]
  status: candidate
abstraction:
  concrete: "Cross-candidate batch synthesis workflow that reads vault at 3 abstraction levels, finds non-obvious connections in fresh material, produces sandboxed proposals as either vault insight candidates or content angles staged in /me/dreams/"
  abstract: "Sandboxed incubation engine — operates between collection and ranking, surfaces connections that no individual source contains, proposes without writing"
  fundamental: "Synthesis requires freedom from consequence. The best thinking happens when the thinker is not simultaneously the decision-maker. Sandbox the generation, gate the output."
  matches: [REM sleep consolidation, R&D labs vs production lines, brainstorming with no-criticism rules, scientific hypothesis generation vs experimental validation, jazz improvisation vs studio recording]
---

# Dream Workflow — Cross-Candidate Synthesis

> One workflow with two exits. Reads fresh material against vault at three abstraction levels. Finds connections no individual source contains. Stages proposals — never writes to vault directly.

---

## 1. PURPOSE

The Librarian ([[converge]], [[gobble]]) handles obvious connections — material that fits cleanly into existing categories. Dream exists for the connections that no single source contains and that the Librarian would never surface: cross-candidate patterns, non-obvious matches between fresh material and old vault, contradictions that productively tension existing doctrine, unnamed self-evidence that lives in your behavior across projects but hasn't been written.

**Why this exists:**
- Without dream, [[converge]] produces Librarian-mode output only — obvious "express this named thing" picks
- Single-source synthesis misses cross-candidate patterns by definition
- Manual cross-source thinking is the kind of cognitive work that gets dropped under cadence pressure
- Once a vault accumulates dozens of doctrines, patterns, and readings, the connection space is too large for human enumeration

---

## 2. WHEN TO USE / WHEN NOT TO USE

### Trigger conditions

**Auto-fire (default):** When 5+ fresh gobbles have accumulated since last dream run AND no gobble has occurred in the last 30 minutes (suppresses auto-fire during active batch sessions per [[converge]] gotcha #9).

**Manual triggers:**
- User says "dream", "dream this batch", "run dream", "synthesize"
- User pastes a batch of material directly: "dream on these"
- Before a major [[converge]] run, to ensure dream output is fresh
- After a particularly rich gobble batch (thought leadership, system patterns, agent deployments)

### Anti-triggers (do NOT apply when)
- Per-gobble surface — dream operates BATCH-wise only. Per-gobble produces shallow output.
- Ranking-only requests — [[converge]] does that.
- Drafting — [[brief]] and write post handle that.
- Creating a single new vault entry — [[distill]] or [[skillify]] handle that.

### Related workflows
- [[converge]] — downstream curator that reads `/me/dreams/` and ranks dream output alongside other vault material
- [[harvest]] — sibling collection workflow (harvest = scattered vault material; dream = fresh material + cross-source synthesis)
- [[gobble]] — produces the fresh material that triggers dream
- [[skillify]] — extracts portable principles; dream proposals may flag candidates for skillify

---

## 3. CORE INSTRUCTIONS

### Step 1: Read [[_RULES]]
Standard for vault-operating workflows. Required because dream stages output (writes to `/me/dreams/`).

### Step 2: Identify the Batch
Determine what fresh material is in scope. Default: gobbles since last dream run. Manual override: user specifies (paste, file list, time window).

The "fresh batch" is the input set for cross-candidate synthesis. Typical: 5-15 candidates. Below 3, dream is unlikely to find non-obvious connections — yield will be low. Above 20, synthesis quality degrades — split into two runs.

### Step 3: Load Operating Filters
Read in this order. These shape what counts as "interesting" for this user:
1. `/me/content-plan.md` (if populated) — narrative arc, active campaign
2. `/me/voice.md` — voice rules
3. `/me/profile.md` — identity, what the user cares about

### Step 4: Load Vault Cross-Reference Surface
Read at three abstraction levels per [[_RULES]] Section 11:

| Source | What to extract |
|---|---|
| `/me/doctrine.md` | All entries — for tension/contradiction detection and pairing opportunities |
| `/me/system-patterns.md` | All entries — for pattern-matching against fresh material |
| `/projects/*-context.md` | Project state — for "this fresh material connects to that project" detection |
| `/reading/` (last 30 days) | Recent gobbles — for cross-candidate match detection via `abstraction.matches` |
| `/me/ideas/_INBOX.md` | Recent entries — for connection to in-flight ideas |
| `/me/journey.md` | Lived experience — for first-person proof points |
| `/me/published/_INDEX.md` | Anti-duplication baseline |

**Note on large files:** `doctrine.md` and `_INBOX.md` exceed Read tool limits. Use grep-based inventory passes per [[converge]] gotcha #7: `Grep "^## "` for doctrine titles, `Grep "^### \d"` with offset/limit for `_INBOX` recent entries.

### Step 5: Apply Worthiness Gate Per Candidate
Per [[doctrine|The Worthiness Gate]] (if populated), score each candidate 0-1 on three criteria:

| Criterion | Question | Score |
|---|---|---|
| **Recency** | From last 7 days, OR evergreen enough? | 0 or 1 |
| **Relevance** | Connects to 1+ active project, doctrine, or pattern? | 0 or 1 |
| **Resonance** | Challenges, extends, or validates something in vault? | 0 or 1 |

Per spec: 2/3 minimum to enter Dream synthesis. 3/3 fast-tracks.

**Below 2/3:** candidate stays in `/reading/` as standard reference, does NOT enter dream synthesis. Note in output: "X candidates processed as standard reference (below worthiness threshold)."

### Step 6: Cross-Candidate Synthesis (Four Passes)
For candidates 2/3+ scoring, run four passes in order:

**Pass A — Cross-candidate pattern detection:**
Multiple candidates expressing variations of the same abstract pattern? Cluster them. Name the underlying shape. The convergence across non-overlapping sources IS the signal — when independent practitioners arrive at the same architecture, that ratifies the pattern.

**Pass B — Vault-against-fresh matching:**
Each candidate's `abstraction.matches` field against doctrine, system-patterns, project contexts. Surface matches that span 3+ vault nodes. These are the unexpected connections the user wouldn't have made manually.

**Pass C — Doctrine tension surfacing:**
Each candidate's claim against existing doctrine entries. Where does fresh material contradict, extend, or challenge? Productive tensions are content fuel and may flag doctrine evolution.

**Pass D — Self-evidence surfacing:**
Patterns visible across multiple project contexts or journey entries that haven't been named as doctrine or system-pattern. The "unnamed in your behavior" category — the kind of pattern that's lived but never written.

### Step 7: Produce Proposals (Two Exits)

Each proposal has one of two exits:

**Exit A — Vault Insight Proposal:**
A candidate vault entry (doctrine, system-pattern, or note) that crystallizes from the synthesis.

```markdown
## PROPOSAL [N] — [Title]
**Exit:** vault-insight
**Type:** [doctrine | system-pattern | note]
**Synthesis source:** Candidates [list of /reading files]
**Vault matches:** [doctrine + pattern + project nodes touched]
**Routing plan:** Append to [[doctrine]] OR [[system-patterns]] OR new file at [path]
**Status:** pending-review
**Confidence:** [low | medium | high] — based on cross-source corroboration count
**Body:**
[The proposed entry, ready for routing-plan confirmation]
```

**Exit B — Content Angle:**
A non-obvious angle that emerged from synthesis.

```markdown
## PROPOSAL [N] — [Title]
**Exit:** content-angle
**Synthesis source:** Candidates [list]
**Pattern:** [one-line abstract]
**Vault matches:** [doctrine/pattern/project nodes]
**Suggested format:** [LinkedIn long-form / X thread / carousel / etc.]
**Suggested matrix cell:** [Base/Middle/Top × Research/Consulting/Teaching]
**Suggested pillar:** [P1 doctrine / P2 proof / P3 teaching / P4 landscape]
**Status:** pending-converge-review
**Confidence:** [low | medium | high]
```

### Step 8: Stage to /me/dreams/
Write all proposals to a single file: `/me/dreams/[YYYY-MM-DD]-[slug].md`

The slug is short — typically the dominant theme of the batch (e.g., `agent-deployments`, `auth-cluster`, `cross-domain-convergence`).

Frontmatter for the dream file:
```yaml
---
type: dream-batch
date: YYYY-MM-DD
batch_size: 10
candidates_synthesized: 8
candidates_below_threshold: 2
proposals_count: 4
exits: {vault-insight: 1, content-angle: 3}
operating_filters: [content-plan, voice, profile]
status: pending-review
---
```

### Step 9: Present Summary in Chat
Output to chat — short summary with proposal count and titles. Full file readable at `/me/dreams/[file]`. User can review at leisure.

DO NOT auto-promote any proposal to vault. All exits require user confirmation:
- Vault insight proposals → user reviews routing plan, confirms or edits
- Content angles → [[converge]] picks them up next run; OR user manually promotes to `_INBOX`

---

## 4. REFERENCE MATERIAL

### Auto-fire mechanics
- Counter increments on each [[gobble]] run
- Counter visible in gobble responses ("Dream eligible: X/5")
- Auto-fire when counter hits 5 AND last gobble was >30 minutes ago
- Counter resets to 0 after each `/dream` run
- Manual override: `gobble: [URL] --no-dream-trigger` suppresses counter increment

### When dream produces zero proposals
Acceptable output. If batch lacks cross-candidate connections, dream says so. Don't force proposals.

The dream operating stance: *tolerate ambiguity — not every dream output will be correct or useful. The sandbox means bad dreams are discarded at zero cost.*

### Distinction from /converge
- **Dream:** cross-source synthesis on FRESH material
- **Converge:** ranking of opportunities from ALL accumulated material (including `/me/dreams/`)
- They compose. Dream produces, converge curates.

### Distinction from /harvest
- **Dream:** fresh material + synthesis = non-obvious connections
- **Harvest:** scattered vault material → flat inventory (no synthesis)
- They're parallel collection mechanisms with different scopes.

---

## 5. GOTCHAS

| # | Gotcha | What goes wrong | What to do instead |
|---|--------|-----------------|-------------------|
| 1 | Per-gobble dream invocation | Each gobble triggers dream individually — too heavy, produces shallow per-source output | Dream operates BATCH-wise only. Auto-fire suppressed unless 5+ accumulated AND quiet period elapsed. |
| 2 | Forcing proposals when batch lacks connections | Output reads like padded reach for synthesis | Honest "0 proposals — batch lacked cross-candidate connections" is correct output. Don't pad. |
| 3 | Dream output written to vault canonicals directly | Pollutes `/me/doctrine.md` or `/me/system-patterns.md` with un-vetted material | Dream NEVER writes to vault canonicals. All exits stage to `/me/dreams/` for review. |
| 4 | Skipping the vault cross-reference load | Synthesis becomes isolated to fresh batch, misses vault-against-fresh matches | Step 4 is mandatory. The vault cross-reference IS the value of dream. |
| 5 | Ignoring worthiness gate, processing all candidates | Low-quality candidates dilute synthesis quality | 2/3 minimum threshold. Below-threshold candidates noted but excluded. |
| 6 | Single-source proposals | A "non-obvious connection" needs at least 2 sources. Single-source proposals are Librarian output, not dream. | Each proposal must cite 2+ candidates OR 2+ vault references. Otherwise drop. |
| 7 | Dream output never reviewed | Files accumulate in `/me/dreams/` never read | [[converge]] reads `/me/dreams/` as Source #7. Weekly cycle ensures dreams get curated. |
| 8 | Large vault files exceed Read limits | `doctrine.md` and `_INBOX.md` fail Read tool | Use grep-based inventory passes per [[converge]] gotcha #7. |

*Note: this workflow has not yet been used in real sessions. Real-usage gotchas required before promotion to `/workflows/library/` (per [[_RULES]] Section 6a). Promotion criterion: 3 weekly runs without breaking + 5+ real-usage gotchas captured.*

---

## 6. EXAMPLES

### Good output (one proposal entry)
```markdown
## PROPOSAL 2 — "The Convergence Signal" (cross-candidate pattern)
**Exit:** content-angle
**Synthesis source:** [[reading-entry-1]] + [[reading-entry-2]] + [[reading-entry-3]] + [[reading-entry-4]]
**Pattern:** Four practitioners from non-overlapping domains (research, marketing, VC, builder) independently arrived at variations of the same architecture in 60 days. The convergence ratifies the pattern.
**Vault matches:** [[doctrine|Your Supporting Doctrine]] (extends evidence), [[system-patterns#A Relevant Pattern]] (operationalizes)
**Suggested format:** LinkedIn long-form essay
**Status:** pending-converge-review
**Confidence:** high — 4-domain cross-corroboration
```

### Bad output (anti-pattern)
```markdown
## PROPOSAL 1 — "[Single Source] is interesting"
**Exit:** content-angle
**Synthesis source:** [[reading-entry-1]]
**Pattern:** This article is interesting and we should write about it.
[Single source. Generic. No cross-source synthesis. This is Librarian output, not dream.]
```

---

## 7. QUICK REFERENCE

```
DREAM = batch synthesis → non-obvious connections → /me/dreams/
TRIGGER: 5+ fresh gobbles + 30min quiet, OR manual
READ: operating filters + vault cross-reference surface (3 abstraction levels)
GATE: 2/3 worthiness minimum per candidate (recency, relevance, resonance)
SYNTHESIS: 4 passes — cross-candidate pattern, vault-against-fresh, doctrine tension, self-evidence
EXIT: vault-insight (with routing plan) OR content-angle (for converge)
WRITE: ONE file per run at /me/dreams/[YYYY-MM-DD]-[slug].md
PROMOTE: NEVER auto. User confirms vault-insights; /converge picks up content-angles.
Read _RULES.md before staging
```

---

## Connected Files

- [[_RULES]] — vault constitution
- [[doctrine|The Worthiness Gate]] — curation principle this workflow applies (if doctrine.md is populated)
- [[converge]] — downstream workflow that reads `/me/dreams/`
- [[harvest]] — sibling collection workflow (scattered vault material)
- [[gobble]] — upstream workflow producing fresh material
- [[skillify]] — sibling extraction workflow
- [[obsidian-strategy]] — multi-abstraction note standard this depends on
