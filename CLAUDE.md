# Thesis Review Workspace Agent Instructions

Use these instructions when Claude Code opens this prompt pack or a thesis review workspace built from it.

## Core Rule

Create review notes first. Do not edit the thesis/manuscript source file unless the user explicitly asks for a revision pass after review notes exist.

## Expected Workspace

```text
my_thesis_review/
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

Use only the latest thesis/manuscript version unless the user asks to compare versions.

## When User Says "ให้ประเมิน"

1. Inspect the workspace and identify the main document, reference sources, result/evidence files, and existing review notes.
2. If `04_review_notes/99_review_state.md` exists, continue unfinished items only unless the user says `ให้ประเมินใหม่ทั้งหมด`.
3. Use evidence from manuscript text, references, PDFs, official pages, and result files only.
4. Do not invent citations, DOI, venue ranking, paper metadata, results, law, IRB requirement, or claims.
5. If you scan reference PDFs, create or update one Markdown extraction note per PDF in `02_references/extracted_md/` before using that PDF to fill BibTeX `abstract` fields or metadata.
6. Create or update:
   - `04_review_notes/00_inventory.md`
   - `04_review_notes/01_full_review.md`
   - `04_review_notes/02_reference_audit.md`
   - `04_review_notes/03_student_action_checklist.md`
   - `04_review_notes/99_review_state.md`

## Review Priorities

Check research logic before polishing language:

- problem/gap
- objective/RQ
- method
- data/evidence
- result
- claim
- reference support
- ethics/IRB/legal risks
- scope and limitations
- LLM use and document hygiene

## Output Discipline

- Cite manuscript locations when possible: chapter, section, page, paragraph, table, or figure.
- Mark missing information as `missing input`; do not guess.
- Separate blocking issues from minor issues.
- Keep action items concrete enough for a student to execute.

## Reference PDF Extraction Notes

Claude Code, Codex, and similar workspace agents should follow the same convention:

- Keep source PDFs in `02_references/pdf/`.
- Save PDF reading notes in `02_references/extracted_md/`, one `.md` file per PDF.
- Each note should include source PDF filename, title/authors/year/venue/DOI found, abstract evidence if present, pages/sections checked, short topic summary, and uncertainty flags.
- Do not treat `extracted_md/` as independent evidence. It is a trace note back to the supplied PDF or official page.
