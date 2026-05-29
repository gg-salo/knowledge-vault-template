# SKILL.md — Universal Template Standard
> For: Personal vault, agent systems, and shareable skill library
> Version: 2.1
> Last updated: 2026-04-16 — added ontology check (v2.1)

---

## ONTOLOGY CHECK — Read This First

Before writing any fields below, answer: is this content a skill?

A SKILL has two conditions that BOTH must hold:

1. **Instructional shape** — an instruction set an agent executes when a trigger matches ("When X, do Y because Z").
2. **Portable** — works without this vault's specific file paths or governance. A different agent system (a Claude Project, ChatGPT, a standalone agent) could take the file as-is and execute it without stripping vault-specific references.

**If both conditions hold → continue filling out this template.**

**If only condition 1 holds (instructional but vault-coupled):** this is a WORKFLOW. Write it in `/workflows/inbox/` instead. Do NOT try to rewrite it as a skill by adding abstraction placeholders — that's the adapter anti-pattern (see [[_RULES#6b.1 — The Pairing Pattern]]). If the portable pattern underneath matters, write a FRESH new skill file from scratch, don't patch the workflow.

**If neither condition holds:** this probably isn't a skill at all. Route to the correct shape:
- Named principle with empirical evidence → `/me/doctrine.md`
- Architectural decision about this vault → `/me/obsidian-strategy.md`
- Architectural pattern about systems (agents, memory, safety, orchestration, any system) → `/me/system-patterns.md`
- External system description → relevant gobbled reading file

