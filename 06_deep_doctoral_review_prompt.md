# 06 Deep Doctoral Review Prompt

ใช้ prompt นี้หลังจากมีผลตรวจรอบแรกแล้ว เช่น `04_review_notes/01_full_review.md` และ `04_review_notes/02_reference_audit.md`

prompt นี้เป็นขั้นสูง ไม่ใช่ค่าเริ่มต้นสำหรับเด็กใหม่ ถ้า draft ยังต้นมาก ยังไม่มี reference/result พอ หรือยังไม่เคยทำ `ประเมิน` ให้ทำ review รอบปกติก่อน

เป้าหมายคือการตรวจลึกระดับปริญญาเอกหรือระดับ reviewer/advisor ที่ต้องทดสอบว่า argument ของงานยังยืนอยู่ได้เมื่อเจอแหล่งหลักฐานจริง มุมมองคู่แข่ง counter-argument และการตรวจ claim แบบละเอียด ไม่ใช่ prompt สำหรับขัดภาษา

คำสั่งสั้น:

```text
ประเมินเชิงลึก
```

คำสั่งเต็ม:

```text
ประเมิน workspace นี้แบบ deep doctoral review โดยยังไม่แก้ thesis/manuscript ต้นฉบับ

ใช้หลังจากมี review notes รอบแรกแล้ว ถ้ายังไม่มี 04_review_notes/01_full_review.md ให้ทำ full review ตาม prompt_pack/01_full_thesis_review_prompt.md ก่อน
ถ้า draft ยังต้นมาก ให้หยุดและบอกผู้ใช้ว่าควรแก้ blocking issues จาก 04_review_notes/03_student_action_checklist.md ก่อนค่อยทำ deep review

อ่าน:
- 00_context_notes.md ถ้ามี
- 00_review_instructions/ ทุกไฟล์
- 01_working_text/ และ input/ เฉพาะงานเวอร์ชันล่าสุด
- 02_references/bib/ ถ้ามี
- 02_references/pdf/ รายชื่อ PDF reference และ extracted_md/ ที่มี
- 02_references/official_pages/ ถ้ามี
- 03_results/ ถ้ามี
- 04_review_notes/00_inventory.md ถ้ามี
- 04_review_notes/01_full_review.md ถ้ามี
- 04_review_notes/02_reference_audit.md ถ้ามี
- 04_review_notes/03_student_action_checklist.md ถ้ามี
- 04_review_notes/99_review_state.md ถ้ามี
- prompt_pack/06_deep_doctoral_review_prompt.md
- prompt_pack/templates/04_review_notes/04_deep_review_TEMPLATE.md ถ้ามี

กติกาหลัก:
1. ใช้เฉพาะหลักฐานจาก manuscript, references, PDF, official pages, result files, และ review notes ใน workspace
2. ถ้าต้องใช้ข้อมูลล่าสุดจากภายนอก เช่น consensus ล่าสุด, paper ใน 5 ปีล่าสุด, venue status, dataset update, product/industry trend หรือกฎหมาย/มาตรฐาน ให้ระบุว่าต้อง live verify และอย่าเดา
3. ห้ามแต่ง citation, DOI, paper metadata, venue ranking, result, law, IRB requirement, dataset status หรือ expert consensus
4. ถ้าอ่าน PDF reference เพิ่ม ต้องสร้างหรืออัปเดต Markdown trace note หนึ่งไฟล์ต่อหนึ่ง PDF ใน 02_references/extracted_md/ ก่อนนำข้อมูลไปใช้
5. แยกให้ชัดระหว่าง established evidence, debated evidence, reviewer interpretation, และ missing input
6. เขียนผลตรวจเป็นภาษาไทย โดยคง technical terms, paper titles, venue names, dataset names, metric names เป็น English เมื่อเหมาะสม

ทำ deep review ตาม module ต่อไปนี้:

1. Deep Research and Source Triangulation
- ระบุ claim หลัก 5-10 ข้อที่ thesis/manuscript ต้องพึ่งพา
- สำหรับแต่ละ claim แยกหลักฐานใน manuscript, reference support, result support, และ missing evidence
- แยกสิ่งที่ established แล้วจากสิ่งที่ยัง debated หรือ context-dependent
- ระบุแหล่งชนิดใดที่น่าเชื่อถือที่สุดสำหรับ claim นั้น เช่น systematic review, benchmark paper, standard, guideline, official dataset page, primary experiment, theorem, legal text, หรือ venue instruction
- อย่าใช้ blog, secondary summary, AI output, หรือ vendor claim แทน primary source เว้นแต่ระบุข้อจำกัดชัดเจน

2. Recent Literature and Consensus Check
- ตรวจว่า reference set มีงานสำคัญช่วง 5 ปีล่าสุดพอหรือไม่ โดยดูจากหลักฐานใน workspace
- ถ้า workspace ไม่มี paper ล่าสุดพอ ให้ list กลุ่มงานที่ต้องค้น ไม่ต้องแต่ง paper title เอง
- ระบุ competing perspectives หรือ method families ที่ literature review ยังไม่ครอบคลุม
- Flag งานหรือหลักฐานที่ขัดกับ mainstream view และอธิบายว่ากระทบ problem, method, baseline, metric หรือ claim อย่างไร
- แยก direct prior work, adjacent work, foundational work, และ weak decorative citation

3. Counter-Argument and Failure Attack
- เขียน strongest counter-arguments ต่อ thesis argument หลัก
- ระบุ evidence หรือ missing evidence ที่อาจทำให้ argument ล้ม
- ระบุ blind spots ที่ reviewer น่าจะโจมตี เช่น baseline ง่ายกว่า, problem ถูกแก้แล้ว, metric วัดผิด construct, data bias, weak ground truth, overclaim, leakage, confounding, หรือ ethical/legal blocker
- ระบุ "decisive test" ที่ถ้าผลออกมาไม่ดีต้องยอมรับว่างานไม่สำเร็จ
- แยก counter-argument ที่แก้ได้ด้วยการเขียนใหม่ ออกจาก counter-argument ที่ต้องมี experiment/data/reference เพิ่ม

4. Claim and Source Credibility Audit
- ตรวจ claim สำคัญทีละข้อว่า true / partially supported / unsupported / contradicted / missing input
- สำหรับแต่ละ claim ระบุ original source ที่ควรตรวจ, วันที่/เวอร์ชันถ้ามีใน workspace, และความเสี่ยงว่าข้อมูลอาจ update แล้ว
- Flag claim ที่มักถูก misquote, overgeneralized, หรือใช้ผิดบริบท
- ตรวจว่า citation รองรับประโยคที่ cite จริงหรือแค่เกี่ยวข้องกว้าง ๆ
- ตรวจว่ามี claim จาก abstract/introduction ของ paper อื่นที่ถูกนำมาใช้เกินสิ่งที่ paper พิสูจน์หรือไม่

5. Data, Result, and Report Interpretation
- วิเคราะห์ dataset/report/result files ที่มีเหมือน research analyst
- ระบุ 3 pattern สำคัญ, 1 anomaly หรือสิ่งที่ไม่เข้ากับ narrative, และ conclusion ที่ data รองรับแต่ manuscript ยังไม่เห็น
- ตรวจว่า metric, denominator, sampling frame, missing data, exclusion criteria, confidence interval/statistical test หรือ qualitative coding procedure เพียงพอหรือไม่
- แยก raw result, processed result, interpretation, และ claim
- ระบุการคำนวณหรือ script ที่ต้องตรวจซ้ำเพื่อให้ result reproducible

6. Expert Breakdown for Student Revision
- อธิบายปัญหาแกนกลางของงานแบบที่ advisor ปริญญาเอกจะอธิบายให้นิสิตปีแรกเข้าใจ
- เริ่มจากว่าทำไมเรื่องนี้สำคัญ
- เดินตามลำดับ concept: problem, gap, objective, method, evidence, output, outcome, limitation
- ใช้ตัวอย่างจริงจาก thesis/manuscript ไม่ใช่ analogy
- จบด้วยความเข้าใจผิดหลักที่ผู้เขียนดูเหมือนกำลังมี

7. Decision Brief for Next Revision
- สร้าง brief ไม่เกิน 500 คำสำหรับตัดสินใจรอบต่อไป
- ครอบคลุม key facts, blocking risks, alternatives, evidence-backed best path, และสิ่งที่ไม่ควรทำตอนนี้
- ถ้ายังตัดสินใจไม่ได้เพราะ missing input ให้ระบุ missing input ขั้นต่ำที่ต้องได้ก่อน

ให้สร้างหรืออัปเดต:
- 04_review_notes/04_deep_review.md
- 04_review_notes/03_student_action_checklist.md เฉพาะ action ที่เพิ่มจาก deep review
- 04_review_notes/99_review_state.md โดยระบุว่า deep review ทำ module ใดแล้วและค้างอะไร

Output format:

## Deep Review Executive Summary
## Evidence Boundary and Missing Inputs
## Claim Map and Source Triangulation
## Recent Literature, Consensus, and Debate
## Strongest Counter-Arguments
## Claim Credibility Audit
## Data and Result Interpretation
## Decisive Tests and Failure Conditions
## Expert Breakdown for Student Revision
## Decision Brief Under 500 Words
## Added Student Actions
## Deep Review State For Next Round
```

## วิธีใช้ร่วมกับชุดเดิม

- ใช้ `ประเมิน` ก่อน เพื่อสร้าง inventory, full review, reference audit และ action checklist
- สำหรับเด็กใหม่หรือ draft ต้น ให้หยุดที่ `ประเมิน` แล้วแก้ blocking issues ก่อน
- ใช้ `ประเมินเชิงลึก` เมื่ออยากทดสอบงานระดับเข้มกว่าเดิม โดยเฉพาะก่อน defense, proposal defense, manuscript submission หรือ revision ใหญ่
- ถ้ามีเวลาจำกัด ให้เลือก module เฉพาะ เช่น `ประเมินเชิงลึกเฉพาะ counter-argument และ claim credibility`
- ถ้าต้องค้นข้อมูลภายนอก ให้บันทึกแหล่งที่ตรวจและวันที่ตรวจไว้ใน review note หรือ `02_references/official_pages/`
