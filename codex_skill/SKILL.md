---
name: thesis-review
description: Use when reviewing a thesis, dissertation, thesis-derived manuscript, or student research draft in a Codex or Claude Code style workspace. Supports Thai/English academic review, reference/BibTeX audit, PDF reference extraction notes, research logic traceability, ethics/IRB/legal risk checks, and resumable review notes.
---

# Thesis Review

Use this skill when the user asks to review, evaluate, audit, or continue reviewing a thesis/manuscript workspace.

## Core Rule

Create review notes before editing source files. Never rewrite the thesis/manuscript directly unless the user explicitly requests a revision pass after review notes exist.

## Version / Update Safety

When working in an existing workspace, check `prompt_pack/VERSION.md` if present.
Do not assume older workspaces can be overwritten safely.

- never overwrite thesis/manuscript files, `04_review_notes/`,
  `00_review_instructions/`, or user-edited workspace instructions without
  explicit instruction
- prefer replacing only `prompt_pack/` and preserving old versions as
  `prompt_pack_backup_<timestamp>`
- compare old/new `VERSION.md` and explain whether the update matters for the
  user's current task
- if new AGENTS/CLAUDE workflow would help, propose a patch instead of silently
  replacing workspace files

## Related Reference/BibTeX Skill

Reference work is its own skill-level workflow. If the user asks specifically
to check references, create BibTeX, complete BibTeX metadata, analyze a
reference set from BibTeX, or audit citation use, use the companion
`thesis-reference-bibtex` skill if available. If that standalone skill is not
available in the current agent, follow `references/reference-audit.md` from this
skill.

Do not force a full thesis review before doing reference/BibTeX work.

## Focused Review Skills

This pack treats major review areas as separate skills. Use the focused skill
when the user asks for that section, or when the overview review determines the
section is mature enough:

- `thesis-overview-review`: overall routing/readiness view; decides which focused skills are applicable.
- `research-workflow-router`: broad research lifecycle router when the request spans multiple stages or is unclear.
- `thesis-title-abstract-outcome`: title, abstract, expected output/outcome, contribution snapshot.
- `thesis-proposal-readiness`: early research proposal, topic proposal, concept note, proposal-stage alignment and missing inputs.
- `research-question-hypothesis`: RQ refinement, hypothesis generation, variables, testability, scope options.
- `thesis-introduction-review`: introduction, problem statement, motivation, scope, objectives/RQs.
- `thesis-literature-review`: literature review, research problem discovery, research gap understanding.
- `systematic-review-protocol`: formal SLR/scoping-review protocol, search strategy, screening/extraction plan.
- `thesis-experiment-design`: method/evaluation plan, baselines, metrics, genuine failure, reproducibility.
- `research-data-analysis-interpretation`: statistical analysis plan, result interpretation, visualization, robustness, evidence-to-claim alignment.
- `research-manuscript-revision-submission`: manuscript self-review, submission package, reviewer response.
- `research-collaboration-productivity`: advisor/collaboration communication, meeting prep, action tracking.
- `latex-document-production`: LaTeX install/build, venue templates, Thai/English fonts, glyph/math issues, tables, and final PDF layout QA.
- `thesis-reference-bibtex`: reference audit, BibTeX creation/analysis, citation-use audit.
- `thesis-venue-status-prognosis`: venue/category selection, readiness verdict, and qualitative end-of-review prognosis.

Do not rush to review a section that is not drafted or not mature enough. Mark
it `not ready for this skill` and list the minimum missing inputs.

## L1-L4 Review Model

- L1 = agentic execution from supplied files: inventory, section map, review notes, reference audit, PDF extraction notes, and action checklist.
- L2 = human academic judgment: advisor/student decisions about scope, positioning, target venue, ethical judgment, and which fixes to make.
- L3 = external evidence/feedback: committee/reviewer input, student/user/expert validation, experiment results, surveys/interviews, venue instructions, or live metadata verification.
- L4 = local evidence/resource layer: manuscript files, BibTeX, PDFs in hand, official pages, results, scripts/logs, and machine-specific paths actually available in the workspace.

