---
name: example-skill
description: >
  Reference example showing the shape of a skill candidate. A fictional
  skill called "pre-commit-self-review" used to illustrate the format
  and conventions. Keep this file around as a permanent reference — do
  not promote or delete.
capabilities: [self-review, quality-gate, code-hygiene]
outputs: a line-by-line self-review of the pending commit, flagging dead code, missed edge cases, and unclear naming
cost: low
speed: 30-90s per commit
requires: []
parallelizable: true
human_gate: false
metadata:
  version: 0.1.0
  type: review
  scope: personal
  projects: [all]
  status: candidate
abstraction:
  concrete: "Before any git commit, the agent runs a structured self-review across the staged diff and reports issues in a consistent format"
  abstract: "Pre-commit quality gate — a deliberate pause between generation and persistence to catch failure modes"
  fundamental: "Review separation — the entity reviewing is the same as the entity producing, but at a different phase, creating a local feedback loop"
  matches: [double-entry bookkeeping reconciliation, writer editing their own draft before publishing, pilot pre-flight checklist, surgeon time-out before incision]
---

> **This is a reference example.** A fictional skill used to show the shape of a skill candidate file. Keep it around as a permanent reference. When you write real skill candidates (via `skillify` or manually), mirror this structure. Do not promote, delete, or modify this file.

---

## 1. PURPOSE

**Prevents Claude from committing code it wouldn't approve on review.** Without this skill, Claude generates code, marks it done, and moves on — relying on the human to catch quality issues. This skill forces a deliberate pause before `git commit` where the agent re-reviews its own work against a structured checklist.

**Why this exists:**
- The same agent that wrote the code is capable of critiquing it — but only if prompted to switch modes
- Most quality regressions in agent-written code come from skipped self-review, not inability to review
- A 30-second self-review pass catches 80% of the issues a human reviewer would flag
- Claude's default behavior is to optimize for completion, not for quality — this skill rebalances that

---

## 2. WHEN TO USE / WHEN NOT TO USE

### Trigger conditions
- Before any `git commit` operation in a project context
- When the user says "commit this" or "let's commit"
- After completing a task that produced code changes across 2+ files
- Before pushing to a shared branch

### Anti-triggers (do NOT apply when)
- The user has already manually reviewed the diff and said "commit as-is"
- The commit is a revert, merge, or mechanical refactor with no new logic
- The task is explicitly exploratory and the commit is a checkpoint (user will say so)
- Working on throwaway scripts or one-off analysis code

### Related skills
- (none yet — this is a reference example)

---

## 3. CORE INSTRUCTIONS

### Step 1: Read the staged diff
```bash
git diff --cached
```

Read the full diff before starting the review. Don't review file-by-file — context across files matters.

### Step 2: Run the checklist

For each changed file, check:

| # | Check | What you're looking for |
|---|---|---|
| 1 | **Dead code** | Unused imports, unreachable branches, commented-out code, console.logs |
| 2 | **Edge cases** | Nil/empty/zero handling, off-by-one, unexpected input shapes |
| 3 | **Error handling** | Swallowed exceptions, missing error paths, unclear error messages |
| 4 | **Naming** | Variables and functions that don't say what they mean, stale names after refactors |
| 5 | **Tests** | New logic without test coverage, stale tests not updated for changed behavior |
| 6 | **Scope** | Changes outside what the task required (scope creep, incidental refactors) |
| 7 | **Secrets** | API keys, tokens, env values accidentally committed |

### Step 3: Report findings

Output format:

```
## Pre-commit self-review

**Files reviewed:** [N]
**Issues found:** [N]

### [File path]:[line]
- [Issue type]: [description]
- [Fix recommendation]

### [Next file]
...

### Verdict
- ✅ Ready to commit
- 🟡 Ready with minor notes (see above)
- 🔴 Should fix before committing: [specific issues]
```

### Step 4: Wait for decision

Do NOT run `git commit` automatically. Present the review and let the user decide:
- "Ready" → proceed to commit
- "Fix X" → address and re-review
- "Ignore" → proceed to commit anyway (user accepts the trade-off)

---

## 5. GOTCHAS

| # | Gotcha | What goes wrong | What to do instead |
|---|--------|-----------------|-------------------|
| 1 | [TODO — populate from first real usage] | | |

*Gotchas must come from real failures, not imagined ones. This section stays with `[TODO]` until the skill has been used at least once and something went wrong that's worth documenting.*

---

## 6. EXAMPLES

### Good output
```
## Pre-commit self-review

**Files reviewed:** 3
**Issues found:** 2

### src/api/user.ts:42
- Dead code: unused import of `logger` from line 3
- Fix: remove the import

### src/api/user.ts:87
- Error handling: catch block swallows the error silently
- Fix: log the error or re-throw it; silent swallowing will hide real bugs

### Verdict
- 🟡 Ready with minor notes — both issues are low-risk, can commit if intentional
```

### Bad output (anti-pattern)
```
Looks good. Committing.

[No checklist applied. No report. No opportunity for the user to catch
issues before they're persisted. This is a rubber stamp, not a review.]
```

---

## 9. QUICK REFERENCE

```
PRE-COMMIT-SELF-REVIEW = read staged diff → run 7-point checklist → report findings → wait for user decision
NEVER commit automatically after review — always let user decide
Checklist: dead code, edge cases, error handling, naming, tests, scope, secrets
Verdict: ✅ ready / 🟡 ready with notes / 🔴 should fix first
Gotchas stay [TODO] until first real use
```

---

## Connected Files
- [[_RULES]] — vault constitution (Section 6 covers skill governance)
- [[_TEMPLATE]] — skill standard this file follows
- [[skillify]] — the skill that would generate files like this one from a source
