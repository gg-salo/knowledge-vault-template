---
name: distill
description: >
  Acts as vault librarian. Takes any raw text input (conversation export,
  notes, ideas, meeting summary) and routes it to the correct vault
  location with proper structure and backlinks. Use when given a block
  of raw text to organize. Triggers on: distill this, add this to vault,
  organize this conversation, file this. Do NOT use for URL-based sources
  (use gobble instead). This is the bridge between thinking and vault.
capabilities: [content-classification, vault-routing, backlink-generation, knowledge-organization]
outputs: routed vault entries across multiple locations with backlinks and source references
cost: medium
speed: 5-15 min depending on input size
requires: []
parallelizable: false
human_gate: true
metadata:
  version: 1.0.0
  type: process
  scope: personal
  projects: [all]
  status: validated
abstraction:
  concrete: "Classifies, splits, and routes raw text (conversations, notes, ideas) to canonical vault locations with proper backlinks and human confirmation"
  abstract: "Multi-target content triage with routing confirmation decomposing heterogeneous input into typed fragments and dispatching each to its canonical destination"
  fundamental: "Demultiplexing splitting a single mixed-signal input stream into multiple categorized output channels"
  matches: [mail sorting at a postal facility, ER triage in medicine, signal demultiplexing in telecommunications, newspaper editorial desk]
---

## 1. PURPOSE

**Prevents insights from dying when you close a tab.** Without this skill, interesting conversations, meeting notes, and raw thinking stay in their original format — unlinked, unrouted, invisible to future sessions. Distill classifies, splits, and routes each piece to its canonical vault location with proper backlinks.

**Why this exists:**
- Conversations like Claude.ai sessions contain multiple content types (project insights, skill candidates, content ideas, strategy decisions) jumbled together
- Dumping everything in one file recreates the scattered-notes problem inside the vault
- The routing decision is the hard part — classifying what goes where. Distill makes that explicit and confirmable.

---

## 2. WHEN TO USE / WHEN NOT TO USE

### Trigger conditions
- User pastes a conversation export and says "distill this"
- User says "add this to vault", "organize this", "file this"
- User has raw notes, meeting summary, or idea dump to process
- User says "I had an interesting conversation about X"

