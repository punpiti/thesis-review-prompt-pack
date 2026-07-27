---
name: thesis-reference-bibtex
description: Use when auditing thesis/manuscript references, checking citation integrity, creating BibTeX from supplied PDFs or official pages, completing BibTeX metadata from evidence, or analyzing a reference set from BibTeX. Supports PDF extraction notes, source coverage tables, citation-to-claim checks, and reference-role clustering.
---

# Thesis Reference and BibTeX

Use this skill when the user asks to:

- ตรวจ ref / ตรวจ reference / ตรวจบรรณานุกรม
- ตรวจ BibTeX หรือสร้าง BibTeX
- เติม metadata หรือ abstract ใน BibTeX จาก PDF/source
- วิเคราะห์ reference set จาก BibTeX
- ตรวจ citation use ใน manuscript
- หา cited keys ที่ไม่มีอยู่จริง
- ตรวจว่า citation รองรับ claim จริงหรือไม่

This skill can run by itself. It does not require a full thesis review first.

## Core Rule

Reference work is evidence-bound. Do not invent author names, titles, venues,
years, DOI, abstracts, publication status, venue ranking, paper metadata, or
replacement references.

Use only:

- manuscript text supplied in the workspace or prompt
- supplied BibTeX/reference lists in `02_references/bib/`
- supplied PDFs in `02_references/pdf/`
- supplied official pages in `02_references/official_pages/`
- extraction notes in `02_references/extracted_md/` only as trace notes back to
  the supplied PDF or official page

## Expected Workspace

```text
02_references/
  bib/
  pdf/
  extracted_md/
  official_pages/
01_working_text/
04_review_notes/
```

## Required Outputs

Default output path for workspace runs:

```text
04_review_notes/02_reference_audit.md
```

When creating or completing BibTeX:

```text
02_references/bib/references.bib
02_references/extracted_md/<one-note-per-pdf>.md
```

Never overwrite an existing `.bib` without preserving the previous content in
the review note or writing a clearly named revised file.

## Workflow A: Reference Audit

Use when BibTeX/reference list already exists.

1. Load manuscript citation locations if available.
2. Load BibTeX/reference list.
3. Inventory PDFs and official pages.
4. Check citation key integrity:
   - cited keys missing from BibTeX/reference list
   - BibTeX/reference-list entries not cited
   - duplicate or unstable citation keys
   - suspicious/hallucinated-looking entries
5. Check source coverage:
   - `PDF_IN_HAND`
   - `OFFICIAL_PAGE_ONLY`
   - `MISSING_SOURCE`
   - `NEEDS_VERIFICATION`
6. Check BibTeX completeness:
   - author
   - title
   - year
   - venue/journal/conference
   - DOI or URL
   - publisher when relevant
   - pages/article number when available
   - entry type
   - abstract when available from supplied evidence
7. Check citation-to-claim fit when manuscript text is available.
8. Cluster references by role.

Write or update `04_review_notes/02_reference_audit.md`.

## Workflow B: Create BibTeX From PDFs / Official Sources

Use when no usable BibTeX exists but PDFs or official pages are supplied.

1. For every PDF read, create one extraction note in
   `02_references/extracted_md/`.
2. Extract only visible metadata from the PDF or supplied official page.
3. Create conservative citation keys, preferably author-year-topic.
4. Add `abstract` only when the abstract is visible in the supplied PDF or
   supplied official source.
5. Mark uncertain metadata with `note = {NEEDS_VERIFICATION: ...}`.
6. Create a source coverage table in `04_review_notes/02_reference_audit.md`.
7. Create or update `02_references/bib/references.bib` only from supported
   evidence.

Do not fill missing metadata from memory.

## Workflow C: Analyze Reference Set From BibTeX

Use when the user asks whether the reference set is strong, complete, credible,
or appropriate for a field/venue.

1. Parse the BibTeX/reference list.
2. Cluster references by research role:
   - core problem domain
   - direct prior work
   - method foundation
   - dataset/benchmark
   - evaluation metric/baseline
   - theory/framework
   - cross-domain conceptual support
   - foundational/math support
   - target-venue anchor
   - implementation/tool citation
   - broad background
   - weak or replaceable reference
3. Assess coverage, directness, recency, and source quality from supplied
   metadata and abstracts only.
4. Identify missing reference families, not invented paper titles or DOI.
5. Flag references that are stronger than the manuscript's actual experiment
   and therefore raise reviewer expectations.

## Workflow D: Citation Use Audit

Use when manuscript text and BibTeX/reference list are both available.

Create a table:

```text
Manuscript claim | Location | Current citation | Key exists in BibTeX? | PDF in hand? | Supports claim? | Problem | Fix
```

Check:

- claims that need citations but have none
- citations that only support a broad area, not the local claim
- decorative citations
- cross-domain citations that need qualification
- citation dumping
- missing direct prior work or baselines

## PDF Extraction Notes

For every PDF you read, create or update one Markdown note in
`02_references/extracted_md/`.

Each note must include:

- source PDF filename
- extraction date or review pass name if available
- title/authors/year/venue/DOI/URL found
- abstract evidence if present
- pages or sections checked
- short topic/contribution summary
- uncertainty flags

The note is not independent evidence. It is a trace back to the supplied PDF or
official page.

## Output Structure

Use these sections in `04_review_notes/02_reference_audit.md`:

```markdown
## Reference Gate Summary
## Citation Key Integrity
## PDF And Official Source Coverage
## BibTeX Completeness
## Citation-To-Claim Fit
## Reference Clusters
## Missing Literature Families
## Required PDF / Source Requests
## Revised BibTeX Entries
## Review State Note
```

Mark the review as `partial` when manuscript citation data, PDFs, official
pages, or BibTeX files are missing.
