---
name: thesis-overview-review
description: Use when the user asks for an overall thesis/manuscript assessment, readiness check, or "ประเมิน" across whatever parts currently exist. Routes to focused skills for title/abstract/expected outcome, introduction, literature review, experiment design, references/BibTeX, and deeper review only when the draft has enough evidence.
---

# Thesis Overview Review

Use this as the orchestration skill for thesis/manuscript review. It should look
at the current state of the work, decide which focused review skills are
applicable, and create a concise overview without forcing a full review of
sections that do not exist yet.

## Core Rule

Review what exists. Mark absent or immature sections as `not ready for this
skill` or `missing input`; do not produce long speculative criticism for
sections the student has not drafted yet.

Do not rewrite thesis/manuscript source files. Create review notes first.

## Skill Routing

Run or emulate these focused skills when the relevant material exists:

- `thesis-title-abstract-outcome`: title, abstract, expected outcome, expected result, contribution snapshot
- `thesis-proposal-readiness`: early proposal/concept note readiness, problem framing, RQ/objective/methodology fit
- `research-question-hypothesis`: unstable RQ/hypothesis/variables/testability
- `thesis-introduction-review`: introduction, problem statement, motivation, objective/RQ, contribution setup
- `thesis-literature-review`: related work/literature review, research problem discovery, research gap understanding
- `systematic-review-protocol`: systematic/scoping review protocol and search/screening/extraction plan
- `thesis-experiment-design`: method/evaluation plan, experiment design, baselines, metrics, failure cases
- `research-data-analysis-interpretation`: data analysis plan, results interpretation, visualization, robustness checks
- `research-manuscript-revision-submission`: manuscript readiness, submission checklist, reviewer response
- `research-collaboration-productivity`: collaboration/advisor meeting/project coordination tasks
- `latex-document-production`: LaTeX/build/template/font/table/final PDF QA
- `thesis-reference-bibtex`: reference audit, BibTeX creation/analysis, citation use
- `thesis-venue-status-prognosis`: venue/category selection, readiness verdict, qualitative prognosis

If a focused skill is not installed, follow the same section rules from this
pack's prompts/templates.

## Maturity Gate

Before reviewing, classify each section:

| Section | Available? | Mature enough for review? | Skill to use | Action |
|---|---:|---:|---|---|
| Title/abstract/expected outcome | yes/no | yes/no/partial | thesis-title-abstract-outcome | review / skip / request input |
| Proposal readiness | yes/no | yes/no/partial | thesis-proposal-readiness | review / skip / request input |
| RQ/hypothesis | yes/no | yes/no/partial | research-question-hypothesis | review / skip / request input |
| Introduction | yes/no | yes/no/partial | thesis-introduction-review | review / skip / request input |
| Literature review | yes/no | yes/no/partial | thesis-literature-review | review / skip / request input |
| Systematic/scoping review protocol | yes/no | yes/no/partial | systematic-review-protocol | review / skip / request input |
| Experiment/evaluation design | yes/no | yes/no/partial | thesis-experiment-design | review / skip / request input |
| Data analysis/interpretation | yes/no | yes/no/partial | research-data-analysis-interpretation | review / skip / request input |
| Manuscript revision/submission | yes/no | yes/no/partial | research-manuscript-revision-submission | review / skip / request input |
| LaTeX/PDF production | yes/no | yes/no/partial | latex-document-production | review / skip / request input |
| References/BibTeX/citations | yes/no | yes/no/partial | thesis-reference-bibtex | review / skip / request input |
| Venue/status/prognosis | yes/no | yes/no/partial | thesis-venue-status-prognosis | review / skip / request input |

For early drafts, it is normal to review only title/abstract/expected outcome,
introduction, and literature review. Do not rush to experiment design if there
is no method, data, baseline, metric, or evaluation plan yet.

## Overview Output

Write or update:

```text
04_review_notes/01_full_review.md
04_review_notes/03_student_action_checklist.md
04_review_notes/99_review_state.md
```

Use this structure:

```markdown
## Overview Decision
## Section Maturity Gate
## Title / Abstract / Expected Outcome Snapshot
## Proposal Readiness Snapshot
## RQ / Hypothesis Snapshot
## Introduction Snapshot
## Literature Review Snapshot
## Systematic Review Protocol Snapshot
## Experiment Design Snapshot
## Data Analysis / Interpretation Snapshot
## Manuscript Revision / Submission Snapshot
## LaTeX / PDF Production Snapshot
## Reference/BibTeX Snapshot
## Venue / Status / Prognosis Snapshot
## Cross-Section Coherence
## What Not To Review Yet
## Blocking Issues
## Next Focused Skill To Run
```

Keep the overview short. Detailed criticism belongs in the focused skill notes.

## Cross-Section Coherence

When enough sections exist, check whether this chain is coherent:

```text
Title -> Abstract -> Introduction problem -> Literature gap -> Objective/RQ -> Method/experiment -> Expected output -> Expected outcome -> Claim
```

Mark each link as `pass`, `partial`, `missing`, or `contradictory`.

## Review State

In `04_review_notes/99_review_state.md`, record which focused skills are done,
partial, skipped, or not ready. Do not mark skipped sections as failed.
