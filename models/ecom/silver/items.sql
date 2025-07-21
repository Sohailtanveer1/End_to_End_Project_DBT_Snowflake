{{ config(materialized='table') }}

SELECT
    item_id,
    item_name,
    category,
    price,
    etl_created_at,
    etl_updated_at
FROM {{ source('bronze', 'items') }}
WHERE item_id IS NOT NULL
