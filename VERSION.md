# Version

Current version: `v1.2`

Release label: Thesis Review Prompt Pack: Student Edition v1.2

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
