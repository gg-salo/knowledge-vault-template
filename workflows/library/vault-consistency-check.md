---
name: vault-consistency-check
description: >
  Scan vault structural files for cross-file inconsistencies. Checks that
  indexes match filesystems, onboarding lists stay in sync, weekly review
  steps are consistent, backlinks resolve, and timestamps are current.
  Run after any structural refactor or as part of weekly review.
capabilities: [vault-maintenance, consistency-verification, structural-audit]
outputs: structured pass/fail report covering 11 consistency checks
cost: low
speed: ~5 minutes
metadata:
  version: 1.0.1
  type: review
  scope: all
  status: validated
  last_reviewed: YYYY-MM-DD
  promoted: YYYY-MM-DD
  source: vault maintenance need identified during an ontology refactor; validated in a live vault run (found drift across governance files, produced real-usage gotchas)
---

# Vault Consistency Check

## 1. PURPOSE

Prevents structural drift between the vault's governance files. After any refactor (moving files, renaming sections, adding canonical locations), the vault's multiple cross-referencing files fall out of sync. This workflow catches those mismatches before they compound into confusion during real work sessions.

Without this: CLAUDE.md says one thing, _RULES.md says another, vault-guide.md says a third. The librarian reads conflicting instructions and makes wrong routing decisions. The consistency check is the immune system for structural integrity.

---

## 2. WHEN TO USE / WHEN NOT TO USE

### Trigger conditions
- After any structural refactor (moving files between directories, renaming sections, adding/removing canonical locations)
- During weekly review (as step 0.5 — after ontology scan, before inbox review)
- When a vault session produces confusing results that suggest stale references
- After creating or deleting any file in `/skills/`, `/workflows/`, or `/me/`
- After editing CLAUDE.md, _RULES.md, or vault-guide.md

