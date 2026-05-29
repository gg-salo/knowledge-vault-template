---
name: [agent-name-kebab-case]
type: agent
description: >
  When this agent should be spawned. One paragraph including trigger phrases
  (e.g., "review this critically", "stress-test the plan", "audit X").
  This is what Claude reads to decide whether to spawn this agent.
role: [the persona's identity, e.g., "adversarial reviewer", "expert panel synthesizer"]
allowed_tools: [Read, Grep, Glob, WebSearch]   # restrict tools to scope
context_isolation: fork                          # fork | inherit
spawn_pattern: one-shot                          # one-shot | parallel-N | sequential
termination_criterion: returns_when(critique_complete)
spawning_mechanism: slash                        # slash | orchestrator-driven | hook
metadata:
  version: 0.1.0
  composition_level: atom                        # atom | molecule | compound
  scope: [personal]
  projects: [array]
  status: candidate                              # candidate → validated on promotion
  last_reviewed: YYYY-MM-DD
  source: [origin — gobble file, distill session, etc.]
abstraction:
  concrete: "What this spawned agent actually does — technical, specific."
  abstract: "The pattern this agent embodies — domain-agnostic."
  fundamental: "Optional. The deepest principle this persona expresses."
  matches: [comma-separated domains where this persona pattern appears elsewhere]
---

# [Agent Name] — [Short Tagline]

> One-line positioning. What this agent IS, in 12 words or fewer.
> Status: candidate. First real-usage gotchas get populated after first 1-2 spawns.

---

## 1. PURPOSE / WHEN TO SPAWN

**What this agent does, and what it prevents going wrong.**

[2-3 sentences: the failure mode this spawn prevents, OR the leverage it adds. Why a spawned persona instead of just running the calling agent's instructions.]

**Why this exists:**
- [Why a forked context matters here, e.g., to escape sycophancy bias of the calling agent]
- [What the parent agent can't do well alone]
- [What the spawned persona's restricted toolset prevents]

---

## 2. WHEN TO USE / WHEN NOT TO USE

### Trigger conditions
- [User phrase or situation 1]
- [User phrase or situation 2]
- [Programmatic trigger from another workflow/agent]

### Anti-triggers (do NOT spawn)
- [Situation where calling agent should just do the work in-place]
- [Situation where a different agent fits better]

### Related agents/skills
- [[related-agent]] — when this agent OR that one applies
- [[related-skill]] — the inherit-context version, if one exists (sibling)
- [[related-workflow]] — if this agent is invoked from a workflow

---

## 3. PERSONA (system prompt material)

> *This is the system prompt loaded into the spawned agent's context. Write it as instructions to a configured persona, not as a third-person description.*

You are [persona description with identity, expertise, and operating style].

Your job: [single-sentence objective].

[Operating principles the persona embodies — 2-5 bullets.]

[Specific behaviors that define this persona's style.]

---

## 4. BEHAVIORS / ANTI-BEHAVIORS

### Behaviors (what the persona DOES)
- [Specific action 1]
- [Specific action 2]
- [Specific action 3]

### Anti-behaviors (what the persona explicitly does NOT do)
- [Common failure mode the persona must avoid]
- [Pattern the calling agent might do that this persona must NOT do]
- [Format / hedging / structure the persona avoids]

---

## 5. OUTPUT FORMAT

The spawned agent returns:

```markdown
[Specify the structured output: sections, required fields, format]
```

Example output:
```
[A real example of what the spawn returns, so the calling agent knows what to expect]
```

---

## 6. GOTCHAS

[TODO — populate from first real spawn session.]

Known risk areas:
- [Failure mode to watch for]
- [Tool restriction that might bite]
- [Context isolation gotcha — what the spawned agent CAN'T see]

---

## 7. QUICK REFERENCE

```
[AGENT NAME]
ROLE:        [persona identity]
TOOLS:       [list]
ISOLATION:   fork | inherit
SPAWN:       one-shot | parallel-N | sequential
TERMINATES:  [criterion]
SPAWNED VIA: slash command | orchestrator | hook

CALL: [exact trigger phrase or programmatic call]
EXPECT: [what the calling agent receives back]
```

---

## Connected Files

- [[_RULES]] — vault constitution (§6b 7-shape ontology, §6c composition levels)
- [[_SCHEMA]] §4 — Agent frontmatter spec
- [[AGENTS]] in this folder — write authorization rules
- [[_INDEX]] — agents governance hub
- [[doctrine|The Worthiness Gate]] — the curation principle for what becomes an agent
- [[skills/_TEMPLATE]] — sibling for skills (inherit-context counterpart)

---

## Mirror to `.claude/agents/` (after promotion)

Once promoted to library:

```bash
ln -s /absolute/path/to/your/vault/agents/library/[name].md ~/.claude/agents/[name].md
```

Claude Code spawns from `~/.claude/agents/`. Vault is the source of truth + version control.
