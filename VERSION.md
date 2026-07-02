# Version

Current version: `v1.1`

Release label: Thesis Review Prompt Pack: Student Edition v1.1

## v1.1

- Added Codex and Claude Code workspace instructions through `AGENTS.md` and `CLAUDE.md`.
- Added `workspace_template/` for student workspaces.
- Added `codex_skill/` for agents that support skills.
- Added `00_inbox/` and init prompt so workspace agents can organize mixed files before review.
- Added `00_review_instructions/` workflow so Codex or Claude Code can read current LaTeX/workspace files and build review context before full review.
- Added `02_references/extracted_md/` convention for Markdown trace notes from scanned reference PDFs.
- Required PDF reference scans to create Markdown extraction notes before filling BibTeX metadata or `abstract` fields.
