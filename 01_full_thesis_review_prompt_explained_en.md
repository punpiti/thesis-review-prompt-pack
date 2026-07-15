# 01 Full Thesis Review Prompt: English Concept Explanation

This file explains what the main prompt in `01_full_thesis_review_prompt.md` asks AI to review.

This is not the prompt to copy directly. To run a review, use `01_full_thesis_review_prompt.md` or follow the workflow in `workspace-en.html`.

## Core idea

A good thesis review is not only a language review. It checks whether the whole research argument actually holds together:

- Is the research problem significant enough?
- Do the objectives really come from the problem?
- Is the method appropriate for the problem and field?
- Do the results answer the objectives and reduce the stated problem?
- Do the references support the manuscript's claims?
- Is there enough evidence for the degree level and expected venue?

Before polishing language, AI should run five stress tests: problem survival, genuine failure, mandatory gates, measurement ceiling, and no-new-problem guardrails.

AI must not invent missing information. It must distinguish manuscript evidence, reference evidence, and reviewer interpretation.

## Required starting context

Before reviewing, AI must know or be able to extract at least:

- field and subfield
- degree level or manuscript type
- document status, such as proposal, thesis draft, defense draft, or journal manuscript
- target venue or expected publication level
- thesis or manuscript text
- reference list or BibTeX

If this information already appears in the documents, AI should summarize it from the documents instead of asking the student to re-enter it.

## What the prompt asks AI to review

### 1. Field, level, and venue

- Identify the field and subfield precisely, not only broad labels such as AI, education, or data science.
- Check the expected contribution level and whether it fits an undergraduate, master's, doctoral, or manuscript-level work.
- Assess whether the target venue or venue category fits the scope, method, results, and reference base.
- Check whether the manuscript uses real papers from the target venue as scope anchors, not decorative citations.
- If the target is too ambitious, state what baseline, experiment, theory, dataset, validation, or writing standard would be needed.

### 2. Title and abstract

- Check whether the title and abstract point to the same study.
- Check whether the title is specific enough and does not overclaim beyond what the work actually does.
- Check whether the abstract includes problem, gap, method, data, result, and contribution.
- Flag placeholders such as missing result, dataset, baseline, metric, or actual value.
- Flag strong terms such as robust, significant, state-of-the-art, or solves when the manuscript does not provide evidence.

### 3. Problem significance

- Identify the real research problem, not only a plan to build a system or apply a tool.
- Assess whether the problem has enough academic weight or practical value.
- Check whether the problem is justified by evidence, literature, a gap, limitations of prior work, or real data.
- Check whether the problem is too broad, too narrow, already solved, or mainly a convenience for the researcher.
- Test problem survival: the problem must exist, matter, remain unresolved, and not already be solved well enough by a simpler, safer, or more standard method.
- State what evidence would make the problem stronger.

### 4. Literature review quality

- Check whether the literature review establishes the problem, gap, and positioning.
- Distinguish synthesis from a paper-by-paper summary.
- Identify bibliography entries that are not cited.
- Identify claims, definitions, datasets, methods, or background statements that need citations but have none.
- Flag citations used too broadly, inaccurately, or decoratively.
- Check whether Introduction and Related Work have distinct roles or repeat the same material.

### 5. Reference clustering and quality

- Cluster references by role, not only by keyword: direct prior work, method foundation, dataset or benchmark, evaluation method, theory, target-venue anchor, background, or weak citation.
- Assess whether each cluster has enough coverage, quality, recency, and relevance.
- Identify missing key work, recent work, target-venue anchors, or expected baselines.
- Explain what each cross-domain reference supports and what it cannot support.
- Identify references that should be verified, demoted, removed, or replaced with stronger sources.

### 6. Objective and problem alignment

- List every objective or research question.
- Link each objective back to the problem or gap it should address.
- Identify objectives that do not come from the problem or are only activities, such as study, develop, or design, without a research question.
- Identify stated problems that no objective tries to solve.
- Check whether each objective is measurable and later supported by results.

### 7. Results and contribution

- Check whether actual or expected results show that the problem is reduced or solved.
- Check whether results match objectives, and whether any objective lacks supporting results.
- Separate implementation output from research evidence. Having a working system does not automatically prove a contribution.
- For quantitative results, check dataset or testbed, baseline, metric definition, raw result, and calculation path.
- Identify missing error analysis, failure cases, runtime or cost trade-off, or statistical or qualitative evidence expected by the venue.
- Test genuine failure: what result would show that the method does not solve the problem or that the claim is unsupported?

### 8. Overall coherence

