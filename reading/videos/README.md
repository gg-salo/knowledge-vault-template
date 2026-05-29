# /reading/videos/

Video captures. Mirror of `/reading/articles/`, `/reading/threads/`, `/reading/repos/` — this directory holds knowledge ingested from video sources (YouTube, Vimeo, conference talks, podcast video episodes).

## What lives here

One file per video. Each file follows the gobble template (`/reading/_GOBBLE_TEMPLATE.md`) with:
- `type: video`
- `source_url`: the video URL
- `author`: creator / speaker
- `date_gobbled`: capture date
- `duration` (optional): for long videos
- `abstraction:` block per `_RULES.md` §11

## What does NOT live here

- Short threads (X/Twitter) → `/reading/threads/`
- Articles, blog posts → `/reading/articles/`
- Repos → `/reading/repos/`
- Playbooks → `/reading/playbooks/`

## Capture via gobble

When you give Claude a YouTube or Vimeo URL and ask to gobble, it's routed here automatically. See `/workflows/library/gobble.md` Step 2 URL-pattern detection.

## Related

- `_RULES.md` — vault constitution
- `/reading/_GOBBLE_TEMPLATE.md` — template for all reading entries
- `/workflows/library/gobble.md` — the workflow that captures external sources
