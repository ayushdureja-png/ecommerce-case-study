# User Acceptance Testing (UAT)

| Test ID | Scenario | Steps | Expected Result |
|---|---|---|---|
| UAT-01 | Executive KPIs load | Open dashboard | KPI cards display non-zero values |
| UAT-02 | Time-period selection | Change time period | KPI/trend view updates correctly |
| UAT-03 | Region analysis | Select region view | Regional metrics display correctly |
| UAT-04 | Category analysis | Select category view | Category revenue/return metrics display correctly |
| UAT-05 | Payment analysis | Select payment view | COD/prepaid cancellation metrics display correctly |
| UAT-06 | Channel analysis | Select channel view | Channel metrics display correctly |
| UAT-07 | Cancellation reason integrity | Run SQL cancellation reason query | Reason counts reconcile with cancelled total |
| UAT-08 | Late-delivery definition | Compare actual vs promised days | is_late = 1 only when actual > promised |
| UAT-09 | Return rate | Run SQL returned/delivered query | Dashboard rate matches within rounding |
| UAT-10 | Same vs cross-region | Compare customer and warehouse region | Fulfillment grouping is correct |
| UAT-11 | Zero-result handling | Apply restrictive condition | Dashboard handles zero safely |
| UAT-12 | Navigation | Open all documentation/dashboard files | All portfolio artifacts render correctly |
