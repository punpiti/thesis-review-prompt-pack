# 05b Workspace AI Guide for Codex / Claude Code / Antigravity

คู่มือนี้เป็นเส้นทางหลักที่แนะนำสำหรับการใช้ Thesis Review Prompt Pack เพราะการตรวจวิทยานิพนธ์ต้องให้ AI อ่านหลายไฟล์ ถามกลับ จัด missing inputs และสร้าง review notes ก่อนแก้ต้นฉบับ

หลักสำคัญ: ให้ AI สร้าง review notes ก่อน อย่าให้แก้ thesis ต้นฉบับทันที

## Step 1: จัดไฟล์ให้ AI อ่านได้

เลือก command ตามระบบปฏิบัติการ แล้วรันทีละบรรทัดจากโฟลเดอร์ที่ต้องการสร้าง project folder

ค่าเริ่มต้นคือ `my_thesis_review/` ถ้าต้องการชื่ออื่น ให้แก้ตัวแปร `PROJECT` หรือ `$Project` ใน command ก่อนรัน

### Linux / macOS

```bash
PROJECT="my_thesis_review"
curl -L -o thesis_review_student_edition.zip https://punpiti.github.io/thesis-review-prompt-pack/thesis_review_student_edition.zip
unzip -o thesis_review_student_edition.zip
cd prompt_packs/thesis_review_student_edition
WORKSPACE="$PWD/../../$PROJECT"
mkdir -p "$WORKSPACE"
cp -R workspace_template/. "$WORKSPACE/"
mkdir -p "$WORKSPACE/prompt_pack"
cp -R . "$WORKSPACE/prompt_pack/"
cd "$WORKSPACE"
```

### Windows PowerShell

```powershell
$Project = "my_thesis_review"
Invoke-WebRequest -Uri "https://punpiti.github.io/thesis-review-prompt-pack/thesis_review_student_edition.zip" -OutFile ".\thesis_review_student_edition.zip"
Expand-Archive -Path .\thesis_review_student_edition.zip -DestinationPath . -Force
Set-Location .\prompt_packs\thesis_review_student_edition
$Workspace = Join-Path (Resolve-Path ..\..).Path $Project
New-Item -ItemType Directory -Force -Path $Workspace | Out-Null
Copy-Item -Path .\workspace_template\* -Destination $Workspace -Recurse -Force
New-Item -ItemType Directory -Force -Path (Join-Path $Workspace "prompt_pack") | Out-Null
Copy-Item -Path .\* -Destination (Join-Path $Workspace "prompt_pack") -Recurse -Force
Set-Location $Workspace
```

วางไฟล์รวมทั้งหมดไว้ใน:

```text
my_thesis_review/00_inbox/

ใส่ได้ทั้ง thesis/manuscript, LaTeX, Word, PDF, BibTeX, reference PDF, รูป, ตาราง, ผลทดลอง, script, log, metric และ baseline

ไฟล์ใน 00_review_instructions/ และ 02_references/extracted_md/ ให้ AI สร้างเอง
```

ถ้ามีหลายเวอร์ชัน ใส่รวมไว้ใน `00_inbox/` ได้ แล้วให้ AI จัดเวอร์ชันใน Step 2

## ทำไมไม่ให้ AI อ่านทั้งโฟลเดอร์ทันที

การโยนทั้งโฟลเดอร์ LaTeX หรือไฟล์ทั้งหมดให้ Claude Code/Codex อ่านตั้งแต่แรกทำได้ แต่ใช้ token มากและอาจทำให้ AI อ่านไฟล์ที่ไม่เกี่ยวกับการตรวจ เช่น auxiliary files, build output, รูปจำนวนมาก หรือ source เก่าที่ไม่ใช่เวอร์ชันปัจจุบัน

workflow นี้จึงให้เริ่มจาก `00_inbox/` แล้วให้ AI จัดไฟล์และสร้าง `00_review_instructions/` ก่อน เมื่อสั่ง `ประเมิน` รอบถัดไป AI จะใช้ context ที่คัดแล้วเป็นหลัก และอ่านไฟล์ต้นฉบับเฉพาะเท่าที่จำเป็นต่อหลักฐาน

## Step 2: ให้ AI จัดไฟล์จาก 00_inbox

ใช้เมื่อวางไฟล์รวมไว้ใน `00_inbox/`

```text
init workspace จากไฟล์รวม
```

ถ้าต้องการ prompt แบบเต็ม ให้ใช้:

```text
init workspace จากไฟล์รวม

อ่านไฟล์ทั้งหมดใน 00_inbox/
สร้างโฟลเดอร์ที่ขาดถ้าจำเป็น
จัดไฟล์โดย copy จาก 00_inbox/ ไปยังโฟลเดอร์ที่เหมาะสม ห้ามลบไฟล์ต้นฉบับใน 00_inbox/

จัดตามนี้:
- thesis/manuscript เวอร์ชันล่าสุด -> input/v02_revised/
- ไฟล์ต้นฉบับก่อนแก้หรือเวอร์ชันเก่า -> input/v01_original/
- .tex/.md/.txt ที่เป็นเนื้อหางาน -> 01_working_text/
- .bib/.ris/.enw/reference list -> 02_references/bib/
- PDF reference -> 02_references/pdf/
- DOI page / publisher page / official abstract -> 02_references/official_pages/
- dataset/table/figure/log/script/metric/baseline/result evidence -> 03_results/

ถ้าไม่แน่ใจว่าไฟล์ใดควรอยู่ไหน ให้คงไว้ใน 00_inbox/ และ mark ว่า needs classification
สร้างหรืออัปเดต 00_review_instructions/file_inventory.md โดยมี source path, target path, file role, uncertainty
ห้ามแก้เนื้อหา thesis/manuscript/references ในขั้นนี้
```

