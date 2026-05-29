---
name: brief
description: >
  Expands a picked angle into a writer-ready package. Reads angle source +
  vault context (voice, doctrine, project specifics, learnings) and produces
  a structured brief at /me/drafts/[slug].md. Brief section is the Strategist's
  output; write post later appends Draft sections to the same file.
  Three input modes: (a) in-context angle from active /converge or /harvest
  output, (b) _INBOX entry reference for deferred items, (c) free-text angle
  for ad-hoc invocation.
  Triggers on: brief, brief this, brief opportunity [N], brief on [topic],
  brief #[inbox-number].
  Do NOT use for ranking (that's [[converge]]) or synthesis (that's [[dream]])
  or final drafting (that's write post).
capabilities: [angle-expansion, vault-context-loading, writer-ready-packaging, voice-calibration-per-topic]
outputs: writes "## Brief" section to /me/drafts/[slug].md (creates file if not exists, appends if exists), also presents brief in chat
cost: medium-high
speed: 3-7 min per brief
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
  concrete: "Workflow that takes a picked angle (from /converge, /harvest, _INBOX, or ad-hoc) and produces a writer-ready brief saved to /me/drafts/[slug].md as the foundation for write post"
  abstract: "Strategist→Writer handoff artifact — converts an angle into structured material the Writer can draft from without needing to research"
  fundamental: "The thinking that makes content land happens BEFORE the drafting. A good brief makes drafting mechanical; a missing brief makes drafting an architecture session."
  matches: [editorial briefing in newsrooms, creative briefs in advertising, deal memos in M&A, mission orders in military operations, recipe mise en place]
---

# Brief Workflow — Strategist→Writer Handoff

> Takes a picked angle. Produces a structured brief. Saves to `/me/drafts/[slug].md` as a "## Brief" section. The Writer (write post) reads the brief and produces drafts in the same file. Decoupled from drafting — invoked separately.

---

## 1. PURPOSE

The thinking that makes content land happens BEFORE the drafting. A good brief turns "I have an angle" into "the Writer can produce a clean draft on first pass." Without a brief, drafting becomes a research session — looking up doctrine quotes, recalling project specifics, deciding format and voice notes mid-write.

This is the Strategist→Writer handoff. A Strategist proposes angles ([[converge]] or [[harvest]]). A Strategist expands picked angles into briefs (this workflow). A Writer drafts from briefs. The handoff is the workflow.

**Why this exists:**
- [[converge]] surfaces opportunities with sourced material refs but doesn't expand them
- [[harvest]] surfaces inventory items but doesn't research them
- Direct invocation of write post on an angle bypasses the strategy work and produces shallow drafts
- The brief is where voice notes, doctrine connections, anti-AI-slop checks specific to topic, and format decisions get locked BEFORE the prose
- Iteration is cheaper at brief level than at draft level

---

## 2. WHEN TO USE / WHEN NOT TO USE

### Trigger conditions (three input modes)

**Mode A — In-context angle (most common):**
- User has just run [[converge]] or [[harvest]] in the same session
- User says "brief opportunity 3" / "brief the [angle] one" / "brief this"
- Brief reads the in-context output and works from it directly

**Mode B — `_INBOX` entry reference:**
- Item has been staged in `_INBOX` for deferred briefing
- User says "brief #N" / "brief inbox entry [title]"
- Brief reads the entry from `_INBOX.md`, expands

**Mode C — Free-text angle (ad-hoc):**
- User has an angle in mind that isn't in `_INBOX` yet
- User says "brief on [topic/angle]"
- Brief works from the prompt + vault context

### Anti-triggers (do NOT apply when)
- Final drafting — that's write post
- Surfacing/finding angles — that's [[converge]] / [[harvest]] / [[dream]]
- Quick edit on an existing draft — direct edit, not a brief
- Brief already exists for this slug AND no new angle — edit existing brief, don't re-run

### Related workflows
- [[converge]] — upstream ranker producing opportunity picks
- [[harvest]] — upstream collector producing inventory items
- [[dream]] — upstream synthesizer producing content angles (via `/me/dreams/`)
- write post — downstream drafter that reads briefs from `/me/drafts/[slug].md`

---

## 3. CORE INSTRUCTIONS

### Step 1: Read [[_RULES]]
Standard for vault-operating workflows. Required because brief writes to `/me/drafts/`.

### Step 2: Identify Input Mode and Source

| Mode | What to extract |
|---|---|
| A — In-context | The opportunity/inventory entry from the conversation context. Pull title, pattern, sourced material refs, suggested format, suggested matrix cell, suggested pillar. |
| B — `_INBOX` ref | Read the specific entry from `/me/ideas/_INBOX.md`. Pull title, body, abstraction.matches, sourced material if attached. |
| C — Free-text | Parse the user's angle prompt. Identify topic, hook intent, claim. |

### Step 3: Derive Slug
Generate kebab-case slug from angle title. Examples:
- "The Review Gap" → `review-gap`
- "Pre-Commit Self-Review" → `pre-commit-self-review`
- "Surfaces Not Paths" → `surfaces-not-paths`

Check `/me/drafts/[slug].md` — if exists, plan to APPEND new "## Brief — [Title] (revision N)" section to existing file (preserving prior brief and draft sections), not overwrite. Show this in routing plan.

### Step 4: Load Vault Context
Read in this order:

| Source | What to extract |
|---|---|
| `/me/voice.md` (or `/skills/library/voice.md`) | Voice rules. Mandatory for any post draft. |
| `/me/content-plan.md` (if populated) | Narrative arc, publishing cadence, active formats. |
| Sourced material refs (from input) | Read each — doctrine entries, project contexts, reading entries, system-patterns. Pull the actual claims, quotes, specifics. |
| Any topic-specific anti-slop / anti-tells skill | Optional. If you've authored a skill that catches AI-default traps for the topic, load it here. |
| `/me/published/_INDEX.md` | Anti-duplication — confirm angle hasn't been expressed in published variant. |

**Note on large files:** if `doctrine.md` is referenced, use grep-based targeted reads per [[converge]] gotcha #7 — don't try to load full file.

### Step 5: Construct the Brief

Brief structure (write to `/me/drafts/[slug].md` as "## Brief — [Title]" section):

```markdown
## Brief — [Title]
*Created: [YYYY-MM-DD]. Status: pending-write. Input mode: [A | B | C].*

**Angle (one sentence):**
[The take/POV in one sentence — what this post argues]

**Hook candidates (2-3):**
1. [Opener candidate 1 — voice-compliant, mid-action, no setup]
2. [Opener candidate 2 — alternative framing]
3. [Opener candidate 3 — optional]

**Key points (3-5 beats):**
- [Beat 1: setup or observation]
- [Beat 2: turn / unexpected angle]
- [Beat 3: landing / so-what]
- [Optional Beat 4-5]

**Sourced material expanded:**
- [[doctrine|Name]] — actual quote or claim, not just reference
- [[project-name-context]] — specific number, story, or moment
- [[reading-entry]] — exact insight to draw on
- [[journey]] — lived experience proof point if applicable

**Voice notes for this topic:**
- [Topic-specific voice rules — e.g., "land on asymmetric move", "don't mention X word", "use the 'I didn't see that. The vault did.' beat pattern"]

**Format spec:**
- Channel: [LinkedIn | X | Both | Newsletter | Blog]
- Format: [long-form | thread | carousel | single | etc.]
- Target length: [word count or tweet count]
- Companion image: [yes / no — describe if yes]

**Doctrine connections:**
- Expresses: [[doctrine|X]] (primary)
- Tensions: [[doctrine|Y]] (productive contradiction worth naming)
- Validates: [[doctrine|Z]] (extends evidence)

**Anti-AI-slop checks for this topic:**
- [Specific traps to watch — e.g., "Avoid crowdframing ('everyone's building X now')", "Don't gift-wrap with 'this is the future of work'"]

---
```

### Step 6: Write to /me/drafts/[slug].md

Per [[_RULES]] Section 2: show routing plan first.

Routing plan format:
- New file? Show: "Will create `/me/drafts/[slug].md` with Brief section."
- Existing file? Show: "Will append Brief section to existing `/me/drafts/[slug].md`. Prior content preserved."
- Anti-duplication hit? Show: "Angle [X] already expressed in published _INDEX as [Y]. Continue?"

Wait for explicit "confirm" / "go" / "proceed". Then write.

### Step 7: Present Brief in Chat
Output the full brief in chat for immediate review. User can:
- Read and approve as-is → invoke `/write post [slug]` next
- Edit the file directly before invoking write post
- Request adjustments to the brief in conversation

Brief stays as the canonical Strategist output until user invokes write post or requests changes.

---

## 4. REFERENCE MATERIAL

### Slug derivation
- Lowercase, kebab-case
- Strip articles ("the", "a")
- Keep distinctive words, drop filler
- Max 5-6 words

### When to append vs overwrite
- **Append (default):** existing file has Brief sections from prior runs (preserve history). New section: "## Brief — [Title] (revision N)"
- **Overwrite:** prior brief was wrong, user explicitly says "rewrite the brief"

### Voice file precedence
If `/me/voice.md` and `/skills/library/voice.md` differ, prefer `/me/voice.md` per [[_RULES]] Section 3. The skill copy lags during edits.

### Anti-duplication scope
Brief checks against `/me/published/_INDEX.md` for "this angle was already published" and against existing `/me/drafts/[slug].md` for "this slug already exists." Both warnings shown in routing plan; user decides.

---

## 5. GOTCHAS

| # | Gotcha | What goes wrong | What to do instead |
|---|--------|-----------------|-------------------|
| 1 | Brief reads like an outline of the post | Writer has nothing left to do — brief contains the prose | Brief is structured material + voice notes, NOT prose. Hook candidates are openers, not opening paragraphs. Key points are beats, not sentences. |
| 2 | Skipping voice load | Brief misses topic-specific voice calibration | Voice load is mandatory Step 4. Even if voice is "obvious," explicit load prevents drift. |
| 3 | Sourced material refs without quotes | Writer has to research vault during drafting | Brief MUST expand refs into actual claims/quotes/specifics. The brief is where research happens, not the draft. |
| 4 | Brief never reviewed before /write post | Writer drafts off bad brief, draft is bad | User reviews brief in chat OR file before invoking write post. Brief output is a checkpoint. |
| 5 | Slug collision with existing draft | New brief overwrites prior work | Step 6 routing plan must surface existing-file warning. User decides append vs overwrite. |
| 6 | Auto-promoting picks to `_INBOX` then briefing | Adds unnecessary `_INBOX` entry for items being briefed immediately | Brief accepts in-context angle directly (Mode A). `_INBOX` is for DEFERRED briefing only, not pipeline staging. |

*Note: this workflow has not yet been used in real sessions. Real-usage gotchas required before promotion to `/workflows/library/` (per [[_RULES]] Section 6a). Promotion criterion: 3 briefs run end-to-end without breaking + 5+ real-usage gotchas captured.*

---

## 6. EXAMPLES

### Good brief output (excerpt)

```markdown
## Brief — Pre-Commit Self-Review
*Created: YYYY-MM-DD. Status: pending-write. Input mode: A.*

**Angle:** 30 seconds of structured self-review before commit catches 80% of what a human reviewer would flag — and most agent workflows skip it entirely.

**Hook candidates:**
1. "Before any commit, the agent reviews its own diff against a 7-point checklist."
2. "The cheapest quality gate is the one between generation and persistence."
3. "Most AI-written code quality regressions come from skipped self-review, not inability to review."

**Key points:**
- The default agent loop optimizes for completion, not quality
- The same agent that wrote the code can critique it — but only if explicitly prompted to switch modes
- 7-point checklist: dead code, edge cases, error handling, naming, tests, scope, secrets
- Real example: caught an unused import + a swallowed exception in a 3-file diff
- 30 seconds prevented two cycles of "wait, why doesn't this work in production"

**Sourced material expanded:**
- [[doctrine|The Review Gap]] (if populated) — "first review finds the obvious; second review, done fresh, finds what the first missed"
- [[skills/inbox/example-skill|pre-commit-self-review]] — the skill candidate this brief expresses
- [[example-saas-project-context]] — Tempo's CI/CD pipeline as the proof context

**Voice notes:**
- Land on the asymmetric move: "the cheapest quality gate is between generation and persistence"
- Mid-action open: drop reader into the moment the self-review catches something
- Avoid framing as "best practice" — the reader already knows reviews are good

**Format spec:**
- Channel: LinkedIn (long-form) + optional X thread
- Format: 6-beat post, ~250 words
- Target length: 250 words LinkedIn, 3-tweet X thread

**Doctrine connections:**
- Expresses: [[doctrine|The Review Gap]] (primary, if populated)
- Validates: pre-commit self-review skill (sibling — operationalizes the doctrine)

**Anti-AI-slop checks:**
- Don't crowdframe ("most teams skip self-review")
- Don't gift-wrap ending with "this is how you build production-grade AI workflows"
- Watch for em dash creep around "self-review"
```

### Bad brief output (anti-pattern)

```markdown
## Brief — Some Topic
*Created: YYYY-MM-DD.*

**Angle:** Write a post about agents.

**Body:**
Agents are powerful and most people don't understand them. We should explain
how to use them properly. The post should cover what an agent is, why it
matters, and how to deploy one. End with a call to action.

[NO hook candidates, NO sourced material, NO voice notes, NO format spec.
This is an outline pretending to be a brief.]
```

---

## 7. QUICK REFERENCE

```
BRIEF = picked angle → writer-ready package → /me/drafts/[slug].md
INPUT MODES: in-context (default), _INBOX ref (deferred), free-text (ad-hoc)
READ: voice + content-plan (if populated) + sourced material refs + published _INDEX
OUTPUT STRUCTURE: angle, hook candidates, key points, sourced material expanded, voice notes, format spec, doctrine connections, anti-AI-slop checks
WRITE: /me/drafts/[slug].md as "## Brief — [Title]" section
APPEND, don't overwrite (preserve prior briefs)
ALSO output in chat for immediate review
NEXT: user invokes write post [slug] when ready
Read _RULES.md before staging
```

---

## Connected Files

- [[_RULES]] — vault constitution
- [[converge]] — upstream ranker producing opportunity picks
- [[harvest]] — upstream collector producing inventory items
- [[dream]] — upstream synthesizer producing content angles (via `/me/dreams/`)
- [[voice]] — voice rules (mandatory load)
- [[content-plan]] — narrative arc + publishing cadence (if populated)
- [[doctrine]] — doctrine entries referenced in briefs
- [[published/_INDEX|published _INDEX]] — anti-duplication baseline