**Important — sibling files:** a single source can produce MULTIPLE files simultaneously. If the source contains both a named principle AND a portable application, create TWO files (doctrine entry + skill candidate) and link them. See [[_RULES#6b.1 — The Pairing Pattern]] for the rule. Don't collapse siblings into one file.

**Diagnostic question to verify before writing:** *"Could a different agent system take this file as-is and execute it without stripping vault-specific references?"* If no → not a skill. Route to workflow or another shape.

**Common failure modes:**
- **Architectural descriptions filed as skills.** An agent cannot execute a description. If it describes rather than instructs, it belongs in strategy, doctrine, or system-pattern — not skills.
- **"Universal with adapter" files.** One file trying to serve both vault and external hosts via conditional paths. Premature abstraction. Don't.
- **Orphan skills.** A skill that expresses a validated principle without a paired doctrine entry loses the empirical grounding. Create the doctrine entry too.

**Metadata red flag:** if you're about to write `type: pattern` in the frontmatter metadata block, pause. Files with `type: pattern` are almost always system architecture descriptions, not portable agent instructions. They belong in `/me/system-patterns.md`, not `/skills/`. If the content truly is a portable technique, use `type: process` or `type: review` instead.

See [[_RULES#6b ONTOLOGY]] for the full 5-shape ontology and [[_RULES#6b.1 — The Pairing Pattern]] for the sibling rule.

---

## EXTRACTION-LENS — Capability vs Principle (added 2026-04-24)

> Introduced after observing that skill extraction was defaulting to principle-lens (abstract instruction for humans/librarians to reference), producing skills that were rarely invokable by agents. Both lenses are valid. They produce different output shapes. Choose deliberately.

When generating a skill from a source, decide the lens BEFORE filling the template:

| Lens | When to choose | Shape of output |
|---|---|---|
| **Capability** | Source contains an executable procedure an agent can run end-to-end (e.g., "monitor X → classify → output Y") | `description` = trigger condition. Core Instructions = numbered executable steps with explicit tools, inputs, outputs, scoring. Gotchas populated from first-invocation test. |
| **Principle** | Source contains a named pattern, heuristic, or stance the agent should APPLY during other work (e.g., "separate generation from evaluation", "verify before reporting done") | `description` = when the principle applies. Core Instructions = the pattern's rules and disambiguators. Gotchas populated from real usage by a reviewer. |

**Both can coexist as siblings** per [[_RULES#6b.1 — The Pairing Pattern]]. A rich source can produce a capability-lens skill AND a principle-lens skill AND a doctrine entry simultaneously. Don't collapse.

**Tag the lens explicitly** in `metadata.extraction-lens`. Values: `capability | principle | hybrid`. The tag makes the skill's intended use legible to reviewers and to future extraction passes.

**Common failure mode this lens addresses:**
A skill extracted only as a principle (e.g., "generate N candidates, score, promote winner") is not invokable — an agent can't run "this principle" end-to-end. If the source was an executable procedure, the capability-lens version is what makes it actionable. If both are valuable, write both.

---

## THE GOLDEN RULE

> A skill is not documentation. It is an agent instruction set.
> Every line must earn its place by changing what the agent does.

---

## TEMPLATE

```yaml
---
name: skill-name
description: >
  What this skill does and when to use it. Include keywords that help
  agents identify relevant tasks. This IS the trigger condition.
capabilities: [tag-1, tag-2]
outputs: what the skill produces (format + content)
cost: low | medium | high
speed: estimated execution time
requires:
  env: []
  bins: []
parallelizable: true
human_gate: false
allowed-tools: Bash(git:*) Read
metadata:
  version: 1.0.0
  type: process
  scope: personal
  projects: [project-a, project-b]
  status: candidate
  last_reviewed: YYYY-MM-DD
  source: https://github.com/example/repo
---
```

---

## FIELD REFERENCE

### Agent-Facing Fields (orchestrator reads these for planning)

| Field | Required | Purpose |
|-------|----------|---------|
| `name` | Yes | kebab-case, unique. Must match directory name when skill is a folder. |
| `description` | Yes | Trigger condition + summary. Max 1024 chars. Agents scan this at startup to decide "is there a skill for this?" |
| `capabilities` | Yes | Tag list. Powers auto-generated capability maps. Orchestrators route tasks to agents based on these. |
| `outputs` | Yes | What the skill produces. Orchestrator needs this to plan downstream task dependencies. |
| `cost` | Yes | `low` \| `medium` \| `high`. Resource planning signal. |
| `speed` | Yes | Estimated execution time (e.g., "~30s per item", "5-15 min", "near-instant"). |
| `requires` | No | Environment gating. `env:` = required env vars, `bins:` = required binaries/tools. Skills with unmet requirements are auto-excluded from agent context. Omit or use `[]` if no requirements. |
| `parallelizable` | No | Boolean. Can run concurrently with other skills? Default: `true`. |
| `human_gate` | No | Boolean. Output requires human approval before downstream use? Default: `false`. |
| `allowed-tools` | No | Pre-approved tools for this skill. Format: `Bash(git:*) Read Edit`. Reduces permission prompts for script-heavy skills. |

### Vault-Management Fields (in `metadata:` block)

These are for human governance. The orchestrator does NOT read these for planning decisions. They exist so the vault can track skill lifecycle, ownership, and compatibility.

| Field | Purpose |
|-------|---------|
| `version` | MAJOR.MINOR.PATCH. Bump on breaking changes. |
| `type` | Skill category — guides which sections to prioritize (see cheatsheet below). |
| `scope` | `personal` \| `shareable` \| `[personal, shareable]` — who can use this skill. |
| `projects` | Which projects benefit. List names or use `[all]`. |
| `status` | `candidate` (inbox) \| `validated` (library). |
| `last_reviewed` | ISO date. When a human last reviewed this skill. |
| `source` | URL if adapted from an external repo or article. |
| `extraction-lens` | `capability` \| `principle` \| `hybrid`. Declares the intended shape — see ONTOLOGY CHECK above. Required for new skills from 2026-04-24 onward. |
| `first_invocation` | ISO date of first real run. Capability-lens skills **must** be invoked once before promotion; populate this field and the Gotchas section on that run. |

---

## FOLDER STRUCTURE

Skills that outgrow a single file use this structure:

```
skill-name/
├── SKILL.md          # Required: frontmatter + instructions
├── scripts/          # Optional: executable code agents can run
├── references/       # Optional: detailed docs loaded on demand
├── assets/           # Optional: templates, data files, examples
└── config.json       # Optional: user-configurable settings
```

**Progressive disclosure (how context is loaded):**
1. **Metadata** (~100 tokens) — `name` + `description` scanned at startup for ALL skills
2. **Instructions** (<5,000 tokens) — full SKILL.md body loaded when skill activates
3. **Resources** (as needed) — files in scripts/references/assets loaded only when required

**Size discipline:**
- Ideal: **200-500 lines**. Maximum: **800 lines**
- Instructions should be **under 5,000 tokens**
- If you're over either limit, move reference material to `references/`
- The body is for instructions, not encyclopedias

Single-file skills (default) remain valid. Evolve to folder structure when a skill needs scripts, reference docs, or assets.

---

## 1. PURPOSE

**One sentence.** What problem does this skill solve that Claude wouldn't solve well on its own?

> "Prevents Claude from reinventing the project's color system on every UI task"
> NOT: "This skill helps with design" — too vague, states the obvious

**Why this exists (not what it does):**
- What failure mode does this prevent?
- What pattern was too valuable to leave unencoded?
- What would Claude get wrong without this?

---

## 2. WHEN TO USE / WHEN NOT TO USE

### Trigger conditions
- [Explicit phrase or pattern that should invoke this skill]
- [Second trigger]
- [Third trigger]

### Anti-triggers (do NOT apply this skill when)
- [Situation where a similar request should NOT use this skill]
- [Overlap scenario with another skill — name the other skill]

### Related skills
- `skill-name` — [when to use that instead / use alongside]

---

## 3. CORE INSTRUCTIONS

The actual instructions. Write for an agent, not a human.

Rules:
- Be opinionated. Don't hedge.
- Give the agent the WHAT and the WHY, not just the what.
- Avoid restating things Claude already knows.
- Focus on the delta — what this skill adds that baseline Claude lacks.

### Content Quality Principles

1. **Show, don't tell.** PASS: copy-pasteable code examples, concrete before/after. FAIL: vague explanations without examples ("always handle errors properly").
2. **Anti-pattern documentation.** Show the wrong approach alongside the correct one. The contrast teaches more than either alone.
3. **Actionable checklists.** Verification steps the agent can execute, not prose describing what good looks like.
4. **Decision trees.** For complex choices, use branching logic: "If X → do A. If Y → do B." Not paragraphs of conditions.
5. **Focused scope.** One skill = one domain. "react-hook-patterns" not "react." If a skill tries to cover too much, split it.

---

## 4. REFERENCE MATERIAL

> For Library/API/Design skills: put the source of truth here
> For Process skills: put the workflow steps here
> For Runbook skills: put symptom → action maps here

Sub-sections as needed:
- Constants, tokens, variables (CSS vars, API endpoints, config values)
- Code snippets the agent should copy, not reconstruct
- Decision trees for branching logic
- Tables for lookup data (mappings, enums, allowed values)

For skills with extensive reference material, move to `references/` and link from here.

---

## 5. GOTCHAS

> **Highest signal section.** Built from real failures. Add to this over time.
> Promotion from inbox → library requires at least one real gotcha from actual usage.
>
> **For capability-lens skills:** this section MUST be populated from the first-invocation test (see §5a below) before the skill leaves version 0.1.0. Speculation-only gotchas ("might fail if...") do not count — only gotchas surfaced by a real run. This is the test that prevents capability skills from drifting back into theory-only.

| # | Gotcha | What goes wrong | What to do instead |
|---|--------|-----------------|-------------------|
| 1 | [Pattern that trips Claude up] | [The failure mode] | [The correct behavior] |
| 2 | | | |
| 3 | | | |

---

## 5a. FIRST-INVOCATION TEST (capability-lens skills only — added 2026-04-24)

> **Mandatory step before promotion from inbox → library for capability-lens skills.** The pattern that drove this requirement: writing a skill well is necessary but not sufficient. The first real invocation surfaces gaps that no amount of re-reading catches — missing error handling, wrong tool names, underspecified branches, instructions that sound clear but produce ambiguous outputs.

**Protocol:**

1. **Invoke the skill once** in the minimum plausible real context (matching one of the skill's `projects`). Use native tools as specified. Do not substitute manual reasoning for executable steps — if the skill says "run WebSearch", run WebSearch.
2. **Capture every hesitation and improvisation.** Every time the executor (you, or another agent) has to interpret beyond what the instructions specify, that's a gotcha candidate.
3. **Populate Section 5 with real gotchas** (not "suspected" ones — remove speculation). Each entry: what happened, what went wrong, what to do instead.
4. **Patch the instruction body** to close the gaps the gotchas exposed. Bump version (0.1.0 → 0.2.0).
5. **Record `first_invocation` date** in metadata.
6. **Only then** is the skill eligible for the standard promotion path (after N invocations without breakage, it can move to `/library/`).

**Why this matters:** the failure mode this prevents is skills extracted as portable instructions but never tested, accumulating in `/inbox/` as aspirational principles with no evidence they work. The first-invocation test is the gate between "wrote a skill" and "have a working skill."

---

## 6. EXAMPLES

### Good output (reference)
```
[Paste a real example of correct skill execution]
```

### Bad output (anti-pattern)
```
[Paste a real example of what to avoid]
```

---

## 7. MEMORY & STATE
> Skip this section if the skill is stateless.

This skill stores state at:
```
[path/to/state/file.json or log]
```

State schema:
```json
{
  "last_run": "ISO timestamp",
  "key_field": "value"
}
```

On first run: [what to do if state file doesn't exist]

---

## 8. SCRIPTS & ASSETS
> Skip if skill is a single file with no external dependencies.

Files in this skill folder:
```
/scripts/       — executable helpers Claude can invoke
/assets/        — templates, reference files, examples
/references/    — detailed docs, extended reference material
config.json     — user-configurable setup (ask user if missing)
```

To run a script:
```bash
[example invocation]
```

---

## 9. QUICK REFERENCE

> Compressed version for fast agent lookup. Keep under 20 lines.

```
[KEY FACTS]
[CRITICAL RULES]
[MOST COMMON USAGE PATTERN]
[DO NOT DO THIS]
```

---

## SKILL TYPE CHEATSHEET

Use the `type` field in `metadata` to know which sections to prioritize:

| Type | Primary section to nail | Gotchas density | Scripts? |
|------|------------------------|-----------------|----------|
| `library` | Reference Material | High | Sometimes |
| `verification` | Scripts | High | Always |
| `data` | Reference + Scripts | Medium | Usually |
| `process` | Core Instructions | Medium | Sometimes |
| `scaffold` | Examples + Assets | Low | Usually |
| `review` | Gotchas | Very High | Sometimes |
| `deployment` | Scripts + Gotchas | High | Always |
| `runbook` | Reference (symptom→action) | High | Sometimes |
| `infra` | Scripts + Gotchas | High | Always |

---

## WORTHINESS RUBRIC

Before creating a new skill, score it:

| Filter | Question | Pass condition |
|--------|----------|----------------|
| **Reusability** | Does it apply to 2+ projects or tasks? | Yes |
| **Non-triviality** | Would Claude get this right without the skill? | No |
| **Stability** | Is the underlying pattern settled enough to encode? | Yes |
| **Delta** | Does it push Claude out of its default behavior? | Yes |

**3/4 = build it. 4/4 = high priority. Under 3/4 = reconsider.**

---

## OVERLAP RESOLUTION PROTOCOL

When two skills conflict or overlap:

1. **Proven-in-production beats external** — always
2. **More specific beats more general** — always
3. **Newer beats older ONLY IF** the newer version demonstrably solves something the older doesn't
4. **Conflicts get flagged, never silently resolved** — add a note to the Gotchas section of both skills

---

## VERSIONING CONVENTION

```
MAJOR.MINOR.PATCH

MAJOR — breaking change (different trigger conditions or incompatible output)
MINOR — new section or meaningful content addition
PATCH — gotcha added, typo fixed, example updated
```

When absorbing a skill from an external repo:
- Tag it `source: [repo-url]` in `metadata`
- Note what was adapted vs copied verbatim
- Date the absorption in `last_reviewed`
