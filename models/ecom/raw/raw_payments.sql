{{ config(materialized='ephemeral') }}

SELECT
    payment_id,
    order_id,
    payment_date,
    amount,
    payment_method,
    status,
    current_timestamp as etl_timestamp

FROM {{ source('raw', 'payments') }}
WHERE payment_id IS NOT NULL
