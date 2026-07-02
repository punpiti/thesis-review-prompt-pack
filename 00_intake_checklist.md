# 00 Intake Checklist

ใช้ checklist นี้เป็นรายการอ้างอิงให้ AI ตรวจว่าเอกสารและ workspace ยังขาดข้อมูลสำคัญอะไร ไม่จำเป็นต้องให้นิสิตกรอกทุกข้อก่อนเริ่ม หากข้อมูลอยู่ใน thesis/manuscript หรือไฟล์ประกอบแล้ว ให้ AI สรุปจากเอกสารเอง และถามกลับเฉพาะข้อมูลที่จำเป็นต่อการ review จริงเท่านั้น

```text
1. ข้อมูลพื้นฐาน
- ชื่อผู้เขียน:
- ระดับงาน: ปริญญาตรี / ปริญญาโท / ปริญญาเอก / manuscript จาก thesis / อื่น ๆ
- สาขา / subfield:
- หลักสูตร / ภาควิชา:
- ภาษาเอกสาร: ไทย / อังกฤษ / สองภาษา
- สถานะเอกสาร: proposal / draft thesis / defense draft / journal manuscript / revised manuscript

2. เป้าหมาย publication หรือการประเมิน
- Target venue หลัก:
- Venue สำรอง:
- คาดหวังระดับใด: thesis-only / conference / national journal / international journal / Q1 / Q2 / อื่น ๆ
- เหตุผลที่เลือก venue:
- ข้อกำหนดสำคัญของ venue ถ้ามี เช่น scope, article type, page limit, dataset policy:
- มี paper ใน target venue ที่ใช้เป็นตัวอย่างหรือ venue anchor แล้วหรือไม่:

3. ข้อมูลเอกสารหลัก
- ไฟล์หลักที่ให้ตรวจ:
- มี title และ abstract เวอร์ชันล่าสุดหรือไม่:
- มี problem statement ชัดหรือไม่:
- มี objectives หรือ research questions ชัดหรือไม่:
- มี methodology ชัดหรือไม่:
- มี results หรือ expected results หรือไม่:
- มี discussion, scope, limitations หรือไม่:
- มี table/figure ครบหรือไม่:
- มี appendix/supplementary material หรือไม่:
- มี style guide หรือ template ที่ต้องตามหรือไม่:
- ต้องการให้ตรวจคุณภาพภาษา การสะกด ชื่อย่อ และการปนภาษาไทย/อังกฤษหรือไม่:
- เอกสารมีส่วนที่ใช้ AI ช่วยร่างหรือแปลอย่างมีนัยสำคัญหรือไม่:

4. ข้อมูล experiment / evidence
- Dataset/testbed ที่ใช้จริง:
- Baseline ที่ใช้เทียบ:
- Metrics:
- มี raw results หรือ raw outputs หรือไม่:
- มี script หรือขั้นตอนคำนวณ metric หรือไม่:
- มี error cases / failure analysis หรือไม่:
- มี runtime, latency, cost, หรือ computation trade-off หรือไม่ ถ้าเกี่ยวข้อง:

5. จริยธรรมการวิจัย / IRB / ข้อกฎหมายหรือข้อบังคับ
- งานเกี่ยวข้องกับ human subjects, ผู้ใช้, นักเรียน/นิสิต, ผู้ป่วย, ผู้เชี่ยวชาญ, หรือผู้ให้ข้อมูลหรือไม่:
- มีการเก็บข้อมูลส่วนบุคคล ข้อมูลอ่อนไหว เสียง ภาพ แชต log พฤติกรรม หรือข้อมูลระบุตัวตนได้หรือไม่:
- ต้องขอ IRB/ethics approval หรือ exemption หรือไม่:
- มี consent form, participant information sheet, de-identification/anonymization plan หรือไม่:
- ใช้ข้อมูลจาก web scraping, social media, platform, LMS, email, chat, medical/legal/financial records หรือแหล่งที่มี Terms of Service หรือไม่:
- dataset/license อนุญาตให้ใช้เพื่อ research, redistribution, model training, หรือ publication หรือไม่:
- มีประเด็น copyright, data ownership, confidentiality, NDA, institutional permission หรือไม่:
- มีข้อกฎหมาย/ข้อบังคับเฉพาะที่ควรกล่าวในเนื้อหา เช่น data protection, privacy, AI policy, research ethics, domain regulation หรือไม่:
- manuscript ระบุ ethics/IRB/legal compliance ไว้ในตำแหน่งที่เหมาะสมหรือยัง:

6. ข้อมูล reference
- ไฟล์ BibTeX หรือ reference list:
- BibTeX มี abstract field หรือไม่:
- มี PDF ของ reference สำคัญหรือไม่:
- มี reference ที่ยังไม่มั่นใจ metadata หรือไม่:
- มี reference ที่เป็น preprint, web page, technical report, thesis, หรือ report หรือไม่:
- มี reference ข้าม domain ที่ต้องอธิบายบทบาทเป็น conceptual support หรือไม่:

7. การใช้ LLM ถ้ามี
- ใช้ LLM ในงานวิจัยหรือการเขียนส่วนใด:
- ใช้ LLM เป็นเครื่องมือช่วย / baseline / method หลัก / evaluator / อื่น ๆ:
- เก็บ prompt, output, model name, date, setting หรือ log ที่เกี่ยวกับ experiment หรือไม่:
- claim, citation, venue, metric, DOI, ranking ตรวจจากแหล่งจริงแล้วหรือไม่:
- มี baseline ที่ไม่ใช่ LLM หรือ baseline แบบ LLM ธรรมดาหรือไม่ ถ้า task เป็น text/recommendation/review/matching:

8. ขอบเขตการตรวจในรอบนี้
- ต้องการตรวจทั้งเล่มหรือเฉพาะบท:
- ต้องการเน้นอะไรเป็นพิเศษ:
- สิ่งที่ยังไม่ต้องตรวจ:
- deadline:
```

## Minimum Input

- Thesis/manuscript ล่าสุด
- Title และ abstract ล่าสุด
- Problem statement
- Objectives / research questions
- Related work หรือ literature review
- Methodology
- Results หรือ expected results
- Dataset, baseline, metrics, raw result หรือหลักฐานที่มี
- Ethics/IRB/legal compliance information ถ้าเกี่ยวข้อง
- Discussion / limitation / scope
- References หรือ BibTeX
- Target venue หรืออย่างน้อยประเภท venue ที่อยากส่ง
