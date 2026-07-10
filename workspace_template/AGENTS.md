# Thesis Review Workspace Instructions

When the user says `ประเมิน`, review this workspace and create review notes before editing any thesis/manuscript source.

## Files

- If files are mixed in `00_inbox/`, organize them first when the user says `init workspace จากไฟล์รวม`.
- Use the latest thesis/manuscript version in `input/` unless asked to compare versions.
- Load `00_review_instructions/` first. If profile/map/scope files are missing or stale, create them from the current workspace before full review.
- Use readable text from `01_working_text/` for review and citation of locations.
- Use references from `02_references/bib/`, PDFs from `02_references/pdf/`, PDF extraction notes from `02_references/extracted_md/`, and official pages from `02_references/official_pages/`.
- Use evidence/results from `03_results/`.
- Write outputs to `04_review_notes/`.
- Use prompts and templates from `prompt_pack/` if available.

## Init Workspace

When the user says `init workspace จากไฟล์รวม`, inspect `00_inbox/`, create missing folders, and copy files to the likely target folders. Do not delete originals in `00_inbox/`.

- latest thesis/manuscript drafts -> `input/v02_revised/`
- older/original drafts -> `input/v01_original/`
- readable `.tex`, `.md`, `.txt` thesis text -> `01_working_text/`
- `.bib`, `.ris`, `.enw`, reference lists -> `02_references/bib/`
- paper/reference PDFs -> `02_references/pdf/`
- DOI/publisher/official abstract pages -> `02_references/official_pages/`
- datasets, tables, figures, logs, scripts, metrics, baselines, result evidence -> `03_results/`

Create or update `00_review_instructions/file_inventory.md`. If uncertain, leave the file in `00_inbox/` and mark `needs classification`.

## Instruction Folder

When the user says `เตรียม instruction จากงานปัจจุบัน`, create or update only the instruction folder files below. Do not create full review notes yet.

Before full review, create or update:

- `00_review_instructions/review_profile.md`
- `00_review_instructions/document_map.md`
- `00_review_instructions/review_scope.md`
- `00_review_instructions/missing_inputs.md`

If the current work is LaTeX, find the root `.tex`, follow `\input{}` and `\include{}` as needed, and identify bibliography files. Do not edit source files while preparing instruction files.

## Outputs

Create or update:

- `04_review_notes/00_inventory.md`
- `04_review_notes/01_full_review.md`
- `04_review_notes/02_reference_audit.md`
- `04_review_notes/03_student_action_checklist.md`
- `04_review_notes/99_review_state.md`

## Review Priorities

Check research logic before polishing language:

- problem survival: the problem exists, matters, remains unresolved, and is not already solved adequately by simpler existing approaches
- objective/RQ alignment
- genuine failure: the study has possible evidence that would make the answer "No"
- mandatory gates: correctness, safety, security, legal/ethical compliance, capacity, or maximum-error gates pass before optimization metrics matter
- measurement ceiling: constructs, proxies/indicators, instruments/ground truth, procedures, and claims are aligned
- no-new-problem guardrail: the solution does not create or transfer unacceptable privacy, security, cost, fairness, accessibility, maintenance, energy, or stakeholder burden
- reference support, ethics/IRB/legal risks, scope/limitations, LLM use, and document hygiene

## Rules

- Do not invent citations, DOI, venue ranking, paper metadata, results, IRB/legal requirements, or claims.
- Fill `00_review_instructions/` from workspace evidence only. Mark unavailable facts as `missing input`.
- If you scan a reference PDF, save one Markdown extraction note per PDF in `02_references/extracted_md/` before using it to fill BibTeX metadata or `abstract`.
- Mark missing information as `missing input`.
- If `04_review_notes/99_review_state.md` exists, continue unfinished items only unless the user says `ประเมินใหม่ทั้งหมด`.
- Do not edit source thesis files unless the user explicitly asks for a revision pass after review notes exist.
