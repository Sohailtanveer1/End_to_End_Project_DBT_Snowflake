{{ config(materialized='table') }}

SELECT
    order_line_id,
    order_id,
    item_id,
    quantity,
    unit_price,
    quantity * unit_price AS total_price,
    etl_created_at,
    etl_updated_at
FROM {{ source('bronze', 'order_lines') }}
WHERE order_line_id IS NOT NULL
