# 00_review_instructions

โฟลเดอร์นี้เป็น instruction folder สำหรับ Codex, Claude Code หรือ workspace AI

ให้ AI อ่านไฟล์งานปัจจุบัน เช่น LaTeX, Markdown, DOCX/PDF text extract, reference files และ result files แล้วสร้าง context สำหรับการตรวจไว้ที่นี่ก่อนเริ่ม full review

ไฟล์ที่ AI ควรสร้างหรืออัปเดต:

- `review_profile.md` - สาขา ระดับงาน target venue ชื่อเรื่อง abstract contribution และข้อจำกัดที่อ่านได้จากงาน
- `file_inventory.md` - รายการไฟล์ที่พบจาก `00_inbox/` หรือ workspace และตำแหน่งที่จัดไป
- `document_map.md` - แผนที่ไฟล์/section/chapter ของ thesis หรือ manuscript ปัจจุบัน
- `review_scope.md` - ขอบเขตการตรวจ รอบนี้ต้องตรวจอะไร อะไรยังขาด และอะไรไม่ควรเดา
- `missing_inputs.md` - ข้อมูลที่จำเป็นมาก / ควรมี / ยังไม่จำเป็น

กติกา:

- ให้สรุปจากหลักฐานใน workspace ก่อน ไม่ถามผู้ใช้ซ้ำถ้าอ่านจากเอกสารได้
- ถ้าข้อมูลไม่อยู่ในเอกสาร ให้เขียนว่า `missing input`
- ถ้าอ่าน LaTeX ให้ตาม `\input{}` และ `\include{}` เท่าที่จำเป็น แต่อย่าแก้ไฟล์ต้นฉบับ
- ห้ามสร้าง citation, DOI, venue ranking, result, IRB/legal requirement หรือ claim เอง
- ไฟล์ในโฟลเดอร์นี้เป็น working instruction สำหรับ review ไม่ใช่ thesis ฉบับแก้ไข
