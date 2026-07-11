---
name: thesis-review
description: Use when reviewing a thesis, dissertation, thesis-derived manuscript, or student research draft in a Codex or Claude Code style workspace. Supports Thai/English academic review, reference/BibTeX audit, PDF reference extraction notes, research logic traceability, ethics/IRB/legal risk checks, and resumable review notes.
---

# Thesis Review

Use this skill when the user asks to review, evaluate, audit, or continue reviewing a thesis/manuscript workspace.

## Core Rule

Create review notes before editing source files. Never rewrite the thesis/manuscript directly unless the user explicitly requests a revision pass after review notes exist.

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
5. Create or update:
   - `04_review_notes/00_inventory.md`
   - `04_review_notes/01_full_review.md`
   - `04_review_notes/02_reference_audit.md`
   - `04_review_notes/03_student_action_checklist.md`
   - `04_review_notes/99_review_state.md`

## Evidence Rules

- Use only manuscript text, supplied references, supplied PDFs, official pages, and supplied result files.
- Do not invent citations, DOI, paper metadata, venue ranking, metrics, law, IRB requirements, results, or claims.
- If evidence is missing, write `missing input` and explain why it matters.
- Distinguish manuscript evidence, reference evidence, and reviewer interpretation.
- When scanning reference PDFs, save one Markdown extraction note per PDF in `02_references/extracted_md/` before using extracted evidence to fill BibTeX metadata or `abstract` fields.

## What To Load When Needed

- For full thesis/manuscript review criteria, read `references/full-review-rubric.md`.
- For reference and BibTeX audit criteria, read `references/reference-audit.md`.
- For resumable state note structure, read `references/review-state.md`.

## Review Order

1. Inventory and missing inputs.
2. Research logic and traceability.
3. Literature and references.
4. Method, data, baseline, evaluation, and feasibility.
5. Ethics/IRB/legal and LLM responsibility.
6. Writing/document hygiene, tables, and figures.
7. Action checklist and next-state note.

## Output Style

Write review notes in Thai. Keep technical terms, paper titles, venue names, datasets, metrics, and method names in English where clearer.

## Companion Research Methodology Frame

If the prompt pack includes the public Research Methodology for AI-Assisted Thesis Review handout, use it as a review-question frame only. Do not treat it as evidence about the student's study.

Apply this minimum argument chain:

```text
Problem -> Prior attempts/evidence -> Unresolved need/gap -> Objective/RQ -> Alternatives/selection rationale -> Method -> Result/evidence -> Output -> Outcome/by-product -> Conclusion
```

Separate `output` from `outcome`: output is direct evidence that the defined problem was solved according to the objective; outcome is what follows after problem resolution and must be measured before it is claimed.
