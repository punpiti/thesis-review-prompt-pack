# 01 Full Thesis Review Prompt: ฉบับอธิบายแนวคิดภาษาไทย

ไฟล์นี้ทำไว้ให้นิสิตอ่านเพื่อเข้าใจว่า prompt หลักใน `01_full_thesis_review_prompt.md` ต้องการให้ AI ตรวจอะไรบ้าง

ไฟล์นี้ไม่ใช่ prompt สำหรับ copy ไปใช้ตรง ๆ หากต้องการสั่ง AI ให้ใช้ไฟล์ `01_full_thesis_review_prompt.md` หรือใช้ workflow ใน `workspace.html`

## หลักคิดของ prompt นี้

การตรวจวิทยานิพนธ์ที่ดีไม่ใช่การตรวจภาษาอย่างเดียว แต่ต้องตรวจว่าเรื่องทั้งเรื่องต่อกันจริงหรือไม่:

- ปัญหาวิจัยมีน้ำหนักพอหรือไม่
- วัตถุประสงค์มาจากปัญหาจริงหรือไม่
- วิธีวิจัยเหมาะกับปัญหาและสาขาหรือไม่
- ผลลัพธ์ตอบวัตถุประสงค์และลดปัญหาได้จริงหรือไม่
- reference รองรับ claim ในเอกสารจริงหรือไม่
- มีหลักฐานเพียงพอสำหรับระดับปริญญาและ venue ที่คาดหวังหรือไม่

AI ต้องไม่แต่งข้อมูลเพิ่มเอง และต้องแยกให้ชัดว่าอะไรเป็นหลักฐานจากเอกสาร อะไรเป็นหลักฐานจาก reference และอะไรเป็นความเห็นแบบ reviewer

## ข้อมูลตั้งต้นที่ต้องรู้

ก่อนประเมิน AI ต้องรู้หรืออ่านจากเอกสารให้ได้อย่างน้อย:

- สาขาและ subfield
- ระดับงาน เช่น ปริญญาตรี ปริญญาโท ปริญญาเอก หรือ manuscript
- สถานะเอกสาร เช่น proposal, thesis draft, defense draft, journal manuscript
- target venue หรือระดับ publication ที่คาดหวัง
- thesis/manuscript text
- reference list หรือ BibTeX

ถ้าข้อมูลเหล่านี้มีอยู่ในเอกสารแล้ว ให้ AI สรุปจากเอกสาร ไม่ต้องถามนิสิตซ้ำ

## สิ่งที่ prompt ให้ AI ตรวจ

### 1. สาขา ระดับงาน และ venue

- ระบุ field/subfield ให้ชัด ไม่ใช้คำกว้างเกินไป เช่น AI, education, data science โดยไม่บอกบริบทวิจัย
- ดูว่างานคาดหวัง contribution ระดับใด และเหมาะกับปริญญาตรี โท เอก หรือ manuscript หรือไม่
- ประเมินว่า target venue หรือ venue category สอดคล้องกับ scope, method, result และ reference หรือไม่
- ตรวจว่ามี paper จาก target venue ใช้เป็น scope anchor จริง ไม่ใช่อ้างเพื่อให้ดูดีเฉย ๆ
- ถ้า target สูงเกินไป ให้บอกว่าต้องเพิ่ม baseline, experiment, theory, dataset, validation หรือ writing standard อะไร

### 2. Title และ abstract

- ตรวจว่า title กับ abstract พูดเรื่องเดียวกันหรือไม่
- ดูว่า title เฉพาะเจาะจงพอหรือไม่ และไม่ overclaim เกินสิ่งที่งานทำจริง
- ตรวจว่า abstract มี problem, gap, method, data, result และ contribution ครบหรือไม่
- จับ placeholder เช่น ยังไม่มี result, dataset, baseline, metric หรือค่าตัวเลขจริง
- flag คำแรง เช่น robust, significant, state-of-the-art, solves หากไม่มีหลักฐานรองรับใน manuscript