- Build a traceability table from `Problem/gap -> Objective/RQ -> Method -> Data/evidence -> Result -> Claim`.
- Check whether every problem has an objective, every objective has a method, and every method has evidence.
- Identify broken chains, such as a claim without a result or a result that does not answer the problem.
- Identify claims that exceed the evidence or interpret beyond what the experiment can show.
- Check measurement ceiling: the claim must not be stronger than the construct, proxy or indicator, instrument or ground truth, data procedure, and analysis that support it.
- Decide whether the whole work is coherent or still a set of disconnected parts.

### 9. Proposed solution and alternatives

- Evaluate whether the solution makes academic sense or is mainly convenient.
- Identify standard or popular alternatives for the same problem that the manuscript ignores.
- Check whether expected baselines are missing, such as keyword or BM25, embeddings, plain LLMs, structured prompts, or classical methods.
- Check whether the method choice is justified.
- Ask whether the novelty remains if a strong baseline performs similarly.
- Check mandatory gates such as correctness, safety, security, ethics or legal compliance, capacity, or maximum error before optimization metrics are compared.
- Check the no-new-problem guardrail: the solution must not create unacceptable burden or risk in privacy, security, cost, fairness, accessibility, maintenance, energy, or stakeholders.

### 10. Data, feasibility, and the narrowest defensible version

- Check whether the required data exist, are accessible, and can be used under the relevant rules.
- Check data cleanliness, ground truth, labeling, missing data, and data-cleaning risk.
- Assess privacy, permission, consent, ownership, and confidentiality risks.
- Check whether the evaluation plan can be completed with available time and resources.
- Suggest the narrowest defensible version if the original plan is too large or the data are not ready.

### 11. Ethics, IRB, and legal or regulatory issues

- Check whether the work involves human subjects, students, users, experts, patients, or vulnerable groups.
- Check whether it uses personal data, sensitive data, images, voice, chat logs, behavioral logs, or identifiable information.
- Check whether IRB approval, exemption, consent forms, participant information sheets, or institutional permission may be required.
- Check issues involving scraping, platform Terms of Service, dataset licenses, copyright, NDAs, and data ownership.
- AI must not conclude by itself that IRB is unnecessary. It should tell the student what must be verified with the advisor, IRB office, institution, or venue instructions.

### 12. Scope and limitation

- Separate scope, which is the deliberate boundary of the study, from limitation, which affects interpretation of results.
- Check whether the manuscript confuses the two terms or uses them interchangeably.
- Check whether the scope is narrow enough to be feasible but not so narrow that the contribution disappears.
- Identify expected limitations such as dataset bias, generalizability, sample size, evaluation weakness, or measurement error.
- Check whether limitations are written responsibly rather than destructively.

### 13. LLM use and research responsibility

- Identify whether LLMs are used for writing, translation, summarization, extraction, data generation, evaluation, or as the main method.
- If LLM use affects evidence, the manuscript should document prompts, outputs, model names, dates, settings, and verification procedures.
- Check citations, DOI, venue ranking, datasets, and factual claims that may have come from LLM output but have not been verified.
- Distinguish whether the LLM is a tool, baseline, evaluator, or actual contribution.
- Flag generic AI writing that sounds fluent but adds no reasoning, evidence, or concrete claim.

### 14. Acknowledgement and long-lived document risk

- Check whether the acknowledgement is appropriate, specific, and not too long or personal.
- Watch for wording about relationships, positions, affiliations, funding, or support that may change over time.
- Check whether conflicts, dependencies, or support should be stated neutrally.
- Check that wording does not make the thesis look informal when read years later.
- Suggest safer acknowledgement principles if needed.

### 15. Language and document hygiene

- Check typos, spelling, punctuation, and repeated errors that are excessive for the document stage.
- Check whether Thai and English are mixed more than necessary and whether technical terms are used consistently.
- Check whether abbreviations and acronyms are defined before use and used consistently.
- Flag forward references to material that will be explained later without enough context.
- Separate minor language polish from language problems that damage scientific meaning.

### 16. Tables and figures

- Check whether tables and figures support claims or are only decoration.
- Check clarity, font size, labels, legends, units, and abbreviations.
- Check whether captions explain what the reader should learn, not only name the figure.
- Check whether tables and figures are referenced near the right place in the text.
- Check whether tables or figures support the claim and do not invite interpretation beyond the evidence.

### 17. Reviewer-style verdict

- Summarize readiness: not ready, early promising, thesis-draft ready, defense-review ready, manuscript-ready, or venue-ready.
- Give top blocking issues first, instead of listing everything at the same priority.
- Separate high-impact fixes from minor issues.
- Identify questions the author must answer or ask the advisor.
- Suggest the next review pass after blocking issues are fixed.

## Why review state matters

Full-thesis review often cannot be completed in one session. AI should record `04_review_notes/99_review_state.md`:

- what was reviewed this round
- what remains unfinished
- what evidence is missing
- what prompt should be used next
- what should not be repeated unless the user asks for `ประเมินใหม่ทั้งหมด` or a full reassessment

This helps students continue later without starting over every time.