### Anti-triggers (do NOT apply when)
- Content-only edits (updating a skill's instructions without moving or renaming it)
- Appending to _INBOX.md or published/_INDEX.md (append-only files don't cause structural drift)
- Editing project context files (these are self-contained — no cross-referencing risk)

### Related workflows
- `weekly review` — this check can run as part of the weekly cadence
- `distill` — after a distill that creates new files, a consistency check catches any index gaps

---

## 3. CORE INSTRUCTIONS

Run all 11 checks below. For each, report PASS or FAIL with specifics.

### Check 1: File Existence

Verify every file path referenced in CLAUDE.md actually exists on disk.

**Scope:**
- Session bootstrap file list (the code block under "Session Bootstrap")
- Power commands section (every file path mentioned in "What It Does" column)
- Key Paths table
- Canonical Locations table (verify the parent directories exist)

**How:** For each path, confirm the file or directory exists. Flag any path that resolves to nothing.

### Check 2: Canonical Location Sync

Compare _RULES.md Section 1 canonical locations table against CLAUDE.md's Canonical Locations table.

**How:** Extract all rows from both tables. Flag:
- Rows in _RULES.md but missing from CLAUDE.md
- Rows in CLAUDE.md but missing from _RULES.md
- Rows present in both but with different paths or descriptions

Note: _RULES.md may have more rows (it is the source of truth). CLAUDE.md's table is a quick-reference subset. Flag mismatches only when the same content type appears in both with different paths.

### Check 3: Folder Structure Sync

Compare vault-guide.md's folder structure tree against the actual filesystem.

**How:**
- Count files in `/skills/library/` and `/skills/inbox/` — compare against vault-guide.md's listed counts or file listings
- Count files in `/workflows/library/` and `/workflows/inbox/` — compare against vault-guide.md's listed counts
- Verify each file listed under `/me/` in vault-guide.md actually exists
- Flag any directory listed in vault-guide.md that does not exist on disk

### Check 4: Onboarding List Sync

Compare vault-guide.md's "Two-Minute Onboarding" file list against CLAUDE.md's "Session Bootstrap" file list.

**How:** Extract both lists. They should contain the same files with the same descriptions. Flag:
- Files in one list but not the other
- Same file with different descriptions
- Different ordering (informational, not a failure)

### Check 5: Weekly Review Sync

Compare weekly review steps across all three locations:
- _RULES.md Section 8
- vault-guide.md "Weekly Maintenance" section
- CLAUDE.md weekly review command description (if it references specific steps)

**How:** Extract the numbered steps from each. Flag:
- Steps present in one location but missing from another
- Steps in different order
- Steps with materially different descriptions of the same action

Note: vault-guide.md may have more detailed descriptions than _RULES.md. That is fine as long as the steps are the same.

### Check 6: Index Accuracy

Verify both index files match their filesystems exactly.

**How:**
- List all `.md` files in `/skills/library/` — compare against skills/_INDEX.md library section
- List all `.md` files in `/skills/inbox/` — compare against skills/_INDEX.md inbox section
- List all `.md` files in `/workflows/library/` — compare against workflows/_INDEX.md library section
- List all `.md` files in `/workflows/inbox/` — compare against workflows/_INDEX.md inbox section
- Flag stale entries (listed in index but file does not exist)
- Flag missing entries (file exists but not listed in index)
- Verify inventory counts stated in the index match actual file counts

### Check 7: Doctrine Backlinks

Verify bidirectional links between doctrine.md and skill/workflow files.

**How:**
- In doctrine.md's Connected Files section, check every `[[backlink]]` — does the target file exist?
- In each skill file's Connected Files section, if it references doctrine.md — does the referenced doctrine entry still exist?
- Flag broken links in either direction

Note: not every skill has a doctrine pairing. Only check files that claim a connection.

### Check 8: Workflow Metadata

Verify status field consistency.

**How:**
- Read frontmatter of each file in `/workflows/library/` — confirm `status: validated`
- Read frontmatter of each file in `/workflows/inbox/` — confirm `status: candidate`
- Do the same for `/skills/library/` and `/skills/inbox/`
- Flag any mismatches

### Check 9: Timestamps

Check that key governance files have been updated recently.

**How:** Read `last_updated` (or equivalent timestamp field) from:
- _RULES.md (the "Last updated" line near the top)
- vault-guide.md frontmatter
- skills/_INDEX.md frontmatter
- workflows/_INDEX.md frontmatter

Flag any file where the timestamp is more than 30 days before today's date. This is a staleness warning, not necessarily a failure — the file may simply not have needed updates.

### Check 10: Step Numbering

Verify _RULES.md Section 8 weekly review steps are numbered sequentially.

**How:** Extract the step numbers from the code block. Confirm:
- Numbers are sequential (no gaps)
- No duplicate numbers
- First number is 0 (current convention)

### Check 11: Connected Files Resolution

Verify backlinks in governance file Connected Files sections.

**How:** Check every `[[backlink]]` in the Connected Files sections of:
- CLAUDE.md
- _RULES.md
- vault-guide.md
- skills/_INDEX.md
- workflows/_INDEX.md

For each backlink, confirm a matching `.md` file exists somewhere in the vault. Flag any that resolve to nothing.

Note: Obsidian backlinks use filename-only matching (e.g., `[[voice]]` matches any `voice.md` in the vault). A backlink is valid if ANY file with that name exists, regardless of directory.

### Check 12: AGENTS.md Hierarchy Resolution

Verify the AGENTS.md write-authorization hierarchy is intact.

**How:**
- Confirm `/AGENTS.md` exists at vault root
- Confirm `/me/AGENTS.md`, `/projects/AGENTS.md`, `/skills/AGENTS.md`, `/workflows/AGENTS.md`, `/reading/AGENTS.md` exist
- Read each file and verify the frontmatter declares `name: agents-[folder]`, `type: reference`, `scope: all` or `scope: personal`
- Verify per-folder AGENTS.md files reference the root [[AGENTS]] in their Connected Files
- Flag any folder containing user content (skills, workflows, projects, reading, me) that lacks an AGENTS.md
- Flag mismatches between root AGENTS.md's per-folder override list and the actual files present

### Check 13: Schema Reference Resolution

Verify _SCHEMA.md exists at root and is consistent with _RULES.md sections.

**How:**
- Confirm `/_SCHEMA.md` exists at vault root
- Verify _SCHEMA references match _RULES.md section numbers (§1, §6, §6b, §6c, §10, §11)
- Spot-check that the entity types listed in _SCHEMA §1 match the 7 shapes defined in _RULES §6b
- Spot-check that composition_level values (atom/molecule/compound) in _SCHEMA §2 match _RULES §6c

### Check 14: Agents Folder Structure

Verify `/agents/` folder exists with proper governance + library/inbox split (added when Agent became the 7th ontology shape).

**How:**
- Confirm `/agents/library/`, `/agents/inbox/`, `/agents/_INDEX.md`, `/agents/_TEMPLATE.md`, `/agents/AGENTS.md` all exist
- List all `.md` files in `/agents/library/` — compare against agents/_INDEX.md library section
- List all `.md` files in `/agents/inbox/` — compare against agents/_INDEX.md inbox section
- Read frontmatter of each agent file — confirm `type: agent` (not `type: process` or `type: review`)
- Confirm each library file has `status: validated`; each inbox file has `status: candidate`
- Verify no agent files were silently moved back into `/skills/`

---

## 4. OUTPUT FORMAT

```
# Vault Consistency Check — [DATE]

## Summary
- Checks passed: X/14
- Checks failed: Y/14
- Warnings: Z

## Results

### Check 1: File Existence — [PASS/FAIL]
[Details of any missing files]

### Check 2: Canonical Location Sync — [PASS/FAIL]
[Details of any mismatches]

[... repeat for all 11 checks ...]

## Action Items
1. [Specific fix needed, with file path and what to change]
2. [Next fix]
...
```

---

## 5. GOTCHAS

| # | Gotcha | What goes wrong | What to do instead |
|---|--------|-----------------|-------------------|
| 1 | Check 3 misses narrative-incomplete trees | `vault-guide.md` folder tree silently omits files/dirs that exist on disk. Count comparison alone catches quantity drift but not listing drift — files exist but aren't documented. | Run a filesystem-vs-tree diff, not just count comparison. For each directory documented in `vault-guide.md`, `ls` it and flag any file present on disk but absent from the tree. |
| 2 | Check 5 weekly-review sync has three sources | _RULES.md §8, vault-guide.md Weekly Maintenance, and CLAUDE.md's `weekly review` command description all describe the same steps but independently. Any of them can drift — most commonly vault-guide adds steps that never land in _RULES. | Treat _RULES.md §8 as the source of truth. Flag any step in vault-guide.md or CLAUDE.md that's missing from _RULES.md — then decide whether to add to _RULES or remove from the drifted file. |
| 3 | Adding a new ontology shape requires updates in ≥ 5 places | When a new shape is added (per §6b.2 2-Instance Rule), _RULES.md §1 canonical locations, _RULES.md §6b ontology table, _RULES.md §8 ontology scan shape-list, CLAUDE.md canonical locations, and vault-guide.md Weekly Maintenance all need the new shape. Skipping any one creates silent drift. | Run this workflow immediately after any shape addition, not just at weekly review. The canonical-location update is the most commonly forgotten — it's the least prominent of the three _RULES.md touchpoints. |
| 4 | Index drift accumulates between session boundaries | When new skills or workflows are added in one session and the relevant `_INDEX.md` isn't updated in the same routing plan, the inbox tables drift. Detection requires a `comm -23` filesystem-vs-index diff (Check 6) — count comparison alone misses it because totals can match while specific files are unindexed. | Any session that adds a skill or workflow MUST update the relevant `_INDEX.md` in the same routing plan. Treat the inbox table and the inbox directory as a single artifact. After every promote/demote, bump `last_updated`. |
| 5 | Tri-source onboarding lists drift independently | CLAUDE.md "Session Bootstrap", vault-guide.md "Two-Minute Onboarding", and (potentially) _RULES.md preface all enumerate the canonical first-read files. Adding a new governance file (e.g., AGENTS.md, _SCHEMA.md) to one but not the others creates silent drift visible only when an agent reads from the lagging source. | Treat the three onboarding lists as ONE artifact split across three files. Any change to one requires evaluating the other two. Run Check 4 immediately after any governance addition. |

*Gotchas 1-3 captured from a first validation run in a live vault after a playbook-shape refactor. Gotchas 4-5 captured after the AGENTS.md hierarchy + _SCHEMA.md addition surfaced the index-drift and tri-source-onboarding patterns.*

---

## 6. QUICK REFERENCE

```
VAULT CONSISTENCY CHECK — COMPRESSED CHECKLIST

 1. File existence    — every path in CLAUDE.md resolves to a real file
 2. Canonical sync    — _RULES.md Section 1 matches CLAUDE.md locations table
 3. Folder structure  — vault-guide.md tree matches actual filesystem
 4. Onboarding sync   — vault-guide.md bootstrap = CLAUDE.md bootstrap
 5. Weekly review     — _RULES.md S8 = vault-guide.md maintenance = CLAUDE.md
 6. Index accuracy    — skills/_INDEX + workflows/_INDEX match their directories
 7. Doctrine backlinks — bidirectional links between doctrine.md and skills
 8. Workflow metadata  — library=validated, inbox=candidate, no mismatches
 9. Timestamps        — governance files updated within 30 days
10. Step numbering    — _RULES.md S8 steps sequential, no gaps/duplicates
11. Connected Files   — all [[backlinks]] in governance files resolve
12. AGENTS hierarchy  — root + 6 per-folder AGENTS.md exist and reference root
13. Schema resolution — _SCHEMA.md exists, references match _RULES.md sections
14. Agents folder    — /agents/ structure exists; library/inbox match _INDEX; type: agent enforced

RUN AFTER: any structural refactor, file moves, section renames
RUN DURING: weekly review (between ontology scan and inbox review)
```

---

## Connected Files

- [[_RULES]] — vault constitution (the source of truth for most checks)
- [[vault-guide]] — onboarding reference (one of the files being checked)
- [[_INDEX|skills _INDEX]] — governance hub being verified
- [[_INDEX|workflows _INDEX]] — governance hub being verified
