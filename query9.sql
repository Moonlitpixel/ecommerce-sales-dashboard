CREATE OR REPLACE VIEW kpi_delivery_performance AS
SELECT
s.seller_state,
COUNT(DISTINCT f.order_id) AS total_orders,
ROUND(AVG(f.days_to_deliver)::NUMERIC, 1) AS avg_delivery_days,
ROUND(AVG(f.review_score)::NUMERIC, 2) AS avg_review_score,
COUNT(*) FILTER (WHERE f.days_late > 0) AS late_orders,
ROUND(
COUNT(*) FILTER (WHERE f.days_late > 0) * 100.0 / COUNT(*), 1) 
AS late_rate_pct
FROM fact_orders f
JOIN dim_sellers s ON f.seller_id = s.seller_id
WHERE f.days_to_deliver IS NOT NULL
GROUP BY s.seller_state
ORDER BY late_rate_pct DESC;