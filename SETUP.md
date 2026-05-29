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

Get the minimum viable personal layer in place (next 30 min). Then drop into the daily habit: paste, capture, distill. That's the whole job. Everything else is the librarian's problem.

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

## Step 1 — Greet and orient

Keep it short and let it breathe. Use short paragraphs with line breaks — never one big wall of text. Lead with the pattern (you feed, I file), recommend the folder path, mention the LLM harvest option, ask the question.

Say something like:

> Welcome. Quick frame, then we start.
>
> This vault is your **Intelligence Layer** — and I'm the librarian operating it. Three things at once: a substrate of plain markdown files (your projects, reading, doctrines, patterns), workflows that file and actively surface things in the background, and me reading it all as native context every session. Most "second brain" systems solve capture; the Intelligence Layer also surfaces connections you didn't ask for, loads your real history so I don't start every conversation from zero, and encodes your judgment so it survives your forgetting. The more you feed it, the sharper it gets at thinking alongside you.
>
> **You feed it raw stuff. I file it.** No organizing, no deciding where things go, no folder schemes to maintain.
>
> Setup is just getting your material in for the first time.
>
> **The fastest way by far: grab a folder of whatever you have lying around.** CV, old strategy docs, drafts, project briefs, memos, personality assessments — anything you've ever written about yourself or your work.
>
> A single folder, a folder of folders, nested chaos — all fine. I scan recursively. Don't organize anything. Don't rename. Garbage filenames are fine. Mixed formats are fine.
>
> Five minutes of grabbing files saves you an hour of typing from memory.
>
> One special source worth flagging: **your past Claude / ChatGPT / Gemini conversations.** Months of your thinking probably live there. You can include exported history in the folder, or skip it for now — there's a dedicated step coming where I'll give you a prompt to harvest your LLM history directly.
>
> So — got stuff to throw in a folder? Or should we start cold (I ask, you answer)?

Wait for the user's answer.

- If they have a folder (or want to gather one), go to Step 2.
- If they want to start cold, skip Step 2 and go straight to Step 3.

---

## Step 2 — Bulk Material Ingestion (Only if the User Chose Path B)

The user has (or is about to prepare) a folder of raw material they want ingested before the guided steps. Your job is to scan it, classify each file, route everything to the right places in the vault, and then use what you learned to pre-draft the files the later steps will ask about.

The payoff: by the time you reach Step 3, the profile is already drafted from the CV. By Step 4, voice can be extracted from real writing samples instead of asked-for-from-memory descriptions. By Step 5, doctrine candidates are already surfaced from strategy docs. The user reviews and refines rather than typing everything from scratch.

### What typically belongs in the folder

The folder is allowed to be chaotic. Typical contents worth ingesting:

- **LLM conversation history exports** (Claude.ai, ChatGPT, Gemini — see Step 8 for export instructions and the harvest prompt)
- CVs, bios, "about me" documents
- Past writings, essays, blog posts, drafts (source material for voice extraction)
- Strategy docs, working notes, decisions already made
- Project briefs, product specs, roadmaps
- Drafts in progress
- Loose ideas, captured notes, memos
- Reading notes, book highlights
- Personality assessments (MBTI, Human Design, strengths tests, etc.)
- Meeting notes, call summaries, transcripts

Binary files (PDFs, docx, pptx) are sometimes readable — try, and skip with a note if they're not. Images, audio, and video files get skipped unless the user converts them first. Secrets (API keys, credentials, financial/identity data) — stop and warn. Never route those into the vault.

### Workflow

1. **Ask for the path.**
   > Give me the absolute path to the folder on your machine, and I'll scan it.

   If the folder is outside the current working directory, you may need to request access first. Verify the path exists before scanning.

2. **Scan recursively.** List every file, note its type and size, sample enough content to classify it.

3. **Classify each file to a destination.**

   | File content | Destination |
   |---|---|
   | CV / bio / about me | Source for `me/profile.md` draft |
   | Past writing samples | Source for voice extraction (feeds Step 4) |
   | Strategy docs, decisions, patterns | Doctrine candidates + `me/obsidian-strategy.md` |
   | Project briefs / specs | Source for `projects/[name]-context.md` drafts |
   | Drafts in progress | `me/drafts/` |
   | Loose ideas, memos, notes | `me/ideas/_INBOX.md` (one entry per idea, with Pattern line) |
   | Reading notes, highlights | `reading/articles/` or `reading/repos/` per type |
   | Personality assessments | `me/profile.md` as a dedicated section |
   | Meeting / call notes | Run `distill` on each — split into typed fragments |
   | LLM conversation exports | Run `distill` on each — split into typed fragments across the vault |

