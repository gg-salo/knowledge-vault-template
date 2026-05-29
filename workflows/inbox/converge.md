---
name: converge
description: >
  Vault-wide weekly synthesis pass. Scans accumulated material across
  doctrine, system patterns, project contexts, reading clusters, dream
  staging, and inbox to surface ranked publishable opportunities. Use weekly
  for content planning. Triggers on: converge, weekly synthesis, surface
  opportunities, what should I publish this week.
  Do NOT use for fresh-batch synthesis (that's [[dream]]) or final draft
  generation (that's [[brief]] + write post).
capabilities: [vault-synthesis, opportunity-ranking, pattern-clustering, anti-duplication-scan]
outputs: ranked list of 5-10 publishable opportunities with sourced material refs and connection maps, presented in chat
cost: high
speed: 5-10 min per run
requires: []
parallelizable: false
human_gate: true
metadata:
  version: 0.1.0
  type: process
  scope: personal
  projects: [all]
  status: candidate
abstraction:
  concrete: "Weekly vault scan that ranks publishable content opportunities by combining dream-staged angles, unexpressed doctrines, accumulated reading patterns, and longest-sitting ideas, with anti-duplication against the published log"
  abstract: "Periodic accumulated-pattern surfacing — converts dormant cross-source patterns into actionable surface area through deliberate batch synthesis"
  fundamental: "Compound knowledge requires periodic harvest. Without scheduled surfacing, accumulated value sits dormant indefinitely. The harvest is what turns capture into output."
  matches: [editorial planning meetings, R&D portfolio reviews, intelligence analyst weekly briefings, REM-sleep memory consolidation, venture capital portfolio rebalancing]
---

## 1. PURPOSE

Converts the vault's accumulated material into a ranked list of publishable opportunities each week. Without this pass, valuable patterns that took weeks to form sit invisible — visible only as moments of "I should write something" without sourced material to back it up.

**Why this exists:**
- Mature angles (3+ readings clustering, unexpressed doctrines, stable system patterns) only surface during periodic scans
- Day-of ideation forces blank-page drafting; pre-sourced material cuts drafting time meaningfully
- Anti-duplication against `/me/published/_INDEX.md` prevents repeating angles already shipped
- Replaces ad-hoc `/inverse-search` and `/surface-content-ideas` with a unified synthesis pass

---

## 2. WHEN TO USE / WHEN NOT TO USE

### Trigger conditions
- User says "converge", "weekly synthesis", "surface opportunities", "what should I publish this week"
- Weekly review cadence (per [[_RULES]] Section 8)
- Before content planning sessions

### Anti-triggers (do NOT apply when)
- Real-time ideation on a single fresh gobble — that's [[dream]]
- Drafting a picked angle into a final post — that's [[brief]] + write post
- Searching for a specific topic — use Grep/standard search
- Reactive content (industry moments, replies) — converge is for accumulation-based, not event-based

### Related workflows
- [[dream]] — feeds `/me/dreams/` which converge reads as input
- [[brief]] — natural next step after picking from converge output
- [[gobble]] — feeds `/reading/` which converge clusters
- [[skillify]] — sibling synthesis workflow (operates on reading entries to extract skills, not content angles)

---

## 3. CORE INSTRUCTIONS

### Step 1: Read `_RULES.md`
Standard for vault-operating workflows. Required even though Converge primarily reads — it may stage outputs to `_INBOX` after explicit user picks.

### Step 2: Load Anti-Duplication Baseline
Read `/me/published/_INDEX.md`. Note recent angles, recurring themes, and explicit "already said this" patterns. Build an exclusion set: any opportunity whose core angle matches a published item should be filtered or flagged for de-prioritization.

### Step 3: Scan Vault Sources
Read in this order. Operating filters (1-6) load first to inform how the rest is evaluated. Then accumulated material (7-13):

| # | Source | What to extract |
|---|--------|-----------------|
| 1 | `/me/content-plan.md` (if populated) | **Active substrate** — narrative arc, publishing cadence, active formats, current campaign. Read FIRST if it exists. |
| 2 | `/me/voice.md` (or `/skills/library/voice.md`) | Voice context. Each opportunity's framing must pass voice rules. |
| 3 | Any active-campaign files in `/me/drafts/` | If you have a multi-post campaign in flight, surface it so converge can anti-duplicate against planned posts AND use it as a source of pre-shaped angles. |
| 4 | `/me/dreams/` | Unprocessed dream outputs — fresh angles staged but not yet promoted |
| 5 | `/me/doctrine.md` | All doctrine entries; flag those NOT yet expressed in published `_INDEX` |
| 6 | `/me/system-patterns.md` | Architectural patterns; flag those with project evidence but no content yet |
| 7 | `/projects/*-context.md` | Active project state, recent updates, lived-experience material |
| 8 | `/reading/` (last 14 days) | Cluster gobbles by `abstraction.matches` overlap |
| 9 | `/me/ideas/_INBOX.md` | All entries; sort by age × connection count |

### Step 4: Cluster and Score
For each candidate opportunity, score on three dimensions (0-3 each):

| Dimension | Question | Scale |
|-----------|----------|-------|
| **Connection density** | How many distinct vault nodes does this touch? | 1=2-3 nodes, 2=4-6, 3=7+ |
| **Pattern strength** | How many independent sources support this? | 1=single source, 2=2-3 sources, 3=4+ sources or cross-domain match |
| **Unexpressed-ness** | How fresh is this angle vs published `_INDEX`? | 1=variant published recently, 2=adjacent topic, 3=never expressed |

**Combined score: 3-9. Rank descending. Discard anything below 5.**

### Step 5: Format Output

For each opportunity (top 5-10 only):

```markdown
## OPPORTUNITY [N] — [Title/Angle]

**Pattern:** [one-line abstract]
**Score:** [X/9] — connection: [Y], pattern: [Y], unexpressed: [Y]
**Status:** [ready-to-brief | needs-material | development-only]

**Sourced material:**
- [[file-1]] — [why it supports this]
- [[file-2]] — [why it supports this]
- [[file-3]] — [why it supports this]

**Connection map:**
[doctrine touched] ←→ [pattern touched] ←→ [project touched] ←→ [reading cluster]

**Suggested format:** [LinkedIn long-form | X thread | Series continuation | Essay]
**Suggested next step:** [/brief OR develop more material first]
```

### Step 6: Present and Wait
Output the ranked list in chat. Do NOT auto-write a file. The user reviews and picks 1-3 opportunities to develop.

### Step 7: Route Picks by Intent

After user picks N opportunities, route each based on user's intent:

| Pick intent | Action |
|---|---|
| **Brief now** (shipping this week) | Pass directly to [[brief]] via Mode A (in-context). Skip `_INBOX`. Brief writes to `/me/drafts/[slug].md`. |
| **Defer brief** (committing but later) | Append entry to `/me/ideas/_INBOX.md` with full sourced material. Brief later via Mode B (`_INBOX` ref). |
| **Develop more** (interesting but not ready) | Append entry to `_INBOX.md` with `status: developing` flag. Re-evaluate next converge run. |
| **Discard** | Note in chat. No vault write. |

**`_INBOX` should NOT receive every pick — only deferred or developing items.** Ready-to-brief picks bypass `_INBOX` entirely. This prevents `_INBOX` bloat over time.

Per [[_RULES]] Section 2: routing plan mandatory before any vault writes. If staging to `_INBOX`, show planned appends and wait for explicit "confirm" before writing.

---

## 4. REFERENCE MATERIAL

### Cluster detection via `matches` field
Per [[_RULES]] Section 11, every gobble has an `abstraction.matches` field listing cross-domain pattern matches. Converge clusters `/reading/` entries by `matches` overlap — three articles matching "swarm intelligence" form a cluster regardless of their concrete domains. This is the multi-abstraction note standard doing real work.

### Status definitions
| Status | Meaning | Next action |
|--------|---------|-------------|
| **ready-to-brief** | 3+ sourced materials, score ≥6, no major gaps | Pass to [[brief]] |
| **needs-material** | High pattern score but thin sources (<3) | Flag domains to gobble next week |
| **development-only** | Interesting pattern but no clear angle yet | Stays in `_INBOX` for next run |

### Three sources of weekly content
Converge is one of three sources. It is NOT meant to fill the entire content calendar:

| Source | Trigger | Where converge fits |
|--------|---------|---------------------|
| Reactive | Industry moment | Bypasses converge entirely |
| Series | Pre-committed arc | Bypasses converge entirely |
| Synthesis (Converge) | Weekly accumulation pass | This workflow |

A typical week mixes all three. If converge produces thin output one week, that's a signal — not a failure mode.

---

## 5. GOTCHAS

| # | Gotcha | What goes wrong | What to do instead |
|---|--------|-----------------|-------------------|
| 1 | Re-surfacing the same opportunity weekly | Same items rank high every run, ideation feels circular | Track surfaced opportunities; deboost items surfaced in last 2 runs |
| 2 | Single-source patterns ranking high | Confirmation bias — one strong source looks like a pattern | Pattern strength requires 2+ independent sources unless source is a cross-domain match |
| 3 | Skipping the anti-duplication scan | Surfaces angles already published, wastes ideation cycles | Always read `/me/published/_INDEX.md` as Step 2, never skip |
| 4 | Outputs written to vault before user picks | Pollutes `/me/ideas/_INBOX.md` with un-vetted opportunities | Present in chat first; only stage to `_INBOX` after explicit user pick |
| 5 | Converge as draft generator | Output reads like content instead of opportunity refs | Converge stops at sourced opportunities; [[brief]] expands picks; write post drafts |
| 6 | Stale `matches` fields on old `/reading/` entries | Clustering misses cross-domain links | If high-value entries have empty `matches`, flag for retro-fill before promoting opportunity |

### Anticipated gotchas (populate from your first runs)

| # | Gotcha | What goes wrong | What to do instead |
|---|--------|-----------------|-------------------|
| 7 | **Read tool size limits on large vault files** | As `/me/doctrine.md` and `/me/ideas/_INBOX.md` accumulate, full reads exceed Read tool limits. | Use grep-based inventory passes for large files: `Grep "^## "` for doctrine titles, `Grep "^### "` with offset/limit for `_INBOX` recent entries. Step 3 should fall back to grep-based scans on large files. |
| 8 | **Substance-level anti-duplication missed** | Anti-duplication that only matches post titles in `published/_INDEX.md` misses substance overlap — a previously-published post that used your candidate angle as a running example has effectively expressed it. | Step 2 anti-duplication must scan both titles AND notes/example fields. If a post mentions a candidate angle as a running example, treat the angle as effectively expressed. |
| 9 | **Librarian-mode output dominates without `/dream` upstream** | Without populated `/me/dreams/`, converge ranks obvious "express this named thing" picks. Non-obvious connections (cross-doctrine tension, project silence, unnamed self-evidence) require [[dream]]-style cross-source logic. | Run [[dream]] before [[converge]] in the weekly cycle. If `/me/dreams/` is empty, accept that converge output skews toward Librarian-mode this run. |
| 10 | **Project silence missed** | Reading project contexts as a group misses the "project silence" pattern — projects that have never appeared in published content. Each represents a potential "I built X" content piece. | Add Step 4b: cross-reference each `/projects/*-context.md` against `published/_INDEX.md`. Flag projects with zero content expression. |
| 11 | **Cross-doctrine tension surfacing not attempted** | Some doctrines contradict each other. These tensions are some of the highest-value content fuel and require comparing sources, not ranking them independently. | Add Step 4c: doctrine-pair tension scan. For doctrines with `supersedes` or contradiction signals, surface the tension as a content opportunity. |

*Promotion criterion: 3 weekly runs without breaking + at least 5 real-usage gotchas captured. Replace the anticipated gotchas above with real ones as you run the workflow.*

---

## 6. EXAMPLES

### Good output (one opportunity entry)
```markdown
## OPPORTUNITY 3 — "The Pattern Nobody is Naming"

**Pattern:** Five recent industry trends (each appearing independent) are one trend at the abstract level: [the convergent shape]
**Score:** 8/9 — connection: 3, pattern: 3, unexpressed: 2
**Status:** ready-to-brief

**Sourced material:**
- [[reading-entry-1]] — angle from research domain
- [[reading-entry-2]] — angle from practitioner domain
- [[reading-entry-3]] — angle from product domain
- [[reading-entry-4]] — angle from infrastructure domain
- [[reading-entry-5]] — distribution-side proof
- [[doctrine|Your Supporting Doctrine]] — anchors the abstract claim

**Connection map:**
[doctrine touched] ←→ [pattern touched] ←→ [project touched] ←→ [5 reading entries clustered]

**Suggested format:** LinkedIn long-form essay (cross-source synthesis)
**Suggested next step:** [[brief]] — sourced material is strong, anti-duplication clear, doctrine alignment explicit
```

### Bad output (anti-pattern)
```markdown
## OPPORTUNITY 1 — Write about agents
This week you should write about agents. They're hot right now.
[NO sourced material, NO score, NO connection map, NO pattern statement —
this is ideation, not converge output. Converge always cites the vault.]
```

---

## 7. QUICK REFERENCE

```
CONVERGE = vault-wide weekly synthesis → ranked publishable opportunities
READ /me/published/_INDEX.md FIRST → anti-duplication baseline
SCAN dreams + doctrine + system-patterns + projects + /reading/ + _INBOX + journey
SCORE: connection density + pattern strength + unexpressed-ness (3-9 combined)
RANK descending, output 5-10, discard <5
PRESENT in chat — never auto-write to vault
USER picks → /brief takes over
Read _RULES.md before any staging writes
```

---

## Connected Files
- [[_RULES]] — vault constitution (read before staging writes)
- [[dream]] — sibling workflow producing `/me/dreams/` inputs
- [[brief]] — downstream workflow that takes converge picks
- [[harvest]] — sibling collection workflow
- [[obsidian-strategy]] — multi-abstraction note standard this depends on
- [[doctrine|The Worthiness Gate]] — the curation principle this workflow extends (if doctrine.md is populated)
