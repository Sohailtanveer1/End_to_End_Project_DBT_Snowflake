{{ config(materialized='view') }}

SELECT
    CAST(payment_id AS INT) AS payment_id,
    CAST(order_id AS INT) AS order_id,
    TRY_CAST(payment_date AS DATE) AS payment_date,
    TRY_CAST(amount AS DECIMAL(10,2)) AS amount,
    TRIM(payment_method) AS payment_method,
    TRIM(status) AS status,
    etl_created_at,
    etl_updated_at
FROM {{ source('bronze', 'payments') }}
WHERE payment_id IS NOT NULL