4. **Show the full routing plan.** One line per file: filename → classification → destination → reason. The plan will be long if the folder is large. That's fine. The user must see everything before any write happens — no shortcuts, per `_RULES.md`.

5. **Wait for explicit confirmation.** The user may approve globally ("go"), adjust per-file ("skip the drafts folder", "route X to inbox instead of projects"), or reject items entirely. Re-present the plan if adjustments are made. Do not write until the plan is approved.

6. **Execute the routing.** One file at a time. Apply backlinks, source references, and multi-abstraction layers per `_RULES.md` Section 11. Batch the writes and report progress as you go — the user should see a running summary, not a black box.

7. **Remember what you ingested.** Keep the ingested material in working memory for the subsequent guided steps. When Step 3 asks about identity, draft from the CV + bio material. When Step 4 extracts voice, pull from the writing samples. When Step 5 asks for doctrine seeds, surface the candidates you already identified. When Step 6 asks for the first project context, draft it from any project briefs that were in the folder.

### Hard rules for bulk ingestion

- **Routing plan is still mandatory.** Volume does not exempt this. The user approves before any write.
- **Do not invent project contexts.** If material references a project that doesn't have a context file yet, flag it as "pending — will create in Step 6". Don't create project contexts prematurely just to hold the material.
- **Do not delete or move source files.** Ingestion is read-only from the user's folder. The user decides later whether to keep or remove originals.
- **Stop on secrets.** If any file contains API keys, credentials, passwords, or private financial/identity data, warn the user and skip that file. Never route into the vault.
- **Skip binary files you can't parse.** Note them in a "skipped files" list at the end of the routing plan, so the user knows nothing was silently missed.
- **Use filenames as hints.** Meaningful filenames (e.g., `acme-strategy-2025.md`) are routing hints. Garbage filenames (`doc1-final-v3.md`) — classify from content only.

### After ingestion

Report what was written, where, and counts. Example format:

> Ingestion complete.
> - `me/profile.md` — draft ready from CV + 3 bio docs (review in Step 3)
> - `me/doctrine.md` — 5 doctrine candidates from strategy docs (review in Step 5)
> - `me/obsidian-strategy.md` — 2 architectural decisions appended
> - `me/ideas/_INBOX.md` — 47 new entries
> - `me/drafts/` — 8 drafts
> - `projects/` — 2 draft contexts (project-a, project-b) — pending review in Step 6
> - `reading/articles/` — 14 article notes
> - `me/voice.md` — not written yet; queued 11 writing samples to pull from in Step 4
>
> Skipped: 3 binary files I couldn't parse, 1 file with what looked like an API key (flagged).
>
> Let's walk through the guided steps now. They'll go faster since we're reviewing drafts instead of starting from nothing.

Then proceed to Step 3.

---

## Step 3 — Profile

Ask:

> First: who are you, in a few sentences? I don't need a CV. I need the working identity I should hold while I help you — what you do, what you're building right now, what kind of thinking you care about. What I write in your voice, what I recommend, what I flag — everything depends on this.

**If Step 2 bulk ingestion was run and the CV / bio material was ingested:** show the draft profile that was drafted from that material first, and ask the user to review, refine, and confirm. Don't make them type from scratch. Say something like: "I drafted this from your CV and bio files — review and tell me what to change, add, or cut."

When the user answers, turn it into `me/profile.md`. Ask one or two follow-up questions if the answer is too thin. Keep the profile to ~200 words — it's orientation, not a biography.

Show the draft. Confirm. Write it. Remove the placeholder marker.

---

## Step 4 — Voice

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

**If Step 2 bulk ingestion captured writing samples:** skip the question and extract voice directly from the samples. Present the extracted voice spec and ask the user to review/refine rather than starting from scratch.

Work with whatever they give you. Produce a `me/voice.md` draft with these sections at minimum:
- **CHARACTER** — one line
- **BASELINE** — one line
- **THE MOVE** — the signature thing that makes their writing theirs
- **RHYTHM** — sentence patterns
- **ZERO** — things they never do
- **TEST** — a gut check they use to verify voice is right
- **PLATFORMS** — any per-platform adjustments (optional on first pass)

Show the draft. Confirm. Write to `me/voice.md`. **Also sync the same content to `skills/library/voice.md`** — both files must stay in sync per `_RULES.md`. Remove placeholder markers from both.

---

## Step 5 — Doctrine seeds

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

**If Step 2 bulk ingestion surfaced doctrine candidates from strategy docs:** present them first as drafts. "Based on the strategy docs you gave me, here are 4 doctrine candidates I found. Review each — keep, refine, or drop."

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

---

## Step 6 — First project context

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

**If Step 2 bulk ingestion drafted project contexts from project briefs:** present those drafts for review one at a time, rather than asking the user to describe projects from memory. The briefs already answered most of the questions.

