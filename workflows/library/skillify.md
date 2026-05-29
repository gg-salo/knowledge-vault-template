---
name: skillify
description: >
  Extracts the transferable principle from any source (gobbled repo,
  article, or conversation) and generates a skill candidate file.
  Use when asked to skillify something or when a gobbled source has
  skill candidates flagged. Do NOT generate full production skills —
  generate candidates for human review in /skills/inbox/.
capabilities: [principle-extraction, skill-generation, worthiness-evaluation]
outputs: skill candidate file in /skills/inbox/ with frontmatter, body sections, and backlinks
cost: medium
speed: 5-10 min per skill candidate
requires: []
parallelizable: true
human_gate: false
metadata:
  version: 1.0.0
  type: process
  scope: personal
  projects: [all]
  status: validated
abstraction:
  concrete: "Extracts transferable principles from any source and encodes them as reusable agent instruction files, gated by a 4-criterion worthiness rubric"
  abstract: "Principle extraction and codification separating domain-agnostic thinking from domain-specific implementation and encoding it as executable knowledge"
  fundamental: "Abstraction as knowledge compression distilling specific instances into general rules that transfer across contexts"
  matches: [case law in jurisprudence, design patterns in software engineering, scientific method generalization, martial arts kata extraction, post-action military review]
---

## 1. PURPOSE

**Prevents valuable patterns from staying locked inside specific repos or articles.** Without this skill, an interesting architecture decision in a GitHub repo remains a bookmark. Skillify extracts the transferable thinking — the part that travels across projects — and encodes it as a reusable agent instruction.

**Why this exists:**
- "Use [library name]" is a dependency. "[Transferable principle]" is intelligence that works everywhere.
- Claude defaults to generic approaches — skills push it toward proven, specific patterns
- Most people read interesting repos and forget the insight within a week
- **The skillify question:** "What would an agent need to know to replicate the THINKING behind this, without the code?"

---

## 2. WHEN TO USE / WHEN NOT TO USE

### Trigger conditions
- User says "skillify this", "extract a skill from this", "turn this into a skill"
- A [[gobble]] output has non-empty Skill Candidates section
- User identifies a transferable pattern in a conversation or reading
- User wants to encode a proven workflow as a reusable agent instruction

