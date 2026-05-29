# Vault Rules — Constitution
> Every skill that touches this vault (gobble, skillify, distill) MUST read this file before making routing decisions.
> This is the single source of truth for how the vault operates.
> Last updated: YYYY-MM-DD

---

## 0. COMPANION FILES

This file (`_RULES.md`) is the **human-readable constitution**: what + why. Two companion files split out specific concerns:

- **[[AGENTS]]** at root — agent-facing write-authorization contract. The 4-zone model + per-folder override rules. Read by any agent before any vault write. Each top-level folder also has its own `AGENTS.md` that overrides root rules within scope.
- **[[_SCHEMA]]** at root — consolidated data-shape reference. Entity types, relation types, frontmatter axes per shape, naming conventions.

**Reading order:**
- For governance + reasoning → this file (`_RULES.md`)
- For agent write authorization → [[AGENTS]] (root + per-folder)
- For data shape lookup → [[_SCHEMA]]

Per-folder `AGENTS.md` files override root rules within their scope.

---

## 1. CANONICAL LOCATIONS — Where Does What Go?

| Content Type | Location | Example |
|-------------|----------|---------|
| Project context | `/projects/[name]-context.md` | `example-saas-project-context.md` |
| Validated skill | `/skills/library/[skill-name].md` | `voice.md` |
| Skill candidate | `/skills/inbox/[skill-name].md` | `example-skill.md` |
| Deprecated skill | `/skills/archived/[skill-name].md` | — |
| Validated workflow | `/workflows/library/[name].md` | `distill.md` |
| Workflow candidate | `/workflows/inbox/[name].md` | — |
| Deprecated workflow | `/workflows/archived/[name].md` | — |
| System pattern | `/me/system-patterns.md` (append to relevant section) | — |
| Gobbled repo | `/reading/repos/[repo-name].md` | — |
| Gobbled article | `/reading/articles/[slug].md` | — |
| Gobbled X thread | `/reading/threads/[author-slug-date].md` | — |
| Gobbled paper | `/reading/articles/[slug].md` | — |
| External doctrine | `/reading/doctrines/[slug].md` | — |
| Doctrine entry (personal) | `/me/doctrine.md` (append new entry) | — |
| Personal playbook | `/me/playbooks/[name].md` | — |
| External playbook | `/reading/playbooks/[slug].md` | — |
| Gobbled video | `/reading/videos/[slug].md` | — |
| Raw idea | `/me/ideas/_INBOX.md` (append entry) | — |
| Content draft | `/me/drafts/[slug].md` | — |
| Published content | `/me/published/_INDEX.md` (append entry) | — |
| Personal voice/tone | `/me/voice.md` | — |
| Content strategy | `/me/content-plan.md` | — |
| Vault strategy | `/me/obsidian-strategy.md` | — |
| Project insight | Append to relevant `/projects/[name]-context.md` | — |
| Personal reflection | Append to relevant `/me/` file | — |

**If content doesn't fit any row above → create a new file in the most logical parent directory and flag it in the routing plan.**

---

## 2. AMBIGUITY HANDLING

- **When content could go in two places:** Show the routing plan and ask. Never guess silently.
- **When content has multiple types:** Split and route each piece to its canonical location. One rich conversation can produce 6-8 entries across 4 different locations. That's correct behavior.
- **When unsure about a connection:** Add it as a `[TODO — verify connection]` rather than omitting it or inventing it.
- **Routing plan is mandatory:** distill, gobble, and any vault-writing operation must show where files will be written and get **explicit confirmation** before writing. Present the plan, wait for the user to say "confirm" / "go" / "proceed" or similar. Never execute a distill or gobble without this confirmation step, even if the user says "proceed" in a general sense about the broader task. Each routing plan requires its own approval.

---

## 3. WHAT NEVER ENTERS THE VAULT

