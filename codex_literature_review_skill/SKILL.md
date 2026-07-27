---
name: thesis-literature-review
description: Use when reviewing a thesis/manuscript literature review, related work, background chapter, research problem discovery, research gap understanding, synthesis quality, or literature-to-objective alignment.
---

# Thesis Literature Review

Use this skill for literature review / related work sections. This is separate
from the reference/BibTeX skill: reference audit checks metadata and citation
integrity; this skill checks whether the author understands the field well
enough to define a defensible research problem and gap.

## Core Rule

The literature review must do more than summarize papers. It should show how
prior work leads to a research problem, an unresolved gap, and a reason this
study is needed.

## What To Check

1. Research problem discovery
   - Does the author find a research problem from prior work?
   - Or did the author merely choose a topic, technology, dataset, or method?
   - Is the problem a clear undesirable/unresolved/uncertain condition?

2. Research gap understanding
   - What is already known?
   - What remains unresolved?
   - In what context, population, dataset, setting, constraint, or condition?
   - Why does the unresolved part matter academically or practically?
   - Is the gap derived from evidence across papers?
   - What type of gap is it: conceptual, methodological, contextual,
     empirical, data, evaluation, implementation, policy/practice, or another
     field-specific type?

3. Prior attempts
   - What has been tried?
   - What works and under what conditions?
   - What does not work and why?
   - What simpler, safer, cheaper, or established alternatives exist?

4. Synthesis quality
   - Synthesis by issue/method/finding/gap, not paper-by-paper summaries only.
   - Comparison matrix when multiple method families exist.
   - Clear distinction between Introduction and Related Work roles.

5. Link to objectives
   - Does the gap lead to the objective/RQ?
   - Are objectives floating without literature support?
   - Is the preferred method locked into the problem too early?

6. Citation support
   - Claims that need citations.
   - Citations that are too broad or decorative.
   - Direct prior work vs cross-domain support.

Use `thesis-reference-bibtex` for detailed BibTeX/source/PDF checks.

## Output

```markdown
## Literature Review
### Research Problem Discovery
### Research Gap Understanding
### Prior Attempts And Unresolved Need
### Synthesis Quality
### Literature-To-Objective Alignment
### Missing Literature Families
### What Not To Claim Yet
### Next Literature Work
```

Mark the section as `not ready for deep literature review` if the student has
only a topic list, bibliography dump, or a few isolated paper summaries.
