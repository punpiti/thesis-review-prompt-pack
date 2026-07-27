# Thesis Review Workspace Agent Instructions

Use these instructions when an AI coding/workspace agent opens this prompt pack or a thesis review workspace built from it.

## Core Rule

Create review notes first. This pack is for student review and feedback, not automatic source improvement. The agent should point out weaknesses, recommend next checks, and leave revision decisions to the student/author. Do not edit the thesis/manuscript source file unless the user explicitly asks for a revision pass after review notes exist.

## Thesis Review Loop Model

Use the Agent Project Kit L1-L4 framing inside thesis review workspaces:

- L1 = agentic review execution: inventory files, read manuscript text, map sections, create review notes, audit BibTeX, extract PDF notes, and draft action checklists.
- L2 = human academic judgment: advisor/student decisions about research positioning, acceptable scope, venue ambition, tone, institutional constraints, ethics judgment, and which fixes to actually make.
- L3 = external evidence/feedback: reviewer comments, committee feedback, student/user/expert validation, experiment results, survey/interview data, official venue guidance, and live metadata verification.
- L4 = local evidence and portability layer: workspace files, PDFs in hand, official pages, result artifacts, local scripts/logs, machine-specific paths, and whether required evidence is actually available on the current machine.

Do not claim that L2 or L3 is solved because L1 review notes look complete. Do not treat missing L4 files, especially missing reference PDFs or result evidence, as if the evidence exists.

## Topic Hierarchy For Review Notes

Track weaknesses at the smallest defensible level:

- document level: overall readiness, field, degree level, target venue, ethics/legal posture, and document hygiene.
- chapter/section level: Introduction, Related Work, Method, Results, Discussion, References, appendix, and any local thesis template sections.
- subsection/paragraph level: local argument flow, unsupported statements, unclear definitions, forward references, and misplaced content.
- claim/evidence level: each important claim must map to manuscript evidence, citation evidence, data/result evidence, or `missing input`.
- citation/BibTeX/PDF level: each cited key must exist in the bibliography, each bibliography entry should be supported by a source PDF or official page, and each citation must support the local claim.

When reporting an issue, cite the most specific location available. If only a higher-level location is available, mark the location precision as chapter/section/page/paragraph/unknown.

## Reference/BibTeX Skill Routing

Reference work should be available as a skill-level workflow, not only as one
section inside full thesis review. If the environment has the standalone
`thesis-reference-bibtex` skill, use it for:

- `ตรวจ ref`, `ตรวจ reference`, `ตรวจ bibliography`
- `สร้าง BibTeX`
- completing BibTeX metadata or abstracts from supplied PDFs/official pages
- analyzing a reference set from BibTeX
- citation-use audit against manuscript text

If the standalone skill is not installed, follow
`codex_skill/references/reference-audit.md` or
`prompt_pack/02_reference_bibtex_prompt.md`. Do not require a full thesis review
before performing a reference/BibTeX audit.

## Focused Review Skill Routing

Treat major review areas as separate skill-level workflows:

- broad research lifecycle / "ควรใช้ skill ไหน" -> `research-workflow-router`
- overview / `ประเมินภาพรวม` / `ประเมิน` -> `thesis-overview-review`
- title, abstract, expected outcome/result -> `thesis-title-abstract-outcome`
- proposal / concept note / โครงร่างวิจัย -> `thesis-proposal-readiness`
- RQ / hypothesis / variables / testability -> `research-question-hypothesis`
- introduction / บทนำ / problem statement / objective/RQ -> `thesis-introduction-review`
- literature review / related work / research gap -> `thesis-literature-review`
- systematic review / scoping review / SLR protocol -> `systematic-review-protocol`
- experiment design / methodology evaluation / baseline / metric -> `thesis-experiment-design`
- data analysis / result interpretation / visualization -> `research-data-analysis-interpretation`
- manuscript revision / submission / reviewer response -> `research-manuscript-revision-submission`
- collaboration / advisor meeting / productivity plan -> `research-collaboration-productivity`
- LaTeX install/build / venue template / Thai font / PDF layout -> `latex-document-production`
- references / BibTeX / citation use -> `thesis-reference-bibtex`
- venue selection / publication fit / readiness verdict / qualitative prognosis -> `thesis-venue-status-prognosis`

The overview skill should decide which focused skills are ready based on the
current draft. Do not rush to review sections that do not exist or lack minimum
evidence; mark them as `not ready for this skill` and list the missing inputs.
Venue/status prognosis should run near the end and only from evidence already
reviewed; mark venue rankings/metrics/scope claims as `needs live verification`
unless supplied by the user.

## Expected Workspace