- **Raw conversation dumps** without distillation — always classify and split first
- **Duplicate entries** — check if an existing file covers the same topic before creating
- **Agent-generated content that hasn't been reviewed** — skills go to `/inbox/` not `/library/`
- **Secrets, credentials, API keys** — never, under any circumstances
- **Ephemeral task state** — use a task manager for tasks, not the vault
- **Content that can be derived from code** — the code is the source of truth for implementation; the vault captures decisions, patterns, and thinking
- **Unsynced voice edits** — voice.md lives in two places:
  `/me/voice.md` (source, edit here) and
  `/skills/library/voice.md` (skill copy, sync after edits).
  Always sync both when updating voice.

---

## 4. BACKLINK REQUIREMENTS

- **Every file must link to at least one other vault file** using `[[filename]]` syntax
- Skills link to every project they apply to
- Projects link to skills that power them
- Published content links back to: projects referenced, reading that informed it, ideas it originated from
- Gobbled content links to: connected projects, connected skills, skill candidates it spawned

---

## 5. TYPED RELATIONSHIPS

When documenting relationships between projects, use these types:

| Type | Meaning |
|------|---------|
| `powers` | Orchestration/execution layer for another project |
| `shares-dna` | Common architecture or origin |
| `depends-on` | Hard dependency |
| `parallel-bet` | Same infrastructure, different market |
| `supersedes` / `superseded-by` | Deprecation chain |
| `feeds` | One project's output is another's input |
| `planned-depends-on` | Intended future dependency, not yet live |

Format:
```markdown
## Relationships
- [[project-a]] — powers
- [[project-b]] — shares-dna (same core architecture)
```

---

## 6. SKILL GOVERNANCE

### Creation
- New skills ALWAYS go to `/skills/inbox/` — never directly to `/library/`
- Must pass worthiness rubric (3/4 minimum) before creation
- Must use [[_TEMPLATE]] standard format
- Must declare `extraction-lens: capability | principle | hybrid` in metadata- Capability-lens skills require first-invocation test (see [[_TEMPLATE]] §5a) before leaving v0.1.0
- voice.md is the only skill that lives in both /me/ and
  /skills/library/ — this is intentional, not a duplicate violation

### Promotion (inbox → library)
- Requires human review
- Gotchas section must have at least one real entry (from actual usage)
- For capability-lens skills: gotchas must come from a first-invocation test. Speculation ("might fail if...") does not count- Backlinks must be wired to all relevant projects

### Overlap Resolution
1. Proven-in-production beats external — always
2. More specific beats more general — always
3. Newer beats older ONLY IF it demonstrably solves something older doesn't
4. Conflicts get flagged in Gotchas of BOTH skills, never silently resolved

### Deprecation (library → archived)
- Move to `/skills/archived/` with a note explaining why
- Update `_INDEX.md` to reflect the change
- Don't delete — keep for history

---

## 6a. WORKFLOW GOVERNANCE

> Workflows are vault-operating procedures. They read/write vault files and apply vault governance. They are NOT portable. For the ontology distinguishing workflows from skills, see Section 6b.

### Creation
- New workflows go to `/workflows/inbox/` — never directly to `/library/`
- No worthiness rubric required (workflows are vault-specific by nature; portability, the rubric's core test, doesn't apply)
- Must follow the same template structure as skills for consistency, but the ontology check at the top of `_TEMPLATE.md` should route here, not to `/skills/`

### Promotion (inbox → library)
- Requires human review
- Promotion criterion: **used in N real sessions without breaking** (different from skills, which require real-usage gotchas)
- The distinction: workflow failure is visible and immediate (files route wrong, structure breaks). Skill failure is subtle (agent does the wrong thing, nobody notices). Different failure modes → different promotion gates.

### Overlap Resolution
- Same rules as skills (Section 6, Overlap Resolution)
- Additional rule: if a workflow and a skill overlap, check whether the overlap is vault-coupled (workflow wins) or portable (skill wins). They may coexist as siblings per Section 6b.1.

