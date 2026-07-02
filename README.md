# Thesis Review Prompt Pack: Student Edition v1.1

Current version: `v1.1`

ชุด prompt นี้ทำไว้สำหรับให้นิสิตใช้ตรวจวิทยานิพนธ์ บทความจากวิทยานิพนธ์ หรือ manuscript ของตนเองและของเพื่อนอย่างเป็นระบบ ก่อนส่งให้อาจารย์หรือกรรมการตรวจรอบถัดไป

เป้าหมายคือช่วยให้เห็นว่าเอกสารมีปัญหาอะไรที่ควรแก้ก่อน เช่น ปัญหาวิจัยไม่ชัด วัตถุประสงค์ไม่ตรงกับผล literature review ยังไม่สังเคราะห์ reference ไม่พอ baseline ขาด หรือ claim แรงเกินหลักฐาน ไม่ใช่ให้ AI ตัดสินแทนผู้วิจัยหรือแทน reviewer จริง

## Quick Start

เปิดหน้าเริ่มต้นที่ [index.html](index.html) ก่อนเสมอ ชุดนี้แนะนำให้ใช้แบบ workspace เป็นหลัก:

- [index.html](index.html) - หน้าเริ่มต้นและตัวเลือก workflow
- [workspace.html](workspace.html) - เส้นทางหลักสำหรับ Codex / Claude Code / Antigravity มีแนวทางติดตั้ง จัด workspace และสั่ง AI ตรวจไฟล์
- [webapp.html](webapp.html) - fallback สำหรับ Gemini / ChatGPT / Claude เฉพาะกรณีตรวจส่วนสั้น ๆ ไม่แนะนำสำหรับตรวจทั้งเล่ม
- [about.html](about.html) - รายละเอียดระบบ privacy ข้อจำกัด และรายการไฟล์
- [VERSION.md](VERSION.md) - เลขเวอร์ชันและสรุปการเปลี่ยนแปลงของชุดนี้

1. เปิด [index.html](index.html)
2. ใช้ [workspace.html](workspace.html) เป็นหลัก ถ้ามี Codex / Claude Code / Antigravity
3. ให้ AI ตรวจจากเอกสารก่อนว่าขาดอะไรและจำเป็นแค่ไหน ไม่ต้องกรอกข้อมูลซ้ำในเว็บ
4. ใช้ [webapp.html](webapp.html) เฉพาะกรณีไม่มี workspace AI และต้องตรวจข้อความสั้น ๆ

## Files

- [index.html](index.html) - หน้าเริ่มต้นแบบ HTML สำหรับ GitHub Pages หรือเปิดใน browser
- [workspace.html](workspace.html) - คู่มือ HTML หลักสำหรับ Codex / Claude Code / Antigravity
- [webapp.html](webapp.html) - fallback สำหรับ Gemini / ChatGPT / Claude แบบ quota จำกัด
- [about.html](about.html) - รายละเอียดระบบ privacy ข้อจำกัด และรายการไฟล์
- [00_intake_checklist.md](00_intake_checklist.md) - checklist อ้างอิงแบบ Markdown สำหรับคนที่อยากเตรียม context เอง
- [01_full_thesis_review_prompt.md](01_full_thesis_review_prompt.md) - prompt หลักสำหรับตรวจทั้งเล่มหรือทั้ง manuscript
- [01_full_thesis_review_prompt_explained_th.html](01_full_thesis_review_prompt_explained_th.html) - หน้า HTML อธิบาย prompt หลักเป็นภาษาไทย สำหรับอ่านเพื่อเข้าใจแนวคิดก่อนใช้
- [02_reference_bibtex_prompt.md](02_reference_bibtex_prompt.md) - prompt สำหรับตรวจ BibTeX, reference quality, citation use และ literature clusters
- [03_review_rubric.md](03_review_rubric.md) - rubric สำหรับ peer review และ self-review
- [04_common_review_patterns.md](04_common_review_patterns.md) - ข้อผิดพลาดที่พบบ่อยและวิธีตรวจ
- [05_choose_your_ai_workflow.md](05_choose_your_ai_workflow.md) - จุดเริ่มต้นสำหรับเลือก workflow ตามเครื่องมือที่มี
- [05a_chat_ai_quota_limited_guide.md](05a_chat_ai_quota_limited_guide.md) - วิธีใช้กับ Gemini / ChatGPT / Claude แบบ chat โดยเฉพาะกรณี quota จำกัด
- [05b_workspace_ai_codex_claude_code_guide.md](05b_workspace_ai_codex_claude_code_guide.md) - วิธีใช้กับ Codex / Claude Code / Antigravity หรือ AI ที่อ่านไฟล์ใน workspace ได้
- [AGENTS.md](AGENTS.md) - instruction สำหรับ workspace agents เมื่อนำ prompt pack ไปใช้กับ Codex / Claude Code / Antigravity
- [CLAUDE.md](CLAUDE.md) - instruction คู่กันสำหรับ Claude Code
- [workspace_template/](workspace_template/) - โครง workspace พร้อม `AGENTS.md`, `CLAUDE.md` และ README ในแต่ละโฟลเดอร์สำหรับให้นิสิตวางไฟล์งาน
- [codex_skill/SKILL.md](codex_skill/SKILL.md) - skill แบบย่อสำหรับ Codex หรือ agent ที่รองรับ skill เพื่อลดการ paste prompt ยาว
- [STUDENT_HANDOUT.md](STUDENT_HANDOUT.md) - ข้อความสั้นสำหรับส่งให้นิสิตในแชต อีเมล หรือ LMS
- [LICENSE.md](LICENSE.md) - เงื่อนไขการนำไปใช้และเผยแพร่ต่อ
- [VERSION.md](VERSION.md) - เลขเวอร์ชันและสรุปการเปลี่ยนแปลง

