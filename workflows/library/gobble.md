---
name: gobble
description: >
  Ingests any external source (GitHub repo, article, X thread, paper)
  into the vault as a structured knowledge node. Use when given a URL
  to capture. Triggers on: gobble [url], ingest this, save this to vault.
  Do NOT use for internal project files or vault-to-vault operations.
capabilities: [source-ingestion, knowledge-capture, backlink-generation, skill-candidate-detection]
outputs: structured vault node in /reading/ with backlinks to projects and skill candidates flagged
cost: medium
speed: 2-5 min per source
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
  concrete: "Ingests external sources (GitHub repos, articles, X threads) into the vault as structured, backlinked knowledge nodes with skill candidates flagged"
  abstract: "Structured capture with context preservation converting ephemeral external information into persistent, graph-connected internal knowledge"
  fundamental: "Entropy reduction at system boundary transforming unstructured external input into structured internal state at the point of ingestion"
  matches: [ETL pipelines in data engineering, specimen collection in field biology, intelligence intake in military/security, library cataloging]
---

## 1. PURPOSE

**Prevents discovered repos, articles, and threads from becoming dead bookmarks.** Without this skill, interesting finds get saved to browser bookmarks or notes apps and never surface again. Gobble creates a structured, backlinked vault node that future sessions can discover automatically.

**Why this exists:**
- Bookmarks and scattered notes are invisible to Claude Code — dead capital
- The connection between a discovered repo and active projects is obvious at discovery time but forgotten within days
- Skill candidates hiding inside interesting repos are never extracted without a deliberate step

---

## 2. WHEN TO USE / WHEN NOT TO USE

### Trigger conditions
- User provides a URL and says "gobble this", "ingest this", "save this to vault"
- User shares a GitHub repo, article link, X thread, or paper URL
- User says "I found something interesting" + provides a link