### Deprecation (library → archived)
- Move to `/workflows/archived/` with a note explaining why
- Update `/workflows/_INDEX.md` to reflect the change
- Don't delete — keep for history

---

## 6b. ONTOLOGY — What Goes Where

> Added after a skills-library audit revealed that a meaningful share of inbox candidates were misfiled principles and architectural patterns, not executable skills. This section is the diagnostic test used by [[skillify]] and [[_TEMPLATE]] to route extractions to the correct location. Getting the shape wrong pollutes both folders: valuable material becomes undiscoverable because it's in the wrong place.

The vault assumes extracted intelligence fits one of seven shapes:

| Shape | Description | Location |
|---|---|---|
| **Skill** | An instruction set an agent executes when a trigger condition matches. Second person: "When X, do Y because Z." Portable across agent systems — works without this vault's specific file layout. | `/skills/library/` or `/skills/inbox/` |
| **Workflow** | A procedure that operates on THIS vault's specific file structure. Reads/writes vault files, applies vault governance. Not portable. | `/workflows/library/` or `/workflows/inbox/` |
| **Doctrine** | A named principle observed repeatedly with empirical evidence. "X happens. Evidence: A, B, C. Confidence: medium." | `/me/doctrine.md` |
| **Vault strategy** | An architectural decision about how THIS vault works. "We decided X because Y, not Z, because of tradeoff T." Inward-facing. | `/me/obsidian-strategy.md` |
| **System pattern** | An architectural pattern observed in the wild or in own projects — agent architecture, memory tiering, permission cascades, orchestration models, safety patterns, any reusable system shape. Outward-facing. | `/me/system-patterns.md` (under the relevant section), OR a project context file if it directly shapes one specific project |
| **Playbook** | A long-form, multi-module operational framework for executing a domain (paid media, fundraising, hiring). Living document. Structured around: objective → when to use → ordered steps → success metrics → field evidence. Distinct from a skill (not agent instructions) and from a workflow (not vault-operating). Federatable across vaults when scope signals it. | `/me/playbooks/[name].md` (personal authored) or `/reading/playbooks/[slug].md` (external captured) |
| **Agent** | A configured persona spawned with its own context, tool restrictions, scope, and termination criterion. The artifact IS the persona definition — system prompt, role, behaviors, anti-behaviors, output format. Distinct from a skill: skills are instruction sets ANY agent executes; agents fork context and run as a separate, scoped instance. Maps to Claude Code's `.claude/agents/` pattern. | `/agents/library/` or `/agents/inbox/` |

### Diagnostic Test

Can you say out loud which shape this is in 10 seconds? If you hesitate, it's probably in the wrong category. Use these disambiguators in order:

1. **Does this operate on vault files?** → Workflow.
2. **Is this a belief with empirical evidence I've personally collected?** → Doctrine.
3. **Is this a decision about how this vault itself should work?** → Vault strategy.
4. **Is this an architectural pattern about systems (agents, memory, orchestration, etc.)?** → System pattern.
5. **Is this a long-form, multi-module operational framework for a domain (not an agent instruction set)?** → Playbook.
6. **Is this a configured persona spawned with its OWN context (not the parent's), with explicit role, tool restrictions, and termination criterion?** → Agent. *(Key distinction from skill: skill = instruction any agent runs; agent = spawned persona with forked context.)*
7. **Is this an instruction an agent executes when a trigger matches?** → Skill.

### Common Failure Mode

Writing architectural descriptions as skills. Architectural descriptions are not instructions. An agent cannot "execute" a description. If it describes rather than instructs, it belongs in system-patterns, vault-strategy, or doctrine — not in skills.

**Linguistic tell:** skills are written in second person to the agent ("When you see X, do Y"). Doctrines are written as observed truth ("X happens. Evidence..."). System patterns are written as architectural description ("The pattern works by..."). If the content reads as description rather than instruction, it is not a skill.

### Re-classification

If an inbox item is in the wrong category, move it and flag the move in the target file with a source reference: `> Moved from [[original-location]] on [date] — was misfiled. Ontology: [X was wrong, correct shape is Y].` Do not silently re-shape — the move is the event, and the lineage should be preserved for future audits.

### Related Workflows

- [[skillify]] — Step 2 applies this ontology before the worthiness rubric
- [[_TEMPLATE]] — the ontology check at the top of the template refuses to be filled out for non-skills

---

## 6b.1 — The Pairing Pattern: Sibling Files, Not Alternatives

> Added after a portability audit revealed that the 5-shape ontology in Section 6b was being read as mutually exclusive, when the vault's actual working pattern is that a single concept can exist as multiple sibling files simultaneously.

A concept is NOT limited to one shape. A single idea can have up to four sibling files:

| Sibling | Captures | Location |
|---|---|---|
| **Doctrine** | The principle + empirical evidence. The WHY. | `/me/doctrine.md` |
| **Workflow** | The vault-specific operational HOW. | `/workflows/library/` or `/workflows/inbox/` |
| **Skill** | The portable executable HOW. Works for any agent system. Same context as the running agent. | `/skills/library/` or `/skills/inbox/` |
| **Agent** | The forked-context HOW — a spawned persona with its own scope, tool restrictions, and termination. Distinct from skill: agent forks context, skill inherits it. | `/agents/library/` or `/agents/inbox/` |

These are siblings, not alternatives. Each file is editable independently. None is a duplicate — they're different views of the same idea, written for different consumers:

- The **doctrine** is for you (and future sessions) reasoning about why a pattern works.
- The **workflow** is for Claude operating inside this vault.
- The **skill** is for agents operating anywhere — Claude Projects, external systems, other agent frameworks.

### The Rule: Never Merge Siblings

**A workflow with portability placeholders is not a skill.** A file that says *"in this vault, path is X; in another host, path may be Y"* is premature abstraction — it pretends portability without delivering it, and it pollutes the instructions with conditional logic that makes agents read them poorly.

**If a vault-coupled workflow has a portable pattern worth preserving as a skill, write a NEW skill file from scratch**, grounded in the principle, without vault references. Do not rewrite the workflow with abstraction layers. The two files coexist, they don't merge.

### Rules for Pairings

1. **One canonical doctrine per principle.** If `doctrine.md` already contains a principle, add new evidence to the existing entry instead of creating a duplicate.

2. **Multiple skills/workflows can pair with one doctrine.** Different operational applications of the same principle are valid siblings, not redundant.

3. **Backlinks are required in both directions.** The doctrine's Connected Files section links to every paired skill/workflow. Each skill/workflow's Connected Files section links back to the paired doctrine.

4. **Don't collapse a pair into one file.** The duplication is deliberate — principle and application evolve independently. Editing the principle shouldn't require editing every skill that applies it, and vice versa.

5. **When running [[skillify]] or [[distill]]:** if a source contains BOTH a named principle with evidence AND a portable executable application, create BOTH files (doctrine entry + skill candidate) and link them. Don't choose one shape when the source clearly has both.

### Common Failure Modes

- **Extracting only the application (skill) without creating a doctrine entry.** The empirical evidence and confidence level get lost. Every validated skill that expresses an observed principle should have a doctrine entry it pairs with.

- **"Universal with adapter" files.** One file trying to serve both the vault use case and a hypothetical future external host via conditional paths. Premature abstraction — the adapter assumes a second host that doesn't exist yet. If the portable version matters later, write it fresh.

- **Silently rewriting a workflow to be portable.** Same anti-pattern as the adapter case — one vague file that's neither clearly vault-coupled nor fully portable.

- **Duplicating existing doctrines.** Ingesting a source whose principle already exists as a doctrine, and creating a new doctrine instead of appending evidence to the existing one. Always check `doctrine.md` first.

### Related Sections

- [[_RULES#6b ONTOLOGY]] — the 6 shapes this pattern operates on
- [[skillify]] — the classifier that routes fragments; uses this pattern for multi-shape sources
- [[_TEMPLATE]] — the ontology check at the top of skill files enforces this rule

---

## 6b.2 — The 2-Instance Rule: Guardrail Against Speculative Branching

> Added after adopting "playbook" as a 6th shape. Without this rule, any new domain-knowledge pattern observed in a reference library (community vaults often carry 8-10 shapes: playbooks, frameworks, mental-models, heuristics, case-studies, failure-case-studies, anti-patterns, practitioners, insights-trends) risks speculative mirroring — creating empty `/me/frameworks/`, `/me/case-studies/`, `/me/mental-models/` directories before the user has actually authored anything of those shapes. The vault would branch faster than it accumulates.

### The Rule

**New ontological shapes enter the vault only after 2+ authored instances exist in the wild. One instance is interesting. Two is a pattern.**

### How to Apply

Before adding a new shape to Section 6b's ontology:

1. **Count authored instances.** Does the user have at least 2 files that clearly match this shape, written in real work, not speculation?
2. **Check external validation.** Does this shape exist in a reference library (another vault, a community knowledge base) with at least ~10 instances? This is evidence the shape is ontologically real, not ad-hoc.
3. **If both conditions fail:** keep the content in the closest existing shape. Don't branch the ontology.
4. **If condition 1 fails but 2 passes:** hold. The shape is real elsewhere but you haven't produced it yet. Revisit when you've authored the second instance.

### What This Prevents

- **Empty-directory trap.** Creating `/me/frameworks/`, `/me/case-studies/`, `/me/mental-models/` speculatively, then having nothing to put in them for 6 months.
- **Shape inflation.** Every time a reference library adds a shape, the personal vault adds one too. Federation becomes impossible because the personal vault has more empty shapes than filled ones.
- **Ontology drift.** Shapes added without evidence become ambiguous — "Is this a framework or a playbook?" — because neither has enough instances to define its boundaries.

### What This Allows

- Adopting a shape the moment you've produced the second instance.
- Borrowing validated patterns from reference libraries when the pattern is clearly proven elsewhere.
- Saying "no" to speculative branching without blocking legitimate evolution.

### Related Sections

- [[_RULES#6b ONTOLOGY]] — the shape inventory this rule governs
- [[system-patterns]] — documents any federation patterns that make shape alignment with other vaults matter

---

## 7. GOBBLE RULES

- Source type detection is automatic from URL
- Depth levels: Repo = deep, Article = medium, Thread = shallow
- Always check for skill candidates after gobbling
- Only link projects where connection is explicit — don't hallucinate connections
- If source is behind a paywall or inaccessible, note the URL and ask user for paste

---

## 8. WEEKLY REVIEW CADENCE

Every week, 15 minutes:
```
0. Ontology scan — for each new inbox item (skills and workflows), apply Section 6b. If the shape is wrong (skill / workflow / doctrine / vault-strategy / system-pattern / playbook / agent), move it to the correct location BEFORE promoting or dismissing. Misfiled items never promote — they accumulate. The ontology scan is step zero because re-classifying before evaluating prevents wasted review cycles.
1. Vault consistency check — run [[vault-consistency-check]] to catch structural drift across governance files (indexes, onboarding, canonical locations). Only strictly required when there's been a structural refactor since last review.
2. Review /skills/inbox/ — promote or dismiss candidates
3. Review /workflows/inbox/ — promote or dismiss candidates
4. Review /me/ideas/_INBOX.md — develop or dismiss ideas
5. Check /me/published/_INDEX.md — add any published posts
6. Run [[sync-context]] on any project with significant recent development
7. Check for stale [TODO] tags across the vault
```

---

## 9. SESSION RULES

| Work type | Open Claude Code at |
|-----------|-------------------|
| Project-specific | Project directory |
| Vault/knowledge work | Vault root |
| Cross-project reasoning | Vault root |

---

## 10. FRONTMATTER RULES

Every vault file with YAML frontmatter must follow this format exactly:

- First line of the file must be `---` alone — nothing before it
- Each field on its own line: `key: value`
- No `##` or other markdown before field names
- Multi-line values use `>` with indented continuation lines
- Closing `---` on its own line immediately before the first `#` heading
- Vault-management fields go inside a `metadata:` block for skill files

**Test:** If frontmatter is visible as text in Obsidian reading view,
it's broken. Correct frontmatter is hidden by Obsidian automatically.

**Common failure mode:** All fields collapsed onto one line — caused by
incorrect indentation or missing line breaks during file creation.

---

## 11. MULTI-ABSTRACTION NOTE STANDARD
> See [[obsidian-strategy]] for the rationale.

Every vault note carries multiple abstraction levels. Claude Code (as librarian) extracts these when creating or updating any note. This enables cross-domain pattern matching that is impossible at the concrete level alone.

### The Three Levels

| Level | Captures | Required |
|-------|----------|----------|
| **Concrete** | What this actually is. Technical, specific, implementation-level. | Yes |
| **Abstract** | The underlying pattern. Domain-agnostic, transferable. | Yes |
| **Fundamental** | What this is really about at the deepest level. Connects to other disciplines. | Optional (add when the connection is non-obvious) |

### The Matches Field

For frontmatter-based notes, include a `matches` field listing domains where the abstract pattern appears elsewhere:

```yaml
abstraction:
  concrete: "AI-powered orchestration of parallel coding agents"
  abstract: "Specialized entities coordinating under uncertainty toward a shared goal"
  fundamental: "Coordinated autonomous intelligence with feedback-driven improvement"
  matches: [swarm intelligence, immune systems, military operations, sports team coordination]
```

The `matches` field makes cross-domain connections explicit and machine-readable.

### How It Appears Per Note Type

**Standalone files with YAML frontmatter** (skills, reading entries):
Add `abstraction:` block to frontmatter with `concrete`, `abstract`, `fundamental` (optional), and `matches` fields.

**Project context files** (add section after "What It Is"):
```markdown
## Abstraction Layers
- **Abstract:** [domain-agnostic pattern]
- **Fundamental:** [deepest level]
- **Matches:** [comma-separated domains]
```

**Analysis notes and drafts** (add section near top):
Same `## Abstraction Layers` section format as project contexts.

**_INBOX entries** (add one line per entry):
```markdown
- **Pattern:** [abstract-level description in one line]
```
This makes the inbox searchable at the abstract level. Pattern-level grouping surfaces clusters invisible when reading sequentially.

**Doctrine entries: EXCEPTION.** Doctrines already operate at the abstract level. Do NOT add abstraction layers to doctrine entries. The doctrine name and description ARE the abstraction. Adding layers would be redundant.

### The Librarian's Job

When Claude Code creates or updates any vault note:
1. Write the concrete description (from user input or source material)
2. Extract the abstract pattern: "What is this really about if you remove the domain-specific language?"
3. Optionally extract the fundamental level: "What discipline-agnostic principle is at work here?"
4. Add `matches` where cross-domain connections are visible
5. If updating an existing note, check whether abstraction layers still match the concrete content
6. For _INBOX entries, add a `- **Pattern:**` line

---

## Connected Files
- [[obsidian-strategy]] — the decisions behind these rules
- [[vault-todo]] — phased execution plan
- [[_TEMPLATE]] — skill standard
- [[gobble]] — ingestion workflow (reads this file)
- [[skillify]] — extraction workflow (reads this file)
- [[distill]] — routing workflow (reads this file)
- [[voice]] — voice skill (references this file for publishing rules)
