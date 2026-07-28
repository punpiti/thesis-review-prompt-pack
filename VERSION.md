# Version

Current version: `v1.5`

Release label: Thesis Review Prompt Pack: Student Edition v1.5

## Unreleased

No unreleased changes.

## v1.5

- Added GitHub Pages version checking to the Linux/macOS and Windows installers.
- Installers now download and extract packages in isolated temporary directories, so first-time installation cannot overwrite a user's existing ZIP or `prompt_packs/` folder in the launch directory.
- Installers now refuse a project path that collides with an existing non-directory file; an existing directory is handled as a safe workspace update.
- First-time installation no longer mistakes the template's placeholder `prompt_pack/` directory for an older installation, so it does not create a false backup or update note.
- Existing workspace updates now record local, remote, installed, and backup versions in `PROMPT_PACK_VERSION.md`.
- Existing workspace updates now create `PROMPT_PACK_UPDATE_NOTES_<timestamp>.md` so new prompt-pack concepts can be reviewed and adopted manually without overwriting user-used workspace instructions.
- Strengthened workspace-agent update guidance: compare against `https://punpiti.github.io/thesis-review-prompt-pack/VERSION.md`, replace only `prompt_pack/` by default, keep backups, and propose small patches for `AGENTS.md`/`CLAUDE.md` instead of replacing local rules.

## v1.4

- Added L1-L4 thesis review framing from Agent Project Kit/computing-environment: L1 agentic review work, L2 human academic judgment, L3 external feedback/live verification, and L4 local evidence/resource availability.
- Added topic hierarchy guidance so review notes can locate issues at document, chapter/section, paragraph, claim/evidence, and citation/BibTeX/PDF levels.
- Strengthened the reference integrity gate: every cited key must exist, BibTeX entries must be traceable and complete, scholarly references should have source PDFs in hand, and missing PDFs or official-source fallbacks must be listed.
- Added a standalone `thesis-reference-bibtex` skill for reference audit, BibTeX creation from supplied PDFs/official sources, reference-set analysis from BibTeX, and citation-use audit.
- Clarified review order: title and abstract should be reviewed first when present, even for early drafts, while keeping that critique separate from deeper method/result sections.
- Strengthened literature-review checks around whether the author found a research problem and understands the research gap from prior work.
- Added standalone focused review skills for overview orchestration, title/abstract/expected outcome, introduction, literature review, and experiment design.
- Clarified that overview review should choose applicable focused skills by draft maturity and skip sections that are not ready instead of forcing a full review.
- Added a standalone venue/status/prognosis skill for venue/category selection, readiness verdicts, and qualitative end-of-review prognosis with live-verification guards for venue metrics/rankings.
- Added a proposal-readiness skill and adapted proposal heuristics into review checks: title directions, introduction funnel, ideal/reality/consequence/gap problem framing, objective-methodology verb alignment, and academic/practical contribution separation.
- Added a research workflow router and additional lifecycle skills adapted from broad scientist-prompt patterns: RQ/hypothesis refinement, data analysis/interpretation, manuscript revision/submission, systematic-review protocol, and collaboration/productivity.
- Added a LaTeX document production skill for install/build diagnosis, venue templates, Thai/English font setup, missing glyph/math-symbol issues, table autofit, and final PDF layout QA.
- Added safer update behavior to installers: existing workspaces keep existing template files by default, old `prompt_pack/` is backed up, and agents are instructed to check prompt-pack versions before recommending workflow updates.
- Added an English explanation page for the full thesis review prompt concept: `01_full_thesis_review_prompt_explained_en.md` and `01_full_thesis_review_prompt_explained_en.html`.
- Added a separate deep doctoral review prompt for `ประเมินเชิงลึก`, covering source triangulation, recent literature/consensus gaps, counter-arguments, claim credibility, data/result interpretation, decisive tests, and a decision brief.
- Added `04_deep_review.md` template and workspace-agent instructions for the deep review pass.
- Clarified progressive difficulty: new students should start with normal `ประเมิน`; `ประเมินเชิงลึก` is an advanced pass for more mature drafts with enough references/results.
- Clarified student-review intent: the pack is for review notes and peer feedback, not automatic rewriting or automatic source improvement.
- Emphasized that reviewers should point out weaknesses and recommend next checks, while students practice doing the revision work and follow-up prompting themselves.
- Added lightweight Linux/macOS and Windows PowerShell installer scripts that only download the pack and create the workspace from the template.

## v1.3

- Integrated the latest public Research Methodology for AI-Assisted Thesis Review handout release `2026.07` as a companion teaching source.
- Added explicit checks for problem statement discipline, prior attempts, unresolved need, alternatives and selection rationale.
- Strengthened output/outcome/by-product traceability so review notes separate direct problem-resolution evidence from downstream claims.
- Updated the full review prompt, rubric, common review patterns, README, student handout, and public start pages for the new research-argument chain.

## v1.2

- Integrated research-methodology teaching concepts from the AI-Assisted Thesis Review materials.
- Added five research-logic stress tests: problem survival, genuine failure, mandatory gates, measurement ceiling, and no-new-problem guardrails.
- Updated the full review prompt, rubric, common patterns, review templates, Codex skill reference, README, and student handout so review notes flag logic failures before language polishing.
- Added bilingual public website pages in Thai and English: home, workspace guide, webapp fallback, and about/privacy.

## v1.1

- Added Codex and Claude Code workspace instructions through `AGENTS.md` and `CLAUDE.md`.
- Added `workspace_template/` for student workspaces.
- Added `codex_skill/` for agents that support skills.
- Added `00_inbox/` and init prompt so workspace agents can organize mixed files before review.
- Added `00_review_instructions/` workflow so Codex or Claude Code can read current LaTeX/workspace files and build review context before full review.
- Added `02_references/extracted_md/` convention for Markdown trace notes from scanned reference PDFs.
- Required PDF reference scans to create Markdown extraction notes before filling BibTeX metadata or `abstract` fields.