### Anti-triggers (do NOT apply when)
- The source is a one-off solution to a specific problem (fails reusability)
- The pattern is something Claude already does well by default (fails non-triviality)
- The underlying technology/approach is still changing rapidly (fails stability)
- The user wants to document an API or library (that's a library-type skill, written differently)

### Related skills
- [[gobble]] — often runs before skillify (gobble captures, skillify extracts)
- [[distill]] — may trigger skillify when classifying conversation content

---

## 3. CORE INSTRUCTIONS

### Step 1: Read `_RULES.md`
Load `/_RULES.md` before making any routing decisions.

### Step 2: Classify the extraction — what shape is this?

Before applying the worthiness rubric, identify what kind of thing this source contains. Sources often contain multiple types — split them. Route each fragment to its correct location. Without this classifier, ~30% of "skill candidates" are actually misfiled principles, architectural patterns, or vault-operating procedures.

Ask these questions and **record ALL applicable shapes** — do NOT stop at the first YES. A rich source often contains multiple shapes simultaneously. Scan for every shape present and prepare a routing plan that may write to multiple files.

1. **Is this a procedure specific to operating THIS vault?**
   (Reads or writes vault files, applies vault governance, only works because the vault's file structure exists. Not portable to another agent system.)
   → **WORKFLOW.** Route to `/workflows/inbox/` (or `/workflows/library/` if battle-tested and being promoted). Workflows promote on "used in N real sessions without breaking", not on the skill worthiness rubric.

   **Do not rewrite a workflow to be portable.** If the portable pattern underneath matters, write a FRESH new skill file from scratch as a separate sibling — do not patch the workflow with abstraction placeholders. Never merge two sibling files into one hybrid.

2. **Is this a named principle with empirical evidence?**
   (A belief observed repeatedly with specific examples: "X happens. I've seen it in A, B, C. Confidence: medium.")
   → **DOCTRINE.** Route to `/me/doctrine.md` as a doctrine entry. Use doctrine format: name, description, where first observed, evidence, confidence.

   **Check `doctrine.md` first for duplicates.** If an existing entry covers the same principle, append your new evidence to the existing entry as additional validation — do NOT create a duplicate doctrine. Read `doctrine.md` before proposing a new entry.

   **Pairing:** if the source ALSO contains a portable executable application of the principle (not just the principle itself), continue scanning through question 6 below — you'll create a paired skill file that links back to this doctrine. Sibling files are the expected case for rich sources.

3. **Is this an architectural decision about the vault itself?**
   (How multi-abstraction works, why routing plans are mandatory, why skills go to inbox first, typed relationship vocabulary — decisions that shape how THIS vault operates.)
   → **VAULT STRATEGY.** Route to `/me/obsidian-strategy.md`.

4. **Is this an architectural pattern about systems?**
   (Agent architecture, memory tiering, permission cascades, orchestration models, distributed coordination, safety classifiers, parallel execution models, tool design patterns — patterns observed in other systems or in your own projects that are NOT about operating this vault.)
   → **SYSTEM PATTERN.** Route to `/me/system-patterns.md` under the most relevant section (Agent Architecture / Memory & Context / Safety & Permissions / Orchestration & Coordination / Parallel Execution / Tool & Prompt Design, or a new section if none fit). If the pattern directly shapes one specific project, ALSO backlink it from that project's context file.

   **Pairing:** if the pattern can be *executed* by an agent (not just described), continue scanning through question 6 below — you'll create a paired skill file that links back to this system pattern.

5. **Is this a long-form, multi-module operational framework for a domain (not an agent instruction set)?**
   (Structured around: objective → when to use → ordered steps → success metrics → field evidence. A living document. Executes a domain — paid media, fundraising, hiring — not a trigger-driven instruction for an agent. Distinct from a skill: not second-person agent instructions. Distinct from a workflow: not vault-operating.)
   → **PLAYBOOK.** Route to `/me/playbooks/[name].md` if personal-authored, or `/reading/playbooks/[slug].md` if captured from an external source. Use the playbook template at `/me/playbooks/_TEMPLATE.md`.

6. **Is this an instruction set an agent executes when a trigger matches?**
   (Written in second person to an agent: "When X, do Y because Z." Portable — works without this vault's specific file layout.)
   → **SKILL.** Proceed to Step 3 (worthiness rubric).

#### The Pairing Rule (critical)

**A source can produce multiple sibling files.** This is the expected case for rich sources, not an exception:

- Source contains a named principle + a portable application → create DOCTRINE entry + paired SKILL file, link them via Connected Files
- Source contains a system architecture pattern + an executable version → create SYSTEM PATTERN entry + paired SKILL file, link them
- Source contains a vault operation + a portable pattern underneath → create the WORKFLOW file. If you want the portable version too, write it FRESH as a separate skill file. Do NOT rewrite the workflow with abstraction layers.

**Never merge siblings into one file.** A file trying to be both vault-coupled and portable (*"in this vault, path is X; elsewhere, may be Y"*) is the adapter anti-pattern — it pretends portability without delivering it.

**When to stop scanning Step 2:** after you've scanned all six questions and recorded every shape present in the source. One source may return yes to multiple questions — that's correct behavior, not an error.

**If every shape in the source routed to non-skill locations, skillify's job is done** — the routing plan IS the output. No skill candidate gets generated, and that's the correct result.

**If any shape in the source is a SKILL, proceed to Step 3 (worthiness rubric) to evaluate that specific fragment.** The other shapes you identified (doctrine, workflow, system-pattern, vault-strategy, playbook) still get written to their correct locations regardless of whether Step 3 approves the skill fragment — the sibling files are independently valuable.

### Step 3: Apply the Worthiness Rubric
Score explicitly. Show all four scores to the user.

| Filter | Question | Score |
|--------|----------|-------|
| **Reusability** | Applies to 2+ of the user's projects? | [0 or 1] |
| **Non-triviality** | Claude gets this wrong without the skill? | [0 or 1] |
| **Stability** | Pattern settled enough to encode? | [0 or 1] |
| **Delta** | Pushes agent out of default behavior? | [0 or 1] |

**Total: [X/4]**
- **3/4 or 4/4:** Proceed to extraction
- **2/4:** Hard stop. Tell user why it scored low. Do not generate a candidate.
- **1/4 or 0/4:** Clearly not a skill. Suggest it stays as a note in the gobble file.

### Step 4: Choose the Extraction Lens — Capability or Principle (updated 2026-04-24)

**BEFORE extracting, decide the lens.** A source can contain both — produce both files as siblings if so. See [[_TEMPLATE]] "EXTRACTION-LENS" section for the full distinction.

| Lens | When to choose | Output shape |
|---|---|---|
| **Capability** | Source is an executable procedure (monitor X → classify → output Y) | `description` = trigger condition. Body = numbered steps, explicit tools, inputs/outputs, scoring. First-invocation test required before promotion. |
| **Principle** | Source is a named pattern / stance to apply during other work | `description` = when the principle applies. Body = pattern rules, disambiguators. |

Tag the chosen lens in `metadata.extraction-lens`. If both apply, write two files.

#### Step 4a — Capability-lens extraction
Output must be:
- **Executable** — an agent can follow the steps end-to-end
- **Tool-specific** — name the tools (`WebSearch`, `WebFetch`, `Write`) not generic verbs ("search the web")
- **Input-validated** — specify required inputs and what to do if missing
- **Output-formatted** — define the exact output shape (table, JSON, file path)
- **Graceful under failure** — name the degradation path if a dependency fails

| Wrong (capability) | Right (capability) |
|---|---|
| "Use [specific tool's] simulation engine to evaluate decisions" | "Given a decision, spawn N agent personas with distinct prior beliefs, run them in parallel against scenario inputs, aggregate votes, return majority + minority-report summary" |
| "Check funding announcements" | "Run WebSearch + HN Algolia + site:x.com + site:reddit.com in parallel, cross-verify candidates, score by stage/industry/amount, output ranked markdown table" |

#### Step 4b — Principle-lens extraction
Output must be:
- **Transferable** — works outside the source's specific context
- **Instructional** — tells an agent what to DO when the pattern applies, not what to READ
- **Opinionated** — makes a choice, doesn't hedge

| Wrong (principle) | Right (principle) |
|---|---|
| "Use [specific tool's] simulation engine" | "Simulate N competing agent perspectives before converging on a decision" |
| "Follow the autoresearch pattern" | "Separate generation from evaluation; score N candidates against a rubric and promote winners" |
| "Check out this repo's approach" | "When facing [specific situation], apply [specific principle] because [specific reason]" |

**A source can produce both as siblings.** One capability-lens skill (tools, steps, convergence logic, output format) + one principle-lens skill (when to apply, why, disambiguators). Linked via Connected Files. Neither is a duplicate.

### Step 5: Generate Skill Candidate
Use [[_TEMPLATE]] standard. Fill:
- **Frontmatter:** name, version (0.1.0), type, scope, projects, description, status: candidate, **`extraction-lens: capability | principle | hybrid`**
- **Purpose:** One sentence — what problem does this solve that Claude wouldn't solve well alone?
- **Triggers / Anti-triggers:** When to use, when not to use
- **Core Instructions:** For capability skills = numbered executable steps. For principle skills = the pattern rules and disambiguators.
- **Reference Material:** Only if the skill needs lookup data
- **Gotchas:** Leave with `[TODO — populate from first-invocation test]` for capability skills, or `[TODO — populate from real usage]` for principle skills. Speculation-only gotchas don't count.
- **Quick Reference:** Compressed to 10 lines max

### Step 5a: First-Invocation Test (capability-lens skills only — required)
Before the skill leaves version 0.1.0:
1. Invoke the skill once in the minimum plausible real context
2. Capture every hesitation and improvisation as a gotcha
3. Populate Section 5 with real gotchas (remove speculation)
4. Patch the instruction body; bump to 0.2.0
5. Record `first_invocation` date in metadata

See [[_TEMPLATE]] §5a for the full protocol.

### Step 6: Save to Inbox
- **Always** save to `/skills/inbox/[skill-name].md`
- **Never** save directly to `/skills/library/` — human review required for promotion
- Add backlinks to source (the gobble file or conversation that spawned it)
- Add backlinks to projects it applies to

### Step 7: Update Source
- If the skill candidate came from a gobble file: update the Skill Candidates section with a link to the new candidate file — note the lens used (capability / principle)
- If it came from a conversation distill: add a note in the distill output linking to the candidate
- For capability-lens skills, **Step 5a (first-invocation test) is mandatory** before the skill leaves 0.1.0. Don't skip.

---

## 4. REFERENCE MATERIAL

### Skill Types (choose the right one)
| Type | When to use | Primary section to nail |
|------|-------------|------------------------|
| `library` | API/design reference skills | Reference Material |
| `verification` | Testing/validation patterns | Scripts |
| `data` | Data fetching/processing | Reference + Scripts |
| `process` | Workflow/methodology patterns | Core Instructions |
| `scaffold` | Project/file generation | Examples + Assets |
| `review` | Code/content review patterns | Gotchas |
| `deployment` | Deploy/release patterns | Scripts + Gotchas |
| `runbook` | Incident/troubleshooting | Reference (symptom→action) |
| `infra` | Infrastructure patterns | Scripts + Gotchas |

### Naming Convention
- kebab-case: `autonomous-scored-iteration.md`
- Name the principle, not the source: NOT `autoresearch-pattern.md`

---

## 5. GOTCHAS

| # | Gotcha | What goes wrong | What to do instead |
|---|--------|-----------------|-------------------|
| 1 | Copying implementation | Skill is too specific to one repo, doesn't transfer | Extract the principle only — ask "does this work without the source code?" |
| 2 | Low-score skills | Clutters inbox with noise, review burden | Hard stop at 2/4. No exceptions. |
| 3 | Promoting to /library/ | Unvalidated skills cause agent confusion | Always → /inbox/ first. Mark status: candidate. |
| 4 | Hedging the instructions | "Consider doing X" instead of "Do X" | Skills are opinionated. Make a choice. |
| 5 | Skipping the rubric | Generating candidates without scoring | Always show all 4 scores explicitly |
| 6 | Naming after the source | `autoresearch-skill.md` instead of the principle | Name the transferable concept, not where it came from |

---

## 6. EXAMPLES

### Good skillify output
**Source:** A multi-agent social simulation engine
**Rubric:** Reusability 1 + Non-triviality 1 + Stability 1 + Delta 1 = 4/4

**Extracted principle:**
> "Simulate N competing agent perspectives before converging on a decision"

**Skill name:** `multi-perspective-convergence.md`
**Applies to:** [[project-a-context]] (task planning), [[project-b-context]] (content evaluation)

### Bad skillify output (anti-pattern)
**Source:** Some utility library
**Rubric:** Reusability 1 + Non-triviality 0 + Stability 1 + Delta 0 = 2/4

**Should have stopped here.** Instead generates a skill that says "use proper error handling" — something Claude already does by default. This is noise, not intelligence.

---

## 9. QUICK REFERENCE

```
SKILLIFY = source → ontology classifier → (if skill) worthiness rubric → lens choice → skill candidate(s)
STEP 2 FIRST: classify as skill | workflow | doctrine | vault-strategy | system-pattern | playbook — route elsewhere if not a skill
ALWAYS score rubric explicitly: Reusability + Non-triviality + Stability + Delta — 3/4 min, hard stop at 2/4
STEP 4: CHOOSE LENS — capability (executable procedure) OR principle (pattern to apply) OR both as siblings
  - Capability lens: tools, steps, inputs, outputs, scoring. First-invocation test MANDATORY before v0.1.0 → v0.2.0.
  - Principle lens: when-to-apply, disambiguators, transferable pattern
Tag metadata.extraction-lens: capability | principle | hybrid
Output ALWAYS goes to /skills/inbox/ — NEVER /skills/library/
Gotchas = [TODO — first-invocation test] for capability skills; [TODO — real usage] for principle skills
Name the principle (or the capability), not the source
Read _RULES.md before routing
```

---

## Connected Files
- [[_RULES]] — vault constitution (read before routing)
- [[gobble]] — often runs before skillify
- [[distill]] — may trigger skillify during classification
- [[_TEMPLATE]] — standard for generated candidates
- [[obsidian-strategy]] — architectural context
