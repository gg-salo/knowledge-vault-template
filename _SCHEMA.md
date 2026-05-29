---
name: vault-schema
type: reference
scope: all
description: >
  Consolidated schema reference. Entity types, relation types, frontmatter
  axes, naming conventions, per-shape write rules. Single source of truth
  for vault data shape; pulls from _RULES.md sections that were scattered
  across §1, §6, §6b, §6c, §10, §11.
status: validated
last_updated: YYYY-MM-DD
---

# _SCHEMA.md — Vault Data Shape Reference

> Consolidates what's specified in [[_RULES]] across multiple sections. _RULES is the constitution (what + why); _SCHEMA is the data dictionary (which fields, which values, which relationships).

---

## 1. Entity Types (Ontology Shapes)

The vault recognizes **7 ontology shapes** per [[_RULES#6b]]:

| Shape | Description | Canonical location |
|-------|-------------|-------------------|
| **Skill** | Instruction set an agent executes when a trigger matches. Portable. Same context as running agent. | `/skills/library/` or `/skills/inbox/` |
| **Workflow** | Procedure that operates on THIS vault's file structure. Vault-coupled. | `/workflows/library/` or `/workflows/inbox/` |
| **Doctrine** | Named principle observed repeatedly with empirical evidence. | `/me/doctrine.md` (append entries) |
| **Vault strategy** | Architectural decision about how THIS vault works. | `/me/obsidian-strategy.md` |
| **System pattern** | Architectural pattern observed in the wild or own projects. | `/me/system-patterns.md` |
| **Playbook** | Long-form, multi-module operational framework. Living document. | `/me/playbooks/[name].md` (personal) or `/reading/playbooks/[slug].md` (external) |
| **Agent** | Configured persona spawned with its OWN context, tool restrictions, scope, and termination criterion. Maps to Claude Code's `.claude/agents/`. | `/agents/library/` or `/agents/inbox/` |

**The 2-Instance Rule** ([[_RULES#6b.2]]): new shapes enter only after 2+ authored instances exist.

---

## 2. Composition Levels

Per [[_RULES#6c]]. Every skill, workflow, and playbook tags its leverage tier:

| Tier | Description | Default for |
|------|-------------|-------------|
| **atom** | Single-purpose primitive. No skill/workflow calls. Near-deterministic. | New skills |
| **molecule** | Chains 2-10 atoms for a scoped task. Bounded judgment. | (Explicit choice) |
| **compound** | Orchestrates molecules with significant agent autonomy. Needs human driver. | New playbooks |

**Reliability ceiling:** compounds spanning >8-10 molecules degrade.

---

## 3. Relation Types (Typed Backlinks)

| Relation | Direction | Meaning |
|----------|-----------|---------|
| `powers` | A → B | A enables/serves B as core infrastructure |
| `shares-dna` | A ↔ B | Common architectural pattern; convergent design |
| `depends-on` | A → B | A requires B to function |
| `parallel-bet` | A ↔ B | Competing/diverging exploration |
| `supersedes` / `superseded-by` | A → B / B ← A | A replaces B |
| `feeds` | A → B | A produces inputs B consumes |
| `planned-depends-on` | A → B | Future dependency |
| `uses` | A → B | A invokes B at runtime |
| `contradicts` | A ↔ B | Mutually exclusive claims (flag for resolution) |
| `derived-from` | A → B | A was extracted from B |
| `fixed-by` | A ← B | A's failure mode addressed by B |

---

## 4. Frontmatter Axes (Per Shape)

### Universal axes (every file)

| Axis | Type | Required? |
|------|------|-----------|
| `name` | string | yes |
| `type` | enum | yes |
| `scope` | enum / array | yes |
| `description` | string (`>`) | yes |
| `status` | enum | yes |
| `last_updated` | YYYY-MM-DD | recommended |

### Status by shape

| Shape | Valid status values |
|-------|---------------------|
| Skill / Workflow | `candidate` → `validated` → `archived` |
| Doctrine | inline confidence percentage |
| Playbook | `draft` → `living` → `archived` |
| Reading | `gobbled` |

### Composition axis (skills, workflows, playbooks)

```yaml
metadata:
  composition_level: atom | molecule | compound
```

### Multi-abstraction block (every note per [[_RULES#11]])

```yaml
abstraction:
  concrete: "What this actually is"
  abstract: "The underlying pattern"
  fundamental: "Optional — the deepest level"
  matches: [domains where the abstract pattern appears elsewhere]
```

### Frontmatter format rules per [[_RULES#10]]

- First line MUST be `---` alone
- Each field on its own line
- Multi-line values use `>` with indented continuation
- Closing `---` on its own line before first `#` heading

---

## 5. Naming Conventions

| Asset | Convention | Example |
|-------|-----------|---------|
| Skill file | `kebab-case.md` (name = principle) | `verification-before-completion.md` |
| Workflow file | `kebab-case.md` (name = action) | `gobble.md`, `sync-context.md` |
| Project context | `[project-name]-context.md` | `example-project-context.md` |
| Reading entry | `[descriptive-slug].md` | `gobbled-source.md` |
| Doctrine entry | `## Title Case` heading inside `/me/doctrine.md` | `## Your Doctrine Name` |
| Playbook | `[descriptive-slug].md` | `paid-media-framework.md` |
| Annotation sidecar | `[name].annotations.md` (same folder as original) |  |

---

## 6. Per-Shape Write Rules (Quick Reference)

| Shape | Write rules summary |
|-------|---------------------|
| Skill | Inbox-only for new. Promotion: human review + 1 gotcha + composition_level + rubric. See [[skills/AGENTS]]. |
| Workflow | Inbox-only for new. Promotion: N real sessions + 1 gotcha + composition_level + still vault-coupled. See [[workflows/AGENTS]]. |
| Doctrine | Append to `/me/doctrine.md`. Never delete; supersede via new entry. |
| Vault strategy | Append to `/me/obsidian-strategy.md`. |
| System pattern | Append to `/me/system-patterns.md` under relevant section. |
| Playbook | Personal: `/me/playbooks/[slug].md`. External: `/reading/playbooks/[slug].md`. Default `composition_level: compound`. |
| Agent | Inbox-only for new. Promotion: N real spawn sessions + 1 gotcha + persona/tools/termination spec + composition_level. See [[agents/AGENTS]]. |

For agent-facing per-folder authorization, see [[AGENTS]] (root) + each folder's AGENTS.md.

---

## 7. The Worthiness Gate (Universal Intake Filter)

Before any vault write:

1. **Worthiness rubric** (skill-specific): Reusability + Non-triviality + Stability + Delta. ≥3/4 to pass.
2. **Ontology shape** matches intended location (run §6b diagnostic)
3. **Composition level** set explicitly when applicable
4. **No duplicate** of existing content
5. **Backlinks** to ≥1 other vault file

The decision to NOT include is as load-bearing as the decision to include.

---

## Connected Files

- [[_RULES]] — vault constitution (this file's source-of-truth)
- [[AGENTS]] — agent-facing write authorization
- [[_TEMPLATE]] — skill standard
- [[_GOBBLE_TEMPLATE]] — reading capture template
- [[obsidian-strategy]] — architectural rationale
- [[vault-consistency-check]] — workflow that audits schema compliance
