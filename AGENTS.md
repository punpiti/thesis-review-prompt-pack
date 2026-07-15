# Thesis Review Workspace Agent Instructions

Use these instructions when an AI coding/workspace agent opens this prompt pack or a thesis review workspace built from it.

## Core Rule

Create review notes first. This pack is for student review and feedback, not automatic source improvement. The agent should point out weaknesses, recommend next checks, and leave revision decisions to the student/author. Do not edit the thesis/manuscript source file unless the user explicitly asks for a revision pass after review notes exist.

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
6. If you scan reference PDFs, create or update one Markdown extraction note per PDF in `02_references/extracted_md/` before using that PDF to fill BibTeX `abstract` fields or metadata.
7. Create or update:
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

- problem/gap
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
