# 02 Reference and BibTeX Review Prompt

ใช้ prompt นี้เมื่อต้องการตรวจ bibliography, BibTeX, citation use, literature clusters หรือเมื่อต้องสร้าง/เติม BibTeX จาก PDF reference

ถ้าใช้ใน workspace AI เช่น Codex หรือ Claude Code และมีการอ่าน PDF reference ให้บันทึกผลอ่านเป็น Markdown หนึ่งไฟล์ต่อหนึ่ง PDF ใน `02_references/extracted_md/` ด้วย ก่อนนำข้อมูลไปเติม `02_references/bib/references.bib`

หลักการสำคัญ:

- ทุก cited key ใน manuscript ต้องมีอยู่จริงใน BibTeX/reference list
- ทุก BibTeX/reference-list entry ควรถูก cite หรือถูก mark ชัดว่า unused/background
- scholarly reference ทุกรายการควรมี source PDF ใน `02_references/pdf/` ถ้าไม่มี ให้ลงรายการเป็น missing PDF และใช้ official page เป็น fallback ได้เฉพาะเมื่อระบุชัด
- BibTeX ที่ครบควรมี author, title, year, venue/journal/conference, DOI หรือ URL, publisher เมื่อเกี่ยวข้อง, pages/article number เมื่อมี, entry type ที่ถูกต้อง, และ abstract เมื่อ abstract มีอยู่ใน supplied PDF หรือ official source
- ห้ามเติม metadata, DOI, abstract, publication status หรือ paper ที่ไม่มีหลักฐานจาก PDF, reference list, หรือ official page ที่ผู้ใช้ให้มา

## Case A: มี BibTeX แล้ว

```text
You are a bibliography auditor for an academic thesis/manuscript.

Context:
- Field/subfield:
- Degree level or manuscript type:
- Target venue or venue category:
- Manuscript title:
- Manuscript abstract:
- Main contribution claimed by the author:

Input BibTeX:
[PASTE BIBTEX HERE]

Tasks:
1. Check every BibTeX entry for metadata quality:
   - author
   - title
   - year
   - venue/journal/conference
   - DOI
   - URL
   - publisher
   - pages/article number
   - entry type
   - abstract field
2. Check source coverage for every entry:
   - matching PDF in 02_references/pdf/
   - matching extraction note in 02_references/extracted_md/ if the PDF was scanned
   - supplied official page if PDF is missing or metadata conflicts
   - source status: PDF_IN_HAND / OFFICIAL_PAGE_ONLY / MISSING_SOURCE / NEEDS_VERIFICATION
3. Identify entries missing abstract.
4. For entries missing abstract, ask for source PDF or official abstract page. Do not fabricate abstracts.
5. If you read or scan source PDFs, create/update one Markdown extraction note per PDF in 02_references/extracted_md/ before using that evidence to fill abstract or metadata.
6. If an internal rationale is needed, put it in note or annote, not in abstract.
7. Normalize obvious BibTeX hygiene issues:
   - DOI should be DOI string, not full https://doi.org URL.
   - URL should go in url field.
   - Citation keys should be stable author-year or semantic keys, not full URL strings.
   - arXiv entries should include eprint, archivePrefix, and primaryClass if known.
8. Cluster references by role:
   - core domain/problem
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
9. Judge whether the reference set is credible for the target venue.
10. Identify missing reference families, not invented individual papers unless verifiable from supplied material.
11. Flag references whose DOI, URL, author list, venue, year, or publication status looks like a placeholder.
12. Identify references that are stronger than the manuscript's actual experiment and therefore raise reviewer expectations.

Output in Thai with English technical names preserved:

## Bibliography Health Summary
## Missing Abstracts
## PDF / Official Source Coverage
## Metadata Problems
## Reference Clusters
## Citation Quality by Cluster
## Direct vs Cross-Domain Support
## Target-Venue Anchors
## Missing Literature Families
## References to Keep
## References to Demote or Replace
## Required PDF / Source Requests
## PDF Extraction Notes Created or Needed
## Revised BibTeX Entries
```

## Case B: ไม่มี BibTeX แต่มี PDF reference

```text
You are creating a thesis bibliography from supplied reference PDFs.

Important rules:
1. Use only the supplied PDFs or official metadata visible in the supplied material.
2. Do not invent author names, titles, venues, DOI, abstracts, or publication status.
3. If metadata is missing from the PDF, mark it as NEEDS_VERIFICATION.
4. Include an abstract field only when the abstract is present in the PDF or official source supplied by the user.
5. For every PDF you read, create a matching Markdown extraction note in 02_references/extracted_md/.
6. Preserve exact title capitalization when needed for proper nouns, dataset names, model names, and acronyms.
7. Treat PDF_IN_HAND as the expected status for scholarly references. If a reference has only an official page and no PDF, mark it OFFICIAL_PAGE_ONLY and list the PDF as still needed unless there is a clear reason no PDF should exist.

Context:
- Field/subfield:
- Degree level or manuscript type:
- Target venue or venue category:
- Manuscript title:
- Manuscript abstract:
- Main contribution claimed by the author:

Supplied PDFs / reference files:
[LIST FILE NAMES OR PASTE PDF TEXT EXTRACTS HERE]

Tasks:
1. Create one Markdown extraction note per PDF in 02_references/extracted_md/.
   Each note should include source PDF filename, title/authors/year/venue/DOI found, abstract evidence if present, pages/sections checked, short topic summary, and uncertainty flags.
2. Create one BibTeX entry per reference.
3. Use stable citation keys, preferably author-year-topic.
4. Add abstract field where available from the PDF or supplied official source.
5. Add note = {NEEDS_VERIFICATION: ...} where metadata is incomplete.
6. After creating BibTeX, cluster references by role in the manuscript.
7. Create a source coverage table with one row per reference: citation key, PDF filename, extraction note, official page, source status, missing fields.
8. Evaluate whether the reference set is sufficient for the field, degree level, and target venue.
9. List PDFs or official metadata pages still needed.

Output:

## PDF Extraction Notes Created
## Created BibTeX
## Source Coverage Table
## Entries Needing Verification
## Reference Clusters
## Coverage Gaps
## Recommended Next Metadata Checks
```

## Case C: ตรวจ citation use ใน manuscript

```text
You are checking whether citations are used properly in a thesis/manuscript.

Inputs:
- Manuscript text:
[PASTE TEXT]

- BibTeX with abstracts:
[PASTE BIBTEX]

Tasks:
1. List bibliography entries that are never cited.
2. List cited keys that are missing from bibliography.
3. List bibliography entries or cited keys with no source PDF in hand.
4. Identify statements that need citation but have none.
5. Identify citations whose abstracts/topics do not support the statement where they are cited.
6. Identify over-citation, citation dumping, and citations used as decoration.
7. Identify claims where a newer, stronger, or more venue-appropriate reference family may be needed.
8. Identify cross-domain citations that need qualification.
9. Produce a table:
   Manuscript claim | Location | Current citation | Key exists in BibTeX? | PDF in hand? | Does it support the claim? | Problem | Fix

Output in Thai.
```
