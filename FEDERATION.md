# Federation — Optional

> **You can ignore this entire file and run a great solo vault.** Federation is an opt-in layer for connecting your vault to others. Nothing here is required for the template to work.

---

## What it is

If you're part of a group that each keeps a vault (a team, a DAO, a cohort), you can connect them. Not by merging the raw content — your vault stays sovereign and private — but by sharing the *abstract layer*: your patterns and principles, stripped of private specifics.

The payoff, in plain terms:
- **Complementary coverage** — see where your expertise fills a gap someone else has, and vice versa
- **Contradiction surfacing** — find assumptions you and a teammate both hold that are quietly incompatible
- **Cross-domain pattern transfer** — a technique from your field turns out to be exactly what someone in another field needs

What it does NOT do: prove some grand "minds independently converge" claim. The three things above are real and observed. Lead with those.

---

## How this template prepares you

The template enforces **mergeable-ready hygiene** regardless of whether you ever federate:

- Every entry has a `type:` field (doctrine, skill, pattern, etc.) — see `_SCHEMA.md`
- Substantive entries carry an `abstraction:` block (concrete + abstract + matches) — see `_RULES.md` §11

That's just good vault hygiene — it makes your own cross-domain connections legible to your own Claude sessions. It also happens to be exactly what federation needs, so if you ever opt in, **you're already structurally ready.** No restructuring required.

**Surfaces, not paths:** organize your vault however you like; the structure that matters is that each entry declares what it IS.

---

## When you're ready to federate

The implementation (the workflow that extracts your abstract layer, submits it to the hub, runs convergence analysis, and writes back lessons) is **not shipped with this template.** It lives in the `connected-vaults` ecosystem — a separate repo built and maintained around the federation hub itself.

To join:

1. Find a federation hub (your team's, your DAO's, your cohort's) — or set one up
2. Follow the hub's `_member-kit/INSTALL.md`, which provides the workflow file and onboarding agent tailored to that hub's conventions
3. Run the first extraction against your vault

The reason the implementation lives at the hub level (not in this template): each federation can evolve its own extraction conventions, hub structure, and convergence rituals. Bundling a fixed implementation here would either freeze adopters into one shape or quickly go stale.

If you're spinning up a federation from scratch, the reference implementation patterns are documented in the `connected-vaults` template repo.

---

## Sovereignty (the non-negotiable)

- Your raw content never leaves your machine. Extraction reads it locally and produces only abstractions.
- You approve every shared entry before it goes anywhere.
- You can withdraw anything, anytime, no questions.

If federation ever feels like it's taking more than it gives, stop. Your vault is yours.
