---
name: vault-guide
type: meta
scope: personal
description: >
  Read this file when asked to help manage, organize, or consult on
  the vault. Also read when starting any vault-related session.
  This is the onboarding document for Claude acting as vault librarian.
---

## What This Vault Is

A personal **Intelligence Layer** — the librarian for your work. Three components in one architecture: a substrate of plain markdown files, workflows that maintain it without your attention, and an AI that reads it as native context every session.

Adjacent to "second brain" tools but sharper. Most second brains solve capture. The Intelligence Layer also **actively surfaces** — surfaces connections you didn't ask for, loads your real history into every agent conversation, encodes your judgment so it survives your forgetting.

Every project has a context file. Every principle has a doctrine entry. Every reusable pattern is a skill. Every external source gets gobbled. Everything connects via typed relationships.

The vault compounds. Day 1 PRD review finds N skill gaps. Day 2 review of the same PRD finds 0. Same methodology, richer memory, materially better output. That's the system working.

---

## Two-Minute Onboarding

Start every vault session by reading these four files:

```
/_RULES.md                 — the vault constitution
/me/obsidian-strategy.md   — all architectural decisions
/me/vault-todo.md          — current task list and phase status
/me/doctrine.md            — named principles with evidence
```

That's it. The vault is the context. You don't need the conversation that built it.

---

## Who [You Are]

Populated during first-run setup — see `/me/profile.md`. Claude reads this to maintain correct context across sessions.

When the user asks for advice, recommendations, drafts, or reviews, pull identity and self-knowledge patterns from `profile.md` first.

---

## The Folder Structure

```
/
  _RULES.md              — vault constitution (read first)
  CLAUDE.md              — operational bootstrap for Claude Code
  SETUP.md               — first-run guide (deletable after setup)

  /me/
    voice.md             — writing tone and voice directives
    profile.md           — self-knowledge and identity
    doctrine.md          — named principles with evidence
    obsidian-strategy.md — all vault architectural decisions
    vault-todo.md        — phased task list
    vault-guide.md       — this file
    content-plan.md      — content calendar / narrative arc (optional)
    /ideas/_INBOX.md     — raw idea capture
    /drafts/             — content in progress
    /published/_INDEX.md — published content log

  /projects/             — one context file per project
    example-saas-project-context.md  — reference example
    [your-projects...]

  /skills/
    _INDEX.md            — skills governance hub
    _TEMPLATE.md         — how to write a skill
    /library/            — validated, production-ready skills
      voice.md           — writing voice (synced with /me/voice.md)
      gobble.md          — source ingestion
      skillify.md        — principle extraction
      distill.md         — content routing
    /inbox/              — skill candidates awaiting validation
      example-skill.md   — reference example

  /reading/
    _GOBBLE_TEMPLATE.md  — template for all gobbled content
    /articles/           — gobbled articles
    /repos/              — gobbled GitHub repos
    /threads/            — gobbled X/Twitter threads
    /doctrines/          — external doctrines (theoretical until tested)
```

---

## The Core Skills

These are the vault's primary operations. Run them in Claude Code at vault root.

### gobble [url]

Ingest an external source into the vault.

- Repos → deep (architecture + transferable principles)
- Articles → medium (argument + mental models)
- Threads → shallow (core insight + context)
- Auto-detects skill candidates. If flagged, run `skillify`.

### skillify

Extract the transferable principle from a gobbled source.

- Runs worthiness rubric (reusability, non-triviality, stability, delta)
- Requires 3/4 to proceed
- Always goes to `/skills/inbox/` — never `/library/` directly
- Promotion to library requires human review + real-usage gotchas

### distill

Route any raw text (conversation, notes, ideas) to correct vault locations.

- Always shows routing plan before writing
- Checks existing files for duplicates first
- Splits multi-type content across correct locations
- Use for: conversation exports, meeting notes, research output

### review PRD [paste PRD]

Review any PRD against vault intelligence.

- Reads: doctrine.md, all relevant project contexts, skill library
- Outputs: doctrine conflicts, architectural conflicts, skill gaps, pattern matches, suggestions, vault updates recommended
- Every suggestion must cite a vault file — no generic advice

### sync context [project]

Update a stale project context file.

- Reads actual codebase, diffs against vault context
- Shows what changed before rewriting
- Run when a project has had significant development since last context update

---

## How to Run a Good Session

### Session type: New idea or project

1. Run `gobble` on any relevant external sources first
2. Run `review PRD` on the PRD or idea doc
3. Note which existing projects it connects to
4. Add to `_INBOX.md` if not ready to build
5. Create a project context file if committing

### Session type: Vault organization / library consulting

1. Read the four onboarding files
2. Read `vault-todo.md` for current phase
3. Identify what's been done vs what's pending
4. Propose routing plan before writing anything
5. Show what already exists before adding new entries

### Session type: Distilling a conversation

1. Copy conversation as markdown
2. Open Claude Code at vault root
3. `distill this [paste]`
4. Review routing plan
5. Confirm

### Session type: Deep research

1. Run research in Claude.ai web (no vault access needed)
2. Structure output with sections: Confirmation / Gap / Ahead
3. Paste into distill session at vault root
4. Routes automatically

---

## The Worthiness Rubric

Before creating a new skill, score it:

|Filter|Question|Pass|
|---|---|---|
|Reusability|Applies to 2+ projects?|Yes|
|Non-triviality|Claude gets this wrong without it?|Yes|
|Stability|Pattern settled enough to encode?|Yes|
|Delta|Pushes agent out of default behavior?|Yes|

3/4 = build it. 4/4 = high priority. Under 3/4 = it's a note, not a skill.

---

## Overlap Resolution

When two skills or doctrines conflict:

1. Proven-in-production beats external — always
2. More specific beats more general — always
3. Newer beats older ONLY IF it demonstrably solves something older doesn't
4. Conflicts get flagged, never silently resolved

---

## Weekly Maintenance (15 minutes)

```
1. Review /skills/inbox/ — promote or dismiss candidates
   Promotion criteria: at least one real-world usage,
   gotchas section populated from actual failures

2. Review /me/ideas/_INBOX.md — develop or dismiss ideas

3. Check /me/published/_INDEX.md — log any published posts

4. Run sync-context on any project with significant recent dev

5. Check for stale [TODO] tags across the vault
```

---

## Known Behavioral Patterns (For Honest Consulting)

*(Populated by the user during setup — see `profile.md` → "Behavioral Patterns to Flag".)*

When the user populates this section in their `profile.md`, name the patterns they listed when you see them appearing in conversation. The point is to consult honestly rather than cheerlead — if the user has flagged a pattern like "I start projects at the architectural phase and lose steam in the last 15%," call it out when it shows up.

If `profile.md` doesn't yet have populated behavioral patterns, skip this — don't invent generic patterns to apply.

The right consulting move when a flagged pattern appears: name it directly, reference the relevant doctrine if one applies, ask "what's the one specific blocker to shipping this?"

---

## Connected Files

[[_RULES]] — operational rules (what goes where)
[[obsidian-strategy]] — all architectural decisions
[[vault-todo]] — current task list
[[doctrine]] — named principles
[[voice]] — content voice
[[profile]] — self-knowledge
[[_INBOX]] — idea capture
