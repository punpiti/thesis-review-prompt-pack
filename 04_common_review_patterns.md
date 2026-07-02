# 04 Common Review Patterns

ไฟล์นี้รวมข้อผิดพลาดที่พบได้บ่อยในการตรวจ thesis/manuscript เพื่อใช้เป็น checklist ก่อนส่งงาน

## 1. Claim แรงเกินหลักฐาน

คำหรือโครงแบบนี้ต้องตรวจเป็นพิเศษ:

- `significant improvement`
- `robust`
- `verified`
- `proven`
- `state-of-the-art`
- `solves`
- `ลดต้นทุนอย่างมีนัยสำคัญ`
- `พิสูจน์แล้ว`
- `แก้ปัญหาได้`
- `ยังไม่มีงานใด`
- `เป็นรากฐานสำคัญ`

ถ้าไม่มีผลทดลอง citation ตรง หรือการวัดที่นิยามชัด ให้ใช้ภาษาที่ป้องกันได้กว่า เช่น:

- `is designed to`
- `aims to`
- `suggests`
- `may improve`
- `supports`
- `remains less directly explored`

## 2. Placeholder ใน abstract หรือ results

ห้ามมี placeholder เช่น `[X]`, `[dataset]`, `[baseline]`, `[metric]`, `[value]` ในเอกสารที่จะส่งจริง

ก่อนเขียน result claim ต้องมี:

- dataset/testbed ที่ใช้จริง
- baseline ที่นิยามชัด
- metric definition
- raw outputs หรือ raw results
- script หรือวิธีคำนวณ metric
- result table
- error cases หรือ failure analysis
- computation/runtime trade-off ถ้า method หนักกว่า baseline

## 3. Abstract ต้องครบ 6 ส่วน

Abstract ที่ดีควรตอบ:

- problem คืออะไร
- gap คืออะไร
- method ทำอะไรจริง
- evaluation ใช้ข้อมูล baseline และ metric อะไร
- result หลักคืออะไร
- contribution ที่ตรวจสอบได้คืออะไร

ถ้ายังไม่มีผล ให้เขียนเป็น protocol-based abstract ชั่วคราว และ mark ว่าประโยค result ต้องเติมจากผลจริงเท่านั้น

## 4. Introduction กับ Related Work ต้องไม่ซ้ำกัน

Introduction ควรเล่า problem, why hard, gap, contribution แบบสั้น

Related Work ควรจัดกลุ่มงานเดิม เปรียบเทียบจุดแข็งจุดอ่อน และทำให้เห็นว่าทำไม design choice ของงานนี้จึงจำเป็น

## 5. แยก direct prior work กับ conceptual support

reference แต่ละตัวควรมีหน้าที่ชัด:

- direct prior work: แก้โจทย์ใกล้กัน ข้อมูลใกล้กัน หรือ evaluation ใกล้กัน
- conceptual support: สนับสนุนแนวคิดหรือ design pattern แต่ไม่ได้แก้โจทย์เดียวกัน
- foundational support: รองรับทฤษฎีหรือคณิตศาสตร์พื้นฐาน
- venue anchor: paper ใน venue เป้าหมายที่ช่วยชี้ว่า scope เข้ากัน
- weak/background citation: ใช้ปูพื้นเท่านั้น ไม่ควรแบก claim หลัก

ถ้าใช้ reference ข้าม domain ต้องเขียนว่า support อะไร และไม่ support อะไร

## 6. Literature review ควรมี comparison matrix

ถ้า literature มีหลายกลุ่ม ควรทำตารางประมาณนี้:

| Method family | Main mechanism | Strength | Limitation for this problem | Role in this thesis |
|---|---|---|---|---|
| Direct domain methods | ... | ... | ... | baseline/problem setting |
| Related-domain methods | ... | ... | ... | conceptual support |
| Evaluation methods | ... | ... | ... | metric/baseline design |
| Proposed direction | ... | ... | ... | gap/contribution |

ตารางนี้ช่วยให้เห็นว่างานไม่ได้แค่ list papers แต่ใช้ literature เพื่อสร้าง argument

## 7. Contribution ต้อง trace ได้

ตรวจทุก contribution claim ด้วยคำถาม:

- claim อยู่ตรงไหนในเอกสาร
- claim นี้มาจาก problem/gap ใด
- method ส่วนใดรองรับ claim นี้
- result หรือ evidence ใดพิสูจน์ claim นี้
- baseline หรือ alternative ใดใช้เทียบ
- limitation ใดทำให้ claim นี้ต้องเขียนเบาลง

ถ้า claim ไม่มี evidence location ให้ถือว่ายังอ่อน

## 8. LLM เป็นเครื่องมือ ไม่ใช่แหล่งอ้างอิง

เมื่องานใช้ LLM ช่วยค้น อ่าน สรุป เขียน หรือ generate output ต้องตรวจว่า:

- paper, DOI, venue, metric, ranking และ dataset ตรวจจากแหล่งจริงหรือยัง
- แยกได้หรือไม่ว่าอะไรเป็น claim จาก LLM และอะไร verified แล้ว
- มี prompt/output/raw evidence เก็บไว้หรือไม่ ถ้าเป็นส่วนของ experiment
- มี LLM baseline ที่เหมาะสมหรือไม่
- ถ้า LLM ธรรมดาทำได้เท่ากัน contribution ยังเหลืออะไร
- งานวิจัยไม่ได้กลายเป็น generic LLM reviewer, chatbot, หรือ summarizer

