# Thesis Review Workspace Instructions

When the user says `ให้ประเมิน`, review this workspace and create review notes before editing any thesis/manuscript source.

## Files

- Use the latest thesis/manuscript version in `input/` unless asked to compare versions.
- Use readable text from `01_working_text/` for review and citation of locations.
- Use references from `02_references/bib/`, PDFs from `02_references/pdf/`, PDF extraction notes from `02_references/extracted_md/`, and official pages from `02_references/official_pages/`.
- Use evidence/results from `03_results/`.
- Write outputs to `04_review_notes/`.
- Use prompts and templates from `prompt_pack/` if available.

## Outputs

Create or update:

- `04_review_notes/00_inventory.md`
- `04_review_notes/01_full_review.md`
- `04_review_notes/02_reference_audit.md`
- `04_review_notes/03_student_action_checklist.md`
- `04_review_notes/99_review_state.md`

## Rules

- Do not invent citations, DOI, venue ranking, paper metadata, results, IRB/legal requirements, or claims.
- If you scan a reference PDF, save one Markdown extraction note per PDF in `02_references/extracted_md/` before using it to fill BibTeX metadata or `abstract`.
- Mark missing information as `missing input`.
- If `04_review_notes/99_review_state.md` exists, continue unfinished items only unless the user says `ให้ประเมินใหม่ทั้งหมด`.
- Do not edit source thesis files unless the user explicitly asks for a revision pass after review notes exist.