Do not treat L1 review output as proof that L2/L3 is resolved. Missing L4 evidence must be recorded as missing input.

## Topic Hierarchy

Review at the smallest defensible level:

```text
document -> chapter/section -> subsection/paragraph -> claim/evidence -> citation/BibTeX/PDF
```

For every blocking issue, cite the most specific location available.

## Expected Workspace

```text
input/
00_inbox/
00_review_instructions/
01_working_text/
02_references/
  bib/
  pdf/
  extracted_md/
  official_pages/
03_results/
04_review_notes/
prompt_pack/
```

Use the latest version in `input/` unless the user asks for revision comparison.

## Init Workspace From Inbox

When the user says `init workspace จากไฟล์รวม`, inspect `00_inbox/`, create missing folders, and copy files into the proper workspace locations without deleting originals.

Create/update `00_review_instructions/file_inventory.md` with source path, target path, inferred file role, and uncertainty. If classification is unclear, keep the file in `00_inbox/` and mark `needs classification`.

Routing:

- latest thesis/manuscript drafts -> `input/v02_revised/`
- older/original drafts -> `input/v01_original/`
- readable `.tex`, `.md`, `.txt` thesis text -> `01_working_text/`
- `.bib`, `.ris`, `.enw`, reference lists -> `02_references/bib/`
- paper/reference PDFs -> `02_references/pdf/`
- DOI/publisher/official abstract pages -> `02_references/official_pages/`
- datasets, tables, figures, logs, scripts, metrics, baselines, result evidence -> `03_results/`

## Instruction Folder First

Before full review, load `00_review_instructions/`.

If `review_profile.md` or `document_map.md` is missing or stale, inspect the latest work from `input/` and `01_working_text/`; for LaTeX, find the root `.tex`, follow `\input{}` and `\include{}` as needed, and create/update:

- `00_review_instructions/review_profile.md`
- `00_review_instructions/document_map.md`
- `00_review_instructions/review_scope.md`
- `00_review_instructions/missing_inputs.md`

Use only workspace evidence and mark unavailable facts as `missing input`.

## Main Trigger

When the user says `init workspace จากไฟล์รวม`, organize files from `00_inbox/` first. Do not review yet.

When the user asks only for reference/BibTeX work, run the reference workflow
instead of the full thesis review workflow:

- `ตรวจ ref`, `ตรวจ reference`, `ตรวจ bibliography` -> create/update `04_review_notes/02_reference_audit.md`
- `สร้าง BibTeX` -> create/update `02_references/bib/references.bib` from supplied PDFs/official pages only
- `วิเคราะห์ ref จาก BibTeX` -> cluster and assess the reference set from supplied BibTeX
- `ตรวจ citation` -> compare manuscript claims/cited keys against BibTeX and source PDFs

When the user says `เตรียม instruction จากงานปัจจุบัน`, create/update only:

- `00_review_instructions/review_profile.md`
- `00_review_instructions/document_map.md`
- `00_review_instructions/review_scope.md`
- `00_review_instructions/missing_inputs.md`

Read the latest thesis/manuscript files, including LaTeX roots and included files if applicable. Do not create full review notes and do not edit thesis/manuscript files in this step.

When the user says `ประเมิน`:

1. Inspect the workspace.
2. Load or create `00_review_instructions/` files first.
3. Read existing `04_review_notes/99_review_state.md` if present.
4. Continue unfinished items only, unless the user says `ประเมินใหม่ทั้งหมด`.
5. Use `thesis-overview-review` if available to decide which focused skills are applicable. Always check title/abstract/expected outcome first if present. Skip sections that are not ready rather than producing speculative criticism. Use `thesis-venue-status-prognosis` near the end only when there is enough evidence for a qualitative readiness/venue judgment.
6. Create or update:
   - `04_review_notes/00_inventory.md`
   - `04_review_notes/01_full_review.md`
   - `04_review_notes/02_reference_audit.md`
   - `04_review_notes/03_student_action_checklist.md`
   - `04_review_notes/99_review_state.md`

