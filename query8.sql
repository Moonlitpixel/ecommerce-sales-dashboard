CREATE OR REPLACE VIEW kpi_sales_overview AS
SELECT
d.year,
d.month,
d.month_name,
COUNT(DISTINCT f.order_id) AS total_orders,
ROUND(SUM(f.total_value)::NUMERIC, 2) AS total_revenue,
ROUND(AVG(f.total_value)::NUMERIC, 2) AS avg_order_value,
ROUND(AVG(f.review_score)::NUMERIC, 2) AS avg_review_score
FROM fact_orders f
JOIN dim_date d ON f.order_date = d.order_date
GROUP BY d.year, d.month, d.month_name
ORDER BY d.year, d.month;