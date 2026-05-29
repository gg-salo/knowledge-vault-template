---
name: review-prd
description: >
  Reviews any PRD against vault intelligence — doctrines, project contexts,
  architectural decisions, and skill gaps. Use when given a PRD to review
  or when asked "does this make sense given what I've built". Triggers on:
  review this PRD, check this against my stack, does this conflict with
  anything. Do NOT use for code review or post-build retrospectives.
capabilities: [prd-analysis, doctrine-comparison, gap-detection, architectural-review]
outputs: structured review with doctrine conflicts, skill gaps, integration findings, and recommendations
cost: high
speed: 10-20 min per PRD
requires: []
parallelizable: true
human_gate: false
metadata:
  version: 0.1.0
  type: process
  scope: all
  projects: [all]
  status: candidate
abstraction:
  concrete: "Reviews PRDs against vault-stored intelligence with every suggestion citing a vault file as evidence"
  abstract: "Evidence-grounded plan review evaluating new proposals against accumulated institutional memory with mandatory source citation"
  fundamental: "Coherence validation against accumulated state checking whether a proposed change is consistent with the existing knowledge graph"
  matches: [legal precedent review, architectural review boards, git merge conflict detection, medical history review before prescribing]
---

## 1. PURPOSE

**Prevents generic AI feedback on PRDs.** Without this skill, Claude gives reasonable but ungrounded advice — the same feedback it would give anyone. With it, every suggestion references your actual architectural decisions, named doctrines, past failures, and skill gaps. The feedback becomes specific to your stack, your history, and your vault.

**Why this exists:**
- Generic PRD reviews miss conflicts with decisions you've already made
- Cross-project architectural conflicts are invisible without reading all context files
- Skill gaps the PRD assumes are covered only surface when you check the library
- Past pattern matches ("we tried something similar on ProjectA") are the highest-signal feedback and the easiest to miss

---

## 2. WHEN TO USE / WHEN NOT TO USE

### Trigger conditions
- User pastes a PRD and says "review this"
- User asks "does this make sense given what I've built?"
- User asks "check this against my stack / my projects / my doctrines"
- User asks "does this conflict with anything?"
- User is evaluating a new product idea or feature spec

