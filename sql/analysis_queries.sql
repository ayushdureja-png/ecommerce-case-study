-- CORE SQL SUPPORTING THE DASHBOARD
-- The main focus of this project is BRD, business analysis, dashboarding, and insights.

-- 1. Executive KPI summary
SELECT
    COUNT(*) AS total_orders,
    ROUND(SUM(CASE WHEN order_status = 'Delivered' THEN order_value ELSE 0 END), 2) AS delivered_revenue,
    ROUND(100.0 * SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*), 2) AS cancellation_rate_pct,
    ROUND(AVG(order_value), 2) AS avg_order_value
FROM orders;

-- 2. Monthly revenue trend
SELECT
    substr(order_datetime, 1, 7) AS month,
    COUNT(*) AS total_orders,
    ROUND(SUM(CASE WHEN order_status = 'Delivered' THEN order_value ELSE 0 END), 2) AS delivered_revenue
FROM orders
GROUP BY substr(order_datetime, 1, 7)
ORDER BY month;

-- 3. Cancellation rate by payment method
SELECT
    payment_method,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(100.0 * SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*), 2) AS cancellation_rate_pct
FROM orders
GROUP BY payment_method
ORDER BY cancellation_rate_pct DESC;

-- 4. Revenue by region
SELECT
    c.region,
    COUNT(*) AS total_orders,
    ROUND(SUM(CASE WHEN o.order_status = 'Delivered' THEN o.order_value ELSE 0 END), 2) AS delivered_revenue
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY delivered_revenue DESC;

-- 5. Delivery performance by region
SELECT
    c.region,
    COUNT(*) AS shipments,
    ROUND(AVG(s.actual_delivery_days), 2) AS avg_delivery_days,
    ROUND(100.0 * SUM(s.is_late) / COUNT(*), 2) AS late_delivery_pct
FROM shipments s
JOIN orders o ON o.order_id = s.order_id
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY late_delivery_pct DESC;

-- 6. Return reasons and refund impact
SELECT
    return_reason,
    COUNT(*) AS returned_orders,
    ROUND(SUM(refund_amount), 2) AS refund_amount
FROM returns
GROUP BY return_reason
ORDER BY returned_orders DESC;
