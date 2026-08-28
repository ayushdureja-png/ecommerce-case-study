# E-commerce Case Study

This is an **independent Business Analyst portfolio project** focused mainly on **business requirements, process analysis, dashboards, and business insights** for an e-commerce order-to-delivery process.

I used a fictional company called **NovaCart** and a synthetic dataset of **50,000 orders** covering January 2025 to June 2026. The objective was to understand why cancellations, late deliveries, and returns were happening and then translate those findings into clear business requirements and dashboard-based recommendations.

## Dashboard Preview

![E-commerce Case Study Dashboard](dashboard/dashboard-preview.svg)

The interactive dashboard is available in [`dashboard/index.html`](dashboard/index.html).

## Main focus of the project

### 1. Business Requirements & BA Documentation
- Defined the business problem, project objective, scope, and stakeholders
- Prepared a detailed **Business Requirements Document (BRD)**
- Created AS-IS and TO-BE process flows
- Defined functional requirements and KPI definitions
- Created user stories, acceptance criteria, UAT scenarios, and RTM

### 2. Dashboarding & Business Insights
The dashboard focuses on the most important operational and commercial KPIs:

- Total Orders
- Delivered Revenue
- Cancellation Rate
- Return Rate
- Late Delivery Rate
- Average Delivery Time
- Revenue by Region
- Monthly Revenue Trend
- Cancellation Rate by Payment Method
- Return Rate by Category
- Delivery Performance by Region

### 3. Supporting SQL
SQL is used only to prepare and validate the data behind the dashboard. I kept the SQL section small and focused on six core business queries such as KPI summary, monthly revenue, payment-method cancellations, regional revenue, delivery performance, and return reasons.

## Business problem

NovaCart is growing, but the order fulfillment process has three main issues:

1. Some orders are cancelled before delivery.
2. A high percentage of deliveries reach customers later than promised.
3. Returns and refunds are affecting revenue and customer experience.

I analyzed the **Order → Fulfillment → Shipment → Delivery → Return** journey to identify where the biggest gaps were.

## Main KPIs

- Total Orders: **50,000**
- Delivered Revenue: **₹482,375,079**
- Cancellation Rate: **5.53%**
- Return Rate: **9.85%**
- Late Delivery Rate: **46.50%**
- Average Delivery Time: **3.35 days**
- Refund Value: **₹37,310,977**

## Key findings

- COD orders had a cancellation rate of around **7.6%**, higher than UPI orders at around **4.9%**.
- Cross-region fulfillment had much weaker delivery performance than same-region fulfillment.
- Fashion had the highest return rate in the dataset.
- Delivery performance weakened during higher-volume festive months.

## Recommendations

Based on the dashboard analysis and BRD, I proposed:

- Prefer same-region warehouse fulfillment when inventory is available
- Validate inventory before final order confirmation
- Add a reconfirmation step for selected COD orders
- Track courier SLA performance by region
- Use return reasons as feedback for product and fulfillment improvements
- Give operations teams a KPI dashboard with exception-focused monitoring

## Tools & skills used

**Business Analysis** — BRD, FRD, scope, stakeholder analysis, AS-IS/TO-BE, user stories, acceptance criteria, UAT, RTM  
**Dashboarding** — KPI design, interactive visual analysis, business insights  
**SQL / SQLite** — supporting data preparation and validation

## Repository structure

```text
dashboard/index.html        Interactive dashboard
dashboard/dashboard-preview.svg Dashboard preview
docs/BRD.md                 Business Requirements Document
docs/FRD.md                 Functional Requirements Document
docs/process_maps.md        AS-IS / TO-BE process maps
docs/user_stories.md        User stories and acceptance criteria
docs/UAT.md                 User Acceptance Testing
docs/RTM.md                 Requirements Traceability Matrix
docs/data_dictionary.md     Data dictionary
sql/analysis_queries.sql    6 supporting SQL queries
sql/schema.sql              Database schema
resume_bullets.md           Resume-ready project bullets
```

## What I learned

This project helped me understand how a Business Analyst can combine **business requirements and dashboards** to turn operational data into useful decisions. The most important part was not writing complex SQL, but identifying the business problem, defining the right KPIs, building useful dashboard views, and translating the findings into realistic process improvements.