## Step 3: ให้ AI สร้าง instruction จากงานปัจจุบัน

ใช้ขั้นนี้ก่อน `ประเมิน` โดยเฉพาะงานที่เป็น LaTeX หลายไฟล์

```text
เตรียม instruction จากงานปัจจุบัน
```

ถ้าต้องการ prompt แบบเต็ม ให้ใช้:

```text
โหลด instruction folder ที่ 00_review_instructions/

อ่านงานเวอร์ชันล่าสุดจาก input/ และ 01_working_text/ เท่าที่มี
ถ้าเป็น LaTeX ให้หา root .tex ปัจจุบัน แล้วตาม \input{} และ \include{} เท่าที่จำเป็น
ให้ระบุ bibliography file, figure/table/result file ที่ถูกอ้างถึงด้วย

สร้างหรืออัปเดต:
- 00_review_instructions/review_profile.md
- 00_review_instructions/document_map.md
- 00_review_instructions/review_scope.md
- 00_review_instructions/missing_inputs.md

ให้สรุปจากหลักฐานใน workspace เท่านั้น
ถ้าข้อมูลไม่อยู่ในไฟล์ ให้เขียนว่า missing input
ห้ามแต่ง citation, DOI, venue ranking, result, IRB/legal requirement หรือ claim เอง
ห้ามแก้ thesis/manuscript/references ในขั้นนี้
```

## Step 4: สั่ง AI ประเมิน

```text
ประเมิน
```

ถ้าต้องการ prompt แบบเต็ม ให้ใช้ข้อความนี้:

```text
ประเมิน workspace นี้แบบ full review จนจบ โดยยังไม่ต้องแก้ thesis ต้นฉบับ

อ่าน:
- 00_context_notes.md ถ้ามี
- 00_review_instructions/ ทุกไฟล์ที่มี ถ้ายังไม่มีหรือเก่า ให้สร้างจากงานปัจจุบันก่อน
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
ประเมินหัวข้อที่เหลือจนจบ ไม่ต้องทำซ้ำหัวข้อที่เสร็จแล้ว
ยกเว้นฉันสั่งชัดเจนว่า "ประเมินใหม่ทั้งหมด"

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
ต้องตรวจ problem survival, genuine failure, mandatory gates, measurement ceiling และ no-new-problem guardrail ก่อนแนะนำแก้ภาษา
ต้องตรวจ reference ตาม prompt_pack/02_reference_bibtex_prompt.md เท่าที่มีหลักฐาน

ถ้าข้อมูลใดมีอยู่แล้วในเอกสาร ให้สรุปจากเอกสาร ไม่ต้องถามฉันซ้ำ
ถ้าข้อมูลไม่พอ ให้เขียนว่า missing input และแยกเป็น จำเป็นมาก / ควรมี / ไม่จำเป็นในรอบนี้

ใน 04_review_notes/99_review_state.md ให้จดว่า:
- รอบนี้ทำอะไรเสร็จแล้ว
- อะไรยังค้างและค้างเพราะขาดหลักฐานอะไร
- รอบหน้าควรใช้ prompt อะไรเพื่อทำต่อ
- หัวข้อใดไม่ควรประเมินซ้ำ เว้นแต่ผู้ใช้สั่งว่า "ประเมินใหม่ทั้งหมด"

ห้ามแก้ thesis หรือ references ในรอบนี้
```

## Step 5: ถ้าต้องการสั่ง full review note แยก

ใช้ template:

- `prompt_pack/templates/04_review_notes/01_full_review_TEMPLATE.md`

```text
ใช้ prompt_pack/01_full_thesis_review_prompt.md เป็นเกณฑ์
ใช้ prompt_pack/templates/04_review_notes/01_full_review_TEMPLATE.md เป็นโครงรายงาน
ตรวจ thesis จาก 01_working_text/thesis_draft.md
ใช้ 00_context_notes.md เป็น context ถ้ามี
ใช้ 00_review_instructions/ เป็น context หลัก ถ้ามี ถ้ายังไม่มีให้สร้างก่อน
ใช้ 02_references/bib/references.bib, 02_references/pdf/, 02_references/extracted_md/, 02_references/official_pages/ และ 03_results/ เท่าที่มีเป็นหลักฐาน

สร้างไฟล์ 04_review_notes/01_full_review.md
อัปเดต 04_review_notes/99_review_state.md ว่าทำ full review ถึงหัวข้อใดแล้ว และยังค้างอะไร

กฎ:
- ห้ามแต่งข้อมูลเกินหลักฐานที่ให้ไว้
- ห้ามแต่ง citation, DOI, venue ranking, result, law, IRB requirement เอง
- ทุก criticism สำคัญต้องอ้าง section/page/paragraph/table/figure ถ้าระบุได้
- ถ้าข้อมูลไม่พอ ให้เขียนว่า missing input
- ต้องตรวจ problem survival, genuine failure, mandatory gates, measurement ceiling และ no-new-problem guardrail ก่อนแนะนำแก้ภาษา
- ห้ามแก้ thesis ต้นฉบับ
```

## Step 6: ถ้าต้องการตรวจ references แยก

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

## Step 7: ถ้าต้องการสร้าง action checklist แยก

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

## Step 8: ถ้าจะให้ AI ช่วยแก้ไฟล์

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
