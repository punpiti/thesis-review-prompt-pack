---
name: thesis-venue-status-prognosis
description: Use when choosing publication venue/category, assessing thesis/manuscript readiness, writing a reviewer-style final verdict, or giving a qualitative prognosis of whether the work can become thesis-ready, defense-ready, manuscript-ready, or venue-ready. Use only from supplied evidence and mark venue metrics/rankings as needing live verification.
---

# Thesis Venue, Status, and Prognosis

Use this skill near the end of an overview or focused review, when there is
enough evidence to judge readiness, venue fit, or qualitative feasibility.

## Core Rule

Do not invent venue rankings, metrics, acceptance likelihood, editorial policy,
scope fit, publication status, or reviewer expectations. If live verification is
needed, write `needs live verification`.

This skill gives a qualitative, evidence-bound prognosis, not a guarantee.

## Minimum Inputs

At least some of:

- field/subfield
- degree level or manuscript type
- current title/abstract
- research problem/gap
- claimed contribution
- method/evaluation status
- result/evidence status
- reference set / target-venue anchors
- stated target venue or desired venue category

If these are too thin, output `not ready for venue/status prognosis` and list
the minimum missing inputs.

## What To Check

1. Current status
   - not ready
   - early promising
   - thesis-draft ready
   - defense-review ready
   - manuscript-ready
   - venue-ready

2. Evidence basis
   - title/abstract clarity
   - problem/gap strength
   - literature support
   - method/evaluation maturity
   - result/evidence maturity
   - reference/source integrity
   - ethics/legal/IRB readiness where relevant

3. Venue category fit
   - thesis-only / defense document
   - local/national conference
   - regional conference
   - field-specific workshop
   - applied/practitioner venue
   - indexed conference/journal
   - target journal or top-tier venue

4. Venue selection
   - fit by topic and method
   - expected evidence standard
   - expected baseline/experiment standard
   - reference anchors from the venue or category
   - scope mismatch
   - over-ambition or under-ambition

5. Qualitative prognosis
   - What is plausible if current blockers are fixed?
   - What remains unlikely without new evidence/data/experiments?
   - What requires L2 human judgment?
   - What requires L3 external feedback or live verification?

6. Next best target
   - narrowest defensible version
   - realistic next review state
   - recommended next focused skill

## Output

```markdown
## Venue / Status / Prognosis
### Current Readiness
### Evidence Basis
### Venue Category Fit
### Target Venue Risks
### Qualitative Prognosis
### What Would Change The Verdict
### Recommended Next Target
### Needs Human Judgment
### Needs Live Verification / External Feedback
```

Use cautious language:

- `plausible if...`
- `not defensible yet because...`
- `too early to judge...`
- `venue metrics need live verification`
- `this is a qualitative prognosis, not an acceptance prediction`