### Anti-triggers (do NOT apply when)
- Content is a URL to an external source (use [[gobble]] instead)
- User wants to edit an existing vault file (that's a direct edit)
- Content is a task or to-do item (those go in a task manager, not the vault)
- User is asking a question, not providing content to file
- User wants to sync a codebase against a context file (use `sync-context` instead)

### Related skills
- [[gobble]] — for URL-based external sources
- [[skillify]] — distill may trigger skillify when it identifies a skill candidate in the input

---

## 3. CORE INSTRUCTIONS

### Step 1: Read `_RULES.md`
Load `/_RULES.md` before making any routing decisions. The rules file defines canonical locations for every content type.

### Step 2: Read the Full Input
Read the entire raw input before classifying anything. Don't start routing after the first paragraph — context often changes meaning of earlier sections.

### Step 3: Classify Content Types
Scan the input and tag each section with a content type:

| Content Type | Destination | Action |
|-------------|------------|--------|
| Project insight | `/projects/[name]-context.md` | Append to existing file |
| New idea | `/me/ideas/_INBOX.md` | Append entry using inbox format |
| Content idea | `/me/ideas/_INBOX.md` | Append with [[content-plan]] link |
| Reading/research | `/reading/[type]/[slug].md` | Create new file |
| Skill candidate | `/skills/inbox/[name].md` | Run [[skillify]] rubric first |
| Doctrine entry | `/me/doctrine.md` | Append new entry (or add evidence to existing) |
| System pattern | `/me/system-patterns.md` | Append under relevant section |
| Strategy decision | `/me/obsidian-strategy.md` | Append to relevant section |
| Playbook (personal) | `/me/playbooks/[name].md` | Create new file using template at `/me/playbooks/_TEMPLATE.md` |
| Playbook (external) | `/reading/playbooks/[slug].md` | Create using playbook template with `source: external` |
| Vault rule/principle | `/_RULES.md` | Append to relevant section |
| Personal reflection | `/me/` appropriate file | Append or create |
| Action item | `/me/vault-todo.md` | Append to correct phase |
| Multiple types | Split and route each | Never dump in one place |

See [[_RULES#6b ONTOLOGY]] for the full 6-shape ontology.

**Skill candidate depth check:** After initial classification, re-scan the source asking: "How does this actually work?", "What goes wrong without it?", and "Where else does this apply?" If answers cross domains, flag as skill candidate. Rich sources often contain 5-15 patterns that a single pass misses.

### Step 4: Show Routing Plan — MANDATORY
Before writing any file, present the routing plan:

```
I'm going to route this conversation as follows:

1. Project insight about [project-a] → append to /projects/project-a-context.md
2. Skill candidate: "multi-perspective-convergence" → /skills/inbox/ (scores 4/4)
3. Content idea: "Scattered knowledge is dead capital" → /me/ideas/_INBOX.md
4. Strategy decision: typed relationships vocabulary → append to /me/obsidian-strategy.md
5. Vault rule: weekly review cadence → append to /_RULES.md

Confirm or redirect.
```

**Do not write files until the user confirms.** If the user redirects, adjust and re-present.

### Step 5: Write Files
For each routed piece:
- Use the canonical format for that location (inbox entry format, project context format, etc.)
- Add `[[backlinks]]` to every connected vault file
- Include a source reference: `> Source: [conversation/notes] distilled on [date]`
- If appending to an existing file, read the file first and merge intelligently — don't duplicate content that's already there
- Apply multi-abstraction note standard per [[_RULES]] Section 11: add `abstraction:` block or `## Abstraction Layers` section as appropriate for the note type

### Step 6: Handle Skill Candidates
If any content looks like a transferable pattern worth encoding:
- Run the [[skillify]] worthiness rubric inline (show scores)
- If 3+/4: generate a candidate in `/skills/inbox/`
- If under 3/4: note it in the routing plan as "identified but below threshold" — let user decide

### Step 7: Report What Was Written
After all files are written, show a summary:
```
Written:
- /projects/project-a-context.md (appended: orchestration insight)
- /skills/inbox/multi-perspective-convergence.md (new candidate, 4/4)
- /me/ideas/_INBOX.md (appended: 1 new idea)
- /me/obsidian-strategy.md (appended: relationship types)
- /_RULES.md (appended: weekly review)

New backlinks created: 7
```

---

## 4. REFERENCE MATERIAL

### Conversation-to-Vault Workflow (Most Common Use Case)
1. User exports conversation as markdown from Claude.ai or ChatGPT
2. (Optional but recommended) Asks the web assistant to produce a structured distillation first
3. Opens Claude Code session at vault root
4. Pastes content + says "distill this"
5. Distill classifies, splits, shows routing plan
6. User confirms or redirects
7. Files written with backlinks
8. Done — conversation is now structured vault entries

### Merge Rules (When Appending to Existing Files)
- Read the existing file first
- Don't duplicate content that already exists
- Add new content under the most relevant existing section
- If no relevant section exists, create one
- Preserve the existing file's formatting and structure

### Backlink Rules
- Every distilled piece must link to at least one other vault file
- Project insights link to the project + any skills mentioned
- Ideas link to projects and skills they connect to
- Skill candidates link to the source and applicable projects

### Meeting Transcripts (High-Yield Source Type)
Meeting transcripts (e.g., Fathom, Otter, Granola) are a high-yield source type that reliably spans multiple content categories in a single input. Beyond the standard classification pass, run these additional checks:

- **Check `journey.md` (if present)** — meetings often produce diary-worthy entries (reframes, surprises, operational learnings). Append if the meeting produced genuine insight, not just information.
- **Scan existing ideas for status updates** — meetings frequently deepen or validate ideas already in `_INBOX.md`. Update existing entries with new evidence and status changes, not just create new ideas.
- **Check doctrine entries for evidence enrichment** — meetings with collaborators often produce new evidence for existing doctrines (confidence changes, new projects that confirm/violate, operational deepening). Append evidence to existing entries rather than creating new ones.
- **Check existing project context sections for merge vs. new content** — meetings about active projects likely overlap with existing context. Read the file first, merge intelligently.

---

## 5. GOTCHAS

| # | Gotcha | What goes wrong | What to do instead |
|---|--------|-----------------|-------------------|
| 1 | Dumping whole conversation in one file | One giant unlinked node, recreates the scattered-notes problem | Always classify and split — one rich conversation = 6-8 entries across 4+ locations |
| 2 | Writing before confirming | Wrong routing is hard to undo, user loses trust | Show routing plan FIRST. Wait for confirmation. Non-negotiable. |
| 3 | Losing the thread | Insights separated from their reasoning | Keep source reference in each entry: `> Source: distilled from [description] on [date]` |
| 4 | Over-splitting | Every sentence becomes its own entry, creates noise | Group related content. A 3-paragraph project insight is one entry, not three. |
| 5 | Inventing content | Distill adds interpretations not in the source | Extract and organize only. Do not add new thinking. Flag ambiguity as `[TODO]` |
| 6 | Ignoring existing file content | Appends duplicate of what's already there | Read existing file first. Merge, don't repeat. |
| 7 | Content with dual homes | Same content could reasonably go in two places | Decide which file owns the depth and which gets a one-line summary + link. Never duplicate full content across two files. |

---

## 6. EXAMPLES

### Good distill routing plan
```
Input: 45-minute conversation about vault architecture

Routing plan:
1. 28 architectural decisions → /me/obsidian-strategy.md (append)
2. Phased action items → /me/vault-todo.md (merge with existing)
3. 3 skill specs (gobble, skillify, distill) → /skills/inbox/ (3 new files)
4. 16 content ideas → /me/ideas/_INBOX.md (append)
5. 9 vault rules/principles → /_RULES.md (append)

Confirm or redirect.
```

### Bad distill output (anti-pattern)
```
Saved the whole conversation to /me/conversation-2026-03-19.md

[This is a dump, not a distill. No classification, no splitting,
no routing, no backlinks. The vault gains one node instead of
distributed intelligence across 7 locations.]
```

---

## 9. QUICK REFERENCE

```
DISTILL = raw text → classify → split → show routing plan → confirm → write with backlinks
ALWAYS read _RULES.md first for canonical locations
ALWAYS show routing plan before writing — non-negotiable
NEVER dump everything in one file — classify and split
One conversation can produce 6-8 entries across 4+ locations — that's correct
Read existing files before appending — merge, don't duplicate
Skill candidates get worthiness rubric inline
Source reference in every entry: "> Source: distilled from [X] on [date]"
For URLs, use /gobble instead — distill is for raw text
Dual-home content: one file owns depth, other gets summary + link
```

---

## Connected Files
- [[_RULES]] — vault constitution (MUST read before routing)
- [[gobble]] — sibling skill for URL-based sources
- [[skillify]] — triggered when distill finds skill candidates
- [[obsidian-strategy]] — where strategy decisions get routed
- [[vault-todo]] — where action items get routed
- [[_INBOX]] — where ideas get routed
- [[content-plan]] — content ideas link to this
