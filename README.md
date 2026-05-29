# Knowledge Vault Template

> A personal **Intelligence Layer** — and the librarian that operates it. You feed it; Claude Code files, surfaces, and reads it as native context every session.

The vault is three things in one architecture: a substrate of plain markdown files, workflows that maintain it in the background, and AI that reads it as native context every session.

Adjacent to "second brain" tools but sharper. Most second brains solve capture and stop there. The Intelligence Layer also **actively surfaces** the connections passive storage misses — encodes your judgment so it survives your forgetting, loads your real history into every agent conversation.

The template is empty. Everything that makes it valuable — your voice, your doctrines, your projects, your reading, your accumulated judgment — gets added by you, through Claude Code, over time. The pattern: **give away the seed, keep the harvest.**

---

## What's in the box

```
├── CLAUDE.md                ← operational bootstrap for Claude Code
├── SETUP.md                 ← guided first-run (you'll read this once)
├── _RULES.md                ← the vault constitution (governance + reasoning)
├── _SCHEMA.md               ← consolidated data-shape reference
├── AGENTS.md                ← agent-facing write authorization (root)
│
├── .claude/                 ← Claude Code config (shipped): SessionStart index-refresh hook
│   ├── settings.json        ← hook wiring (project-level)
│   └── hooks/qmd-refresh.sh ← backgrounds qmd update+embed on session start
│
├── me/                      ← your identity, voice, doctrine, ideas, system patterns
│   └── AGENTS.md            ← Zone 1 rules (annotate only, never rewrite)
├── projects/                ← one context file per active project
│   └── AGENTS.md            ← Zone 2 rules (update in place with audit trail)
├── reading/                 ← ingested external sources
│   ├── AGENTS.md            ← Zone 3 input rules (immutable raw sources)
│   ├── _GOBBLE_TEMPLATE.md  ← capture template
│   ├── articles/  repos/  threads/  videos/  transcripts/  playbooks/  doctrines/
├── skills/                  ← portable agent instruction sets (inherit context)
│   ├── AGENTS.md            ← Worthiness Gate enforcement + composition_level rules
│   ├── _TEMPLATE.md         ← the standard for writing new skills
│   ├── library/             ← 1 pre-validated skill: voice
│   └── inbox/               ← skill candidates waiting for review
├── agents/                  ← sub-agent definitions (forked-context personas)
│   ├── AGENTS.md            ← fork-context vs inherit-context diagnostic + promotion gate
│   ├── _TEMPLATE.md         ← the standard for writing sub-agent definitions
│   ├── library/             ← validated sub-agent definitions
│   └── inbox/               ← sub-agent candidates waiting for review
├── workflows/               ← vault-operating procedures (not portable)
│   ├── AGENTS.md            ← vault-coupling rules + promotion gate
│   ├── library/             ← pre-validated workflows: gobble, distill, skillify, sync-context, vault-consistency-check
│   └── inbox/               ← workflow candidates: review-prd, harvest, converge, brief, dream, setup-tooling
│
└── FEDERATION.md            ← OPTIONAL: connect your vault to others (ignore if you run solo)
```

**Three-file governance.** `_RULES.md` is the constitution (what + why), `_SCHEMA.md` is the data dictionary (shapes, axes, naming), `AGENTS.md` is the agent write-authorization contract (what each folder allows). Each top-level folder has its own `AGENTS.md` overriding root rules within scope.

**Seven ontology shapes:** skill · workflow · doctrine · vault-strategy · system-pattern · playbook · agent. See `_RULES.md §6b` for the diagnostic that routes any new content to the right shape.

**Federation is optional.** The template prepares your vault to connect with others (a team, a DAO, a cohort) without shipping the implementation itself. Two structural conventions — every entry declaring its `type`, substantive entries carrying an `abstraction:` block — make your vault *mergeable-ready* whether or not you ever federate. The same conventions are good hygiene regardless. When you're ready to join a federation, the workflow ships with the hub you join. See `FEDERATION.md` for the full explanation.

---

## The 30-second setup

1. **Clone this repo** into a directory you'll open as an Obsidian vault.
2. **Open the directory in Claude Code** (`cd` into it, run `claude`).
3. **Type:** `help me set this up`

