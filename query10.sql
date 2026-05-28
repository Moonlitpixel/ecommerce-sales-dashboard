CREATE OR REPLACE VIEW kpi_customer_insights AS
SELECT
c.customer_state,
COUNT(DISTINCT c.customer_unique_id) AS unique_customers,
COUNT(DISTINCT f.order_id) AS total_orders,
ROUND(SUM(f.total_value)::NUMERIC, 2) AS total_revenue,
ROUND(AVG(f.review_score)::NUMERIC, 2) AS avg_review_score,
ROUND(
COUNT(DISTINCT f.order_id) * 1.0 / 
COUNT(DISTINCT c.customer_unique_id), 2) AS orders_per_customer
FROM fact_orders f
JOIN dim_customers c ON f.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC;