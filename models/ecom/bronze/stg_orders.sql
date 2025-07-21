{{ config(materialized='view') }}

SELECT
    CAST(order_id AS INT) AS order_id,
    CAST(customer_id AS INT) AS customer_id,
    TRY_CAST(order_date AS DATE) AS order_date,
    TRY_CAST(total_amount AS DECIMAL(10,2)) AS total_amount,
    TRIM(status) AS status,
    etl_created_at,
    etl_updated_at
FROM {{ source('bronze', 'orders') }}
WHERE order_id IS NOT NULL
