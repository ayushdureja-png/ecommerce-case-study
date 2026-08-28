# Functional Requirements Document (FRD)

## Order Validation
- **FR-01:** Validate product availability before final order confirmation.
- **FR-02:** Store cancellation reason using a controlled reason list.
- **FR-03:** Flag selected COD orders for customer reconfirmation.

## Warehouse Routing
- **FR-04:** Evaluate customer and warehouse region before assignment.
- **FR-05:** Prefer same-region fulfillment when inventory and serviceability conditions are satisfied.
- **FR-06:** Record a reason code when cross-region routing occurs.

## Shipment Management
- **FR-07:** Store courier, promised delivery time, shipment timestamp, and delivery timestamp.
- **FR-08:** Calculate actual delivery duration.
- **FR-09:** Classify a shipment as late when actual delivery duration exceeds promised duration.

## Courier SLA
- **FR-10:** Show late-delivery percentage by courier, region, and month.
- **FR-11:** Flag courier-region combinations above an agreed SLA threshold.

## Returns
- **FR-12:** Require a return reason before refund completion.
- **FR-13:** Record refund amount and return status.
- **FR-14:** Compare return rate between on-time and late deliveries.

## Dashboard
- **FR-15:** Show orders, revenue, cancellation rate, late delivery rate, return rate, and average delivery time.
- **FR-16:** Support filtering/drill-down by region, category, payment method, channel, and time period.
- **FR-17:** Recalculate visual metrics when a selection changes.
- **FR-18:** Provide executive, fulfillment, returns/CX, and commercial views.

## Non-Functional Requirements
- **NFR-01 Performance:** Standard dashboard interactions should respond within 3 seconds in production.
- **NFR-02 Security:** Role-based access should restrict operational and financial details.
- **NFR-03 Auditability:** KPI calculations must be traceable to documented definitions.
- **NFR-04 Availability:** Dashboard target availability 99.5% during business hours.
- **NFR-05 Data Quality:** Mandatory keys and timestamps must not be null for completed transactions.
