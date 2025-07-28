{{ config(materialized='incremental',
pre_hook = "TRUNCATE TABLE {{source('silver','stg_shippings')}}") }}

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
        s.etl_timestamp
    FROM {{ ref('clean_shippings') }} s
    LEFT JOIN {{ ref('clean_orders') }} o
        ON s.order_id = o.order_id
)

SELECT * FROM shipping_data
WHERE shipping_id IS NOT NULL
