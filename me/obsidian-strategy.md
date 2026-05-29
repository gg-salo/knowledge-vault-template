---
name: obsidian-strategy
type: reference
scope: personal
description: >
  Architectural decisions behind the vault. Why the structure is the
  way it is. Claude reads this when asked to reason about vault
  organization, add new areas, or resolve structural ambiguity.
---

## Why This Vault Works the Way It Does

This file captures the design decisions that make the vault compound rather than accumulate. It's not a spec — it's the reasoning. When the structure needs to evolve, consult this file to make sure new decisions are consistent with the existing ones.

---

## Core Decision 1: The Vault Is the Intelligence Layer

The vault is the **Intelligence Layer** — and the **librarian** operating it. Three components in one architecture: substrate (plain markdown files) + workflows (background maintenance and active surfacing) + AI (reading the substrate as native context every session). The persistent intelligence layer agents operate from across projects.

Adjacent to "second brain" tools but distinct: most second brains solve capture and stop there. The Intelligence Layer also **actively surfaces** the connections passive storage misses — periodic cross-domain matching, structural prevention of forgetting against the "I researched this last quarter" tax, judgment encoded as artifacts agents read directly.

Consequences:
- Every file is written for two audiences: the human (reader) and the agent (future Claude session). Both need to parse it fast.
- Ephemeral content (task state, conversation dumps, unreviewed agent output) does not enter the vault. Those belong in a task manager or scratch buffer.
- The vault is the canonical source of truth for accumulated judgment — not for implementation details (code is that source of truth).

---

## Core Decision 2: Typed Graph, Not a Pile

Every note links to at least one other note using `[[filename]]` syntax. Every project links to skills that power it. Every skill links to projects it applies to. Gobbled content links to connected projects + skill candidates.

Consequence: the vault is a graph. Knowledge surfaces via traversal, not search. One file leads to three, which lead to nine — most of which you forgot you had.

Typed relationships (`powers`, `shares-dna`, `depends-on`, `parallel-bet`, `supersedes`, `feeds`, `planned-depends-on`) make the edges semantic rather than decorative.

---

## Core Decision 3: Multi-Abstraction Notes

Every note carries concrete + abstract layers, plus an optional fundamental layer. The `matches` field declares domains where the abstract pattern appears elsewhere.

**Rationale:** concrete-level notes only connect via keyword matching. Abstract-level notes connect via pattern matching across domains. A project about "parallel coding agents" can be discovered through a note on "swarm intelligence" only because both carry the same abstract pattern. This is the mechanism for *systematic serendipity* — making cross-domain insights structural instead of accidental.

See `_RULES.md` Section 11 for the full specification.

---

## Core Decision 4: Routing Plan Before Writing

No vault write happens without a routing plan and explicit confirmation. This applies to `gobble`, `distill`, `skillify`, and any manual write operation.

**Rationale:** the routing decision is the hard part. Getting it wrong pollutes the graph — a misrouted file is worse than no file, because it creates noise in future traversals. Showing the plan forces the classification to be explicit and correctable before it becomes permanent.

---

## Core Decision 5: Skills Go to Inbox First

New skills always go to `/skills/inbox/`, never `/library/` directly. Promotion requires human review and at least one real-usage gotcha from actual use.

**Rationale:** a skill written from theory is documentation, not an agent instruction. A skill validated in production is intelligence. The gotchas section — populated from real failures — is what makes a skill earn library status.

---

## Core Decision 6: Dual-Home for Voice

`voice.md` is the one file that intentionally lives in two places: `/me/voice.md` (the source) and `/skills/library/voice.md` (the skill copy). Both must stay in sync.

**Rationale:** voice is both personal identity (lives in `/me/`) and an agent skill (lives in `/skills/library/`). Neither location is wrong. Duplication is accepted as long as the sync rule is followed.

---

## Core Decision 7: Content Derivable from Code Does Not Enter the Vault

Implementation details belong in the code. The vault captures decisions, patterns, tensions, and reasoning — things that are not recoverable from reading the code.

**Rationale:** if the vault duplicates what code already says, it drifts, it rots, and it misleads. Keeping the vault to the non-code layer means it stays correct and useful.

---

## How to Evolve the Structure

New top-level areas (`/health/`, `/finance/`, `/clients/`, etc.) are welcome when the content type is *fundamentally different* from anything that exists. Not when you have a lot of one kind of thing within an existing folder.

**The evolution signal:** when you try to file something and realize it doesn't fit anywhere. Until that signal appears, the existing structure is enough.

When adding a new area:
1. Create the folder
2. Add the canonical location to `_RULES.md` Section 1
3. Start using it
4. Write a note in this file explaining the decision

---

## Core Decision 8: Content Workflow Pipeline

Content production from the vault runs as a 5-stage pipeline of vault-operating workflows on top of existing primitives. Each stage does one thing; the chain composes:

```
[[gobble]] (continuous) → /reading/[type]/
                       ↓
[[dream]] (auto on threshold + 30min quiet, OR manual) → /me/dreams/[date-slug].md
                       ↓
[[harvest]] (weekly sweep) → flat inventory in chat
                       ↓
[[converge]] (weekly synthesis) → ranked opportunities in chat
                       ↓ user picks per opportunity
              ┌────────┴────────┐
              ↓                 ↓
    [[brief]] (now)        _INBOX entry (deferred or developing)
              ↓                 ↓ later
   /me/drafts/[slug].md    [[brief]] (Mode B — _INBOX ref)
              ↓                 ↓
              write post → /me/drafts/[slug].md (Draft section, same file)
                       ↓
                  ship → log to /me/published/_INDEX.md
```

### Why this shape

- **One thing per workflow.** Gobble ingests. Dream synthesizes cross-source on FRESH material. Harvest collects scattered OLD material. Converge ranks. Brief expands. Write post drafts. No primitive overlap.
- **Two-mode collection.** Dream operates on fresh material finding non-obvious connections. Harvest operates on scattered material accumulated in the vault. Parallel mechanisms with different scopes — neither subsumes the other.
- **Status-based routing keeps `_INBOX` clean.** Picks from /converge or /harvest don't auto-write to `_INBOX`. Ready-to-brief picks bypass it entirely (direct to /brief); only deferred or developing items stage. `_INBOX` is optional staging, not a required hop.
- **Vault sovereignty preserved.** No workflow auto-writes to vault canonicals (`doctrine.md`, `system-patterns.md`, project contexts). All proposals stage in chat OR `/me/dreams/` OR `/me/drafts/`. Canonical writes require explicit user-confirmed routing plans per [[_RULES]] Section 2.
- **Single file per content piece.** Brief and draft co-locate at `/me/drafts/[slug].md`. Brief is appended as "## Brief — [Title]"; drafts as "## Draft v1", "## Draft v2", etc. The Strategist→Writer handoff is a section append, not a separate file.

### Operating filters

Every workflow in the pipeline loads context-shaping reads from personal `/me/` files (e.g., voice rules, content strategy, brand pillars, performance learnings, anti-duplication baseline from published index). Template ships with placeholder versions; populate them as you personalize the vault.

### Promotion path

All five workflows live as candidates in `/workflows/inbox/`. Promotion criterion per [[_RULES]] Section 6a: 3 weekly runs without breaking + 5+ real-usage gotchas captured per workflow.

### Related

- [[converge]] / [[dream]] / [[harvest]] / [[brief]] — the 4 new workflow files
- [[gobble]] — upstream primitive (existing)

---

## Connected Files

- [[_RULES]] — vault constitution (the rules these decisions produced)
- [[vault-guide]] — onboarding reference
- [[doctrine]] — principles the vault exists to preserve and compound
