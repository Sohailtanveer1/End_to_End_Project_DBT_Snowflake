{{ 
    config(
    materialized='ephemeral'
    ) 
}}

SELECT
    shipping_id,
    order_id,
    shipping_date,
    shipping_address,
    shipping_method,
    shipping_status,
    current_timestamp as etl_timestamp

FROM {{ source('raw', 'shippings') }}
WHERE shipping_id IS NOT NULL
