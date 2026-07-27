---
name: research-data-analysis-interpretation
description: Use when reviewing or planning data analysis, statistical analysis plan, result interpretation, null results, regression/model outputs, visualization strategy, robustness checks, sensitivity analyses, or evidence-to-claim alignment.
---

# Research Data Analysis and Interpretation

Use this skill when the user has data, results, statistical output, model
output, or an analysis plan to review.

## Core Rule

Do not invent numbers, p-values, confidence intervals, effect sizes, sample
sizes, model performance, or statistical significance. Interpret only supplied
results and mark missing diagnostics.

## What To Check

1. Analysis readiness
   - study design
   - variables and measurement level
   - sample size and missingness
   - planned primary/secondary analyses
   - assumptions and diagnostics

2. Statistical analysis plan
   - descriptive summaries
   - primary test/model for each RQ
   - effect size and uncertainty reporting
   - multiple comparison handling
   - missing data strategy
   - sensitivity/subgroup analyses if justified

3. Interpretation
   - result supports which claim?
   - practical/clinical/educational significance vs statistical significance
   - null or unexpected results
   - confounders, artifacts, bias, and alternative explanations
   - limitations of measurement/proxy

4. Visualization
   - chart type fits data and message
   - uncertainty and sample size shown where needed
   - readable labels, units, legends, captions
   - avoid plots that overstate evidence

5. Evidence-to-claim discipline
   - what can be concluded now
   - what remains exploratory
   - what requires additional analysis or external validation

## Output

```markdown
## Data Analysis / Interpretation Review
### Analysis Readiness
### Analysis Plan Fit
### Result Interpretation
### Robustness / Sensitivity / Diagnostics
### Visualization Notes
### Claims Supported / Not Supported
### Missing Inputs
```