## 9. Data, baseline, evaluation, venue ต้อง feasible พร้อมกัน

หัวข้อที่ดูดีแต่ไม่มี data หรือ evaluate ไม่ได้ควรถือว่าเสี่ยงสูง ให้ตรวจทุกหัวข้อด้วย matrix:

| Candidate | Data availability | Baselines | Evaluation | Venue fit | Main risk | Fallback |
|---|---|---|---|---|---|---|

สำหรับ thesis ควรถามหา `narrowest defensible version` เสมอ ไม่ใช่เริ่มจาก platform ใหญ่หรือ claim ใช้ได้ทุก domain

## 10. Ethics, IRB, legal compliance ต้องไม่เป็นส่วนเติมท้าย

ถ้างานเกี่ยวข้องกับคน ผู้ใช้ ข้อมูลส่วนบุคคล ข้อมูลอ่อนไหว หรือข้อมูลจากระบบ/platform ต้องตรวจตั้งแต่ต้น ไม่ใช่รอใกล้ส่ง paper แล้วค่อยเติมประโยค ethics

ควรถามอย่างน้อย:

- มี human subjects หรือ identifiable personal data หรือไม่
- ต้องขอ IRB/ethics approval หรือ exemption หรือไม่
- มี consent, participant information sheet, de-identification/anonymization plan หรือไม่
- มีข้อมูลจาก web scraping, social media, LMS, chat, email, platform log, medical/legal/financial/institutional record หรือไม่
- dataset license อนุญาตให้ใช้ เผยแพร่ ดัดแปลง train model หรือทำ benchmark ตามที่ทำจริงหรือไม่
- มี copyright, data ownership, Terms of Service, NDA, confidentiality หรือข้อบังคับของสถาบัน/venue/domain เฉพาะหรือไม่
- manuscript ควรมี ethics statement, data availability, consent statement, AI-use statement หรือ limitation ด้าน compliance หรือไม่

หมายเหตุ: prompt ใช้ช่วย flag ประเด็นเท่านั้น ไม่ใช่ legal advice ต้องตรวจจริงกับอาจารย์ที่ปรึกษา IRB office สถาบัน venue instructions หรือแหล่งกฎหมาย/ข้อบังคับที่เกี่ยวข้อง

## 11. Figures and tables ต้องเป็นหลักฐาน

รูปและตารางที่ดีควร:

- ถูกอ้างในเนื้อหาก่อนหรือใกล้กับตำแหน่งที่ปรากฏ
- caption บอก insight ไม่ใช่แค่ชื่อรูป
- มี unit, legend, label, sample size, metric หรือ condition ครบ
- อ่านได้เมื่อพิมพ์หรือแปลงเป็น PDF
- ไม่ใส่ placeholder
- สอดคล้องกับ result claim ใน abstract/conclusion

## 12. คุณภาพภาษาและสัญญาณการใช้ AI แบบไม่ระวัง

เอกสารที่ใช้ AI ช่วยเขียนไม่ได้ผิดโดยตัวมันเอง แต่ผู้เขียนต้องยังควบคุมเนื้อหาและตรวจความถูกต้องเอง สัญญาณเสี่ยง ได้แก่:

- ย่อหน้าลื่นแต่ไม่มี claim, evidence, หรือ reasoning ใหม่
- ใช้คำกว้าง ๆ ซ้ำ เช่น important, significant, robust, comprehensive โดยไม่มีหลักฐาน
- คำแปลแปลกหรือคำไทย/อังกฤษที่ไม่ใช่ภาษาของ field
- terminology เดียวกันถูกเรียกหลายชื่อโดยไม่จำเป็น
- reference หรือ DOI ดูเหมือนถูก generate แต่ยังไม่ตรวจ
- บอกว่ามีผลหรือมีข้อสรุป ทั้งที่ไม่มี raw result หรือ metric รองรับ

## 13. Spelling, acronyms, and reader flow

ควรตรวจ hygiene พื้นฐานก่อนส่งงาน:

- สะกดผิดหรือ typo มากเกินระดับ draft ปกติหรือไม่
- ชื่อย่อทุกตัวถูกนิยามก่อนใช้หรือไม่
- ชื่อย่อเหมาะสมหรือไม่ หรือทำให้เอกสารดูไม่เป็นวิชาการ
- ใช้ชื่อ method, dataset, metric, model, variable และหน่วยวัดสม่ำเสมอหรือไม่
- ปนภาษาไทย/อังกฤษมากเกินจำเป็นหรือไม่
- อ้างไปยังสิ่งที่ผู้อ่านยังไม่เห็น เช่น section ด้านหลัง รูปด้านหลัง ตารางด้านหลัง นิยามที่ยังไม่ให้ โดยไม่มี context หรือไม่
- ใช้คำว่า `ดังกล่าว`, `ข้างต้น`, `ต่อไปนี้`, `the above`, `the following`, `this method` แบบกำกวมหรือไม่
