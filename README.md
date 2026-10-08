# Knowledge Vault Template

> **An Intelligence Layer.** And the librarian that operates it.

You feed it; Claude does the filing. Every Claude session opened against the vault inherits your accumulated thinking — projects, voice, doctrines, reading, ideas — as native context. No uploading. No reminding. The vault *is* the context.

**The template ships empty.** Everything that matters comes from you, fed in over time, filed by the librarian.

---

## Quick start

**Claude desktop app (no terminal needed):**

1. On this page, click the green **Code** button → **Download ZIP**. Unzip it somewhere stable (Documents works) and rename the folder if you like, e.g. `my-vault`
2. Open the [Claude desktop app](https://claude.ai/download), switch to the **Code** tab and select that folder. The Code tab needs a paid Claude plan; Pro is enough
3. Type: *"Help me set up this knowledge vault."*

Claude reads `CLAUDE.md`, detects the fresh vault, and walks you through 6 steps in ~20-30 minutes. Have a folder of raw material ready (CV, writing, notes, decks, exported AI chats) and setup drafts your profile and voice from it. See Path A under [Setup details](#setup-details).

> Already added a Filesystem connector in a regular chat? No harm, but run the vault from the **Code** tab: it loads `CLAUDE.md` and the vault's rules automatically every session, which a regular chat does not.

**Via terminal (Claude Code):**

```bash
git clone https://github.com/gg-salo/knowledge-vault-template
cd knowledge-vault-template
claude
```

Then: `help me set this up`. Auto-detects the fresh vault — same destination, fewer keystrokes.

Optionally open the same folder in [Obsidian](https://obsidian.md) for the graph view and backlinks UI — but the vault is fully usable from Claude alone. **Obsidian is the reader. Claude is the librarian.**

---

## What it looks like in practice

A concrete example. You paste a URL:

```
gobble: https://example.com/an-interesting-article
```

Claude reads the article, scans your existing vault for connections, comes back with a routing plan:

> *I'll create `reading/articles/[slug].md` with the article's argument and transferable principle. Backlinks: `projects/project-x-context.md` (the architecture discussion overlaps) and `me/doctrine.md#the-review-gap` (the article reinforces it). I spotted 2 skill candidates — flagging them in the file, both score 4/4 on the worthiness rubric. Want me to skillify either one? Confirm the routing plan?*

You: `go`. Three files updated, 5 backlinks created, 2 skill candidates flagged for later. The article is now part of your graph — addressable to every future session, not a dead bookmark in a browser folder.

Multiply that by ~10 things you read per week, and after a month you've built a connected substrate that thinks alongside you instead of sitting inert.

### Why connections compound

Every substantive note carries a small **`abstraction:` block** in its frontmatter — concrete (what it specifically is), abstract (the underlying pattern, domain-agnostic), and optional fundamental (the deepest principle). Plus a `matches` field listing other domains where the abstract pattern appears.

This is what enables cross-domain surfacing. When you gobble a new article, the librarian doesn't just match keywords — it matches abstract patterns. A note on "swarm intelligence" surfaces when you ask about "parallel coding agents" because both carry the same abstract shape, even though their concrete subjects share no vocabulary.

On top of that, every backlink is **typed** (`powers`, `feeds`, `shares-dna`, `parallel-bet`, `supersedes`, `depends-on`...) — so the graph edges carry meaning. Traversal isn't just "what's nearby"; it's "what enables this," "what conflicts with this," "what was this derived from." Systematic serendipity, by design.

---

## What you get

The vault compounds. That's the whole point.

**Week 1:** A few project contexts, a handful of doctrine seeds, and maybe 5 gobbled sources. Useful but lightweight.

**Week 4:** You paste a PRD into `review PRD` and Claude cites four of your own doctrines, flags a conflict with an existing project, and surfaces three skill candidates. None of that advice was findable last month. Same methodology. Richer memory.

**Week 12:** You ask `cross-stack eval: [new idea]` and Claude tells you which existing project it compounds, which it duplicates, and which one it might kill. Your decisions get faster and more honest because the vault remembers everything you've committed to.

**Month 6:** The vault is a graph. Ideas connect across domains you didn't plan. A thread you gobbled in March surfaces in a post you write in August because the abstract pattern matched. Your content gets sharper because every draft pulls from real specifics across your entire body of work. **You stop re-deriving things.**

The value isn't in any single file. It's in the accumulated judgment becoming addressable — to Claude, to you, and to every future session.

**The specific failure this prevents:** designing the same thing twice. Having an idea, losing it, and re-having it three months later in a slightly different shape. The vault exists so that every piece of thinking you do becomes permanent capital instead of a disposable insight.

---

## How you use it day-to-day

Whichever way you open it (the desktop app's Code tab or `claude` in a terminal), every session you open against the vault has the entire substrate loaded as native context — your profile, your voice, your doctrines, every project, every gobbled source, every captured idea, every distilled conversation. You never upload, paste, or remind. The vault *is* the context.

**What this changes:**

- **Asking Claude's opinion on a new spec?** It already knows what you've built — current projects, architectural decisions, the doctrines that should apply.
- **Drafting a post?** Voice, recent reading, relevant doctrines, and prior published work are loaded by default.
- **Wondering if an idea is fresh or you've already had it?** The vault knows. Ask.
- **Reviewing a plan?** `review PRD: [paste]` and every suggestion cites a vault file. No generic advice.

The vault is your **context layer.** The model is interchangeable; what makes your conversations sharper than the same model from a blank chat window is the substrate it's reading from. Setup builds the substrate, the daily habit maintains it, and **every Claude session opened against the vault is where the actual work happens** — strategy, drafting, review, the decisions that compound.

If you ever find yourself opening a Claude.ai web tab to ask a question instead of opening your vault, that's the signal you've forgotten the unlock. Close the tab. Open the vault. Ask there.

---

## The daily habit

The vault only works if you use it. But the daily habit is tiny — **do not try to do everything at once.**

### Every day (2 minutes)

The whole system runs on this: **drop the raw thing, the librarian files it.** You never need to know where anything goes.

Whatever shows up in your day:

- **A URL you're reading** → `gobble: [URL]`
- **A loose thought** → `capture idea: [whatever just occurred to you]`
- **A conversation, transcript, or pasted block** → `distill this`
- **Something you just published** → `log published: [first line]`

Claude classifies, splits, routes, and connects. You see a routing plan, you confirm, done. No ritual, no context switching, no "where does this go?" decision. The vault gets denser; you keep moving.

### Every week (15 minutes)

```
weekly review
```

Claude walks you through: review skill candidates in `/skills/inbox/`, review ideas in `_INBOX.md`, log anything you published, check for stale TODOs. That's the whole maintenance cost.

### When you're doing work

Just ask. The power commands are in `CLAUDE.md` — you'll discover them as you need them:

| Command | What you'll use it for |
|---|---|
| `distill: [paste]` | File a conversation, meeting notes, or raw thinking into the vault |
| `skillify: [source]` | Turn a pattern you keep using into a reusable instruction |
| `review PRD: [paste]` | Review any plan against your entire vault of doctrines + project context |
| `sync context: [project]` | Update a stale project context against the real codebase |
| `develop ideas: [paste list]` | Cross-reference a stack of scattered ideas against your doctrines and reading. Surface the strongest with their connections. |
| `draft kickstart: [topic]` | Generate a web-chat-ready brief for a post — voice rules, doctrine connections, unexpected cross-refs |
| `adversarial review: [paste plan]` | Attack a plan before you commit — name the failure modes |
| `cross-stack eval: [paste idea]` | Does this new idea compound what exists, or add noise? |

**Don't memorize them.** Keep `CLAUDE.md` open when you need one. The habit to build is the daily loop. Everything else is a tool you reach for when you notice a need.

---

## What's in the box

If you want to look under the hood:

```
├── CLAUDE.md                ← operational bootstrap for Claude
├── SETUP.md                 ← guided first-run (you'll read this once)
├── _RULES.md                ← the vault constitution (governance + reasoning)
├── _SCHEMA.md               ← consolidated data-shape reference
├── AGENTS.md                ← agent-facing write authorization (root)
│
├── .claude/                 ← Claude Code config (shipped): SessionStart index-refresh hook
│
├── me/                      ← your identity, voice, doctrine, ideas, system patterns
├── projects/                ← one context file per active project
├── reading/                 ← ingested external sources
│   └── articles/  repos/  threads/  videos/  transcripts/  playbooks/  doctrines/
├── skills/                  ← portable agent instruction sets (inherit context)
│   ├── library/             ← 1 pre-validated skill: voice
│   └── inbox/               ← candidates awaiting validation
├── agents/                  ← sub-agent definitions (forked-context personas)
│   ├── library/             ← validated
│   └── inbox/               ← candidates
├── workflows/               ← vault-operating procedures (not portable)
│   ├── library/             ← gobble, distill, skillify, sync-context, vault-consistency-check
│   └── inbox/               ← review-prd, harvest, converge, brief, dream, setup-tooling
│
└── FEDERATION.md            ← OPTIONAL: connect your vault to others (ignore if solo)
```

Each top-level folder has its own `AGENTS.md` that overrides root rules within scope.

**Three-file governance.** `_RULES.md` is the constitution (what + why), `_SCHEMA.md` is the data dictionary (shapes, axes, naming), `AGENTS.md` is the agent write-authorization contract (what each folder allows).

**Seven shapes. One diagnostic.** Most note systems are a single bucket — everything is just a "note." This vault recognizes seven distinct shapes (skill, workflow, doctrine, vault-strategy, system-pattern, playbook, agent), each with its own home and lifecycle. The §6b diagnostic in `_RULES.md` routes any new piece of content to the right one. **This is what prevents the junk-drawer failure mode** most note systems collapse into.

**`library/` vs `inbox/`.** Same split everywhere it appears (skills, workflows, agents): new entries land in `/inbox/` first. Promotion to `/library/` requires real-usage validation plus at least one captured gotcha from actual failure. The split protects against the "looked good in theory, broke in practice" failure mode. Library = battle-tested. Inbox = candidates.

**Federation is optional.** The template prepares your vault to connect with others (a team, a DAO, a cohort) without shipping the implementation itself. Two structural conventions — every entry declaring its `type`, substantive entries carrying an `abstraction:` block — make your vault *mergeable-ready* whether or not you ever federate. The same conventions are good hygiene regardless. When you're ready to join a federation, the workflow ships with the hub you join. See `FEDERATION.md` for the full explanation.

---

## How the vault evolves

The starter structure is opinionated but not fixed. As you use it, you'll find places it doesn't cover. Two ways that happens:

**You tell Claude.** Spot friction — "I keep capturing X but it doesn't fit anywhere clean" — and say it. Claude proposes a new file, folder, or sub-category, you confirm.

**Claude tells you.** The **Vault Evolution Watch** (configured in `CLAUDE.md`) keeps the librarian actively scanning for structural signals. When 3+ items of the same flavor pile up in places that don't fit them well, Claude surfaces it as a question: *"You've captured 4 [thing] across [places]. Want me to propose a [new file/folder]?"* You decide. The watch uses your work-type answer from setup to bias toward evolutions that fit your domain.

**Adding a new top-level area is trivial.** Create a folder, add it to `_RULES.md` Section 1 (canonical locations), and start using it. A few common extensions:

| Area | What lives there |
|---|---|
| `/health/` | Doctrine-style notes on what you've learned works for your body, sleep, energy |
| `/relationships/` | Patterns observed in the important people in your life (with their consent) |
| `/finance/` | Your actual financial doctrine — what you'll invest in, what you won't, why |
| `/clients/` | Per-client context files, same pattern as projects |
| `/research/` | Longer-form research projects that outgrow a single gobble |
| `/teaching/` | If you teach or mentor — lesson patterns, student-specific notes |

**Rule of thumb:** a new folder is justified when the content type is *fundamentally different* from what exists — not when you just have a lot of one kind of thing within an existing folder. More projects = more files in `/projects/`, not a new folder. A new *kind* of thinking = a new folder.

**Don't add folders prophylactically.** Add them when you try to file something and realize it doesn't fit anywhere. That signal means the structure needs to grow. Until that signal appears, the existing structure is enough.

---

## Setup details

Setup is **6 steps, ~20-30 minutes** (often less if you bring material). Claude opens with two quick orientation questions:

**1. What kind of work do you do?** Engineering, content/writing, research, consulting, product, design, founder, or a mix. One or two lines. This shapes how Claude routes your material AND activates the **Vault Evolution Watch** (above).

**2. Bring material or start cold?**

**Path A (strongly recommended)** — give Claude a folder of any raw material you have lying around. CV, past writings, strategy docs, old notes, project briefs, drafts, memos, personality assessments, **exported LLM conversation history**. Folder of folders, nested chaos, mixed formats, garbage filenames — all fine. Claude scans recursively, classifies everything, and routes it across the vault *before* the guided questions. By the time you reach "who are you?", your profile is already drafted from your CV. By the voice step, voice is already extracted from real samples. **You review and refine instead of typing from memory.**

LLM exports especially are high-leverage: Claude.ai (Settings → Privacy → Export), ChatGPT (Settings → Data Controls → Export), Gemini ([takeout.google.com](https://takeout.google.com)). If you can't deal with the export UI, Claude will give you a harvest prompt to paste into your LLM instead — the output becomes a file in your folder. Same result.

**Cold start** works too if you have nothing on hand — Claude asks, you answer, Claude drafts, you confirm. Slower and thinner because you're working from memory instead of evidence. See `SETUP.md` for the full guided flow either way.

### The 6 steps

| Step | What happens |
|---|---|
| **1. Greet, orient, choose path** | The two questions above. ~2 min. |
| **2. Bulk Material Ingestion** *(Path A only)* | Claude scans, shows routing plan, writes everything across the vault with backlinks. Domain-aware via your work-type. |
| **3. Foundation** | Four files that anchor the rest: profile, voice, doctrine seeds, first project context. Fast confirmations of drafts (Path A) or conversational seeding (cold). |
| **4. Gobble active reading** | 3-5 current sources, structured and connected to your projects. |
| **5. How the vault grows with you** | Quick frame on evolution + introduction of the Vault Evolution Watch. |
| **6. Wrap up** | Daily habit, weekly maintenance, optional tooling install. |

### Optional: install the tooling layer

After personalizing, run **`set up vault tooling`** in Claude Code. It installs the retrieval stack that makes the vault fast and cheap to search at scale:

- **Obsidian CLI** — graph queries (backlinks, orphans, tags), 54× faster than grep
- **kepano/obsidian-skills** — teaches Claude correct Obsidian CLI syntax
- **QMD** — hybrid semantic search (BM25 + vector + reranker), 60-96% token savings, wired as an MCP server
- **SessionStart hook** (pre-shipped in `.claude/`) — refreshes the search index in the background every time you open a session

Idempotent and safe to re-run on a new machine. The vault works without it (Claude falls back to grep) — but on a vault of any size, the tooling pays for itself fast. See `workflows/inbox/setup-tooling.md`.

---

## Philosophy

Knowledge management isn't filing. It's the judgment harness. Intelligence isn't in the model — it's in the layer between you and the model that knows what you've already decided. Most "second brain" systems solve capture; few do the active surfacing. The vault is both: structured substrate that holds your judgment, plus workflows that surface the connections passive storage misses, plus an AI that reads it as native context every time you open a session. Every interesting thing you read, think, or decide produces structured, connected, reusable artifacts — not bookmarks, not scattered notes, not duplicate documents in three different apps. What you put in is your life. What you get out is compounding leverage.

The methodology is replicable. The accumulated intelligence isn't. **That's the moat.**

---

## Origin

Extracted from a mature personal vault used daily for knowledge work, strategy, and content production. The architecture — constitution, schema, agent-authorization hierarchy, seven-shape ontology, inbox → library promotion lifecycle, pre-validated skill and workflows — has been battle-tested through real use. The personal content is yours to build.

Issues, ideas, and contributions welcome via [GitHub](https://github.com/gg-salo/knowledge-vault-template) — or reach me on X at [@goncalo_pr_](https://x.com/goncalo_pr_).
