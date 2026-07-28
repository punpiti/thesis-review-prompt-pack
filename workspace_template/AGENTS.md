# Thesis Review Workspace Instructions

When the user says `ประเมิน`, review this workspace and create review notes before editing any thesis/manuscript source. This workspace is for student review and feedback, not automatic rewriting or automatic improvement. Point out weaknesses, recommend next checks, and leave revision decisions to the student/author.

## Prompt Pack Version / Update Safety

If this workspace already has `prompt_pack/VERSION.md`, check it before
adopting new workflow instructions. If internet access is available or the user
asks to check for updates, compare it with the GitHub Pages version:

- `https://punpiti.github.io/thesis-review-prompt-pack/VERSION.md`

Do not overwrite thesis source files, `04_review_notes/`,
`00_review_instructions/`, or user-edited `AGENTS.md` / `CLAUDE.md` without
explicit instruction.

When updating, prefer replacing only `prompt_pack/` after preserving the old one
as `prompt_pack_backup_<timestamp>`. Keep or create update notes such as
`PROMPT_PACK_UPDATE_NOTES_<timestamp>.md`. If new workflow concepts, gates,
skills, or safety rules are useful, summarize the difference and propose a small
patch to workspace-level instructions instead of replacing them wholesale. Keep
rules and workflows the user has already used unless the user explicitly decides
to replace them.

## L1-L4 Review Model

- L1 = AI can execute now: file inventory, section map, review notes, reference audit, PDF extraction notes, and action checklist.
- L2 = human academic judgment: advisor/student decisions about research scope, target venue, positioning, tone, ethical judgment, and what to revise.
- L3 = external feedback/data: committee/reviewer comments, student/user/expert validation, experiment results, survey/interview data, venue instructions, or live metadata verification.
- L4 = local evidence/resource layer: manuscript files, BibTeX, PDFs in hand, official pages, result artifacts, scripts/logs, and machine-specific paths available in this workspace.

Do not treat L1 review work as proof that L2/L3 questions are resolved. Do not treat missing L4 evidence, especially missing PDFs or result files, as available evidence.

## Topic Hierarchy

Review and report at the smallest level supported by evidence:

- document -> chapter/section -> subsection/paragraph -> claim/evidence -> citation/BibTeX/PDF

For each blocking issue, cite the most specific location available and mark missing location detail as `missing input`.

## Reference/BibTeX Skill Routing

If the user asks only for reference work, do that directly without running a
full thesis review first:

- `ตรวจ ref`, `ตรวจ reference`, `ตรวจ bibliography` -> update `04_review_notes/02_reference_audit.md`
- `สร้าง BibTeX` -> create/update `02_references/bib/references.bib` from supplied PDFs/official pages only
- `วิเคราะห์ ref จาก BibTeX` -> assess and cluster the supplied BibTeX reference set
- `ตรวจ citation` -> compare manuscript claims/cited keys against BibTeX and source PDFs

Use `prompt_pack/02_reference_bibtex_prompt.md` or the standalone
`thesis-reference-bibtex` skill if available.

## Focused Review Skill Routing

Use focused section workflows when the user asks for a section, or when the
overview pass says the section is ready:

- broad research lifecycle / "ควรใช้ skill ไหน" -> route first
- overview / `ประเมินภาพรวม` / `ประเมิน` -> decide which sections are ready
- title, abstract, expected outcome/result -> title/abstract/outcome review
- proposal / concept note / โครงร่างวิจัย -> proposal readiness review
- RQ / hypothesis / variables / testability -> RQ/hypothesis review
- introduction / บทนำ / problem statement / objective/RQ -> introduction review
- literature review / related work / research gap -> literature review
- systematic review / scoping review / SLR protocol -> systematic-review protocol review
- experiment design / methodology evaluation / baseline / metric -> experiment design review
- data analysis / result interpretation / visualization -> data analysis/interpretation review
- manuscript revision / submission / reviewer response -> manuscript revision/submission review
- collaboration / advisor meeting / productivity plan -> coordination/productivity review
- LaTeX install/build / venue template / Thai font / PDF layout -> LaTeX document production
- references / BibTeX / citation use -> reference/BibTeX review
- venue selection / publication fit / readiness verdict / qualitative prognosis -> venue/status/prognosis review

Do not rush to review sections that are not drafted or do not have enough
evidence. Mark them as `not ready for this skill` and list the missing inputs.
Run venue/status/prognosis near the end only when the reviewed evidence is
sufficient. Mark venue metrics/rankings as `needs live verification` unless the
workspace supplies verified sources.

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

When the user says `ประเมินเชิงลึก`, use the initial review notes and `prompt_pack/06_deep_doctoral_review_prompt.md` if available. If the draft is still early or references/results are too thin, tell the user to fix blocking issues from the normal review first. Otherwise create or update `04_review_notes/04_deep_review.md`, then add any new actions to `04_review_notes/03_student_action_checklist.md` and update `04_review_notes/99_review_state.md`.

## Review Priorities

Check research logic before polishing language:

- title and abstract first pass, if present, to understand the main intended problem and contribution while keeping this critique separate from deeper sections
- topic hierarchy and L1-L4 status
- problem survival: the problem exists, matters, remains unresolved, and is not already solved adequately by simpler existing approaches
- literature review as research-problem and research-gap discovery, not only a paper summary or citation list
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
- Every cited key must exist in the BibTeX/reference list. Every BibTeX/reference-list entry should be cited or explicitly marked as unused/background.
- Every scholarly reference should have a source PDF in `02_references/pdf/` whenever possible. Missing PDFs must be listed in `04_review_notes/02_reference_audit.md`; official pages are fallback evidence, not a reason to pretend the PDF is in hand.
- BibTeX metadata must be traceable to supplied PDFs, supplied reference lists, or supplied official pages. Mark incomplete metadata as `NEEDS_VERIFICATION`; never fill it from memory.
- Mark missing information as `missing input`.
- If `04_review_notes/99_review_state.md` exists, continue unfinished items only unless the user says `ประเมินใหม่ทั้งหมด`.
- For `ประเมินเชิงลึก`, do not invent current consensus, papers, DOI, venue status, law, standards, or dataset updates. Mark unsupported external checks as `missing input` or `needs live verification`.
- Do not edit source thesis files unless the user explicitly asks for a revision pass after review notes exist.
