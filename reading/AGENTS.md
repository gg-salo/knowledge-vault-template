---
name: agents-reading
type: reference
scope: all
description: >
  Per-folder write authorization for /reading/. IMMUTABLE raw sources.
  Annotate in sidecar files only. Never modify the gobbled original.
status: validated
last_updated: YYYY-MM-DD
---

# AGENTS.md — /reading/ (Zone 3 Input: Immutable Raw Sources)

> Raw sources are immutable. Agents compile from them; humans curate which sources enter; nobody rewrites them.

---

## The Rule

**Raw gobbled files are IMMUTABLE. Never edit the original after gobble.**

If new analysis is needed, create a **sidecar annotation file** in the same folder:
- Original: `/reading/articles/example-source.md`
- Sidecar: `/reading/articles/example-source.annotations.md`

The sidecar follows the same frontmatter rules but `type: annotation` and includes `annotates: [[example-source]]`.

---

## Subfolders

| Subfolder | Source type |
|-----------|-------------|
| `/reading/articles/` | Articles, blog posts, papers |
| `/reading/repos/` | GitHub repositories |
| `/reading/threads/` | X/Twitter threads |
| `/reading/videos/` | YouTube, Vimeo, conference talks |
| `/reading/transcripts/` | Meeting recordings, calls |
| `/reading/playbooks/` | External operational playbooks |
| `/reading/doctrines/` | External named principles |

---

## Capture Rules (via [[gobble]])

1. **Source type detection** — automatic from URL per [[gobble]] §2
2. **Frontmatter required** — type, source_url, author, date_gobbled, tags, abstraction block
3. **Filing by primary subject** — domain/topic, not source format
4. **Backlink obligations** — at least one connected vault file. Hallucinated connections forbidden.

---

## Annotation Rules

When adding analysis to a gobbled source:

1. Create sidecar `[name].annotations.md` in same subfolder
2. Frontmatter: `type: annotation`, `annotates: [[name]]`
3. Multiple annotations OK — single accumulating file or timestamped per operator preference

---

## What Lives Outside `/reading/`

- Personal-authored playbooks → `/me/playbooks/`
- Personal doctrines → `/me/doctrine.md`
- Synthesized cross-source patterns → `/me/system-patterns.md`
- Idea spawned from a reading → `/me/ideas/_INBOX.md` with `connects-to: [[source]]`

The boundary: `/reading/` holds external; `/me/` holds your engagement with external.

---

## Anti-Patterns

- ❌ Editing the gobbled file to "fix" or "update" it
- ❌ Filing personal interpretation in /reading/
- ❌ Skipping abstraction block on gobble
- ❌ Creating /reading/ subfolders without precedent (per 2-Instance Rule)

---

## Connected Files

- [[AGENTS]] (root)
- [[_GOBBLE_TEMPLATE]] — capture template
- [[gobble]] — workflow
- [[_RULES]] — vault constitution