### 3. น้ำหนักของปัญหาวิจัย

- ระบุปัญหาวิจัยจริงให้ได้ ไม่ใช่แค่บอกว่าจะพัฒนาระบบหรือประยุกต์เครื่องมือ
- ประเมินว่าปัญหามีน้ำหนักทางวิชาการหรือ practical value เพียงพอหรือไม่
- ดูว่าปัญหาถูก justify ด้วย evidence, literature, gap, limitation ของงานเดิม หรือข้อมูลจริงหรือไม่
- ตรวจว่าปัญหากว้างเกินไป แคบเกินไป ซ้ำกับงานที่แก้ไปแล้ว หรือเป็นเพียงความสะดวกของผู้ทำวิจัยหรือไม่
- บอกว่าควรเพิ่ม evidence แบบใดเพื่อทำให้ปัญหาแข็งแรงขึ้น

### 4. คุณภาพของ literature review

- ตรวจว่า literature review สร้าง problem, gap และ positioning ของงานได้จริงหรือไม่
- แยกว่าข้อความเป็น synthesis หรือเป็นเพียง summary paper ทีละเรื่อง
- หา reference ที่อยู่ใน bibliography แต่ไม่ได้ cite ในเนื้อหา
- หา claim, definition, dataset, method หรือ background statement ที่ควร cite แต่ไม่มี citation
- จับ citation ที่ใช้กว้างเกินไป ใช้ผิด claim หรือใช้แบบ decorative citation
- ดูว่า Introduction กับ Related Work ทำหน้าที่ต่างกันหรือเล่า literature ซ้ำกัน

### 5. การจัดกลุ่มและคุณภาพ reference

- จัดกลุ่ม reference ตามบทบาท ไม่ใช่แค่ keyword เช่น direct prior work, method foundation, dataset/benchmark, evaluation method, theory, target-venue anchor, background, weak citation
- ประเมินแต่ละกลุ่มว่า coverage, quality, recency และ relevance เพียงพอหรือไม่
- ดูว่าขาดงานสำคัญ งานล่าสุด งานใน venue เป้าหมาย หรือ baseline ที่ reviewer คาดหวังหรือไม่
- แยก cross-domain support ว่าสนับสนุน concept ใด และไม่สามารถ support claim ใด
- ระบุ reference ที่ควร verify, demote, remove หรือหาแหล่งที่เหมาะสมกว่า

### 6. ความสอดคล้องของวัตถุประสงค์กับปัญหา

- ระบุ objective หรือ research question ทุกข้อออกมาให้ครบ
- โยงแต่ละ objective กลับไปยัง problem/gap ที่ตั้งไว้
- หา objective ที่ไม่เกิดจากปัญหา หรือเป็นเพียงกิจกรรม เช่น ศึกษา พัฒนา ออกแบบ โดยไม่มีคำถามวิจัย
- หาปัญหาที่เอกสารพูดไว้ แต่ไม่มี objective ใดตั้งใจแก้
- ตรวจว่า objective วัดผลได้หรือไม่ และมีผลลัพธ์รองรับในภายหลังหรือไม่

### 7. ผลลัพธ์และ contribution

- ตรวจว่าผลที่ได้หรือ expected result แสดงว่าปัญหาลดลงหรือถูกแก้จริงหรือไม่
- ดูว่าผลลัพธ์ตรงกับ objective หรือมี objective ที่ไม่มีผลลัพธ์รองรับ
- แยก implementation output ออกจาก research evidence เช่น มีระบบแล้วไม่ได้แปลว่าพิสูจน์ contribution แล้ว
- ตรวจ quantitative result ว่ามี dataset/testbed, baseline, metric definition, raw result และวิธีคำนวณครบหรือไม่
- หา missing error analysis, failure cases, runtime/cost trade-off หรือ statistical/qualitative evidence ที่ venue คาดหวัง

### 8. ความสัมพันธ์โดยรวมของงาน

