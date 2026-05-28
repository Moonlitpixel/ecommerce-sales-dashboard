CREATE TABLE dim_customers AS
SELECT DISTINCT 
customer_id,
customer_unique_id,
customer_city,
customer_state
FROM stg_customers;


CREATE TABLE dim_products AS
SELECT DISTINCT
product_id,
category,
product_weight_g,
product_photos_qty
FROM stg_products;


CREATE TABLE dim_sellers AS
SELECT DISTINCT
seller_id,
seller_city,
seller_state
FROM stg_sellers;


CREATE TABLE dim_date AS 
SELECT DISTINCT
order_date AS order_date,
EXTRACT(YEAR FROM order_date) AS year,
EXTRACT(MONTH FROM order_date ) AS month,
EXTRACT(QUARTER FROM order_date) AS quarter,
TO_CHAR(order_date, 'Month') AS month_name
FROM stg_orders
ORDER BY order_date;