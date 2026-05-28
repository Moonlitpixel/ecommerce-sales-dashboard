CREATE OR REPLACE VIEW stg_orders AS 
SELECT 
order_id,
customer_id,
order_status,
order_purchase_timestamp::DATE AS order_date,
order_approved_at::DATE AS approved_date,
order_delivered_carrier_date::DATE AS carrier_date,
order_delivered_customer_date::DATE AS delivered_date,
order_estimated_delivery_date::DATE AS estimated_date
FROM olist_orders_dataset
WHERE order_status = 'delivered';
 