---
title: [Playbook Title]
slug: [kebab-case-slug]
type: playbook
status: draft
scope: [personal]
description: >
  One paragraph describing what this playbook produces, which domain it
  operates in, and when to reach for it. This field is what agents read
  to decide whether this playbook is relevant to a question.
domain: [marketing | fundraising | hiring | product | ops | other]
evidence_level: theoretical
last_updated: YYYY-MM-DD
source: personal-authored
abstraction:
  concrete: "What this actually is — technical, specific, implementation-level"
  abstract: "The underlying pattern — domain-agnostic, transferable"
  fundamental: "What this is really about at the deepest level (optional)"
  matches: [comma-separated domains where the abstract pattern appears elsewhere]
---

# [Playbook Title]

> One-line positioning — what this playbook does in a sentence.
> Status: draft | living | archived
> Field evidence: [project where validated, or "theoretical — not yet tested"]

---

## Objective

What this playbook produces. The deliverable, the outcome, the end-state.
One paragraph. No hedging.

---

## When to Use

Specific triggering conditions. List the situations where someone should
reach for this playbook. Be concrete.

- Trigger 1
- Trigger 2
- Trigger 3

## When Not to Use

Anti-triggers. Situations where this playbook is the wrong tool. Critical
for preventing misapplication.

- Anti-trigger 1
- Anti-trigger 2

---

## Required Inputs

What the operator must have before running this playbook. Budget,
information, stakeholder sign-off, prerequisites. If an input is missing,
the playbook fails silently — so list them explicitly.

- Input 1
- Input 2

---

## Ordered Steps

The executable process. Numbered phases or modules. Each step should be
runnable by an operator who has the required inputs.

### Phase 1: [Name]
- What happens in this phase
- Deliverables
- Time estimate (optional)

### Phase 2: [Name]
- ...

### Phase N: [Name]
- ...

---

## Owners & Roles

Who runs which parts. Relevant for multi-stakeholder playbooks.

| Role | Responsibility |
|------|---------------|
| ... | ... |

---

## Success Metrics

### Primary outcomes
What "this playbook worked" looks like. Measurable.

- Metric 1: [how measured]
- Metric 2: [how measured]

### Leading indicators
Early signals that it's on track before final outcomes are visible.

- Indicator 1
- Indicator 2

---

## Risks & Mitigations

| Risk | Mitigation |
|------|-----------|
| ... | ... |

---

## Failure Signals

Specific signs that the playbook is failing in execution. If you see these,
stop and diagnose rather than pushing through.

- Signal 1
- Signal 2

---

## Field Evidence

Concrete cases where this playbook was deployed. For each:
- **Case:** [project / client / situation]
- **Outcome:** [what happened]
- **Key learning:** [what the case taught]

*If no field evidence yet, mark the playbook `evidence_level: theoretical`
and update when validated.*

---

## Connected Files

- [[_RULES]] — vault constitution (§6b defines playbook as a shape)
- [[doctrine]] — relevant named principles this playbook expresses
- [[project-context-file]] — projects where this playbook is applied
- [[related-skill]] — portable agent skills this playbook composes

---

## Notes

### Living-document rules
- Update when new data overturns an assumption
- Mark each update with a date
- If a step changes, explain why (field evidence or doctrine shift)
- Archive (don't delete) when superseded — preserve lineage

### Federation signal
If `scope` includes a federated vault (e.g., `[personal, federation]`),
this playbook is a candidate for round-trip flow. Ensure field evidence
is generalized enough to be useful outside the personal context.
