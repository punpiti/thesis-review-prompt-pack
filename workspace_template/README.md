# Thesis Review Workspace Template

คัดลอกโฟลเดอร์นี้ไปเป็น workspace ใหม่ของงานที่ต้องการตรวจ แล้ววางไฟล์ thesis/manuscript และ reference ตามโครงนี้

```text
my_thesis_review/
  AGENTS.md
  CLAUDE.md
  00_context_notes.md
  00_inbox/
  00_review_instructions/
  input/
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

หลังจัดไฟล์แล้ว เปิด workspace นี้ด้วย Codex / Claude Code / Antigravity แล้วสั่ง:

```text
init workspace จากไฟล์รวม
```

ถ้าวางไฟล์เข้าถูกโฟลเดอร์เองแล้ว ข้าม prompt นี้ได้

จากนั้นสั่ง:

```text
เตรียม instruction จากงานปัจจุบัน
```

จากนั้นสั่ง:

```text
ประเมิน
```

AI ควรสร้างหรืออัปเดต context ใน `00_review_instructions/` ก่อน แล้วจึงสร้าง review notes ใน `04_review_notes/` ห้ามแก้ thesis ต้นฉบับทันที ชุดนี้ใช้เพื่อช่วยตรวจและให้ feedback ไม่ใช่ให้ AI ปรับปรุงต้นฉบับแทนเจ้าของงานโดยอัตโนมัติ ให้ AI ชี้จุดอ่อน แนะนำ และบอกหลักฐานที่ควรตรวจเพิ่ม จากนั้นเจ้าของงานต้องกลับไปทำเอง

ถ้ามี review notes รอบแรกแล้ว งานคืบหน้าพอ มี reference/result พอ และต้องการตรวจเข้มระดับปริญญาเอก ให้สั่ง:

```text
ประเมินเชิงลึก
```

AI ควรสร้าง `04_review_notes/04_deep_review.md` และอัปเดต action/state notes โดยยังไม่แก้ thesis ต้นฉบับ ถ้า draft ยังต้นมาก ให้แก้ blocking issues จาก `ประเมิน` ก่อน
