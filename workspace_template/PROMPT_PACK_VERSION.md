# Prompt Pack Version

- Installed prompt pack version: copied from `prompt_pack/VERSION.md` at install time if available
- Workspace template generation: update-safe template

## Update Rule

When updating an existing workspace:

- check `prompt_pack/VERSION.md`
- do not overwrite thesis/manuscript source files
- do not overwrite `04_review_notes/` or `00_review_instructions/`
- do not replace workspace `AGENTS.md` or `CLAUDE.md` if they contain local edits without asking first
- prefer replacing only `prompt_pack/` and preserving the old one as `prompt_pack_backup_<timestamp>`

Suggested prompt:

```text
เช็คเวอร์ชัน prompt_pack ว่าควรอัปเดต workflow หรือ AGENTS/CLAUDE ใน workspace ไหม โดยห้ามทับ review notes หรือไฟล์ thesis
```
