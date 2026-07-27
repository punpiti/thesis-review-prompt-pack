# Reference Audit

Use this when creating `04_review_notes/02_reference_audit.md` or building `02_references/bib/references.bib`.

## Evidence Rules

- Use only supplied BibTeX/reference lists, supplied PDFs, and supplied official pages.
- Do not invent author names, title, venue, year, DOI, abstract, ranking, or publication status.
- If metadata is missing, mark `NEEDS_VERIFICATION`.
- Include `abstract` only when visible in a supplied PDF or official source.
- When reading a supplied PDF, save a Markdown trace note in `02_references/extracted_md/` before using it to complete BibTeX metadata or an `abstract` field.
- Treat reference integrity as a gate: every cited key must exist in BibTeX/reference list, and every BibTeX/reference-list entry should be cited or explicitly marked unused/background.
- Treat PDF_IN_HAND as the expected source status for scholarly references. If a PDF is missing, list it as a required source request and record any supplied official page as fallback evidence.

## PDF Extraction Notes

Create one `.md` file per PDF, named from the paper or PDF filename, for example `Smith_2021_topic.md`.

Each note should include:

- source PDF filename
- extraction date or review pass name if available
- title, authors, year, venue, DOI, URL found in the PDF or supplied official page
- abstract evidence if present
- pages or sections checked
- short topic/contribution summary
- uncertainty flags, including missing or conflicting metadata

Do not copy long paper text unnecessarily. The note is a trace back to the supplied PDF/official page, not a new independent source.

## If BibTeX Exists

Check:

- required fields by entry type
- missing `abstract`
- source coverage: PDF in hand, official page fallback, extraction note if PDF was scanned, or missing source
- suspicious DOI, URL, venue, year, or publication type
- duplicate entries
- inconsistent citation keys
- internal rationale incorrectly placed in `abstract` instead of `note` or `annote`

## If No BibTeX Exists

Create `02_references/bib/references.bib` from supplied PDFs and official sources only.

For each entry:

- create or update the matching `02_references/extracted_md/*.md` note if the entry came from a scanned PDF
- generate a conservative citation key
- include fields supported by evidence
- add `abstract` only if available
- mark uncertain metadata as `NEEDS_VERIFICATION`
- list missing PDFs or official pages needed
- create a source coverage table with `PDF_IN_HAND`, `OFFICIAL_PAGE_ONLY`, `MISSING_SOURCE`, or `NEEDS_VERIFICATION`

## Citation Use Audit

Compare references to manuscript text:

- uncited bibliography entries
- cited keys missing from bibliography
- bibliography entries with no PDF in hand or no official fallback
- claims needing citations but lacking citations
- citations that do not support the claim
- decorative citations
- direct prior work vs cross-domain support
- target-venue anchors
- weak/replaceable references

## Output

Include:

- summary judgment of reference quality
- citation key integrity gate
- PDF and official source coverage table
- BibTeX completeness table
- reference clusters by research role
- high-risk metadata issues
- citation support problems
- items to verify from PDFs or official pages
- recommended removals, replacements, or additions without inventing new sources
