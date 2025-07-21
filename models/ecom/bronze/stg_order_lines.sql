{{ config(materialized='view') }}

SELECT
    order_line_id,
    CAST(order_id AS INT) AS order_id,
    CAST(item_id AS INT) AS item_id,
    TRY_CAST(quantity AS INT) AS quantity,
    TRY_CAST(unit_price AS DECIMAL(10,2)) AS unit_price,
    etl_created_at,
    etl_updated_at
FROM {{ source('bronze', 'order_lines') }}
WHERE order_line_id IS NOT NULL
