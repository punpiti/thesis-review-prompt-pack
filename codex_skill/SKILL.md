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

## Main Trigger

When the user says `ให้ประเมิน`:

1. Inspect the workspace.
2. Read existing `04_review_notes/99_review_state.md` if present.
3. Continue unfinished items only, unless the user says `ให้ประเมินใหม่ทั้งหมด`.
4. Create or update:
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
