# Version

Current version: `v1.3`

Release label: Thesis Review Prompt Pack: Student Edition v1.3

## Unreleased

- Added a separate deep doctoral review prompt for `ประเมินเชิงลึก`, covering source triangulation, recent literature/consensus gaps, counter-arguments, claim credibility, data/result interpretation, decisive tests, and a decision brief.
- Added `04_deep_review.md` template and workspace-agent instructions for the deep review pass.
- Clarified progressive difficulty: new students should start with normal `ประเมิน`; `ประเมินเชิงลึก` is an advanced pass for more mature drafts with enough references/results.
- Clarified student-review intent: the pack is for review notes and peer feedback, not automatic rewriting or automatic source improvement.
- Emphasized that reviewers should point out weaknesses and recommend next checks, while students practice doing the revision work and follow-up prompting themselves.

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
