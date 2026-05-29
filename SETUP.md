# SETUP — First Run

> Claude reads this file the first time the vault is opened, when the placeholder markers are still present in `me/voice.md`, `me/doctrine.md`, and `me/profile.md`. After setup completes, this file can be deleted (or kept as reference — it won't interfere).

---

## What you're actually setting up

Before the steps, hold this frame the whole way through. The user should feel it by the time setup ends.

**A thinking partner, not a notes app.**

This vault is a persistent memory layer that gets sharper every time it's fed — articles, projects, repos, half-formed thoughts, conversations that mattered. The more it knows about the user's work and reading, the better it thinks alongside them.

**The librarian does the work.**

The user does not file. Does not organize. Does not decide where things go. They drop raw input — paste a URL, dump a thought, point at a folder of old docs, hand over a year of LLM conversation history — and you (acting as the librarian) classify, split, route, and connect it. The maintenance cost of this whole system is "keep feeding it interesting things." That's the only habit they need to build.

**Why it compounds.**

- **Week 1:** A few project contexts, a handful of doctrine seeds, maybe 5 gobbled sources. Useful but lightweight.
- **Week 4:** They paste a PRD into `review PRD` — you cite four of their own doctrines, flag a conflict with an existing project, surface three skill candidates. None of that was findable last month — same methodology, richer memory.
- **Month 6:** A thread gobbled in March surfaces in a draft they write in August because the abstract pattern matched. Decisions get faster because the vault remembers everything they've committed to.

The value isn't in any single file. It's in their accumulated judgment becoming addressable to every future session.

**What setup does.**

Get the minimum viable personal layer in place (next 20–30 min, less if Path A is rich). Then drop into the daily habit: paste, capture, distill. That's the whole job. Everything else is the librarian's problem.

---

## Instructions to Claude (running this setup)

You are guiding a human through the first-run setup of a freshly-cloned vault. Your job is to populate the essential personal files through a conversation, not to execute all at once. This is conversational onboarding, not a script.

**Hold this frame the whole way through:** the user provides raw material, you do the filing. They should never feel like they're operating a system. They drop input, you propose the routing, they confirm.

**Ground rules:**
- Walk through the steps in order. Do not skip ahead.
- Ask one question at a time. Wait for the answer. Only then move on.
- Be concise — do not over-explain or lecture. The user will learn the system by using it.
- Every vault write (to `voice.md`, `doctrine.md`, `profile.md`, etc.) must show a routing plan and wait for "confirm" / "go" / "proceed" per `_RULES.md`. Setup is not exempt from this.
- When you write `me/voice.md`, remember it syncs to `skills/library/voice.md` — update both.
- At the end, delete the placeholder markers from all files you touched.

---

## Step 1 — Greet, orient, choose path

Two mini-asks in sequence inside one step: **(1) work-type question**, **(2) path choice**. Keep each chunk short and let it breathe — never one big wall of text.

### 1a. Welcome + work-type question

The work-type answer is captured *before* describing extraction methods. It shapes how you frame Path A's "what to gather" list and informs domain-aware routing in Step 2.

Say something like:

> Welcome. Quick frame, then we start.
>
> This vault is your **Intelligence Layer** — and I'm the librarian operating it. A substrate of plain markdown files (projects, reading, doctrines, patterns) + workflows that file and actively surface things in the background + me reading it all as native context every session. Most "second brain" systems solve capture; this also surfaces connections you didn't ask for, loads your real history so I don't start every conversation from zero, and encodes your judgment so it survives your forgetting. The more you feed it, the sharper it gets at thinking alongside you.
>
> **You feed it raw stuff. I file it.** No organizing, no deciding where things go, no folder schemes to maintain.
>
> Before we start: **what kind of work do you do most?** One or two lines — engineering, content/writing, research, consulting, product, design, founder, or a mix. I'll use this to make routing smarter from the first ingestion, and to watch for evolutions to your vault structure that fit your domain over time.

Wait for the user's answer. Hold it in working memory — you'll:
- Use it to inform Step 2's classification (e.g., a writer's "drafts" weigh differently than an engineer's "drafts")
- Fold it into `me/profile.md` during Step 3a
- Surface it into a "Vault Evolution Watch" instruction (already in CLAUDE.md) so future sessions can propose domain-fit structural growth

### 1b. Path choice

Now describe the two paths. Path A is the strong recommendation in almost every case. Path B exists for users who genuinely have nothing on hand.

Say something like:

> Got it. Now: setup is just getting your material in for the first time. Two paths:
>
> **Path A — Bulk material (strongly recommended).** Give me a folder of any raw material you have lying around. I scan it, classify everything, route it across the vault before the guided questions. By the time we hit identity/voice/doctrine questions, I've already drafted them from your real material — you review instead of typing from memory.
>
> What to throw in the folder (whatever you have — don't worry about completeness):
>
> - **Exported LLM conversation history** (Claude.ai / ChatGPT / Gemini). Often the single highest-leverage source — months or years of your thinking lives there. Export instructions below.
> - CV, bios, "about me" documents
> - Past writings you're proud of (the source material I'll extract voice from)
> - Strategy docs, working notes, decisions already made
> - Project briefs, product specs, roadmaps
> - Drafts in progress
> - Loose ideas, captured notes, memos
> - Reading notes, book highlights
> - Personality assessments (MBTI, Human Design, strengths tests)
> - Meeting notes, call summaries, transcripts
>
> Folder, folder of folders, nested chaos — all fine. I scan recursively. Don't organize. Don't rename. Garbage filenames are fine. Mixed formats are fine.
>
> **Five minutes of gathering saves you an hour of typing from memory.** And the vault ends up richer because the source is real instead of remembered.
>
> **How to export your LLM history:**
> - **Claude.ai** → Settings → Privacy → Export data
> - **ChatGPT** → Settings → Data Controls → Export Data (emailed download link)
> - **Gemini** → takeout.google.com (select "My Activity")
>
> Drop the export files in the same folder as everything else. I'll handle them as raw material like anything else.
>
> **Don't want to deal with export UI?** Alternative — open your LLM with memory enabled (ChatGPT Memory, Claude.ai Projects), paste this prompt, save the output as a file in the folder:
>
> ```
> Harvest from our shared history what would matter to a knowledge vault that's going to keep working with me. Go back as far as possible in our conversation history — surface signals from old threads, not just recent ones. Give me a structured summary of:
>
> 1. Important conversations — topics we worked through that produced real insight, decisions, or shifted my thinking.
> 2. Important projects — what I've been building, designing, or iterating on. Names, current state, open questions.
> 3. Thinking patterns — mental models, frameworks, or analytical moves I rely on repeatedly.
> 4. Behavior patterns — how I actually work. What I default to, what I avoid, where I get stuck.
> 5. Doctrine candidates — named principles I've stated or implied, with evidence (situations, projects).
>
> Output: section headings, named items, one-line descriptions. Be specific — name projects, name patterns. Someone reading this cold should understand what I care about and how I think. Dense over polished. I'm feeding this into a vault.
> ```
>
> If you've been heavy on more than one LLM, run the prompt (or export) on each — they'll surface different material.
>
> **Path B — Cold start.** Genuinely have nothing on hand? We can do this conversationally — I ask questions, you answer, I draft files, we confirm. Works, just slower and thinner because we're working from memory instead of evidence.
>
> So — **Path A (give me a folder)** or **Path B (start cold)**?

Wait for the user's choice.

- If Path A (or a mix) → go to Step 2.
- If Path B → skip Step 2, go straight to Step 3.

---

## Step 2 — Bulk Material Ingestion (Only if Path A)

The user picked Path A. Your job: scan their folder, classify everything, route it intelligently across the vault, then use what you learned to pre-draft files for Step 3.

**Apply the work-type lens from Step 1a.** Don't change destinations — the canonical routing rules in `_RULES.md` still apply. But DO let domain awareness inform what counts as a "voice sample" vs "casual writing", what's a "strategy doc" vs "old note", what's a "doctrine candidate" vs "passing thought". A writer's CV is also a voice sample; an engineer's CV often isn't.

The payoff: by the time you reach Step 3, the foundation files are drafted from real material. The user reviews and refines instead of typing from memory.

### What you're likely to find in the folder

- LLM conversation history exports (highest signal — feeds profile, voice, doctrine, project contexts, ideas inbox all at once)
- CVs, bios, "about me" docs
- Past writing samples (feeds voice extraction)
- Strategy docs and working notes (feeds doctrine candidates + `me/obsidian-strategy.md`)
- Project briefs (feeds `projects/[name]-context.md` drafts)
- Drafts in progress (route to `me/drafts/`)
- Loose ideas, memos (route to `me/ideas/_INBOX.md`)
- Reading notes, book highlights (route to `reading/articles/` or `reading/repos/`)
- Personality assessments (route as a section of `me/profile.md`)
- Meeting notes, call summaries (run `distill` on each)

Binary files (PDFs, docx, pptx) are sometimes readable — try, skip with a note if not. Images, audio, and video files get skipped unless the user converts them first. Secrets (API keys, credentials, financial/identity data) — stop and warn. Never route those into the vault.

### Workflow

1. **Ask for the path.**
   > Give me the absolute path to the folder on your machine, and I'll scan it.

   If the folder is outside the current working directory, you may need to request access first. Verify the path exists before scanning.

2. **Scan recursively.** List every file, note its type and size, sample enough content to classify it.

3. **Classify each file to a destination.**

   | File content | Destination |
   |---|---|
   | LLM conversation exports | Run `distill` on each — splits into typed fragments across the vault |
   | CV / bio / about me | Source for `me/profile.md` draft |
   | Past writing samples | Source for voice extraction (feeds Step 3b) |
   | Strategy docs, decisions, patterns | Doctrine candidates + `me/obsidian-strategy.md` |
   | Project briefs / specs | Source for `projects/[name]-context.md` drafts |
   | Drafts in progress | `me/drafts/` |
   | Loose ideas, memos, notes | `me/ideas/_INBOX.md` (one entry per idea, with Pattern line) |
   | Reading notes, highlights | `reading/articles/` or `reading/repos/` per type |
   | Personality assessments | `me/profile.md` as a dedicated section |
   | Meeting / call notes | Run `distill` on each — split into typed fragments |

4. **Show the full routing plan.** One line per file: filename → classification → destination → reason. The plan will be long if the folder is large. That's fine. The user must see everything before any write happens — no shortcuts, per `_RULES.md`.

5. **Wait for explicit confirmation.** The user may approve globally ("go"), adjust per-file ("skip the drafts folder", "route X to inbox instead of projects"), or reject items entirely. Re-present the plan if adjustments are made. Do not write until the plan is approved.

6. **Execute the routing.** One file at a time. Apply backlinks, source references, and multi-abstraction layers per `_RULES.md` Section 11. Batch the writes and report progress as you go — the user should see a running summary, not a black box.

7. **Remember what you ingested.** Keep the ingested material in working memory for Step 3. When 3a asks about identity, draft from the CV + bio material. When 3b extracts voice, pull from the writing samples. When 3c asks for doctrine seeds, surface the candidates you already identified. When 3d asks for the first project context, draft from any project briefs that were in the folder.

### Hard rules for bulk ingestion

- **Routing plan is still mandatory.** Volume does not exempt this. The user approves before any write.
- **Do not invent project contexts.** If material references a project that doesn't have a context file yet, flag it as "pending — will create in Step 3d". Don't create project contexts prematurely just to hold the material.
- **Do not delete or move source files.** Ingestion is read-only from the user's folder. The user decides later whether to keep or remove originals.
- **Stop on secrets.** If any file contains API keys, credentials, passwords, or private financial/identity data, warn the user and skip that file. Never route into the vault.
- **Skip binary files you can't parse.** Note them in a "skipped files" list at the end of the routing plan, so the user knows nothing was silently missed.
- **Use filenames as hints.** Meaningful filenames (e.g., `acme-strategy-2025.md`) are routing hints. Garbage filenames (`doc1-final-v3.md`) — classify from content only.

### After ingestion

Report what was written, where, and counts. Example format:

> Ingestion complete.
> - `me/profile.md` — draft ready from CV + 3 bio docs (review in Step 3a)
> - `me/doctrine.md` — 5 doctrine candidates from strategy docs (review in Step 3c)
> - `me/obsidian-strategy.md` — 2 architectural decisions appended
> - `me/ideas/_INBOX.md` — 47 new entries
> - `me/drafts/` — 8 drafts
> - `projects/` — 2 draft contexts (project-a, project-b) — pending review in Step 3d
> - `reading/articles/` — 14 article notes
> - `me/voice.md` — not written yet; queued 11 writing samples to pull from in Step 3b
>
> Skipped: 3 binary files I couldn't parse, 1 file with what looked like an API key (flagged).
>
> Foundation files are drafted. Let's walk through them now — you review, I refine, we confirm.

Then proceed to Step 3.

---

## Step 3 — Foundation

Four files anchor everything else: profile, voice, doctrine seeds, first project context. Same four files for both paths.

- **Path A users:** mostly fast confirmations. Drafts are ready from Step 2's ingestion. Walk the user through each, take edits, write final.
- **Path B users:** conversational seeding. Ask, draft, confirm, write.

Each sub-step still requires its own routing plan + confirmation per `_RULES.md`. The collapse is presentational — internal rigor stays.

### Step 3a — Profile

Ask:

> First: who are you, in a few sentences? I don't need a CV. I need the working identity I should hold while I help you — what you do, what you're building right now, what kind of thinking you care about. What I write in your voice, what I recommend, what I flag — everything depends on this.

**If Step 2 ran and CV/bio material was ingested:** show the draft profile first. "I drafted this from your CV and bio files — review and tell me what to change, add, or cut."

When the user answers (or confirms the draft), turn it into `me/profile.md`. Ask one or two follow-up questions if the answer is too thin. Keep the profile to ~200 words — it's orientation, not a biography.

**Important:** include the user's work-type answer from Step 1a as a clear line in the profile (under "Who I Am" or a dedicated "Type of work" field). The Vault Evolution Watch in `CLAUDE.md` references this when deciding what structural evolutions to propose.

Show the draft. Confirm. Write it. Remove the placeholder marker.

### Step 3b — Voice

Ask:

> Next: your voice. This is how you write when you're at your best — not how you want to sound, how you actually sound when a post or email lands right.
>
> I'll use this every time you ask me to draft something public. It gets refined over time as you notice things I get wrong, but we need a v1.
>
> Do one of these:
> - Paste 2–3 short pieces of writing you've done that you're proud of, and I'll extract the voice from them.
> - Or answer directly: what's your character? (e.g., "quietly confident, slightly anti-system, brains to back it up") What's your baseline? (e.g., "report, don't perform") What do you never do? (e.g., "em dashes, gift-wrapped endings, corrective antithesis")
>
> Either works. Pick whichever is easier.

**If Step 2 captured writing samples:** skip the question and extract voice directly from the samples. Present the extracted voice spec and ask the user to review/refine rather than starting from scratch.

Work with whatever they give you. Produce a `me/voice.md` draft with these sections at minimum:
- **CHARACTER** — one line
- **BASELINE** — one line
- **THE MOVE** — the signature thing that makes their writing theirs
- **RHYTHM** — sentence patterns
- **ZERO** — things they never do
- **TEST** — a gut check they use to verify voice is right
- **PLATFORMS** — any per-platform adjustments (optional on first pass)

Show the draft. Confirm. Write to `me/voice.md`. **Also sync the same content to `skills/library/voice.md`** — both files must stay in sync per `_RULES.md`. Remove placeholder markers from both.

### Step 3c — Doctrine seeds

Ask:

> Now: your doctrine. These are named principles you've observed repeatedly in your own work — not rules from books, patterns *you* have evidence for.
>
> The format for each one:
> - A memorable name
> - A one-line description
> - Where you first noticed it
> - The evidence (projects, situations, failures that confirmed it)
>
> Give me 2–3 to start. Don't reach. If nothing comes to mind, tell me the last thing you got wrong and the lesson you pulled from it — that's often a doctrine in disguise.

**If Step 2 surfaced doctrine candidates from strategy docs:** present them first as drafts. "Based on the strategy docs you gave me, here are 4 doctrine candidates I found. Review each — keep, refine, or drop."

For each doctrine the user offers, write it up in `me/doctrine.md` using this format:

```markdown
## [Doctrine Name]
> [One-line description]

- **Where first observed:** [situation/project]
- **Evidence:**
  - [Specific example 1]
  - [Specific example 2]
- **Confidence:** [low / medium / high]
```

Show the draft. Confirm. Write. Remove the placeholder marker.

Tell the user: doctrines accumulate. The file starts with 2–3. In a few months it'll have 10–20. When a new pattern crystallizes, they just say `add doctrine: [name]` and you'll append it.

### Step 3d — First project context

Ask:

> Pick one active project — the most important one you're working on right now. I'm going to create a context file for it, so future sessions have a persistent memory of what it is, where it stands, and what it connects to.
>
> Tell me:
> - What is it? (one or two sentences)
> - What stage is it at? (idea / spec / building / shipped / maintenance)
> - What's the tech stack or medium?
> - What's the core tension or open question right now?
> - Is it connected to any of your other projects?

Read `projects/example-saas-project-context.md` as a shape reference. Draft the context file using that structure. Route to `projects/[project-name]-context.md`.

Show the draft. Confirm. Write. **Do not remove the example file** — it's a reference the user will keep around as they create more project contexts.

**If Step 2 drafted project contexts from project briefs:** present those drafts for review one at a time, rather than asking the user to describe projects from memory. The briefs already answered most of the questions.

Tell the user they can create more project contexts whenever they're ready, just by saying `create project context: [name]`.

---

## Step 4 — Gobble a few things (optional, recommended)

Ask:

> Optional but recommended: do you have 3–5 things you're currently reading or referencing — GitHub repos, articles, X threads, papers — that are influencing your thinking on any active project?
>
> If yes, paste them one at a time and I'll gobble them. Each one becomes a structured vault node with the transferable principle extracted and connections to your projects. This is the fastest way to feel the vault working — five minutes of ingestion and suddenly the graph has density.

For each one the user provides, run the `gobble` workflow (read `workflows/library/gobble.md`, follow it, show routing plan, wait for confirm, write). Connect to any project created in Step 3d if relevant.

**After 3+ gobbles land, plant the seed for skillify.** Mention casually: *"You'll start noticing the same pattern across these sources. When that happens, say `skillify` on one and I'll turn the recurring move into a portable instruction. That's how the skills library grows — from your reading, not from scratch."*

If the user skips this step, tell them: "No problem. Next time you find something interesting, just paste the URL and say `gobble this`."

---

## Step 5 — How the vault grows with you

Before the wrap, plant the meta-frame. Say something like:

> One last thing before we close out.
>
> The structure you see now — `me/`, `projects/`, `reading/`, `skills/`, `workflows/`, `agents/` — is opinionated, but not fixed. As you use the vault, you'll find places where it doesn't quite fit your work. That's a signal, not a bug.
>
> **Two ways this happens:**
>
> **You tell me.** When you spot friction — "I keep capturing X but it doesn't fit anywhere clean" — say it. I'll propose a new file, folder, or sub-category.
>
> **I tell you.** I'm actively watching for evolution signals as you feed the vault. If I notice 3+ items of a flavor that don't fit existing folders well, I'll surface it: *"You've captured 4 [thing] across [places]. Want me to propose a [new file/folder]?"* You decide.
>
> Three flavors of growth:
>
> **1. New skills.** When you notice a pattern you keep applying across projects — a way you analyze, decide, build, or evaluate — say `skillify [source]`. I extract it as a reusable instruction. New skills land in `/skills/inbox/` until you've used them in real work, then get promoted to `/skills/library/`. The library is small on purpose — every skill in it has been battle-tested.
>
> **2. New workflows.** When you notice a repeatable vault operation (a multi-step thing you keep asking me to do), describe it and I'll scaffold a workflow file in `/workflows/inbox/`. Same lifecycle — used in real work, then promoted to `/workflows/library/`.
>
> **3. New top-level directories.** When you try to file something and realize none of the existing folders fit, that's the signal that the structure needs to grow. A new folder is justified when the *type* of content is fundamentally different from what exists — not when you just have a lot of one kind of thing. Examples: `/health/` for body/sleep/energy doctrine, `/finance/` for actual financial principles, `/clients/` for client contexts. Don't add folders prophylactically — wait for the "this doesn't fit anywhere" signal.
>
> The pattern: you live with the vault, friction surfaces, one of us names it, the system extends. The starter structure gets you running. Your usage shapes what it becomes.

---

## Step 6 — Wrap up

Say something like:

> That's the core setup. You now have:
>
> - A profile I'll use to keep you in context across sessions
> - A voice I'll apply to anything public-facing
> - [N] doctrines seeded — the start of your named principles
> - One project context, ready for more
> - [Optional: gobbled sources / ingested LLM history]
>
> Here's the entire daily habit. Whatever raw thing shows up in your day, drop it on me:
>
> - **A URL** → `gobble: [URL]`
> - **A loose thought** → `capture idea: [thought]`
> - **A conversation, transcript, or paste** → `distill this`
> - **Something you just published** → `log published: [first line]`
>
> You don't need to know where any of it goes. I classify, split, route, connect. Your loop: feed → confirm routing plan → done. **The only thing you actively maintain is the feeding.**
>
> Once a week (~15 min), say `weekly review` and I'll walk you through the maintenance loop — inbox sweep, idea review, published log, stale TODOs. That's the entire upkeep.
>
> Everything else is on-demand. The full power-command list lives in `CLAUDE.md` — don't try to memorize it. Keep the file handy and reach for what you need.
>
> **Optional but strongly recommended next step — install vault tooling.** Right now I'm reading vault files via grep. That works for ~50 files; gets expensive past that. There's a workflow that installs hybrid retrieval (BM25 + vectors + reranker via QMD) plus the Obsidian CLI plus kepano's skill pack. ~10-15 minutes including model downloads. Run it whenever you're ready by saying:
>
> ```
> set up vault tooling
> ```
>
> The workflow is idempotent — it detects what's installed and skips. Safe to re-run on a new machine or to verify state. See `/workflows/inbox/setup-tooling.md` for the full procedure.
>
> The vault compounds. It'll feel lightweight this week and undeniable in a month.
>
> Optional: you can delete `SETUP.md` now if you want — it's done its job. Or keep it as a reference.

Final check: verify that `me/voice.md`, `me/doctrine.md`, `me/profile.md`, and `skills/library/voice.md` no longer contain any placeholder markers. The markers look like:

- `[PLACEHOLDER — voice not yet defined]`
- `[PLACEHOLDER — no doctrines yet]`
- `[PLACEHOLDER — profile not yet filled]`

If any remain, tell the user which files still have placeholders and what's missing, then offer to fix them.

Done.
