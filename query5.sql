CREATE OR REPLACE VIEW stg_order_items AS
SELECT
    order_id,
    order_item_id,
    product_id,
    seller_id,
    price,
    freight_value,
    (price + freight_value) AS total_value
FROM olist_order_items_dataset;

CREATE OR REPLACE VIEW stg_customers AS
SELECT
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state
FROM olist_customers_dataset;

CREATE OR REPLACE VIEW stg_products AS
SELECT
    p.product_id,
    COALESCE(t.product_category_name_english, 'uncategorized') AS category,
    p.product_weight_g,
    p.product_photos_qty
FROM olist_products_dataset p
LEFT JOIN product_category_name_translation t
    ON p.product_category_name = t.product_category_name;

CREATE OR REPLACE VIEW stg_sellers AS
SELECT
    seller_id,
    seller_city,
    seller_state
FROM olist_sellers_dataset;

CREATE OR REPLACE VIEW stg_payments AS
SELECT
    order_id,
    payment_type,
    payment_installments,
    payment_value
FROM olist_order_payments_dataset;

CREATE OR REPLACE VIEW stg_reviews AS
SELECT
    order_id,
    review_score,
    review_creation_date::DATE AS review_date
FROM olist_order_reviews_dataset;