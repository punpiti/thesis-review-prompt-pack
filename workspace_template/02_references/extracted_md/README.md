# 02_references/extracted_md

โฟลเดอร์นี้ให้ AI เก็บบันทึกผลอ่าน reference PDF เป็น Markdown หนึ่งไฟล์ต่อหนึ่ง PDF

ใช้เมื่อ Codex, Claude Code หรือ workspace AI อ่านไฟล์ใน `../pdf/` เพื่อสร้างหรือตรวจ `../bib/references.bib`

ในแต่ละไฟล์ควรมี:

- ชื่อไฟล์ PDF ต้นฉบับ
- title, authors, year, venue, DOI/URL ที่พบจาก PDF หรือแหล่งทางการ
- abstract ที่พบ หรือระบุว่าไม่พบ abstract
- หน้า/section ที่ตรวจ
- สรุปสั้น ๆ ว่า paper นี้เกี่ยวกับอะไรและ support claim แบบใด
- จุดที่ยังต้อง verify

ห้ามใช้ไฟล์ในโฟลเดอร์นี้เป็นหลักฐานใหม่แทน PDF หรือ official page เพราะเป็นเพียงบันทึกร่องรอยการอ่าน
