---
name: harvest
description: >
  Weekly vault sweep that collects content-flavored material scattered
  across _INBOX, drafts, journey, doctrine, system-patterns, project
  contexts, and recent reading. Output is a flat inventory in chat —
  not a ranked list, not auto-written to vault. User reviews and
  promotes selected items to _INBOX. Triggers on: harvest, sweep
  content material, what content material exists in the vault.
  Do NOT use for ranking (that's [[converge]]) or synthesis (that's [[dream]]).
capabilities: [vault-sweep, content-material-inventory, scattered-material-collection]
outputs: flat inventory in chat with provenance, abstraction layers, suggested matrix cell, suggested pillar per item — typically 15-30 items per run
cost: medium
speed: 3-5 min per run
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
  concrete: "Weekly sweep of vault that collects content-flavored material from scattered locations into a flat inventory presented in chat for user review and promotion to _INBOX"
  abstract: "Collection-mode pass over an accumulated knowledge surface, separating discovery from ranking and synthesis, producing visibility without commitment"
  fundamental: "What's invisible in a vault is what wasn't actively retrieved. Periodic sweep makes the dormant findable; ranking and synthesis follow but cannot precede."
  matches: [stocktaking in retail, archival surveys in libraries, quarterly portfolio review in VC, "see all your stuff at once" decluttering principle, military situation report]
---

# Harvest Workflow — Vault Sweep for Content Material

> Collects content-flavored material from scattered vault locations into a flat inventory. NOT synthesis (that's [[dream]]). NOT ranking (that's [[converge]]). Just collection + structuring, presented in chat for review.

---

## 1. PURPOSE

Content-flavored material accumulates in vault locations that aren't formally "content" — drafts that got abandoned, journey entries with content potential, doctrine entries whose evidence has never been published, system-patterns with project proof but no public expression, `_INBOX` entries tagged for content, project contexts with case-study material, recent reading flagged at gobble time.

Without a periodic sweep, this material stays dormant. [[converge]] ranks accumulated opportunities but operates on what's already in active circulation; harvest is the discovery step that makes scattered material visible.