When the user says `ประเมินเชิงลึก`:

1. Confirm that `04_review_notes/01_full_review.md` and `04_review_notes/02_reference_audit.md` exist. If not, run the normal `ประเมิน` workflow first.
2. If the draft is still early, or references/results are too thin for a meaningful attack, tell the user to fix blocking issues from the normal review first instead of producing a long missing-input-only deep review.
3. Read `prompt_pack/06_deep_doctoral_review_prompt.md` if available.
4. Create or update `04_review_notes/04_deep_review.md` with source triangulation, recent-literature/consensus gaps, strongest counter-arguments, claim credibility audit, data/result interpretation, decisive tests, and a short decision brief.
5. Add any new actions to `04_review_notes/03_student_action_checklist.md` and update `04_review_notes/99_review_state.md`.
6. Do not invent current consensus, papers, DOI, venue status, law, standards, or dataset updates. Mark unsupported external checks as `missing input` or `needs live verification`.

## Evidence Rules

- Use only manuscript text, supplied references, supplied PDFs, official pages, and supplied result files.
- Do not invent citations, DOI, paper metadata, venue ranking, metrics, law, IRB requirements, results, or claims.
- If evidence is missing, write `missing input` and explain why it matters.
- Distinguish manuscript evidence, reference evidence, and reviewer interpretation.
- When scanning reference PDFs, save one Markdown extraction note per PDF in `02_references/extracted_md/` before using extracted evidence to fill BibTeX metadata or `abstract` fields.
- Every cited key must exist in the BibTeX/reference list.
- Every BibTeX/reference-list entry should be cited or explicitly marked unused/background.
- Every scholarly reference should have a source PDF in `02_references/pdf/` whenever possible. If no PDF is available, record the missing PDF and any official-source fallback in `04_review_notes/02_reference_audit.md`.
- BibTeX metadata must be traceable to supplied PDFs, supplied reference lists, or supplied official pages. Mark unsupported metadata as `NEEDS_VERIFICATION`.

## What To Load When Needed

- For full thesis/manuscript review criteria, read `references/full-review-rubric.md`.
- For reference and BibTeX audit criteria, read `references/reference-audit.md`.
- For resumable state note structure, read `references/review-state.md`.

## Review Order

1. Inventory and missing inputs.
2. Overview maturity gate: decide which focused skills can be run from current evidence.
3. Title and abstract first pass, if either exists. Use them to understand the intended problem, field, method, evidence, and contribution, but keep title/abstract criticism separate from deeper method/result criticism.
4. Proposal readiness review, if the work is a proposal/concept note or lacks mature thesis sections.
5. Introduction review, if the introduction exists.
6. Literature review, if there is enough related-work text to judge problem/gap discovery.
7. Experiment design review, only if method/data/baseline/metric/evaluation evidence exists.
8. Reference/BibTeX audit, if references, BibTeX, PDFs, or citation text exist.
9. Venue/status/prognosis review, only if field, contribution, evidence state, and target venue/category information are sufficient.
10. Cross-section coherence and action checklist.
11. Next-state note, including which focused skills are done, partial, skipped, or not ready.

## Output Style

Write review notes in Thai. Keep technical terms, paper titles, venue names, datasets, metrics, and method names in English where clearer.

## Companion Research Methodology Frame

If the prompt pack includes the public Research Methodology for AI-Assisted Thesis Review handout, use it as a review-question frame only. Do not treat it as evidence about the student's study.

Apply this minimum argument chain:

```text
Problem -> Prior attempts/evidence -> Unresolved need/gap -> Objective/RQ -> Alternatives/selection rationale -> Method -> Result/evidence -> Output -> Outcome/by-product -> Conclusion
```

Separate `output` from `outcome`: output is direct evidence that the defined problem was solved according to the objective; outcome is what follows after problem resolution and must be measured before it is claimed.
