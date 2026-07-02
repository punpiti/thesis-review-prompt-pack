# 05a Chat AI Fallback Guide for Gemini / ChatGPT / Claude with Limited Quota

คู่มือนี้เป็น fallback เท่านั้น สำหรับนิสิตที่ไม่มี Codex / Claude Code / Antigravity หรือ AI ที่อ่านไฟล์ใน workspace ได้

ไม่แนะนำให้ใช้ chat/webapp ตรวจทั้งเล่ม เพราะต้อง copy ข้อความเองหลายรอบและ AI มักหลุดบริบท ให้ใช้เฉพาะการตรวจส่วนสั้น ๆ เช่น title/abstract, related work บางย่อหน้า หรือ document hygiene เฉพาะ section

หลักสำคัญ: อย่าส่งทั้งเล่มแล้วถามว่า `ดีไหม` ให้แบ่งตรวจเป็นรอบสั้น ๆ และขอเฉพาะประเด็นที่ต้องแก้ก่อน

## Scenario: มีร่างวิทยานิพนธ์และ references แล้ว

สมมุติว่านิสิตมีไฟล์เหล่านี้:

```text
thesis_draft.pdf หรือ thesis_draft.docx
references.bib หรือ reference list
ผลทดลองบางส่วน เช่น ตารางผล / รูป / raw result
```

ให้ทำตามขั้นตอนนี้

## Step 0: เตรียมข้อมูลก่อนเปิด AI

สร้างไฟล์ note ของตัวเองหนึ่งไฟล์ เช่น `ai_review_notes.md` แล้วเตรียมข้อมูลสั้น ๆ:

```text
ชื่อเรื่อง:
ระดับ: ปริญญาโท / ปริญญาเอก / manuscript
สาขา:
สถานะเอกสาร: proposal / draft thesis / defense draft / manuscript
target venue หรือประเภท venue:
ปัญหาวิจัย:
objectives/RQs:
ข้อมูลที่ใช้:
baseline:
metrics:
ผลที่มี:
ethics/IRB/legal issue ที่เกี่ยวข้อง:
```

ถ้ายังตอบไม่ได้บางข้อ ให้เขียนว่า `ยังไม่ชัด` หรือ `ยังไม่ได้ตรวจสอบ`

## Step 1: ให้ AI เช็คว่า context พอไหม

คัดลอก prompt นี้ไปใช้:

```text
ฉันต้องการให้ช่วยตรวจร่างวิทยานิพนธ์/manuscript แบบ reviewer

กฎ:
- ห้ามแต่ง citation, DOI, venue ranking, metric, result, IRB/legal requirement หรือข้อกฎหมายเอง
- ถ้าข้อมูลไม่พอ ให้ถามกลับ
- ขอ feedback ภาษาไทย แต่คง technical terms ภาษาอังกฤษได้
- ทุกประเด็นสำคัญต้องบอกว่าดูจากข้อมูลส่วนไหน

ก่อนตรวจเต็ม ช่วยบอกว่าข้อมูลต่อไปนี้ยังขาดอะไรบ้าง

[PASTE ข้อมูลจาก Step 0]
```

ผลที่ควรได้: AI ควรถามหาข้อมูลที่ขาด ไม่ใช่รีบตัดสินงาน

## Step 2: ตรวจ title, abstract, problem, objectives

ใช้กับ quota จำกัดได้ดี เพราะข้อความไม่ยาว

```text
ช่วยตรวจเฉพาะ title, abstract, problem statement และ objectives/RQs ต่อไปนี้

ขอ output เป็น:
1. title กับ abstract สอดคล้องกันหรือไม่
2. problem มีน้ำหนักพอหรือไม่
3. objectives/RQs มาจาก problem หรือไม่
4. มี claim ใดแรงเกินหลักฐานหรือไม่
5. top 5 fixes ก่อนส่งอาจารย์

ห้าม rewrite ทั้งหมด ให้เสนอเฉพาะจุดที่ควรแก้และเหตุผล

[PASTE title, abstract, problem, objectives/RQs]
```

ให้บันทึกคำตอบไว้ใน `ai_review_notes.md`

## Step 3: ตรวจ literature review แบบประหยัด quota

อย่าส่งทุก reference ถ้ายาวมาก ให้ส่ง:

- หัวข้อย่อยของ related work
- 1-2 ย่อหน้าสำคัญต่อหัวข้อ
- reference list หรือ BibTeX เฉพาะรายการหลัก

Prompt:

