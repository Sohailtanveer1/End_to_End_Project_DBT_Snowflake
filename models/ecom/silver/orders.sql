{{ config(materialized='table') }}

SELECT
    order_id,
    customer_id,
    order_date,
    total_amount,
    status,
    DATE_PART('year', order_date) AS order_year,
    DATE_PART('month', order_date) AS order_month,
    etl_created_at,
    etl_updated_at
FROM {{ source('bronze', 'orders') }}
WHERE order_id IS NOT NULL
