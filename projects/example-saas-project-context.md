---
name: example-saas-project-context
type: project-context
scope: personal
description: >
  Reference example showing the structure of a project context file.
  Keep this file around as a shape reference — do not delete it.
  When creating real project contexts, copy this structure.
abstraction:
  concrete: "A SaaS project that lets small teams schedule recurring content drops across multiple social platforms from a single interface"
  abstract: "Multi-channel orchestration from a single source of truth"
  fundamental: "Fan-out execution — one intent, many distribution targets"
  matches: [email marketing platforms, ad bidding systems across channels, CI/CD pipelines, military command and control]
---

> **This is a reference example.** A fictional SaaS project called "Tempo" used to show the shape of a project context file. When you create real project contexts during setup or later, mirror this structure. Do not delete this file — it stays as a permanent reference.

---

# Tempo

## What It Is

Tempo is a scheduling layer for small teams running content across X, LinkedIn, and Instagram. Unlike Buffer or Hootsuite, it treats the **cadence** as a first-class object — you define a rhythm ("every Tuesday 10am + every Friday 3pm") and drop posts into slots, rather than scheduling each post individually. The goal is to make consistent publishing the path of least resistance for two- and three-person marketing teams.

**Stage:** Building. MVP live with 12 beta users.
**Medium:** Web app (Next.js + Supabase + Vercel).
**Revenue model:** $29/month per seat, $79/month for team plans.

---

## Abstraction Layers

- **Abstract:** Multi-channel orchestration from a single source of truth
- **Fundamental:** Fan-out execution — one intent, many distribution targets
- **Matches:** email marketing platforms, ad bidding across channels, CI/CD pipelines, military command and control

---

## Current State

- ✅ Slot-based scheduling UI (drag-and-drop calendar)
- ✅ X + LinkedIn OAuth + posting
- ✅ Team member roles (owner / editor / viewer)
- 🟡 Instagram integration (Meta API approval pending)
- 🟡 Content approval workflow (in design)
- 🔴 Analytics (engagement tracking per slot)
- 🔴 AI draft suggestions from slot context

**Current tension:** the cadence-first UX resonates with beta users but confuses first-time visitors who expect a traditional calendar. The onboarding flow needs a "show, don't explain" moment.

---

## Tech Stack

| Layer | Tech | Notes |
|---|---|---|
| Frontend | Next.js 14 (App Router) + Tailwind | |
| Backend | Supabase (Postgres + Auth + Edge Functions) | |
| Hosting | Vercel | |
| Queue | Inngest | For scheduled post execution |
| APIs | X v2, LinkedIn OAuth 2.0, Meta Graph | Instagram pending review |

---

## Architecture Notes

- **Slots, not posts.** The core data model has a `slot` table (cadence + time) and a `content` table (the actual post). A slot can be empty or filled. This is the key abstraction that differentiates the product.
- **One-way sync.** Tempo owns the schedule state; the platform APIs are downstream consumers. No importing existing scheduled posts from platforms.
- **No real-time collaboration.** Editing is single-user at a time with an optimistic lock. Collaboration complexity wasn't worth the cost at MVP stage.

---

## Recent Additions

- **2026-03-30** — Added team roles (editor / viewer). Beta user request.
- **2026-04-02** — Shipped drag-and-drop calendar v2 with touch support.
- **2026-04-08** — Onboarding rewrite (attempt #1) — metrics unchanged, planning attempt #2.

---

## Relationships

*(Typed relationships to other projects — see `_RULES.md` Section 5 for the vocabulary.)*

- [[example-other-project-context]] — shares-dna (same Supabase + Next.js architecture baseline)

---

## Skills That Power This Project

*(As skills get promoted or written for this project, list them here. Examples of what might appear:)*

- [[voice]] — used for any public-facing copy (landing page, changelog, onboarding microcopy)
- [[review-prd]] — used to pressure-test new feature specs

---

## Reading That Informed This

*(As gobbled sources connect to this project, list them here.)*

- (none yet — gobbled sources will appear here with backlinks)

---

## Open Questions

- Will cadence-first UX scale beyond marketing teams? Beta feedback skews heavily to content marketers. Unclear whether sales teams, ops teams, etc. even want this shape.
- How much does the Instagram integration matter? 8 of 12 beta users asked for it, but none have churned over its absence.
- Is the $29/seat pricing too low? Comparable tools are $49–$99.

---

## Connected Files

- [[_RULES]] — vault constitution
- [[doctrine]] — doctrines that may apply to this project
- [[vault-guide]] — onboarding context
