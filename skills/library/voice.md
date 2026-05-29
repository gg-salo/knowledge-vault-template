---
name: voice
description: >
  Personal voice and tone directives. Applied to every draft, post,
  email, and public-facing piece of writing Claude produces on behalf
  of the vault owner. This is the shareable skill copy — the source
  lives at /me/voice.md. Both files must stay in sync.
capabilities: [voice-enforcement, tone-matching, anti-slop]
outputs: a voice specification used when drafting or reviewing public-facing content
cost: low
speed: near-instant (read-only reference during drafting)
requires: []
parallelizable: true
human_gate: false
metadata:
  version: 0.1.0
  type: process
  scope: personal
  projects: [all]
  status: placeholder
---

[PLACEHOLDER — voice not yet defined]

> This file is a synced copy of `/me/voice.md`. It is populated during first-run setup (see `/SETUP.md`).
>
> **Sync rule:** when you update voice, update BOTH `/me/voice.md` (source) AND `/skills/library/voice.md` (this file). See `_RULES.md` Section 3.

---

## 1. PURPOSE

**Prevents Claude from drafting in default-assistant register** — the hedging, gift-wrapped, slightly corporate voice that every AI assistant falls back to when no constraint is specified. This skill injects the vault owner's actual voice into every public-facing draft.

**Why this exists:**
- Default Claude voice is detectable and homogenized
- A personal brand requires consistency across drafts that span months
- Tone drift is invisible until a reader flags it — the skill prevents drift proactively

---

## 2. WHEN TO USE / WHEN NOT TO USE

### Trigger conditions
- Any draft of public-facing content (posts, threads, newsletters, long-form)
- Landing page or marketing copy for the user's own projects
- Review or edit of existing draft content
- Email intended for a public audience

### Anti-triggers (do NOT apply when)
- Internal notes, vault files, or Claude-facing documentation (keep those clean and technical)
- Code comments or commit messages (neutral engineering voice)
- Direct replies to a user's private message (match the conversation's register, not the public voice)

### Related skills
- (none yet — add related skills here as you build them, e.g., a topic-specific anti-AI-slop filter)

---

## 3. CORE INSTRUCTIONS

*(Populated during first-run setup. The sections below mirror `/me/voice.md` and are synced from it.)*

### CHARACTER
[fill in during setup]

### BASELINE
[fill in during setup]

### THE MOVE
[fill in during setup]

### RHYTHM
[fill in during setup]

### ZERO
*(Things the agent must never do when writing in this voice.)*
[fill in during setup]

### TEST
[fill in during setup]

### PLATFORMS
*(Optional — per-platform adjustments.)*
[fill in during setup if relevant]

---

## 5. GOTCHAS

| # | Gotcha | What goes wrong | What to do instead |
|---|--------|-----------------|-------------------|
| 1 | [TODO — populate from first real use] | | |

---

## 9. QUICK REFERENCE

```
VOICE = character + baseline + the move + rhythm + zero + test
ALWAYS check against ZERO list before returning a draft
NEVER apply to internal notes or code comments
Synced with /me/voice.md — update both when voice changes
```

---

## Connected Files

- [[_RULES]] — vault constitution (Section 3 covers voice sync rule)
- [[voice|me/voice.md]] — the source file
- [[SETUP]] — first-run setup