```text
ช่วยตรวจ literature review ส่วนนี้แบบ reviewer

ขอให้เน้น:
1. literature review เป็น synthesis หรือแค่ summary ทีละ paper
2. มี claim ที่ควร cite แต่ยังไม่มี citation หรือไม่
3. citation ใดดูไม่ตรง claim
4. reference ควร cluster เป็นกลุ่มอะไรบ้าง
5. ควรมี comparison matrix แบบใด
6. มี direct prior work, cross-domain support, foundational support, target-venue anchor แยกชัดหรือไม่

ตอบแบบสั้นเป็นตารางและ bullet

[PASTE related work + reference list เฉพาะที่เกี่ยวข้อง]
```

## Step 4: ตรวจ method, data, baseline, results

ส่งเฉพาะส่วน methodology + ตารางผล + คำอธิบาย dataset/baseline/metric

```text
ช่วยตรวจ methodology และ results ต่อไปนี้

ขอให้ตอบ:
1. method แก้ problem/objective จริงหรือไม่
2. baseline พอหรือไม่ ถ้าไม่พอควรมีอะไร
3. metrics เหมาะสมหรือไม่
4. results ตอบ objectives/RQs หรือไม่
5. มี result claim ใดที่ยังไม่มี raw result/script/error analysis รองรับ
6. top 5 blocking issues

ห้ามแต่งผลทดลองเพิ่ม

[PASTE methodology, dataset, baseline, metrics, result table]
```

## Step 5: ตรวจ ethics / IRB / legal compliance

ใช้เมื่อมีคน ผู้ใช้ ข้อมูลส่วนบุคคล scraping social media LMS chat logs dataset license หรือข้อมูลที่มีข้อบังคับ

```text
ช่วย flag ประเด็น ethics/IRB/legal compliance จากข้อมูลนี้

กฎ:
- ห้ามให้ legal advice
- ห้ามสรุปแทนว่าไม่ต้องขอ IRB ถ้าไม่มีหลักฐานจากสถาบัน
- ให้บอกว่าควรถามอาจารย์/IRB office/venue/institution เรื่องใด

ข้อมูล:
[PASTE data collection, participants, consent, dataset/source/license, scraping/platform details]

ขอ output:
1. ประเด็นที่อาจต้องมี IRB/ethics approval หรือ exemption
2. consent/anonymization/de-identification ที่ควรมี
3. license/copyright/Terms of Service/data ownership ที่ต้องตรวจ
4. ข้อความที่ manuscript ควรมี เช่น ethics statement, data availability, consent statement
```

## Step 6: ตรวจภาษาและ document hygiene

ส่งเฉพาะ section ที่สงสัย

```text
ช่วยตรวจ document hygiene ของข้อความนี้

เน้น:
1. สะกดผิดหรือ typo มากเกินเหตุ
2. ใช้ชื่อย่อโดยไม่ define
3. ปนภาษาไทย/อังกฤษเกินจำเป็น
4. อ้างถึงสิ่งที่อยู่ด้านหลังที่ผู้อ่านยังไม่เห็น
5. มีร่องรอยใช้ AI แบบ generic, claim ลอย, คำแปลแปลก หรือ terminology ไม่สม่ำเสมอ

ห้าม rewrite ทั้งหมด ให้ list ปัญหาและตัวอย่างเท่านั้น

[PASTE SECTION]
```

## Step 7: สรุปคะแนนด้วย rubric

เมื่อได้ feedback หลายรอบแล้ว ค่อยใช้ rubric

```text
จาก notes ต่อไปนี้ ช่วยให้คะแนนตาม rubric 0-5 โดยเน้น blocking issues ก่อน

ให้ output:
1. ตารางคะแนน
2. blocking issues ที่ต้องแก้ก่อน
3. fixes ที่ควรทำใน 1 สัปดาห์
4. ประเด็นที่ต้องถามอาจารย์

[PASTE summary notes + relevant parts of 03_review_rubric.md]
```

## ถ้า quota เหลือน้อยมาก

ใช้ prompt นี้:

```text
ตรวจเฉพาะ blocking issues 5 ข้อแรกจากข้อความนี้
ต้องอ้างตำแหน่งจากหัวข้อ/ย่อหน้า
ห้าม rewrite ทั้งบท
ห้ามแต่ง citation, DOI, result, venue ranking, หรือ IRB/legal requirement เอง

[PASTE TEXT]
```

## สิ่งที่ไม่ควรทำกับ Chat AI

- อย่าส่งทั้งเล่มแล้วถามว่า `ดีไหม`
- อย่าให้ AI rewrite ทั้งบทก่อนรู้ว่า problem/objective/result ผิดตรงไหน
- อย่าให้ AI สร้าง reference เอง
- อย่าเชื่อ venue ranking, DOI, law, IRB decision จาก AI โดยไม่ตรวจ
- อย่าใช้คำตอบ AI เป็นหลักฐานใน thesis
