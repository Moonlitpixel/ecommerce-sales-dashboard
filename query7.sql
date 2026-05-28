CREATE TABLE fact_orders AS
SELECT
o.order_id,
o.customer_id,
i.product_id,
i.seller_id,
o.order_date,
i.price,
i.freight_value,
i.total_value,
(o.delivered_date - o.order_date) AS days_to_deliver,
(o.delivered_date - o.estimated_date) AS days_late,
COALESCE(r.review_score, 0) AS review_score,
p.payment_type,
p.payment_value
FROM stg_orders o
JOIN stg_order_items i ON o.order_id = i.order_id
LEFT JOIN stg_reviews r ON o.order_id = r.order_id
LEFT JOIN stg_payments p ON o.order_id = p.order_id;