### Anti-triggers (do NOT apply when)
- Content is internal to the vault (use [[distill]] instead)
- User wants to modify an existing vault file (that's an edit, not a gobble)
- User wants a full code review of a repo (that's a different task — gobble captures patterns, not audits)
- URL points to documentation the user wants to follow as instructions (that's a task, not ingestion)

### Related skills
- [[skillify]] — run after gobble if Skill Candidates section is non-empty
- [[distill]] — for raw text without a URL (conversations, notes, meeting summaries)

---

## 3. CORE INSTRUCTIONS

### Step 1: Read `_RULES.md`
Load `/_RULES.md` before making any routing decisions.

### Step 2: Detect Source Type
Infer from URL:
| URL pattern | Type | Depth |
|-------------|------|-------|
| `github.com/*` | repo | deep |
| `x.com/*` or `twitter.com/*` | thread | shallow |
| `youtube.com/*`, `youtu.be/*`, `vimeo.com/*` | video | medium |
| `granola.ai/*`, `fathom.video/*`, `fireflies.ai/*`, or a local meeting transcript file | transcript | medium |
| Long-form framework / multi-module operational guide (e.g., community library playbooks) | playbook | deep |
| Everything else | article/paper | medium |

**Playbook detection heuristic:** the source isn't a playbook just because it's long. It's a playbook when it's structured around *operating a domain* (paid media, fundraising, hiring) with: objective → ordered steps → success metrics → field evidence. If it's one argument or one idea, it's an article. If it's executable by an operator in phases, it's a playbook. When ambiguous, default to article and let distill/skillify re-route later.

### Step 3: Fetch and Read
- For repos: read README, scan directory structure, identify core architecture files
- For articles: fetch full text
- For threads: fetch thread content
- If source is inaccessible (paywall, deleted, private): note the URL, ask user to paste content

### Step 4: Generate Output
Use the gobble template format:

```markdown
# [Title]
---
type: [repo | article | thread | paper | video | transcript | playbook]
source_url: [url]
author: [name]
date_gobbled: [today]
tags: []
---

## Core Argument / What It Is
[One paragraph — the central claim or purpose]

## Key Mental Models / Architectural Patterns
- [Pattern 1]: [one line]
- [Pattern 2]: [one line]

## Transferable Principle
[What survives outside this source's specific context]
[For repos: the THINKING behind it, not the implementation]

## Connected Projects
[[project-name]] — why it connects

## Connected Skills
[[skill-name]] — how it relates

## Skill Candidates
[Any pattern worth formalizing into /skills/inbox/?]
[If yes → create a stub and link it here]

## Content Angles
[Any observation, tension, or pattern from this source worth expressing in your own voice. Format: one line per angle.]

- [Angle hook]: [one-line claim or framing] → [suggested format: post / thread / long-form / carousel]
- [Angle hook]: [one-line claim or framing] → [suggested format]

[If no angles surface, write "None — pure reference material."]
```

### Step 5: Route to Correct Location
| Type | Destination |
|------|------------|
| Repo | `/reading/repos/[repo-name].md` |
| Article/Paper | `/reading/articles/[slug].md` |
| Thread | `/reading/threads/[author-slug-date].md` |
| Video | `/reading/videos/[slug].md` |
| Transcript (meeting / call notes) | `/reading/transcripts/[date-slug].md` |
| Playbook (external) | `/reading/playbooks/[slug].md` (use `/me/playbooks/_TEMPLATE.md` with `source: external`) |

### Step 6: Auto-Connect (Two-Lens Scan)
Scan `/projects/` twice, with two different lenses:

**Lens 1 — Inbound: "What does this source teach us?"**
Technical and architectural connections. Shared patterns, shared DNA, dependencies, things the source explains that a project already does.

**Lens 2 — Outbound: "What could this source DO for our projects?"**
Strategic and narrative connections. For each project, ask: could this source serve as...

| Outbound connection type | What it means |
|--------------------------|---------------|
| **Content ammunition** | Arguments, data, or framing useful for a project's content/marketing |
| **Positioning evidence** | Validates a project's market bet or differentiator |
| **Competitive validation** | External proof that a project's approach beats alternatives |
| **Case study / proof of concept** | Someone else doing a version of what the project does |
| **Counterargument** | Challenges a project's assumptions — worth noting, not hiding |

- **Only link projects where connection is explicit** — do not hallucinate connections
- Add `[[project-name]]` backlinks for each genuine connection
- Tag each connection with its type (inbound or outbound + subtype) so the link is actionable, not just decorative

### Step 7: Flag Skill Candidates (capability vs principle — updated 2026-04-24)

A source often contains BOTH capability-shape and principle-shape candidates. Flag them separately — they produce different skill files downstream.

**Capability candidates** (source contains an executable procedure):
- Something an agent could RUN end-to-end given the right tools
- Has clear trigger, inputs, steps, outputs
- Example: a "funding-signal-monitor" capability — monitor sources → classify → output ranked list
- Flag these with: `**Capability candidate:** [name] — [one-line trigger]. Extract with capability-lens.`

**Principle candidates** (source contains a named pattern or stance):
- Something an agent should APPLY during other work
- "When facing [situation], prefer [approach] because [reason]"
- Example: an "autonomous-scored-iteration" principle — separate generation from evaluation; score candidates
- Flag these with: `**Principle candidate:** [name] — [one-line pattern]. Extract with principle-lens.`

**Both can coexist.** The same source may yield a capability-lens skill AND a principle-lens skill AND a doctrine entry. Don't collapse — sibling files are the expected case. See [[_RULES#6b.1 — The Pairing Pattern]] and [[_TEMPLATE]] ontology check for the lens distinction.

**If no candidates of either kind:** write "None identified" — don't force it.

### Step 7b: Flag Content Angles (added 2026-04-26)

Parallel to skill candidates, the source may contain content angles — observations, tensions, or patterns worth expressing in your own voice (NOT skill instructions an agent runs, but writing material a human shapes into a post).

For each angle:
- **Hook:** one-line framing or observation
- **Claim:** one-line argument
- **Suggested format:** post / thread / long-form / carousel

All angles get written into the gobble file's `## Content Angles` section (per Step 4 template). They live with the source — traceable, scannable later by [[harvest]] and [[converge]].

**Standout angles** (you'd ship if briefed): *optionally* propose appending to `/me/ideas/_INBOX.md` with `Content Angle: [hook]` prefix and `Pattern: content-idea` tag. Per [[_RULES]] Section 2: confirmation required before any `_INBOX` write. Most angles stay in the gobble file; only standouts get promoted.

**If no content angles:** write "None — pure reference material" in the gobble file. Don't force angles where the source doesn't produce them.

**Why this exists:** strong content angles surface during gobble but get lost in narrative without structured capture. The Content Angles section is the destination; this step ensures it gets filled and standouts get optionally tracked.

### Depth Check: Extracting Patterns
A surface pass typically finds 1-2 candidates. Rich sources contain 5-15.

After the initial scan, ask four questions of the source:
1. **"Could an agent run this end-to-end?"** — If yes, there's a capability candidate. What are the inputs, steps, outputs?
2. **"How does this actually work?"** — If the source describes a mechanism (not just a result), there's a principle candidate underneath.
3. **"What goes wrong without this?"** — If the source names a failure mode and its fix, that's a principle candidate.
4. **"Where else does this apply?"** — If the answer crosses domains, it's a transferable principle. If it's domain-narrow but executable, it's a capability.

If you found fewer than 3 total candidates (capability + principle combined) from a deep or medium-depth source, do a second pass before finalizing.

### Depth Levels
- **Repo (deep):** Extract architecture decisions, design patterns, transferable principles. Read beyond the README — scan src/ structure, key files, config patterns.
- **Article (medium):** Extract core argument, mental models, the transferable insight stripped of the article's specific context.
- **Thread (shallow):** Extract the core insight and enough context to understand it later. Don't over-process short-form content.

---

## 4. REFERENCE MATERIAL

### Naming Conventions
- Repos: `[repo-name].md` (e.g., `autoresearch.md`)
- Articles: `[kebab-case-slug].md` (e.g., `anthropic-skill-building-guide.md`)
- Threads: `[author-topic-YYYY-MM-DD].md` (e.g., `karpathy-agents-2026-03-15.md`)

---

## 5. GOTCHAS

| # | Gotcha | What goes wrong | What to do instead |
|---|--------|-----------------|-------------------|
| 1 | Repo has no README | Can't assess purpose | Read src/ structure, infer from code and file names |
| 2 | Article behind paywall | Fetch fails silently | Note URL, ask user for paste |
| 3 | Inventing connections | Hallucinated backlinks pollute the graph | Only link projects where connection is explicit and articulable |
| 4 | Copying implementation details | Gobble file becomes a code dump | Extract the principle, not the code |
| 5 | Over-processing threads | Shallow content gets deep treatment, wastes time | Threads get shallow depth — one core insight, move on |
| 6 | X/Twitter requires JavaScript | WebFetch returns empty error page for x.com URLs. Threads, X Articles, and replies all fail. | Use `api.fxtwitter.com/{user}/status/{id}` instead — returns JSON with tweet text, author, metrics, and basic article summaries. For X Articles (longform), fxtwitter gets the title + summary but not the full body. If full body is needed, ask the user to paste the content. |
| 7 | X Article vs X Thread | X Articles (longform posts at `x.com/i/article/...`) look like threads but are behind a separate JS renderer. fxtwitter gets partial content. | Treat X Articles as article-depth (medium), not thread-depth (shallow). If fxtwitter summary is thin, note `[PARTIAL — full article requires user paste]` and ask. |

---

## 6. EXAMPLES

### Good output (repo gobble)
```markdown
# Autoresearch
---
type: repo
source_url: https://github.com/example/autoresearch
author: Example Author
date_gobbled: 2026-03-19
tags: [research, automation, agents, evaluation]
---

## What It Is
Autonomous research loop: propose → test → score → iterate.
Agents generate hypotheses, run experiments, and evolve based on results.

## Architectural Patterns
- Propose-test-score loop: hypothesis generation is separate from evaluation
- Autonomous iteration: no human in the loop per cycle, human sets rubric

## Transferable Principle
Any creative/generative process can be improved by separating generation
from evaluation and running multiple scored iterations autonomously.

## Connected Projects
[[project-a-context]] — could use this loop for skill A/B testing
[[project-b-context]] — signal evaluation could use scored iteration

## Skill Candidates
"Autonomous scored iteration" — pattern of generating N candidates,
scoring against a rubric, and promoting winners. Worth encoding as a
skill. → Create stub in /skills/inbox/autonomous-scored-iteration.md
```

### Bad output (anti-pattern)
```markdown
# Some Repo
Here is a summary of the repo. It has many files. The main.py file
imports several libraries including...
[NO structured format, NO transferable principle, NO project connections,
NO skill candidates — this is a dump, not a gobble]
```

---

## 9. QUICK REFERENCE

```
GOBBLE = one URL → one structured vault node
DETECT type from URL → FETCH content → GENERATE structured output → ROUTE to /reading/[type]/ → CONNECT to projects → FLAG skill candidates → FLAG content angles
Depth: repo=deep, playbook=deep, article=medium, video=medium, thread=shallow
NEVER invent connections — only link what's explicitly relevant
ALWAYS check for skill candidates AND content angles — note if none found
After gobble: suggest /skillify if skill candidates exist; surface standout content angles for optional _INBOX promotion
Read _RULES.md before routing
```

---

## Connected Files
- [[_RULES]] — vault constitution (read before routing)
- [[skillify]] — run after gobble when skill candidates found
- [[distill]] — sibling skill for non-URL content
- [[_TEMPLATE]] — standard this skill follows
- [[obsidian-strategy]] — architectural context
