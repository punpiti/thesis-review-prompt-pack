# Prompt Pack Version

- Installed prompt pack version: copied from `prompt_pack/VERSION.md` at install time if available
- Workspace template generation: update-safe template

## Update Rule

When updating an existing workspace:

- check `prompt_pack/VERSION.md`
- if internet access is available, compare it with `https://punpiti.github.io/thesis-review-prompt-pack/VERSION.md`
- do not overwrite thesis/manuscript source files
- do not overwrite `04_review_notes/` or `00_review_instructions/`
- do not replace workspace `AGENTS.md` or `CLAUDE.md` if they contain local edits without asking first
- prefer replacing only `prompt_pack/` and preserving the old one as `prompt_pack_backup_<timestamp>`
- keep or create `PROMPT_PACK_UPDATE_NOTES_<timestamp>.md`
- adopt new concepts as a proposed patch, not as a wholesale replacement of user-used workflow rules

Suggested prompt:

```text
เช็คเวอร์ชัน prompt_pack กับ GitHub Pages และสรุปแนวคิดใหม่ที่ควรรับเข้ามา โดยห้ามทับ review notes, instruction เดิม, หรือสิ่งที่ user เคยใช้แล้ว
```
