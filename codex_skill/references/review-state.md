# Review State

Use this when creating or updating `04_review_notes/99_review_state.md`.

## Purpose

The review may not finish in one run. The state file lets the next agent continue without repeating completed work.

## Required Sections

````markdown
# Review State

## Current Review Mode

- Mode: full review / continue remaining only / focused recheck
- User requested full reassessment this round: yes / no
- Main document version reviewed:
- Review timestamp:

## Completed Review Items

| Item | Status | Output file | Evidence/location checked | Notes |
|---|---|---|---|---|
| Inventory/readiness | done / partial / not started | 04_review_notes/00_inventory.md |  |  |
| Full thesis review | done / partial / not started | 04_review_notes/01_full_review.md |  |  |
| Reference audit | done / partial / not started | 04_review_notes/02_reference_audit.md |  |  |
| Student action checklist | done / partial / not started | 04_review_notes/03_student_action_checklist.md |  |  |

## Remaining Work

| Priority | Remaining task | Why still needed | Required input/evidence | Suggested next prompt |
|---|---|---|---|---|
| High |  |  |  |  |

## Do Not Repeat Unless Requested

- 

## Next Prompt To Continue

```text
ประเมินต่อจาก 04_review_notes/99_review_state.md
ถ้าหัวข้อใดประเมินครบแล้ว ไม่ต้องทำซ้ำ ยกเว้นฉันสั่งว่า "ประเมินใหม่ทั้งหมด"
ประเมินหัวข้อที่เหลือจนจบ แล้วอัปเดต 04_review_notes/99_review_state.md
```
````
