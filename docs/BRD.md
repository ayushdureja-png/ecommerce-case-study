# Business Requirements Document (BRD)

## Project
NovaCart Order-to-Delivery Transformation

## Business Background
NovaCart is a fictional Indian e-commerce marketplace. Leadership is concerned about cancellations, late deliveries, returns/refunds, and inconsistent fulfillment performance.

## Business Problem
The current process lacks sufficient controls for inventory validation, warehouse selection, courier SLA management, COD cancellation risk, return root-cause monitoring, and executive exception reporting.

## Objective
Improve order fulfillment reliability and reduce avoidable revenue leakage by identifying process bottlenecks and defining future-state business/system requirements.

## In Scope
- Order confirmation
- Payment method analysis
- Warehouse assignment
- Shipment and courier SLA tracking
- Delivery performance
- Returns and refunds
- KPI reporting and exception workflows

## Out of Scope
- Seller onboarding
- Recommendation engine
- Marketing attribution
- Fraud-model development
- Actual payment gateway integration

## Stakeholders
| Stakeholder | Need | Influence |
|---|---|---|
| COO / Head of Operations | Lower cancellations and late deliveries | High |
| Fulfillment Manager | Better warehouse allocation | High |
| Logistics Manager | Courier SLA visibility | High |
| Customer Experience Lead | Reduce complaints and returns | Medium |
| Finance | Reduce refund leakage | Medium |
| Product Manager | Prioritize platform changes | High |
| Engineering | Clear functional requirements | High |
| Data/BI Team | KPI definitions and data model | Medium |

## Business Requirements
| ID | Requirement | Priority |
|---|---|---|
| BR-01 | Reduce avoidable order cancellations | Must |
| BR-02 | Improve on-time delivery performance | Must |
| BR-03 | Prefer same-region fulfillment where feasible | Must |
| BR-04 | Provide courier SLA visibility by region | Must |
| BR-05 | Detect high-risk COD orders for reconfirmation | Should |
| BR-06 | Track return reasons and refund impact | Must |
| BR-07 | Provide executive and operational dashboards | Must |
| BR-08 | Maintain auditable KPI definitions | Should |

## Baseline KPIs
- Cancellation Rate: 5.53%
- Return Rate: 9.85%
- Late Delivery Rate: 46.50%
- Average Delivery Time: 3.35 days

## Success Criteria
- Reduce cancellation rate by at least 15% relative.
- Reduce late-delivery rate by at least 20% relative.
- Reduce cross-region fulfillment where local inventory is available.
- Improve visibility of courier, warehouse, return, and refund performance.

## Recommendation
Run a 6–8 week regional pilot combining same-region routing, COD reconfirmation, and courier SLA monitoring before scaling.