Tell the user they can create more project contexts whenever they're ready, just by saying `create project context: [name]`.

---

## Step 7 — Gobble a few things (optional, recommended)

Ask:

> Optional but recommended: do you have 3–5 things you're currently reading or referencing — GitHub repos, articles, X threads, papers — that are influencing your thinking on any active project?
>
> If yes, paste them one at a time and I'll gobble them. Each one becomes a structured vault node with the transferable principle extracted and connections to your projects. This is the fastest way to feel the vault working — five minutes of ingestion and suddenly the graph has density.

For each one the user provides, run the `gobble` workflow (read `workflows/library/gobble.md`, follow it, show routing plan, wait for confirm, write). Connect to the project created in Step 6 if relevant.

**After 3+ gobbles land, plant the seed for skillify.** Mention casually: *"You'll start noticing the same pattern across these sources. When that happens, say `skillify` on one and I'll turn the recurring move into a portable instruction. That's how the skills library grows — from your reading, not from scratch."*

If the user skips this step, tell them: "No problem. Next time you find something interesting, just paste the URL and say `gobble this`."

---

## Step 8 — Harvest your past thinking from Claude / ChatGPT / Gemini

This is the highest-leverage step in the entire setup. Months — sometimes years — of the user's thinking, problem-solving, and project iteration live inside their LLM conversation history. Right now that thinking is invisible to this vault. One pass fixes it.

Say something like:

> One more step before we wrap — and this one has the biggest payoff in the whole setup.
>
> Probably months or years of your thinking already live inside your past conversations with Claude.ai, ChatGPT, Gemini — wherever you've been working with LLMs. That history holds your projects, your patterns, the way you actually think. Right now it's invisible to this vault. We can change that in one pass.
>
> Here's what you do. Open Claude.ai, ChatGPT, or whichever LLM you've been using most. If you're using one with a memory feature (ChatGPT Memory, Claude.ai Projects), make sure you're somewhere it has access to your history. If not, paste a few of your most substantial past conversations into a fresh chat first. Then run this prompt:
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
> Then paste the result back here and say `distill this`. I'll classify, split, and route everything — projects to project contexts, patterns to system-patterns, doctrine candidates to doctrine.md, ideas to _INBOX.md. In one pass, months of thinking become addressable.
>
> If you've been heavy on more than one LLM, run the prompt in each — they'll surface different material.
>
> Want to do it now, or come back later?

If the user does it now: run the `distill` workflow on the pasted output. Show the routing plan. Confirm. Write.

If the user defers: "No problem. Whenever you're ready, run that prompt and paste back. Even a single pass will dramatically densify the vault."

**Note for Path B users:** If LLM exports were already in the bulk-ingest folder, this step is partially or fully done — but the harvest prompt above often surfaces material the raw exports don't (memory features pull from sources beyond the export). Worth running anyway.

---

## Step 9 — How the vault grows with you

Before the wrap, plant the meta-frame. Say something like:

> One last thing before we close out.
>
> The structure you see now — `me/`, `projects/`, `reading/`, `skills/`, `workflows/` — is opinionated, but not fixed. As you use the vault, you'll find places where it doesn't quite fit your work. That's a signal, not a bug. Tell me when you spot one and I'll extend the system.
>
> Three ways the vault grows:
>
> **1. New skills.** When you notice a pattern you keep applying across projects — a way you analyze, decide, build, or evaluate — say `skillify [source]`. I extract it as a reusable instruction. New skills land in `/skills/inbox/` until you've used them in real work, then get promoted to `/skills/library/`. The library is small on purpose — every skill in it has been battle-tested.
>
> **2. New workflows.** When you notice a repeatable vault operation (a multi-step thing you keep asking me to do), describe it and I'll scaffold a workflow file in `/workflows/inbox/`. Same lifecycle — used in real work, then promoted to `/workflows/library/`.
>
> **3. New top-level directories.** When you try to file something and realize none of the existing folders fit, that's the signal that the structure needs to grow. A new folder is justified when the *type* of content is fundamentally different from what exists — not when you just have a lot of one kind of thing. Examples: `/health/` for body/sleep/energy doctrine, `/finance/` for actual financial principles, `/clients/` for client contexts. Don't add folders prophylactically — wait for the "this doesn't fit anywhere" signal.
>
> The pattern: you live with the vault, you notice friction, you name it, I extend the system. The starter structure gets you running. Your usage shapes what it becomes.

---

## Step 10 — Wrap up

Say something like:

> That's the core setup. You now have:
>
> - A profile I'll use to keep you in context across sessions
> - A voice I'll apply to anything public-facing
> - [N] doctrines seeded — the start of your named principles
> - One project context, ready for more
> - [Optional: gobbled sources / harvested LLM history]
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
