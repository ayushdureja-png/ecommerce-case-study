-- BUSINESS ANALYST SQL ANALYSIS

-- Q1. Executive KPI summary
SELECT COUNT(*) AS total_orders,
       ROUND(SUM(CASE WHEN order_status='Delivered' THEN order_value ELSE 0 END),2) AS delivered_revenue,
       ROUND(100.0*SUM(CASE WHEN order_status='Cancelled' THEN 1 ELSE 0 END)/COUNT(*),2) AS cancellation_rate_pct,
       ROUND(AVG(order_value),2) AS avg_order_value
FROM orders;

-- Q2. Monthly order and revenue trend
SELECT substr(order_datetime,1,7) AS month,
       COUNT(*) AS orders,
       ROUND(SUM(CASE WHEN order_status='Delivered' THEN order_value ELSE 0 END),2) AS revenue
FROM orders
GROUP BY 1 ORDER BY 1;

-- Q3. Cancellation rate by payment method
SELECT payment_method,
       COUNT(*) AS orders,
       SUM(CASE WHEN order_status='Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
       ROUND(100.0*SUM(CASE WHEN order_status='Cancelled' THEN 1 ELSE 0 END)/COUNT(*),2) AS cancellation_rate_pct
FROM orders
GROUP BY payment_method
ORDER BY cancellation_rate_pct DESC;

-- Q4. Cancellation reasons
SELECT cancellation_reason, COUNT(*) AS cancelled_orders
FROM orders
WHERE order_status='Cancelled'
GROUP BY cancellation_reason
ORDER BY cancelled_orders DESC;

-- Q5. On-time delivery by customer region
SELECT c.region, COUNT(*) AS delivered_orders,
       ROUND(100.0*SUM(CASE WHEN s.is_late=0 THEN 1 ELSE 0 END)/COUNT(*),2) AS on_time_delivery_pct,
       ROUND(AVG(s.actual_delivery_days),2) AS avg_delivery_days
FROM shipments s
JOIN orders o ON o.order_id=s.order_id
JOIN customers c ON c.customer_id=o.customer_id
GROUP BY c.region
ORDER BY on_time_delivery_pct;

-- Q6. Warehouse performance
SELECT w.warehouse_city, COUNT(*) AS shipments,
       ROUND(AVG(s.actual_delivery_days),2) AS avg_delivery_days,
       ROUND(100.0*SUM(s.is_late)/COUNT(*),2) AS late_delivery_pct
FROM shipments s
JOIN warehouses w ON w.warehouse_id=s.warehouse_id
GROUP BY w.warehouse_city
ORDER BY late_delivery_pct DESC;

-- Q7. Courier SLA performance
SELECT courier_partner, COUNT(*) AS shipments,
       ROUND(AVG(actual_delivery_days),2) AS avg_delivery_days,
       ROUND(100.0*SUM(is_late)/COUNT(*),2) AS late_delivery_pct
FROM shipments
GROUP BY courier_partner
ORDER BY late_delivery_pct DESC;

-- Q8. Return reasons and refund impact
SELECT return_reason, COUNT(*) AS returns,
       ROUND(SUM(refund_amount),2) AS refunds
FROM returns
GROUP BY return_reason
ORDER BY returns DESC;

-- Q9. Revenue by region
SELECT c.region, COUNT(*) AS orders,
       ROUND(SUM(CASE WHEN o.order_status='Delivered' THEN o.order_value ELSE 0 END),2) AS revenue
FROM orders o
JOIN customers c ON c.customer_id=o.customer_id
GROUP BY c.region
ORDER BY revenue DESC;

-- Q10. Same-region vs cross-region fulfillment impact
SELECT CASE WHEN c.region=w.region THEN 'Same-region warehouse' ELSE 'Cross-region warehouse' END AS fulfillment_type,
       COUNT(*) AS shipments,
       ROUND(AVG(s.actual_delivery_days),2) AS avg_delivery_days,
       ROUND(100.0*SUM(s.is_late)/COUNT(*),2) AS late_delivery_pct
FROM shipments s
JOIN orders o ON o.order_id=s.order_id
JOIN customers c ON c.customer_id=o.customer_id
JOIN warehouses w ON w.warehouse_id=s.warehouse_id
GROUP BY fulfillment_type;

-- Q11. Customer segment performance
SELECT c.customer_segment, COUNT(*) AS orders,
       ROUND(AVG(o.order_value),2) AS aov,
       ROUND(100.0*SUM(CASE WHEN o.order_status='Cancelled' THEN 1 ELSE 0 END)/COUNT(*),2) AS cancellation_rate_pct
FROM orders o
JOIN customers c ON c.customer_id=o.customer_id
GROUP BY c.customer_segment
ORDER BY aov DESC;

-- Q12. Late deliveries and returns relationship
SELECT CASE WHEN s.is_late=1 THEN 'Late' ELSE 'On time' END AS delivery_status,
       COUNT(*) AS delivered_orders,
       SUM(CASE WHEN r.order_id IS NOT NULL THEN 1 ELSE 0 END) AS returned_orders,
       ROUND(100.0*SUM(CASE WHEN r.order_id IS NOT NULL THEN 1 ELSE 0 END)/COUNT(*),2) AS return_rate_pct
FROM shipments s
LEFT JOIN returns r ON r.order_id=s.order_id
GROUP BY delivery_status;

-- Q13. Top products by delivered revenue
SELECT p.product_name, p.category,
       ROUND(SUM(oi.quantity*oi.unit_selling_price),2) AS product_revenue,
       SUM(oi.quantity) AS units
FROM order_items oi
JOIN products p ON p.product_id=oi.product_id
JOIN orders o ON o.order_id=oi.order_id
WHERE o.order_status='Delivered'
GROUP BY p.product_id,p.product_name,p.category
ORDER BY product_revenue DESC
LIMIT 15;

-- Q14. Gross-margin estimate by category
SELECT p.category,
       ROUND(SUM(CASE WHEN o.order_status='Delivered' THEN oi.quantity*oi.unit_selling_price ELSE 0 END),2) AS sales,
       ROUND(SUM(CASE WHEN o.order_status='Delivered' THEN oi.quantity*p.unit_cost ELSE 0 END),2) AS estimated_cogs,
       ROUND(SUM(CASE WHEN o.order_status='Delivered' THEN oi.quantity*(oi.unit_selling_price-p.unit_cost) ELSE 0 END),2) AS estimated_gross_margin
FROM order_items oi
JOIN products p ON p.product_id=oi.product_id
JOIN orders o ON o.order_id=oi.order_id
GROUP BY p.category
ORDER BY estimated_gross_margin DESC;

-- Q15. Return cost as percentage of delivered revenue
SELECT ROUND((SELECT SUM(refund_amount) FROM returns),2) AS total_refunds,
       ROUND((SELECT SUM(order_value) FROM orders WHERE order_status='Delivered'),2) AS delivered_revenue,
       ROUND(100.0*(SELECT SUM(refund_amount) FROM returns)/(SELECT SUM(order_value) FROM orders WHERE order_status='Delivered'),2) AS refund_to_revenue_pct;