## What You Must Prepare

ถ้าไม่อยากสร้างโฟลเดอร์เอง ให้เริ่มจาก `workspace_template/` แล้วคัดลอกเป็น workspace ของงานนั้น

- เอกสารต้นฉบับใน `input/v01_original/`, `input/v02_revised/` ฯลฯ โดยเวลาใช้งานให้ใช้เฉพาะเวอร์ชันล่าสุด
- ไฟล์ข้อความที่ AI อ่านได้ใน `01_working_text/` เช่น `.md` หรือ `.txt`
- BibTeX หรือ reference list ใน `02_references/bib/` ถ้ามี ถ้าไม่มีให้ใส่ PDF reference ก่อน แล้วให้ AI สร้าง BibTeX จาก PDF
- PDF ของ reference ต้นฉบับใน `02_references/pdf/`
- Markdown extraction notes จาก PDF ใน `02_references/extracted_md/` ถ้า AI เคย scan PDF reference แล้ว
- หน้าเว็บหรือข้อมูลจากแหล่งทางการของ paper ใน `02_references/official_pages/` ถ้ามี
- dataset, baseline, metric, raw results, script หรือหลักฐานผลทดลองใน `03_results/` ถ้ามี
- context สั้น ๆ ใน `00_context_notes.md` ถ้ามี เช่น สาขา ระดับงาน target venue หรือข้อจำกัดพิเศษ

## Ground Rules

- AI ช่วยอ่านและจัดระบบ feedback ได้ แต่ผู้เขียนต้องรับผิดชอบทุก claim เอง
- ห้ามให้ AI แต่ง citation, DOI, venue metric, paper title, result หรือ ranking เอง
- ถ้าไม่แน่ใจ ให้เขียนว่า `ยังไม่ได้ตรวจสอบ` แทนการเดา
- citation ทุกตัวควรตรวจจาก paper หรือหน้าเว็บ/ข้อมูลจากแหล่งทางการ
- ถ้าใช้ Codex หรือ Claude Code อ่าน PDF reference ให้ AI เก็บบันทึกผลอ่านเป็น Markdown ใน `02_references/extracted_md/` หนึ่งไฟล์ต่อหนึ่ง PDF ก่อนนำไปเติม `abstract` หรือ metadata ใน BibTeX
- claim เชิงผลทดลองต้องมี dataset, baseline, metric, raw result และวิธีคำนวณรองรับ
- ถ้างานเกี่ยวข้องกับคน ผู้ใช้ ข้อมูลส่วนบุคคล scraping dataset license หรือข้อมูลที่มีข้อบังคับ ต้องตรวจ IRB/ethics/legal compliance ตั้งแต่ต้น
- ถ้างานใช้ LLM ต้องบอกให้ชัดว่าใช้ทำอะไร และตรวจผลจากแหล่งจริงอย่างไร
- ตรวจคุณภาพการเขียนด้วย เช่น ใช้ AI แบบ generic หรือไม่ สะกดผิดมากเกินเหตุหรือไม่ ใช้ชื่อย่อเหมาะสมหรือไม่ ปนไทย/อังกฤษเกินจำเป็นหรือไม่ และลำดับการอธิบายทำให้ผู้อ่านต้องไปรู้สิ่งที่อยู่ด้านหลังก่อนหรือไม่

