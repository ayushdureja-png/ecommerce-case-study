# E-commerce Case Study

**End-to-End Business Analyst Portfolio Project**

> SQL • Business Requirements • Process Mapping • User Stories • UAT • RTM • Interactive Dashboard

**Portfolio owner:** [ayushdureja-png](https://github.com/ayushdureja-png)

**Company:** NovaCart (fictional Indian e-commerce marketplace)  
**Project type:** End-to-end Business Analysis + SQL + Interactive Dashboard  
**Dataset:** Synthetic; 50,000 orders from Jan 2025 to Jun 2026  
**Database:** SQLite  
**Dashboard:** Interactive HTML dashboard

## Executive business scenario
NovaCart has grown rapidly but management is seeing three operational problems:
1. Order cancellations are eroding conversion and marketing efficiency.
2. Late deliveries are creating customer complaints and increasing returns.
3. Return/refund costs are reducing contribution margin.

The BA objective is to identify the largest process bottlenecks in the **Order → Fulfillment → Shipment → Delivery → Return** lifecycle and translate findings into prioritized system/process requirements.

## Portfolio KPIs
- Total orders: **50,000**
- Delivered revenue: **₹482,375,079**
- Cancellation rate: **5.53%**
- Return rate: **9.85%**
- Late delivery rate: **46.50%**
- Average delivery time: **3.35 days**
- Refund value: **₹37,310,977**

## Key findings
- COD cancellation rate is **7.6%**, materially higher than UPI at **4.9%**.
- Cross-region fulfillment has a late-delivery rate of **74.9%** versus **40.5%** for same-region fulfillment.
- **Fashion** has the highest synthetic return rate at approximately **16.9%**.
- Festive-period volume creates a visible late-delivery spike, indicating capacity/SLA pressure.

## Recommended transformation
1. Introduce **warehouse-routing rules** that prioritize same-region fulfillment.
2. Add **inventory-availability validation before payment confirmation** to reduce stock-related cancellations.
3. Add a **COD risk / reconfirmation workflow** for selected orders.
4. Implement **courier SLA scorecards** by route and region.
5. Add **return-reason analytics and product quality feedback loops**.
6. Give operations leaders a near-real-time KPI dashboard with exception views.

## Repository structure
```text
sql/schema.sql              Relational model
sql/analysis_queries.sql    25 business SQL analyses
dashboard/index.html        Interactive dashboard
docs/BRD.md                 Business Requirements Document
docs/FRD.md                 Functional Requirements Document
docs/user_stories.md        Agile backlog
docs/UAT.md                 User Acceptance Tests
docs/RTM.md                 Requirements Traceability Matrix
docs/process_maps.md        AS-IS / TO-BE process maps
docs/data_dictionary.md     Field definitions
docs/interview_story.md     How to present this project
outputs/                    SQL result samples
resume_bullets.md           Resume-ready bullets
```

## How to use
1. Review `docs/BRD.md` and `docs/FRD.md` for the business and functional requirements.
2. Review `docs/process_maps.md` for the AS-IS and TO-BE workflow.
3. Run queries from `sql/analysis_queries.sql` against the project schema/data.
4. Open `dashboard/index.html` in a browser for the interactive portfolio dashboard.
5. Use `docs/interview_story.md` to prepare for BA interview questions.

## Important resume wording
Present this as an **Independent Business Analyst Portfolio Project** or **Business Analysis Case Study**. The company and dataset are fictional/synthetic.

## Resume Usage
Use the project title:

**E-commerce Case Study — Independent Business Analyst Portfolio Project**

This is a fictional case study built with synthetic data and should be presented as a portfolio project rather than professional employment experience.