**Why this exists:**
- The vault accumulates faster than user attention naturally retrieves
- `_INBOX` grows fast; many entries are content-flavored and never re-surfaced
- Drafts pile up in `/me/drafts/` with usable material lost to abandonment
- Journey entries (if you keep one) contain lived-experience proof points that never make it to content
- The "what content material exists in the vault" question requires a sweep, not a query
- Project silence pattern (per [[converge]] gotcha #10): project contexts often outnumber published posts. Every project with no content expression is potential content material unsurfaced.

---

## 2. WHEN TO USE / WHEN NOT TO USE

### Trigger conditions
- Weekly cadence (Sunday) — alongside [[converge]]
- Before a major content session — to surface forgotten material
- When user says "harvest", "sweep content material", "what's in the vault for content"
- After the vault has accumulated significantly (e.g., 20+ new items since last harvest)

### Anti-triggers (do NOT apply when)
- Synthesis is the goal — that's [[dream]]
- Ranking is the goal — that's [[converge]]
- Drafting — [[brief]] + write post
- Looking up a specific topic — use Grep/standard search
- Clearing `_INBOX` entries — that's weekly review (manual)

### Related workflows
- [[dream]] — sibling collection mechanism (synthesis on fresh material; harvest is on scattered older material)
- [[converge]] — downstream ranker that includes harvested-and-promoted items as input
- [[skillify]] — for extracting principles from harvested material if it warrants

---

## 3. CORE INSTRUCTIONS

### Step 1: Read [[_RULES]]
Standard. Harvest doesn't auto-write to vault but may stage promotions to `_INBOX` (with confirmation per Section 2).

### Step 2: Load Operating Filters (lightweight)
Just enough context to recognize "content-flavored":
- `/me/content-plan.md` (if populated) — narrative arc, formats, current campaign
- `/me/voice.md` — voice context (to evaluate framings)
- `/me/published/_INDEX.md` — anti-duplication baseline (don't surface what's already been published)

### Step 3: Sweep Vault Sources

| # | Source | Filter |
|---|--------|--------|
| 1 | `/me/ideas/_INBOX.md` | Entries explicitly marked as content ideas (not all `_INBOX` entries are). Sort by age. Flag entries 30+ days old that haven't been developed. |
| 2 | `/me/drafts/` | All non-archived drafts. Each is a potential content piece in some state. Note which are abandoned vs in-progress. |
| 3 | `/me/journey.md` | Entries with content potential — lived-experience moments, decision points, surprise observations. Filter to last 60 days unless user specifies wider window. |
| 4 | `/me/doctrine.md` | Entries with empirical evidence but no expression in `/me/published/_INDEX.md`. Flag as "doctrine awaiting first publication." |
| 5 | `/me/system-patterns.md` | Patterns with project evidence (1+ "Where observed" entry from your projects) but no published content expressing them. |
| 6 | `/projects/*-context.md` | Case-study material — scan for "I built X", "we shipped Y", "the result was Z" patterns. **Especially projects with no published content (project silence pattern).** |
| 7 | `/reading/` (last 30 days) | Strong angles flagged at gobble time. Look for content-candidate flags or strong "Connected Skills" / "Skill Candidates" sections. |

**Note on large files:** `_INBOX.md` and `doctrine.md` exceed Read tool limits. Use grep-based inventory passes per [[converge]] gotcha #7: `Grep "^## "` for doctrine titles, `Grep "^### \d"` with offset/limit for `_INBOX` recent entries.

### Step 4: Cross-Reference Against Published Index
For each candidate item, check `/me/published/_INDEX.md`:
- **Already expressed:** drop or note as "expressed — content variant available"
- **Adjacent to published:** note as "develops further"
- **Never expressed:** flag as fresh material

### Step 5: Structure Output

Each harvested item gets:
- **Title/Hook candidate:** one-line content-shaped framing
- **Source:** vault location (file + section if applicable)
- **Provenance:** how it surfaced (draft / journey / doctrine / pattern / project / reading)
- **Abstraction layers:** concrete + abstract (per [[_RULES]] Section 11)
- **Anti-duplication status:** never expressed / adjacent / partially expressed
- **Confidence:** how content-ready (high = could be drafted today, medium = needs a session, low = development required)

### Step 6: Present in Chat — Flat Inventory Format

```markdown
# Harvest Run — [YYYY-MM-DD] (N items found)

## DRAFTS (M items)
1. [[draft-slug]] — [hook candidate] — Status: abandoned YYYY-MM-DD. Provenance: draft. Anti-dup: never expressed. Confidence: medium.
...

## DOCTRINE — UNEXPRESSED (M items)
1. [[doctrine|Your Doctrine Name]] — "one-line description" — Anti-dup: never expressed. Confidence: high (draft exists).
...

## SYSTEM PATTERNS — NO CONTENT (M items)
1. [[system-patterns#A Relevant Pattern]] — Anti-dup: never expressed. Confidence: medium.
...

## JOURNEY — LIVED EXPERIENCE WITH CONTENT POTENTIAL (M items)
...

## PROJECT SILENCE — UNEXPRESSED PROJECTS (M items)
1. [[example-project-context]] — "I built X" potential. Anti-dup: never expressed. Confidence: low (needs session to extract).
...

## _INBOX CONTENT-FLAGGED (M items, sorted by age)
1. #N "Idea Title" — fresh (YYYY-MM-DD).
...

## RECENT READING WITH ANGLES (M items)
...
```

### Step 7: User Review and Routing

User reviews inventory in chat. Per item, route by intent:

| Pick intent | Action |
|---|---|
| **Brief now** (item ready, shipping this week) | Pass directly to [[brief]] via Mode A (in-context). Skip `_INBOX`. |
| **Defer brief** (committing but later) | Append to `_INBOX.md` with full sourced material. Brief later via Mode B. |
| **Develop more** (interesting but needs work) | Append to `_INBOX.md` with `status: developing` flag. |
| **Route to [[dream]]** | Items with cross-source synthesis potential — flag for next dream run instead of briefing. |
| **Archive** | Drafts that should move to `/me/drafts/archive/` — flagged but not auto-moved (post-MVP cleanup). |
| **Discard** | Content-shaped but not worth pursuing → noted in chat output, no action. |

**`_INBOX` should NOT receive every harvested item — only deferred or developing items.** Ready-to-brief items bypass `_INBOX`. This prevents `_INBOX` bloat.

NO auto-write to vault. All `_INBOX` appends require explicit user confirmation per routing plan ([[_RULES]] Section 2).

---

## 4. REFERENCE MATERIAL

### What counts as "content-flavored"?
- Has a hook, a take, a position, a story, a number, an observation
- Could become a post if expanded
- Is NOT just a fact, lookup, or reference material

### What does NOT count as "content-flavored"?
- Pure reference (specifications, glossaries, architectural diagrams)
- Tasks and todos
- Calendar/scheduling material
- Data dumps without framing
- Half-finished thoughts with no claim or observation

### "Project silence" detection
Special category — projects with active context files but ZERO published content expressing them. Once you have several projects, expect most to be in silence. Each is a potential content piece.

### Anti-pattern: harvest as dump
Harvest is NOT "list everything in the vault." It's specifically content-flavored material. If a sweep produces 100+ items, the filter is too loose — tighten by raising the "content-flavored" threshold.

---

## 5. GOTCHAS

| # | Gotcha | What goes wrong | What to do instead |
|---|--------|-----------------|-------------------|
| 1 | Harvesting EVERYTHING | Output is overwhelming, user can't review | Filter to content-flavored only. 15-30 items per run is healthy. 50+ means filter is too loose. |
| 2 | Auto-promoting to `_INBOX` | Pollutes `_INBOX` with un-vetted material | NEVER auto-promote. User selects items per routing plan. |
| 3 | Missing the project silence pattern | Only surfaces ideas already in `_INBOX` | Step 3 #6 explicitly looks for projects with no published content. Project silence IS the discovery. |
| 4 | Harvest as ranking | Output reads like ranked opportunities | Harvest is FLAT inventory. [[converge]] does ranking. Keep separate. |
| 5 | Ignoring anti-duplication | Surfaces material that's been expressed already | Step 4 mandatory. `/me/published/_INDEX.md` must be checked. |
| 6 | Treating harvest as comprehensive | User assumes everything content-flavored is in output | Harvest is best-effort sweep. Hidden material exists. Re-run weekly catches what got missed. |

*Note: this workflow has not yet been used in real sessions. Real-usage gotchas required before promotion to `/workflows/library/` (per [[_RULES]] Section 6a). Promotion criterion: 3 weekly runs without breaking + 5+ real-usage gotchas captured.*

---

## 6. EXAMPLES

### Good output (one section)
```markdown
## DOCTRINE — UNEXPRESSED (8 items)

1. [[doctrine|The Review Gap]]
   - Hook candidate: "The first review finds the obvious. The second finds what the first missed."
   - Provenance: doctrine.md
   - Anti-dup: never expressed.
   - Confidence: HIGH — well-defined, evidence-backed, easy to draft.

2. [[doctrine|Your Other Doctrine]]
   - Hook candidate: "One-line content-shaped framing of the principle."
   - Provenance: doctrine.md
   - Anti-dup: adjacent — published a related post 30 days ago, this would extend.
   - Confidence: MEDIUM — needs a session to find the angle.
```

### Bad output (anti-pattern)
```markdown
## EVERYTHING

1. doctrine.md - N entries, here's the full list
2. _INBOX.md - all entries
3. /reading/ - all files
[Dump, no filtering, no provenance, no content-flavor check. This is NOT harvest.]
```

---

## 7. QUICK REFERENCE

```
HARVEST = vault sweep for content-flavored scattered material → flat inventory in chat
SCAN: drafts + doctrine-unexpressed + system-pattern-no-content + journey + project-silence + _INBOX-content-flagged + reading-recent-angles
FILTER: content-flavored only — has hook/take/position/story/number/observation
ANTI-DUP: cross-check /me/published/_INDEX.md
OUTPUT: flat inventory in chat — provenance, layers, matrix, pillar, confidence per item
NO RANK (that's /converge). NO SYNTHESIS (that's /dream).
NO AUTO-WRITE — user promotes items to _INBOX with confirmation
Read _RULES.md before any staging writes
```

---

## Connected Files

- [[_RULES]] — vault constitution
- [[converge]] — downstream ranker that consumes harvested-and-promoted items
- [[dream]] — sibling collection workflow (cross-source synthesis on fresh material)
- [[brief]] — downstream Strategist→Writer handoff for ready-to-brief picks
- [[content-plan]] — narrative arc (if populated)
- [[published/_INDEX|published _INDEX]] — anti-duplication baseline