Claude will read `SETUP.md` and walk you through everything. Plan for ~30 minutes the first time.

### Optional but recommended: install the tooling layer

After personalizing, run **`set up vault tooling`** in Claude Code. It installs the retrieval stack that makes the vault fast and cheap to search at scale:

- **Obsidian CLI** — graph queries (backlinks, orphans, tags), 54× faster than grep
- **kepano/obsidian-skills** — teaches Claude correct Obsidian CLI syntax
- **QMD** — hybrid semantic search (BM25 + vector + reranker), 60-96% token savings, wired as an MCP server
- **SessionStart hook** (pre-shipped in `.claude/`) — refreshes the search index in the background every time you open a session

Idempotent and safe to re-run on a new machine. The vault works without it (Claude falls back to grep) — but on a vault of any size, the tooling pays for itself fast. See `workflows/inbox/setup-tooling.md`.

Optionally open the same folder in [Obsidian](https://obsidian.md) for the graph view and backlinks UI — but the vault is fully usable from Claude Code alone. Obsidian is the reader. Claude is the librarian.

---

## What the setup will ask you

Claude offers two paths through setup. Pick whichever fits what you have ready.

### Path A — Conversational

Claude asks you questions, you answer, Claude drafts files, you confirm. No prep required. About 30 minutes for the core.

### Path B — Bulk material first (dramatically faster if you have raw material)

If you already have stuff lying around on your machine — a CV, past writings you're proud of, old strategy docs, loose memos, drafts, project briefs, personality assessments, anything you've ever written about yourself or your work — **drop it all into a single folder first**. The folder can be completely chaotic. Unorganized. Mixed formats. Random filenames. Doesn't matter.

Then during setup, give Claude the path to that folder. Claude will:

1. Scan every file and classify it
2. Show you a full routing plan (what goes where and why)
3. Wait for your approval
4. Route everything into the vault with proper backlinks
5. Use what it learned to pre-draft the guided steps

By the time you reach the "who are you?" question, your profile is already drafted from the CV. By the voice step, voice is already extracted from your real writing. By the doctrine step, candidates are already surfaced from your strategy docs. You're reviewing and refining instead of typing from memory.

**This is the single biggest time-saver in the whole setup.** If you have even a small folder of raw material, Path B is worth the 5 minutes it takes to gather it.

You can also mix the two paths — bulk-ingest some things, talk through the rest.

---

### What setup populates, either way

Regardless of which path you pick, setup covers these essentials:

**1. Who you are.** A short profile — what you do, what you're building, what you care about. This becomes `me/profile.md`.

**2. Your voice.** How you write when you're at your best. Character, baseline, what you never do. This becomes `me/voice.md` and gets applied to every public-facing thing you ask Claude to draft. Don't overthink this — you'll refine it over time.

**3. Your doctrine seeds.** Principles you've observed repeatedly in your work. Not rules from books. Patterns *you* have evidence for. Start with 2-3. This becomes `me/doctrine.md`. New doctrines get added as you notice them.

**4. Your first project.** Pick one active project. Claude will create a context file for it using the example template as a guide. You'll probably end up with one per project eventually.

**5. Gobble your active reading.** If you have 3-5 repos, articles, or threads currently influencing your thinking, Claude can ingest them one by one. This is the fastest way to see the vault "click" — external sources get structured, connected to projects, and scanned for reusable patterns.

**6. (Optional, high-leverage) Distill your conversation history.** Another big unlock: take your past conversations with Claude.ai and ChatGPT and route them into the vault.

- Go to [Claude.ai](https://claude.ai/) → each conversation → copy as markdown. Or export all via Settings → Export Data.
- Go to [ChatGPT](https://chatgpt.com/) → Settings → Data Controls → Export Data.
- Before pasting raw transcripts into the vault: ask the web version of Claude or ChatGPT to **produce a distillable summary** of each conversation — what was discussed, what was decided, what patterns emerged, what open questions remain.
- Then paste those summaries into a Claude Code session at vault root and say: `distill this`.
- Claude will classify, split, and route the content across the vault in one pass. Months of thinking you couldn't find before suddenly become addressable.

This step is optional. Skip it and come back when you want the payoff.

---

## The daily habit (the whole thing)

The vault only works if you use it. But the daily habit is tiny — **do not try to do everything at once.**

### Every day (2 minutes)

The whole system runs on this: **drop the raw thing, the librarian files it.** You never need to know where anything goes.

Whatever shows up in your day:

- **A URL you're reading** → `gobble: [URL]`
- **A loose thought** → `capture idea: [whatever just occurred to you]`
- **A conversation, transcript, or pasted block** → `distill this`
- **Something you just published** → `log published: [first line]`

Claude classifies, splits, routes, and connects. You see a routing plan, you confirm, done. No ritual, no context switching, no "where does this go?" decision. The vault gets denser; you keep moving.

That's the entire daily loop.

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

## What this unlocks

The vault compounds. That's the whole point.

**Week 1:** You have a few project contexts, a handful of doctrine seeds, and maybe 5 gobbled sources. It feels useful but lightweight.

**Week 4:** You paste a PRD into `review PRD` and Claude cites four of your doctrines, flags a conflict with an existing project, and surfaces three skill candidates. None of that advice was findable last month — same methodology, richer memory.

**Week 12:** You ask `cross-stack eval: [new idea]` and Claude tells you which existing project it compounds, which it duplicates, and which one it might kill. Your decisions get faster and more honest because the vault remembers everything you've committed to.

**Month 6:** The vault is a graph. Ideas connect across domains you didn't plan. A thread you gobbled in March surfaces in a post you write in August because the abstract pattern matched. Your content gets sharper because every draft pulls from real specifics across your entire body of work. You stop re-deriving things.

The value isn't in any single file. It's in the accumulated judgment that becomes addressable — to Claude, to you, and to every future session.

**The specific failure this prevents:** designing the same thing twice. Having an idea, losing it, and re-having it three months later in a slightly different shape. The vault exists so that every piece of thinking you do becomes permanent capital instead of a disposable insight.

---

## How the vault evolves

The starter structure is opinionated but not fixed. As you use it, you'll find you need areas it doesn't cover. Add them.

**Adding a new top-level area is trivial.** Create a folder, add it to `_RULES.md` Section 1 (canonical locations), and start using it. A few common extensions:

| Area | What lives there |
|---|---|
| `/health/` | Doctrine-style notes on what you've learned works for your body, sleep, energy |
| `/relationships/` | Patterns observed in the important people in your life (with their consent) |
| `/finance/` | Your actual financial doctrine — what you'll invest in, what you won't, why |
| `/clients/` | Per-client context files, same pattern as projects |
| `/research/` | Longer-form research projects that outgrow a single gobble |
| `/teaching/` | If you teach or mentor — lesson patterns, student-specific notes |

**The rule of thumb:** a new folder is justified when the content type is *fundamentally different* from what exists — not when you just have a lot of one kind of thing within an existing folder. More projects = more files in `/projects/`, not a new folder. A new *kind* of thinking = a new folder.

**Don't add folders prophylactically.** Add them when you try to file something and realize it doesn't fit anywhere. That signal means the structure needs to grow. Until that signal appears, the existing structure is enough.

---

## Philosophy (in one paragraph)

Knowledge management isn't filing. It's the judgment harness. Intelligence isn't in the model — it's in the layer between you and the model that knows what you've already decided. Most "second brain" systems solve capture; few do the active surfacing. The vault is both: structured substrate that holds your judgment, plus workflows that surface the connections passive storage misses, plus an AI that reads it as native context every time you open a session. Every interesting thing you read, think, or decide produces structured, connected, reusable artifacts — not bookmarks, not scattered notes, not duplicate documents in three different apps. What you put in is your life. What you get out is compounding leverage.

The methodology is replicable. The accumulated intelligence isn't. **That's the moat.**

---

## Credits

This template is derived from a live, mature vault that has been used daily for knowledge work, strategic planning, and content production. The pre-validated skill (`voice`) and workflows (`gobble`, `skillify`, `distill`, `sync-context`, `vault-consistency-check`) along with the `_RULES.md` constitution + `_SCHEMA.md` reference + `AGENTS.md` hierarchy have been battle-tested — the architecture is proven. The personal content is yours to build.

Questions, improvements, or contributions welcome.
