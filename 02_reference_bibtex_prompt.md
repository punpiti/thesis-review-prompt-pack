# 02 Reference and BibTeX Review Prompt

ใช้ prompt นี้เมื่อต้องการตรวจ bibliography, BibTeX, citation use, literature clusters หรือเมื่อต้องสร้าง/เติม BibTeX จาก PDF reference

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
2. Identify entries missing abstract.
3. For entries missing abstract, ask for source PDF or official abstract page. Do not fabricate abstracts.
4. If an internal rationale is needed, put it in note or annote, not in abstract.
5. Normalize obvious BibTeX hygiene issues:
   - DOI should be DOI string, not full https://doi.org URL.
   - URL should go in url field.
   - Citation keys should be stable author-year or semantic keys, not full URL strings.
   - arXiv entries should include eprint, archivePrefix, and primaryClass if known.
6. Cluster references by role:
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
7. Judge whether the reference set is credible for the target venue.
8. Identify missing reference families, not invented individual papers unless verifiable from supplied material.
9. Flag references whose DOI, URL, author list, venue, year, or publication status looks like a placeholder.
10. Identify references that are stronger than the manuscript's actual experiment and therefore raise reviewer expectations.

Output in Thai with English technical names preserved:

## Bibliography Health Summary
## Missing Abstracts
## Metadata Problems
## Reference Clusters
## Citation Quality by Cluster
## Direct vs Cross-Domain Support
## Target-Venue Anchors
## Missing Literature Families
## References to Keep
## References to Demote or Replace
## Required PDF / Source Requests
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
5. Preserve exact title capitalization when needed for proper nouns, dataset names, model names, and acronyms.

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
1. Create one BibTeX entry per reference.
2. Use stable citation keys, preferably author-year-topic.
3. Add abstract field where available.
4. Add note = {NEEDS_VERIFICATION: ...} where metadata is incomplete.
5. After creating BibTeX, cluster references by role in the manuscript.
6. Evaluate whether the reference set is sufficient for the field, degree level, and target venue.
7. List PDFs or official metadata pages still needed.

Output:

## Created BibTeX
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
3. Identify statements that need citation but have none.
4. Identify citations whose abstracts/topics do not support the statement where they are cited.
5. Identify over-citation, citation dumping, and citations used as decoration.
6. Identify claims where a newer, stronger, or more venue-appropriate reference family may be needed.
7. Identify cross-domain citations that need qualification.
8. Produce a table:
   Manuscript claim | Current citation | Does it support the claim? | Problem | Fix

Output in Thai.
```

