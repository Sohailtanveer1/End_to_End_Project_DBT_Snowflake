{{ config(materialized='ephemeral') }}

SELECT
    order_line_id,
    order_id,
    item_id,
    quantity,
    unit_price,
    current_timestamp as etl_timestamp

FROM {{ source('raw', 'order_lines') }}
WHERE order_line_id IS NOT NULL