```text
my_thesis_review/
  00_inbox/
  input/
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

Use only the latest thesis/manuscript version unless the user asks to compare versions.

## Prompt Pack Version / Update Safety

When opening an existing workspace, check `prompt_pack/VERSION.md` if present.
If the installed prompt pack is older than the current package, do not blindly
overwrite workspace files. Treat the workspace as student work:

- never overwrite thesis/manuscript files, `04_review_notes/`, `00_review_instructions/`, or user-edited `AGENTS.md`/`CLAUDE.md` without explicit instruction;
- prefer updating or replacing only `prompt_pack/`;
- preserve any old `prompt_pack` as `prompt_pack_backup_<timestamp>`;
- summarize version differences and recommend whether an update is useful;
- if workflow instructions changed, propose a small manual patch or ask before
  refreshing workspace `AGENTS.md`/`CLAUDE.md`.

Use this prompt when needed:

```text
เช็คเวอร์ชัน prompt_pack/VERSION.md เทียบกับ workspace instructions ปัจจุบัน
บอกว่าควรอัปเดต workflow ไหม
ห้ามทับ thesis source, review notes, หรือไฟล์ instruction ที่มีงานค้างโดยไม่ถามก่อน
```

## Init Workspace From Inbox

When the user says `init workspace จากไฟล์รวม`, inspect `00_inbox/` and organize files into the workspace.

Rules:

- Create missing folders if needed.
- Copy files from `00_inbox/` to target folders; do not delete originals unless the user explicitly asks.
- Put latest thesis/manuscript drafts in `input/v02_revised/`.
- Put older/original drafts in `input/v01_original/` when clear from filename/date.
- Put readable `.tex`, `.md`, `.txt` thesis text in `01_working_text/`.
- Put `.bib`, `.ris`, `.enw`, or reference lists in `02_references/bib/`.
- Put paper/reference PDFs in `02_references/pdf/`.
- Put DOI pages, publisher pages, and official abstracts in `02_references/official_pages/`.
- Put datasets, tables, figures, logs, scripts, metrics, baselines, and result evidence in `03_results/`.
- If uncertain, leave the file in `00_inbox/` and list it in `00_review_instructions/missing_inputs.md` or `04_review_notes/00_inventory.md` as `needs classification`.
- Create or update `00_review_instructions/file_inventory.md` with source path, target path, file role, and uncertainty.

## Instruction Folder First

Before a full review, load `00_review_instructions/`.

If `00_review_instructions/review_profile.md` or `00_review_instructions/document_map.md` is missing or stale:

1. Inspect the latest work from `input/` and `01_working_text/`.
2. If the current work is LaTeX, find the root `.tex` file, follow `\input{}` and `\include{}` where needed, and identify bibliography files without editing source files.
3. Create or update:
   - `00_review_instructions/review_profile.md`
   - `00_review_instructions/document_map.md`
   - `00_review_instructions/review_scope.md`
   - `00_review_instructions/missing_inputs.md`
4. Fill these files from workspace evidence only. Mark unavailable facts as `missing input`.

## When User Says "ประเมิน"

1. Inspect the workspace and identify the main document, reference sources, result/evidence files, and existing review notes.
2. Load or create the instruction files in `00_review_instructions/` before full review.
3. If `04_review_notes/99_review_state.md` exists, continue unfinished items only unless the user says `ประเมินใหม่ทั้งหมด`.
4. Use evidence from manuscript text, references, PDFs, official pages, result files, and the generated instruction files only.
5. Do not invent citations, DOI, venue ranking, paper metadata, results, law, IRB requirement, or claims.
6. Treat reference integrity as a gate:
   - every cited key in the manuscript must exist in BibTeX/reference list;
   - every BibTeX/reference-list entry should either be cited or explicitly marked as background/unused;
   - every scholarly reference should have a matching source PDF in `02_references/pdf/` whenever possible;
   - if a PDF is unavailable, record the missing PDF and any official page used as a fallback in `04_review_notes/02_reference_audit.md`;
   - do not accept a citation, DOI, title, venue, year, or abstract that cannot be traced to a supplied PDF, supplied BibTeX/reference list, or supplied official page.
7. If you scan reference PDFs, create or update one Markdown extraction note per PDF in `02_references/extracted_md/` before using that PDF to fill BibTeX `abstract` fields or metadata.
8. Create or update:
   - `04_review_notes/00_inventory.md`
   - `04_review_notes/01_full_review.md`
   - `04_review_notes/02_reference_audit.md`
   - `04_review_notes/03_student_action_checklist.md`
   - `04_review_notes/99_review_state.md`

## When User Says "ประเมินเชิงลึก"

1. Confirm that initial review notes exist, especially `04_review_notes/01_full_review.md` and `04_review_notes/02_reference_audit.md`. If they do not exist, do the normal `ประเมิน` workflow first.
2. If the draft is still early, or references/results are too thin for a meaningful attack, tell the user to fix blocking issues from the normal review first instead of producing a long missing-input-only deep review.
3. Load `prompt_pack/06_deep_doctoral_review_prompt.md` if available.
4. Use the existing review notes plus workspace evidence to run a deeper doctoral-level pass: source triangulation, recent literature/consensus gaps, strongest counter-arguments, claim credibility, data/result interpretation, decisive failure tests, and a short decision brief.
5. Do not invent current consensus, papers, DOI, venue status, law, standards, or dataset updates. If live verification is needed and unavailable, mark it as `missing input` or `needs live verification`.
6. Create or update:
   - `04_review_notes/04_deep_review.md`
   - `04_review_notes/03_student_action_checklist.md`
   - `04_review_notes/99_review_state.md`

## When User Says "เตรียม instruction จากงานปัจจุบัน"

Create or update only the instruction folder files:

- `00_review_instructions/review_profile.md`
- `00_review_instructions/document_map.md`
- `00_review_instructions/review_scope.md`
- `00_review_instructions/missing_inputs.md`

Read the latest thesis/manuscript files, including LaTeX roots and included files if applicable. Do not create full review notes and do not edit thesis/manuscript files in this step.

## Review Priorities

Check research logic before polishing language:

- title and abstract first pass, if present, to understand the main intended problem and contribution while keeping this critique separate from deeper sections
- topic hierarchy: document -> chapter/section -> subsection/paragraph -> claim/evidence -> citation/BibTeX/PDF
- L1/L2/L3/L4 status: what AI reviewed, what needs human academic judgment, what needs external feedback/verification, and what local evidence files are missing
- problem/gap
- literature review as research-problem and research-gap discovery, not only a paper summary or citation list
- problem survival: the problem exists, matters, remains unresolved, and is not already solved adequately by simpler existing approaches
- objective/RQ
- method
- genuine failure: the study has possible evidence that would make the answer "No"
- mandatory gates: correctness, safety, security, legal/ethical compliance, capacity, or maximum-error gates pass before optimization metrics matter
- data/evidence
- measurement ceiling: constructs, proxies/indicators, instruments/ground truth, procedures, and claims are aligned
- result
- claim
- no-new-problem guardrail: the solution does not create or transfer unacceptable privacy, security, cost, fairness, accessibility, maintenance, energy, or stakeholder burden
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

Codex, Claude Code, and similar workspace agents should follow the same convention:

- Keep source PDFs in `02_references/pdf/`.
- Save PDF reading notes in `02_references/extracted_md/`, one `.md` file per PDF.
- Each note should include source PDF filename, title/authors/year/venue/DOI found, abstract evidence if present, pages/sections checked, short topic summary, and uncertainty flags.
- Do not treat `extracted_md/` as independent evidence. It is a trace note back to the supplied PDF or official page.

## Reference Integrity Gate

`04_review_notes/02_reference_audit.md` must explicitly check:

- cited keys missing from BibTeX/reference list;
- BibTeX/reference-list entries not cited in the manuscript;
- bibliography entries with no PDF in `02_references/pdf/`;
- entries relying only on an official page, DOI page, or publisher page because the PDF is missing;
- incomplete BibTeX metadata, including missing author, title, year, venue, DOI/URL, pages/article number, publisher when relevant, and abstract when available from supplied evidence;
- citation-to-claim fit: whether the cited source supports the exact sentence/paragraph where it is cited;
- suspicious or hallucinated-looking references, including entries that cannot be traced to supplied PDFs, official pages, or the manuscript's existing bibliography.

If the reference gate cannot be completed, mark the review state as `partial` and list the missing PDFs, official pages, or manuscript citation data needed for the next pass.

<!-- BEGIN COMPUTING-ENVIRONMENT -->

## Computing Environment Rules

Self-hosting guard: if this project is the Agent Project Kit source repository
itself, including the legacy `computing-environment` folder, use root-level
governance files as canonical and treat `.ai/computing-environment/` as a
packaged downstream snapshot. Do not recurse into another Agent Project Kit /
`computing-environment` layer unless explicitly requested.

If project-local `.ai/` governance files exist, read the relevant files before
working on this project:

- `.ai/computing-environment/START_HERE.md`
- `.ai/computing-environment/SPEC_EVAL_LOOP_INSTRUCTION.md`
- `.ai/computing-environment/AGENTS.md`
- `.ai/computing-environment/MACHINE_PROFILES.md`
- `.ai/computing-environment/TOKEN_DISCIPLINE.md`
- `.ai/computing-environment/DOCUMENT_PRODUCTION_POLICY.md`
- `.ai/computing-environment/MARKDOWN_ORGANIZATION_POLICY.md`
- `.ai/computing-environment/ENVIRONMENT_POLICY.md`
- `.ai/computing-environment/MARKDOWN_ORGANIZATION_POLICY.md`
- `.ai/PROJECT_STATE.md`
- `.ai/PROJECT_HIERARCHY.md`
- `.ai/MACHINE_PROFILE.md`
- `.ai/LOCAL_RESOURCES.md`
- `.ai/MACHINE_COMPATIBILITY.md`
- `.ai/RUNBOOK.md`
- `.ai/TOKEN_BUDGET.md`

Use Spec–Eval–Loop Workflow when `.ai/` governance is present. Record machine
identity/storage assumptions in `.ai/MACHINE_PROFILE.md`, record non-portable
local resources, and keep AI Markdown in the `.ai/` pipeline only when those
files/folders exist in the current workspace.
Do not pretend L2/L3 or non-portable resources are solved by L1 alone.

<!-- END COMPUTING-ENVIRONMENT -->
