---
name: thesis-experiment-design
description: Use when reviewing a thesis/manuscript experiment design, evaluation plan, methodology validation plan, baseline selection, metrics, datasets, expected results, failure cases, feasibility, or reproducibility.
---

# Thesis Experiment Design

Use this skill only when the work has enough method/evaluation material to
review. If there is no data, baseline, metric, evaluation procedure, or
validation plan yet, mark it `not ready` and recommend the minimum inputs.

## Core Rule

Experiment design must let the study genuinely fail. A design that interprets
every possible result as success is not a research evaluation.

## Minimum Inputs

- objective/RQ or hypothesis
- method or intervention
- data/testbed/context
- baseline or comparison condition
- metric/indicator and definition
- expected output/result
- procedure or protocol

If these are missing, do not invent an experiment. List the missing inputs.

## What To Check

1. Objective-to-evaluation alignment
   - What claim is being tested?
   - What evidence would show success?
   - What evidence would show failure?
   - Do the verbs in objectives match the methodology and evidence? For
     example, effect/comparison/prediction claims need quantitative evidence;
     understanding/interpretation claims need qualitative evidence; design or
     development claims need validation/evaluation evidence.

2. Baselines and alternatives
   - standard baselines expected by the field
   - simpler/cheaper/safer alternatives
   - ablations where relevant

3. Metrics and measurement validity
   - construct
   - operational indicator
   - instrument/ground truth
   - calculation
   - threshold or mandatory gate

4. Data and protocol
   - dataset/testbed/source
   - sampling/splitting/labeling
   - privacy/permission/license risks
   - reproducibility path

5. Failure cases and error analysis
   - unfavorable conditions
   - maximum-error or minimum-capacity gates
   - runtime/cost/maintenance trade-offs

6. Expected output vs outcome
   - output evidence from experiment
   - outcome claims requiring deployment/user/stakeholder feedback

## Output

```markdown
## Experiment Design Review
### Readiness
### Objective-To-Evaluation Alignment
### Baselines / Alternatives
### Metrics And Measurement Validity
### Data / Protocol / Reproducibility
### Genuine Failure Conditions
### Risks And Missing Inputs
### Minimum Defensible Experiment
```
