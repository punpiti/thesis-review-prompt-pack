# 05b Workspace AI Guide for Codex / Claude Code / Antigravity

คู่มือนี้เป็นเส้นทางหลักที่แนะนำสำหรับการใช้ Thesis Review Prompt Pack เพราะการตรวจวิทยานิพนธ์ต้องให้ AI อ่านหลายไฟล์ ถามกลับ จัด missing inputs และสร้าง review notes ก่อนแก้ต้นฉบับ

หลักสำคัญ: ให้ AI สร้าง review notes ก่อน อย่าให้แก้ thesis ต้นฉบับทันที

## Step 1: จัดไฟล์ให้ AI อ่านได้

สร้างโฟลเดอร์งานใหม่ เช่น:

```text
my_thesis_review/
  input/
    v01_original/
    v02_revised/
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

ใส่ไฟล์ตามนี้:

```text
1. เก็บไฟล์ต้นฉบับเป็นเวอร์ชันใน input/
   - input/v01_original/thesis_draft.docx
   - input/v01_original/thesis_draft.pdf
   - input/v02_revised_after_advisor/thesis_draft.docx
   - input/v02_revised_after_advisor/thesis_draft.pdf

   เวลาใช้งาน ให้ใช้เฉพาะเวอร์ชันล่าสุด
   ไม่ต้องให้ AI อ่านทุกเวอร์ชันพร้อมกัน เว้นแต่ต้องการเปรียบเทียบ revision

2. ใส่ไฟล์ข้อความที่ AI อ่านและอ้างตำแหน่งได้ใน 01_working_text/
   - 01_working_text/thesis_draft.md
   - 01_working_text/chapter_1_introduction.md
   - 01_working_text/chapter_2_literature_review.md

3. ใส่ bibliography ใน 02_references/bib/
   - 02_references/bib/references.bib
   - 02_references/bib/references_from_word.txt

   ถ้ายังไม่มี .bib ไม่เป็นไร ให้ข้ามขั้นนี้ แล้วใส่ PDF ของ reference ในข้อ 4
   จากนั้นสั่ง AI สร้าง references.bib จาก PDF ที่มี โดยห้ามแต่งข้อมูลที่ไม่มีหลักฐาน

4. ใส่ไฟล์ reference ต้นฉบับ เช่น paper PDF ที่อ้างอิง ใน 02_references/pdf/
   - 02_references/pdf/Smith_2021_topic.pdf
   - 02_references/pdf/Wang_2023_method.pdf

5. เวลาสั่ง Codex หรือ Claude Code อ่าน PDF reference ให้ AI เก็บบันทึกผลอ่านไว้ใน 02_references/extracted_md/ ด้วย
   - 02_references/extracted_md/Smith_2021_topic.md
   - 02_references/extracted_md/Wang_2023_method.md

   ไฟล์นี้ควรบอกว่าอ่านจาก PDF ใด พบ title/authors/year/venue/DOI/abstract อะไร หน้าไหน และอะไรยังต้อง verify
   ใช้เป็นร่องรอยการตรวจ ไม่ใช่หลักฐานใหม่แทน PDF

6. ถ้ามีหน้าเว็บหรือข้อมูลจากแหล่งทางการของ paper ให้ใส่ใน 02_references/official_pages/
   - 02_references/official_pages/doi_pages.md
   - 02_references/official_pages/publisher_abstracts.md
   - 02_references/official_pages/acm_ieee_springer_pages.md

7. ใส่ผลทดลอง ตาราง รูป หรือ log ใน 03_results/

8. แตกไฟล์ prompt pack นี้ไว้ใน prompt_pack/

9. สร้างโฟลเดอร์ว่างให้ AI เขียนผลตรวจ: 04_review_notes/
```

ถ้าเอกสารหลักเป็น `.docx` หรือ `.pdf` ให้ export เป็น Markdown/text เพิ่มใน `01_working_text/` ถ้าทำได้ เพื่อให้ AI อ้าง section และ paragraph ได้ง่ายขึ้น

## Step 2: สั่ง AI ประเมิน

```text
ให้ประเมิน
```

ถ้าต้องการ prompt แบบเต็ม ให้ใช้ข้อความนี้:

```text
ให้ประเมิน workspace นี้แบบ full review จนจบ โดยยังไม่ต้องแก้ thesis ต้นฉบับ

