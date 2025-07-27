{{ config(materialized='ephemeral') }}

SELECT
    order_id,
    customer_id,
    order_date,
    total_amount,
    status,
    current_timestamp as etl_timestamp
FROM {{ source('raw', 'orders') }}
WHERE order_id IS NOT NULL
