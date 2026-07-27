---
name: research-workflow-router
description: Use when the user asks what research skill/prompt to use next, has a broad research task, or needs routing across the research lifecycle from topic/proposal to literature review, hypothesis/RQ refinement, experiment design, data interpretation, manuscript writing, revision, venue/status prognosis, collaboration, or productivity.
---

# Research Workflow Router

Use this router before choosing a focused research skill when the user request
is broad, mixed, or stage-dependent.

## Core Rule

Route by current research stage and available evidence. Do not run every skill.
If a stage is not ready, mark it `not ready` and list the missing input.

## Stage Router

| User need / current stage | Use skill | Minimum inputs |
|---|---|---|
| "ยังไม่รู้จะเริ่มตรงไหน", broad topic, concept note | `thesis-proposal-readiness` | topic, field, key problem, population/context, expected output |
| Need to refine RQ, hypothesis, variables, testability | `research-question-hypothesis` | rough RQ/topic, field, resources/data, constraints |
| Title, abstract, expected outcome/result | `thesis-title-abstract-outcome` | title/abstract/expected result or contribution paragraph |
| Introduction/problem/objective/scope | `thesis-introduction-review` | introduction or problem/objective text |
| Literature review, gap, synthesis, SLR search strategy | `thesis-literature-review` or `systematic-review-protocol` | related-work text or review question + scope/databases |
| References, BibTeX, citation support | `thesis-reference-bibtex` | BibTeX/reference list, manuscript citations, PDFs/official pages |
| Experiment/evaluation design | `thesis-experiment-design` | RQ/hypothesis, method, data/testbed, baseline, metrics |
| Data analysis, statistics, visualization, interpretation | `research-data-analysis-interpretation` | dataset summary/results/model output, variables, analysis goal |
| Paper/manuscript draft, self-review before submission | `research-manuscript-revision-submission` | manuscript section/draft, target venue/category, results |
| Reviewer comments / response letter | `research-manuscript-revision-submission` | reviewer/editor comments, manuscript changes/evidence |
| LaTeX install/build, venue template, Thai font, PDF layout | `latex-document-production` | TeX source/template, venue instructions, build log or PDF |
| Venue choice, readiness verdict, prognosis | `thesis-venue-status-prognosis` | field, contribution, evidence state, target venue/category |
| Collaboration email, advisor meeting, project agenda | `research-collaboration-productivity` | role, project state, decision needed, recipient/audience |
| Overall thesis/manuscript assessment | `thesis-overview-review` | current workspace files and review state |

## Evidence Guardrails

- Literature/citation tasks must use supplied sources or mark `needs source`.
- Data tasks must not invent numbers, statistical significance, sample size, or
  model performance.
- Venue tasks must not invent rankings, scope rules, or acceptance likelihood.
- Collaboration/productivity tasks may draft communications, but decisions and
  commitments remain L2 human judgment.

## Output

```markdown
## Research Workflow Routing
| Need | Recommended skill | Ready? | Missing input | Why this skill |
|---|---|---:|---|---|

## Suggested Next Prompt
```

Keep routing short. Detailed work belongs in the selected skill.