### Anti-triggers (do NOT apply when)
- User wants a code review (that's a review agent task, not a PRD review)
- User wants a post-build retrospective (different workflow)
- User wants to edit an existing PRD (that's a direct edit, not a review)
- User wants generic feedback without vault grounding (just ask Claude directly)

### Related skills
- [[skillify]] — if the PRD reveals a transferable pattern worth encoding
- [[gobble]] — if the PRD references external sources worth ingesting
- [[distill]] — if the review surfaces insights worth routing to the vault

---

## 3. CORE INSTRUCTIONS

### Step 1: Load Vault Intelligence
Before reviewing anything, read these files in order:
1. `/vault/me/doctrine.md` — your named principles
2. All relevant `/vault/projects/*-context.md` files — scan the PRD for project references, technology overlap, or domain overlap to determine which are relevant. When in doubt, read all of them.
3. `/vault/skills/library/` — scan for gaps the PRD assumes but the library doesn't cover
4. `/vault/me/obsidian-strategy.md` — architectural decisions that may conflict

### Step 2: Review Against Each Layer
Check the PRD against each layer of vault intelligence systematically:

**Doctrine check:** For every named principle in doctrine.md, ask: "Does this PRD respect, violate, or ignore this principle?" Flag violations and omissions.

**Architecture check:** For every relevant project context file, ask: "Does this PRD conflict with any existing decision? Does it duplicate something already built? Does it assume infrastructure that doesn't exist?"

**Skill gap check:** Scan the PRD for capabilities it assumes. Check `/vault/skills/library/` and `/vault/skills/inbox/`. If the PRD requires a skill that doesn't exist, flag it.

**Pattern match check:** Has anything similar been attempted before? Check project context files for prior art, failed experiments, or related features.

### Step 3: Produce Structured Output
Always output in this exact order:

```
## PRD Review: [PRD title or subject]
> Reviewed against vault intelligence on [date]

### 1. Doctrine Conflicts
[Named principle] — [why it conflicts]
> Source: /vault/me/doctrine.md

### 2. Architectural Conflicts
[Project] — [existing decision] — [how the PRD conflicts]
> Source: /vault/projects/[name]-context.md

### 3. Skill Gaps
[Capability the PRD assumes] — [not found in library or inbox]
> Recommendation: [build skill / acceptable gap / already covered by X]

### 4. Pattern Matches
[Similar prior work] — [what happened] — [what to learn from it]
> Source: /vault/projects/[name]-context.md

### 5. Suggestions
[Each suggestion must cite a vault file as evidence]
> Source: [vault file path]
```

### Step 4: The Grounding Rule
**Every suggestion must reference a vault file.** No generic advice. If the vault has no evidence on a topic, say so explicitly: "The vault has no prior evidence on [X]. This suggestion is ungrounded — use your judgment."

This is the core delta of this skill. Without it, you're just asking Claude to review a PRD. With it, you're asking your accumulated intelligence to review it.

---

## 4. REFERENCE MATERIAL

### Doctrine File Structure
Doctrine entries have: principle name, where first observed, projects that confirm, projects that violate, confidence level. Use the confidence level to weight your feedback — a 95% confidence doctrine violation is a hard flag, a 75% one is a soft flag.

### Project Context File Structure
Project contexts have: what it is, current state, tech stack, relationships, content connections. The relationships section is especially useful — typed relationships (powers, shares-dna, depends-on, feeds) surface non-obvious conflicts.

---

## 5. GOTCHAS

| # | Gotcha | What goes wrong | What to do instead |
|---|--------|-----------------|-------------------|
| 1 | Reading only one project context | Misses cross-project conflicts — PRD may conflict with a project it doesn't directly reference | Always check all related projects, including those connected via typed relationships (shares-dna, feeds, depends-on) |
| 2 | Generic suggestions | Advice not grounded in vault, indistinguishable from vanilla Claude | Every suggestion must cite a specific vault file. No exceptions. |
| 3 | Missing doctrine file | No principle checking happens, skill degrades to generic review | Always read doctrine.md first. If empty or missing, flag it: "Doctrine file is empty — review is limited to architectural and skill gap checks." |
| 4 | Inventing vault evidence | Citing a decision or principle that doesn't exist in the vault | Only cite what you actually read. If a file doesn't contain the evidence, don't claim it does. |
| 5 | Skipping pattern matches | Missing the highest-signal feedback — "we tried this before" | Always scan project contexts for prior art, even if the PRD seems novel |

---

## 6. EXAMPLES

### Good output (reference)
```
## PRD Review: Automated Content Scheduler

### 1. Doctrine Conflicts
**Self-Healing Loops** — PRD describes a single-shot scheduling
system with no feedback capture. Violates the principle that
systems should accumulate operational knowledge across runs.
> Source: /vault/me/doctrine.md

### 2. Architectural Conflicts
**ProjectA** — PRD proposes a new voice calibration module, but
ProjectA already has an 11-stage voice pipeline. Duplicates
existing infrastructure.
> Source: /vault/projects/project-a-context.md

### 3. Skill Gaps
PRD assumes a "content scoring" capability. No skill exists
in library or inbox for scoring content quality against
defined metrics.
> Recommendation: build skill — aligns with autonomous-scored-iteration pattern

### 4. Pattern Matches
ProjectB content pipeline — similar scheduling was attempted in
the ProjectA content production workflow. Key learning: the
review agent needed access to the content plan to evaluate
relevance, not just quality.
> Source: /vault/projects/project-b-context.md

### 5. Suggestions
Add a feedback store that captures scheduling performance
(open rates, engagement) and feeds it back into future
scheduling decisions. Without this, the system can't learn
which time slots and content types perform best.
> Source: /vault/me/doctrine.md (Self-Healing Loops, 95% confidence)
```

### Bad output (anti-pattern)
```
This PRD looks good overall. A few suggestions:
- Consider adding error handling
- You might want to think about scalability
- The architecture seems reasonable

[No vault references. No doctrine checks. No project
conflict analysis. This is generic Claude, not
vault-grounded intelligence. Useless.]
```

---

## 9. QUICK REFERENCE

```
REVIEW-PRD = load vault intelligence → check PRD against 4 layers → structured output
ALWAYS read doctrine.md first — named principles are the primary review lens
ALWAYS check all related project contexts — cross-project conflicts are invisible otherwise
EVERY suggestion must cite a vault file — no generic advice, ever
If vault has no evidence → say so explicitly, don't invent it
Output order: doctrine conflicts → architectural conflicts → skill gaps → pattern matches → suggestions
Flag doctrine violations by confidence level: 90%+ = hard flag, <90% = soft flag
For URLs or external sources in the PRD, suggest /gobble — don't review what you haven't ingested
```

---

## Connected Files
- [[_RULES]] — vault constitution (read before routing any review output)
- [[doctrine]] — primary review lens, named principles checked against every PRD
- [[skillify]] — triggered if review surfaces a skill candidate
- [[gobble]] — triggered if PRD references external sources worth ingesting