- สร้าง traceability table จาก `Problem/gap -> Objective/RQ -> Method -> Data/evidence -> Result -> Claim`
- ดูว่าทุก problem มี objective ทุก objective มี method และทุก method มี evidence หรือไม่
- หา broken chain เช่น มี claim แต่ไม่มี result หรือมี result แต่ไม่ตอบ problem
- ระบุ claim ที่เกิน evidence หรืออธิบายเกินสิ่งที่ experiment พิสูจน์ได้
- สรุปว่าทั้งเรื่อง coherent หรือยังเป็นชิ้นส่วนแยกกัน

### 9. แนวคิดการแก้ปัญหาและทางเลือกอื่น

- ประเมินว่าวิธีแก้ปัญหา make sense ในเชิงวิชาการหรือเป็นเพียงวิธีที่ทำสะดวก
- ระบุทางเลือกมาตรฐานหรือ popular approach ในปัญหาเดียวกันที่เอกสารยังไม่กล่าวถึง
- ตรวจว่ามี baseline ที่ควรเทียบหรือไม่ เช่น keyword/BM25, embedding, plain LLM, structured prompt หรือ classical method
- ดูว่าเหตุผลที่เลือก method น่าเชื่อถือหรือไม่
- ถามว่า novelty ยังเหลืออยู่หรือไม่ ถ้า baseline ที่แข็งแรงทำได้ใกล้เคียงกัน

### 10. ข้อมูล ความเป็นไปได้ และเวอร์ชันที่ defend ได้

- ตรวจว่าข้อมูลที่ต้องใช้มีอยู่จริง เข้าถึงได้ และใช้ได้ตามข้อกำหนดหรือไม่
- ดูความสะอาดของข้อมูล ground truth labeling missing data และ data cleaning risk
- ประเมิน privacy, permission, consent, ownership และ confidentiality risk
- ดูว่า evaluation plan ทำได้ทันเวลาและใช้ทรัพยากรพอหรือไม่
- เสนอ narrowest defensible version หากแผนเดิมใหญ่เกินไปหรือข้อมูลไม่พร้อม

### 11. Ethics, IRB และข้อกฎหมาย/ข้อบังคับ

- ตรวจว่างานเกี่ยวข้องกับ human subjects, students, users, experts, patients หรือ vulnerable groups หรือไม่
- ดูว่ามี personal data, sensitive data, image, voice, chat log, behavioral log หรือข้อมูลระบุตัวตนได้หรือไม่
- ตรวจว่าควรมี IRB approval, exemption, consent form, participant information sheet หรือ institutional permission หรือไม่
- ดูประเด็น scraping, platform Terms of Service, dataset license, copyright, NDA และ data ownership
- ห้าม AI ฟันธงแทนว่าไม่ต้องขอ IRB ต้องบอกให้ตรวจสอบกับอาจารย์ หน่วย IRB สถาบัน หรือ venue instruction

### 12. Scope และ limitation

- แยก scope ซึ่งเป็นขอบเขตที่ตั้งใจจำกัด ออกจาก limitation ซึ่งเป็นข้อจำกัดที่กระทบการตีความผล
- ตรวจว่าเอกสารสับสนสองคำนี้หรือใช้แทนกันผิดหรือไม่
- ดูว่า scope แคบพอให้ทำสำเร็จ แต่ไม่แคบจน contribution หายหรือไม่
- หา limitation สำคัญที่ควรบอก เช่น dataset bias, generalizability, sample size, evaluation weakness หรือ measurement error
- ดูว่า limitation เขียนอย่างรับผิดชอบ ไม่ใช่ลดความน่าเชื่อถือของงานเกินจำเป็น

### 13. การใช้ LLM และความรับผิดชอบทางวิจัย

- ระบุว่าใช้ LLM เพื่อเขียน แปล สรุป สกัดข้อมูล generate data evaluate หรือเป็น method หลักหรือไม่
- ถ้า LLM มีผลต่อ evidence ต้องมี prompt, output, model name, date, setting และ verification procedure
- ตรวจ citation, DOI, venue ranking, dataset และ factual claim ที่อาจมาจาก LLM แต่ยังไม่ได้ verify
- แยกว่า LLM เป็น tool, baseline, evaluator หรือ contribution จริง
- จับ generic AI writing ที่อ่านลื่นแต่ไม่เพิ่ม reasoning evidence หรือ concrete claim

