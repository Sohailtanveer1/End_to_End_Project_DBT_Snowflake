{{ config(materialized='table') }}

SELECT
    payment_id,
    order_id,
    payment_date,
    amount,
    payment_method,
    status,
    etl_created_at,
    etl_updated_at
FROM {{ source('bronze', 'clean_payments') }}
WHERE payment_id IS NOT NULL