อ่าน:
- 00_context_notes.md ถ้ามี
- 01_working_text/thesis_draft.md
- 01_working_text/ ทุกไฟล์ที่เกี่ยวข้อง
- 02_references/bib/references.bib ถ้ามี
- 02_references/pdf/ รายชื่อไฟล์ PDF reference ทั้งหมด
- 02_references/extracted_md/ ถ้ามี
- 02_references/official_pages/ ถ้ามี
- 03_results/ ถ้ามี
- prompt_pack/README.md และ prompt_pack/*.md
- 04_review_notes/99_review_state.md ถ้ามี

ถ้ามี 04_review_notes/99_review_state.md ให้ดูว่าหัวข้อใดทำเสร็จแล้วและหัวข้อใดค้าง
ให้ประเมินหัวข้อที่เหลือจนจบ ไม่ต้องทำซ้ำหัวข้อที่เสร็จแล้ว
ยกเว้นฉันสั่งชัดเจนว่า "ให้ประเมินใหม่ทั้งหมด"

ให้สร้างหรืออัปเดตไฟล์เหล่านี้:
- 04_review_notes/00_inventory.md
- 04_review_notes/01_full_review.md
- 04_review_notes/02_reference_audit.md
- 04_review_notes/03_student_action_checklist.md
- 04_review_notes/99_review_state.md

ใช้ template ถ้ามี:
- prompt_pack/templates/04_review_notes/01_full_review_TEMPLATE.md
- prompt_pack/templates/04_review_notes/03_student_action_checklist_TEMPLATE.md
- prompt_pack/templates/04_review_notes/99_review_state_TEMPLATE.md

ต้องประเมินตาม prompt_pack/01_full_thesis_review_prompt.md ให้ครบทุกหัวข้อที่ทำได้จากหลักฐาน
ต้องตรวจ reference ตาม prompt_pack/02_reference_bibtex_prompt.md เท่าที่มีหลักฐาน

ถ้าข้อมูลใดมีอยู่แล้วในเอกสาร ให้สรุปจากเอกสาร ไม่ต้องถามฉันซ้ำ
ถ้าข้อมูลไม่พอ ให้เขียนว่า missing input และแยกเป็น จำเป็นมาก / ควรมี / ไม่จำเป็นในรอบนี้

ใน 04_review_notes/99_review_state.md ให้จดว่า:
- รอบนี้ทำอะไรเสร็จแล้ว
- อะไรยังค้างและค้างเพราะขาดหลักฐานอะไร
- รอบหน้าควรใช้ prompt อะไรเพื่อทำต่อ
- หัวข้อใดไม่ควรประเมินซ้ำ เว้นแต่ผู้ใช้สั่งให้ประเมินใหม่ทั้งหมด

ห้ามแก้ thesis หรือ references ในรอบนี้
```

## Step 3: ถ้าต้องการสั่ง full review note แยก

ใช้ template:

- `prompt_pack/templates/04_review_notes/01_full_review_TEMPLATE.md`

```text
ใช้ prompt_pack/01_full_thesis_review_prompt.md เป็นเกณฑ์
ใช้ prompt_pack/templates/04_review_notes/01_full_review_TEMPLATE.md เป็นโครงรายงาน
ตรวจ thesis จาก 01_working_text/thesis_draft.md
ใช้ 00_context_notes.md เป็น context ถ้ามี
ใช้ 02_references/bib/references.bib, 02_references/pdf/, 02_references/extracted_md/, 02_references/official_pages/ และ 03_results/ เท่าที่มีเป็นหลักฐาน

สร้างไฟล์ 04_review_notes/01_full_review.md
อัปเดต 04_review_notes/99_review_state.md ว่าทำ full review ถึงหัวข้อใดแล้ว และยังค้างอะไร

กฎ:
- ห้ามแต่งข้อมูลเกินหลักฐานที่ให้ไว้
- ห้ามแต่ง citation, DOI, venue ranking, result, law, IRB requirement เอง
- ทุก criticism สำคัญต้องอ้าง section/page/paragraph/table/figure ถ้าระบุได้
- ถ้าข้อมูลไม่พอ ให้เขียนว่า missing input
- ห้ามแก้ thesis ต้นฉบับ
```

## Step 4: ถ้าต้องการตรวจ references แยก

```text
ใช้ prompt_pack/02_reference_bibtex_prompt.md เป็นเกณฑ์
ถ้ามี 02_references/bib/references.bib ให้ตรวจเทียบกับ 01_working_text/thesis_draft.md
ถ้าไม่มี references.bib ไม่เป็นไร ให้สร้าง 02_references/bib/references.bib จาก PDF ใน 02_references/pdf/
ใช้ไฟล์ PDF reference ต้นฉบับใน 02_references/pdf/ และหน้าเว็บ/ข้อมูลจากแหล่งทางการใน 02_references/official_pages/ เป็นหลักฐาน
ถ้ามีการอ่านหรือ scan PDF reference ให้สร้างหรืออัปเดต Markdown หนึ่งไฟล์ต่อหนึ่ง PDF ใน 02_references/extracted_md/ ก่อนนำข้อมูลไปเติม references.bib
ในไฟล์ extracted_md ให้ระบุ source PDF filename, metadata ที่พบ, abstract evidence ถ้ามี, หน้า/section ที่ตรวจ, summary สั้น ๆ และ uncertainty flags

สร้างไฟล์ 04_review_notes/02_reference_audit.md
อัปเดต 04_review_notes/99_review_state.md ว่าตรวจ reference เสร็จหรือยัง และยังต้องขอ PDF/official page อะไรเพิ่ม

ให้ตรวจ:
- uncited references
- cited keys missing from bibliography
- ข้อมูลบรรณานุกรมที่ยังเป็น placeholder หรือยังต้องตรวจจากแหล่งจริง
- missing abstracts
- DOI/URL/venue/year ที่น่าสงสัย
- direct prior work vs cross-domain support
- target-venue anchors
- citation ที่ไม่ support claim
- references ที่ควร demote/remove/verify
- รายการที่ต้องขอ PDF หรือหน้าเว็บจากแหล่งทางการเพิ่ม
- รายการที่ควรเติม abstract field จาก PDF/official source ที่มีอยู่

ห้ามสร้าง reference ใหม่เองถ้าไม่มีแหล่งตรวจสอบ
```

## Step 5: ถ้าต้องการสร้าง action checklist แยก

ใช้ template:

- `prompt_pack/templates/04_review_notes/03_student_action_checklist_TEMPLATE.md`

```text
อ่าน 04_review_notes/01_full_review.md และ 04_review_notes/02_reference_audit.md

สร้างไฟล์ 04_review_notes/03_student_action_checklist.md
อัปเดต 04_review_notes/99_review_state.md ให้บอกว่างานอะไรเสร็จแล้ว อะไรค้าง และ prompt รอบหน้าควรเริ่มจากอะไร

แยกงานเป็น:
- ต้องถามอาจารย์
- ต้องแก้ problem/objectives
- ต้องแก้ literature/references
- ต้องเพิ่ม baseline/evaluation
- ต้องตรวจ ethics/IRB/legal
- ต้องแก้ language/document hygiene
- งานที่ทำได้ใน 1 วัน
- งานที่ทำได้ใน 1 สัปดาห์
- งานที่ต้องใช้ข้อมูลเพิ่ม
```

## Step 6: ถ้าจะให้ AI ช่วยแก้ไฟล์

ให้ทำหลังจากมี review notes เท่านั้น และใช้ working copy:

```text
สร้างสำเนา 01_working_text/thesis_draft.md เป็น 01_working_text/thesis_draft_revised.md

แก้เฉพาะส่วนที่ระบุใน 04_review_notes/03_student_action_checklist.md

ห้ามแก้ references, results, methodology หรือ claims เชิงตัวเลขโดยไม่มีหลักฐาน
หลังแก้ ให้สรุปว่าแก้อะไร และเพราะอะไร
```

ตรวจ diff หรืออ่านเทียบเองก่อนรับเสมอ

## สิ่งที่ไม่ควรทำกับ Workspace AI

- อย่าสั่งให้แก้ทั้ง thesis ทันที
- อย่าให้ลบ reference หรือ result โดยไม่สร้าง audit note
- อย่าให้แก้ไฟล์ source เดิมโดยไม่มีสำเนา
- อย่าให้ AI อ่านทุกเวอร์ชันใน `input/` พร้อมกันโดยไม่จำเป็น
- อย่ารับ diff โดยไม่อ่าน
- อย่าให้ AI สรุปว่า IRB ไม่จำเป็นโดยไม่ตรวจจากสถาบันจริง
- อย่าให้ AI เติม citation/DOI/result เอง