### 14. Acknowledgement และความเสี่ยงของเอกสารอายุยาว

- ตรวจว่า acknowledgement เหมาะสม เฉพาะเจาะจง และไม่ยาวหรือส่วนตัวเกินไป
- ระวัง wording เรื่องความสัมพันธ์ ตำแหน่ง affiliation funding หรือ support ที่อาจเปลี่ยนในอนาคต
- ดูว่ามี conflict, dependency หรือ support ที่ควรกล่าวอย่างเป็นกลางหรือไม่
- ตรวจว่าไม่ใช้ถ้อยคำที่อาจทำให้เอกสารทางวิชาการดูไม่เป็นทางการเมื่อเวลาผ่านไป
- เสนอหลักการเขียน acknowledgement ที่ปลอดภัยกว่า หากพบความเสี่ยง

### 15. ภาษาและ document hygiene

- ตรวจ typo, spelling, punctuation และความผิดซ้ำที่มากเกินระดับเอกสารปัจจุบัน
- ดูการปนภาษาไทย/อังกฤษว่าเกินจำเป็นหรือไม่ และใช้คำเทคนิคสม่ำเสมอหรือไม่
- ตรวจ abbreviation/acronym ว่านิยามก่อนใช้ และใช้สม่ำเสมอหรือไม่
- จับ forward reference เช่น อ้างถึงสิ่งที่จะอธิบายด้านหลังโดยยังไม่ให้ context เพียงพอ
- แยกปัญหาภาษาแบบ minor polish ออกจากปัญหาที่ทำให้ scientific meaning เสีย

### 16. ตารางและรูปภาพ

- ตรวจว่าตารางและรูปภาพจำเป็นต่อ claim หรือเป็นเพียง decoration
- ดูความคมชัด ขนาดตัวอักษร label legend หน่วย และคำย่อในภาพ
- ตรวจ caption ว่าอธิบายว่าผู้อ่านควรเห็นอะไร ไม่ใช่แค่ตั้งชื่อรูป
- ดูว่ามีการอ้าง table/figure ในเนื้อหาใกล้ตำแหน่งที่เหมาะสมหรือไม่
- ตรวจว่าภาพหรือตารางรองรับ claim จริง และไม่ชวนตีความเกินหลักฐาน

### 17. Verdict แบบ reviewer

- สรุประดับความพร้อม เช่น not ready, early promising, thesis-draft ready, defense-review ready, manuscript-ready หรือ venue-ready
- ให้ top blocking issues ที่ต้องแก้ก่อน ไม่ใช่รวมทุกเรื่องเป็นรายการยาวเท่ากันหมด
- แยก high-impact fixes ออกจาก minor issues
- ระบุคำถามที่ผู้เขียนต้องตอบเองหรือถามอาจารย์ที่ปรึกษา
- เสนอ next review pass ว่ารอบต่อไปควรตรวจอะไรต่อ หลังแก้ blocking issues แล้ว

## ทำไมต้องมี Review State

การตรวจทั้งเล่มมักทำไม่จบในรอบเดียว จึงให้ AI บันทึก `04_review_notes/99_review_state.md` ว่า:

- รอบนี้ตรวจอะไรเสร็จแล้ว
- อะไรยังค้าง
- ค้างเพราะขาดหลักฐานอะไร
- รอบหน้าควรใช้ prompt อะไรทำต่อ
- หัวข้อใดไม่ควรทำซ้ำ เว้นแต่ผู้ใช้สั่งให้ประเมินใหม่ทั้งหมด

วิธีนี้ช่วยให้นิสิตกลับมาทำต่อได้โดยไม่ต้องเริ่มใหม่ทุกครั้ง
