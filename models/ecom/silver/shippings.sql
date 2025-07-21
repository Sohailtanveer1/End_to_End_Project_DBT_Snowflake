{{ config(materialized='table') }}

WITH shipping_data AS (
    SELECT
        s.shipping_id,
        s.order_id,
        s.shipping_date,
        s.shipping_address,
        s.shipping_method,
        s.shipping_status,
        o.order_date,
        DATEDIFF(day, o.order_date, s.shipping_date) AS delivery_days,
        s.etl_created_at,
        s.etl_updated_at
    FROM {{ source('bronze', 'shippings') }} s
    LEFT JOIN {{ source('bronze', 'orders') }} o
        ON s.order_id = o.order_id
)

SELECT * FROM shipping_data
WHERE shipping_id IS NOT NULL
