---
name: setup-tooling
description: >
  One-command vault tooling installer. Detects what's already installed,
  walks the operator through installing what's missing (Obsidian CLI,
  kepano/obsidian-skills, QMD with hybrid retrieval, Claude Code MCP wiring,
  SessionStart index-refresh hook). Idempotent — safe to re-run. Use after
  cloning the vault template or when adding a new machine. Triggers on: set
  up vault tooling, install vault tools, configure my vault. Do NOT use for
  vault content setup (that's the SETUP.md guided onboarding).
capabilities: [tooling-detection, install-orchestration, mcp-configuration, hook-configuration, idempotent-setup]
outputs: fully-wired vault tooling stack — Obsidian CLI registered, kepano-skills cloned, QMD installed + indexed + MCP-wired, SessionStart refresh hook active (pre-shipped in vault .claude/)
cost: low (mostly time + downloads; ~2.3GB models, ~10-15 min for first run)
speed: 10-15 min on first run; <1 min on re-runs (most steps skip)
requires: [macos-with-homebrew, node-v22-or-installable, obsidian-1.12-or-newer, claude-code]
parallelizable: false
human_gate: true
metadata:
  composition_level: molecule
  version: 0.1.0
  type: process
  scope: all
  status: candidate
  source: distilled from a manual install run; surfaces failure modes encountered (better-sqlite3 binding, bun-vs-npm, qmd update-before-embed gotcha)
abstraction:
  concrete: "A scripted-but-confirmed install procedure that walks an operator through 12 vault-tooling install steps with idempotent detection at each stage and clean failure messaging when a step blocks."
  abstract: "Idempotent provisioning workflow with human gates at each install — detect, propose, confirm, execute, verify. The librarian sets up the librarian."
  fundamental: "Self-bootstrapping infrastructure — a system whose installation is itself orchestrated by the system being installed."
  matches: [Bootstrap loaders in operating systems, Ansible idempotent playbooks, Homebrew Bundle, Nix declarative environments, dotfiles install scripts]
---

# Setup Tooling — One-Command Vault Tooling Installer

> The librarian sets up the librarian. Run once after cloning the template; re-run safely whenever you add a new machine or want to verify state.

---

## 1. PURPOSE

**Eliminates the 12-step manual tooling install** that would otherwise gate every new template clone from the full vault experience. Without this workflow, users either skip tooling entirely (settling for grep-based vault access at 60-96% higher token cost) or hit one of the multiple failure modes (better-sqlite3 binding, bun-vs-npm path issues, qmd lifecycle confusion) and bounce.

With it: one Claude Code session, one prompt, ~10-15 minutes of confirmations and downloads, fully-wired vault.

---

## 2. WHEN TO USE / WHEN NOT TO USE

### Trigger conditions
- Just cloned the vault template, ready to wire tooling
- Adding the vault to a new machine
- Verifying tooling state after a system update or migration
- A vault-consistency-check flagged missing tooling

### Anti-triggers (do NOT apply when)
- Setting up vault CONTENT (use the guided onboarding in SETUP.md instead)
- On Linux or Windows (this workflow is macOS-specific; equivalents exist but aren't scripted here)
- The operator explicitly wants minimal tooling (grep-only is a valid choice for small vaults)

### Related workflows
- `SETUP.md` (guided content onboarding) — runs FIRST; this workflow runs AFTER content is in place
- [[vault-consistency-check]] — sibling: that one audits structure; this one provisions tooling

---

## 3. CORE INSTRUCTIONS

Each step has a **detection check** (skip if already done) + **install action** + **verification**. Present a routing plan for each non-trivial install before executing. Fail fast and surface clear next-steps if a step blocks.

### Step 0: Preflight

```bash
uname -a   # expect Darwin (macOS); abort with clear message if not
which brew || echo "MISSING: install Homebrew first → https://brew.sh"
```

If non-macOS or no Homebrew → halt with clear message.

### Step 1: Obsidian 1.12 + CLI registration

**Detection:** `which obsidian`

**Install (manual UI step):** Obsidian → Settings → General → CLI → Register CLI

**Verify:** `obsidian --version`

### Step 2: kepano/obsidian-skills

**Detection:** `[ -d ~/.claude/skills/obsidian-skills ]`

```bash
mkdir -p ~/.claude/skills
git clone https://github.com/kepano/obsidian-skills.git ~/.claude/skills/obsidian-skills
```

**Why:** patches a 22.8% silent failure rate in the Obsidian CLI command syntax.

### Step 3: Node v22 (specific version)

```bash
node -v   # if not v22.x:
brew install node@22
brew link node@22 --overwrite --force
```

**Why v22 specifically:** QMD breaks on v23/v25.

### Step 4: Homebrew SQLite (FTS5 support)

```bash
brew install sqlite   # idempotent
```

### Step 5: QMD installation

**Cleanup if previous bun install left broken state:**
```bash
bun remove -g @tobilu/qmd 2>/dev/null
```

**Install (critical: --build-from-source flag):**
```bash
npm install -g @tobilu/qmd --build-from-source
```

**Why the flag:** Without it, better-sqlite3 native binding fails (`"Could not locate the bindings file"`) — the #1 failure mode.

### Step 6: QMD packaged skill (self-install)

```bash
qmd skill install
```

**Why:** QMD ships its own Claude Code skill that teaches the agent qmd's tools idiomatically.

### Step 7: Vault collection

```bash
cd "<vault-root>"   # use the vault path detected from Claude Code's working directory
qmd collection add . --name vault --mask "**/*.md"
```

### Step 8: Context

```bash
qmd context add qmd://vault "Personal knowledge vault — [auto-generate description from /me/profile.md if available, otherwise generic]"
```

### Step 9: Index + embed (CRITICAL ORDERING)

```bash
qmd update    # FIRST — scan files into index
qmd embed     # SECOND — vectorize (downloads ~2.3GB models on first run)
```

**Why ordering matters:** `qmd embed` on an empty index returns "all hashes already have embeddings" — silently wrong because zero hashes exist.

**Verify:**
```bash
qmd status                           # expect Files > 0, Vectors > 0
qmd search "test query" --json -n 3  # expect results, not []
```

### Step 10: Wire QMD into Claude Code MCP

Edit `~/.claude/settings.json` to add the qmd MCP server. Use **absolute path** from `which qmd` (matters for nvm setups):

```json
{
  "mcpServers": {
    "qmd": {
      "command": "<absolute-path-from-which-qmd>",
      "args": ["mcp"]
    }
  }
}
```

If file doesn't exist → create with minimal structure.
If exists with other settings → merge `mcpServers` block, preserving existing entries.

### Step 11: Index refresh — SessionStart hook (pre-shipped, no cron)

**The index-refresh hook is already shipped in this vault** at `.claude/settings.json` (project-level) + `.claude/hooks/qmd-refresh.sh`. It runs `qmd update && qmd embed` in the background on every session start, so the index stays fresh whenever you work.

No action needed beyond confirming the script is executable:

```bash
chmod +x "${CLAUDE_PROJECT_DIR:-.}/.claude/hooks/qmd-refresh.sh"
ls -l "${CLAUDE_PROJECT_DIR:-.}/.claude/hooks/qmd-refresh.sh"
```

**Why a hook, not a cron:** macOS cron skips entirely if the machine is off/asleep, and cron's minimal PATH often can't find nvm-installed `qmd` (silent failure — the #1 reason indexes go stale). The SessionStart hook runs in your real shell environment and fires exactly when you start working. The shipped script also detects qmd via PATH + nvm fallback and skips gracefully if qmd isn't installed yet — so it never errors a session.

*(Optional belt-and-suspenders: if you also want a scheduled refresh for long stretches without sessions, add a 1pm cron — `0 13 * * * $(which qmd) update && $(which qmd) embed` — but it's redundant with the hook for most users.)*

### Step 12: Final verification

```bash
echo "=== Tooling state ==="
echo "Obsidian CLI: $(obsidian --version 2>/dev/null || echo NOT REGISTERED)"
echo "kepano/obsidian-skills: $(ls -d ~/.claude/skills/obsidian-skills 2>/dev/null && echo present || echo MISSING)"
echo "Node: $(node -v)"
echo "QMD: $(qmd --version)"
echo "QMD index: $(qmd status | grep 'Files:' | head -1)"
echo "MCP entries (global): $(grep -c qmd ~/.claude/settings.json)"
echo "SessionStart hook: $(ls .claude/hooks/qmd-refresh.sh 2>/dev/null && echo present || echo MISSING)"
```

**Final operator instruction:**
> "Setup complete. Fully quit Claude Code (Cmd+Q on Claude Desktop, or exit + restart `claude` CLI), start a fresh session, and run `/mcp` to verify qmd is connected. The SessionStart hook will refresh your index in the background from now on — no cron needed."

---

## 4. REFERENCE MATERIAL

### Failure mode reference

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| `Could not locate the bindings file` | bun install without native rebuild | npm install with `--build-from-source` |
| `Collection 'vault' already exists` | Stale config from earlier failed install | Skip the add step; collection is configured |
| `qmd embed` says "all hashes already have embeddings" but Files: 0 | Ran embed before update | Run `qmd update` first |
| `qmd search` returns `[]` after embed | No documents indexed | `qmd status` shows Files: 0 → run `qmd update` |
| `qmd` MCP doesn't appear after restart | PATH issue (nvm, custom location) | Use absolute path in settings.json |

---

## 5. GOTCHAS

[TODO — populate from first real-usage runs by template clone users.]

Authoring-run gotchas (carried from the install session that produced this workflow):
1. **`qmd embed` before `qmd update` is silently wrong.** Workflow MUST enforce ordering.
2. **bun-installed QMD breaks** due to better-sqlite3 binding. Default to npm + `--build-from-source`.
3. **Claude Desktop ≠ Claude Code MCP config.** This workflow edits `~/.claude/settings.json` (Claude Code). Claude Desktop standalone uses a different file.

---

## 6. QUICK REFERENCE

```
SETUP-TOOLING — vault tooling installer (idempotent, ~10-15 min first run)

 1. Preflight (macOS + Homebrew)
 2. Obsidian 1.12 + CLI register (manual UI step)
 3. kepano/obsidian-skills    → git clone
 4. Node v22                  → brew install node@22 (NOT v23/v25)
 5. Homebrew SQLite           → brew install sqlite
 6. QMD                       → npm install -g @tobilu/qmd --build-from-source
 7. QMD packaged skill        → qmd skill install
 8. Vault collection          → qmd collection add .
 9. Context                   → qmd context add
10. Update + embed            → update FIRST, then embed
11. MCP wire                  → edit ~/.claude/settings.json (global)
12. Index refresh             → SessionStart hook (pre-shipped in vault .claude/, no cron)
13. Restart Claude Code

Run AFTER: SETUP.md content onboarding
#1 failure: bun-installed QMD → use npm --build-from-source
#2 failure: embed before update → always update first
```

---

## Connected Files

- [[_RULES]] — vault constitution
- [[AGENTS]] — write authorization
- [[vault-consistency-check]] — sibling: audits structure
- [[obsidian-strategy]] — why these tools matter