## Suggested Workflow

แนะนำให้ใช้แบบ workspace เป็นหลัก เพราะการตรวจวิทยานิพนธ์ต้องอ่านหลายไฟล์ ถามกลับหลายรอบ และต้องสร้าง review notes ที่อ้างตำแหน่งในเอกสารได้ ถ้าใช้ AI webapp ให้ใช้เฉพาะตรวจข้อความสั้น ๆ ไม่ใช่ตรวจทั้งเล่ม

### Round 1: Readiness Check

ให้ AI สำรวจ workspace ก่อน แล้วสร้าง `04_review_notes/00_inventory.md` เพื่อบอกว่าไฟล์หลักอยู่ไหน มี references/results หรือไม่ และ missing inputs ใดจำเป็นจริง

### Round 2: Full Review ด้วยคำสั่งสั้น

ถ้าใช้ workspace AI ให้สั่งสั้น ๆ ว่า:

```text
ให้ประเมิน
```

AI ควรตรวจความสอดคล้องของทั้งงานตาม [01_full_thesis_review_prompt.md](01_full_thesis_review_prompt.md), ตรวจ references ตาม [02_reference_bibtex_prompt.md](02_reference_bibtex_prompt.md), และสร้าง review notes ให้ครบเท่าที่หลักฐานมี โดยห้ามแก้ thesis ต้นฉบับทันที

ดู template โครงรายงานได้ที่ [templates/04_review_notes/01_full_review_TEMPLATE.md](templates/04_review_notes/01_full_review_TEMPLATE.md)

ถ้าต้องการเข้าใจว่าทำไม prompt ตรวจหัวข้อเหล่านี้ ให้อ่าน [01_full_thesis_review_prompt_explained_th.html](01_full_thesis_review_prompt_explained_th.html)

### Round 3: State Note สำหรับกลับมาทำต่อ

ให้ AI สร้างหรืออัปเดต `04_review_notes/99_review_state.md` ทุกครั้ง เพื่อบอกว่าเคยประเมินอะไรเสร็จแล้ว อะไรค้างเพราะขาดหลักฐาน และคราวหน้าควรใช้ prompt อะไรทำต่อ

ดู template ได้ที่ [templates/04_review_notes/99_review_state_TEMPLATE.md](templates/04_review_notes/99_review_state_TEMPLATE.md)

ถ้ากลับมารอบหน้า ให้สั่ง:

```text
ให้ประเมินต่อจาก 04_review_notes/99_review_state.md
```

AI ควรประเมินเฉพาะหัวข้อที่เหลือ ยกเว้นผู้ใช้สั่งชัดว่า `ให้ประเมินใหม่ทั้งหมด`

### Round 4: Fix and Recheck

ให้ AI สรุป `04_review_notes/03_student_action_checklist.md` แล้วผู้เขียนแก้ blocking issues ก่อนแก้ภาษา เช่น problem ไม่ชัด objective ไม่ตรง result ไม่มี baseline หรือ citation รองรับ claim ไม่ได้

หมายเหตุ: `04_review_notes/03_student_action_checklist.md` เป็นไฟล์ที่ AI ต้องสร้างใน workspace ของนิสิต ไม่ใช่ไฟล์ที่มีมาให้ตั้งแต่แรก ดูตัวอย่างรูปแบบได้ที่ [templates/04_review_notes/03_student_action_checklist_TEMPLATE.md](templates/04_review_notes/03_student_action_checklist_TEMPLATE.md)
