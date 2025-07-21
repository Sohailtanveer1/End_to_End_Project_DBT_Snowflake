{{ config(materialized='view') }}

SELECT
    CAST(item_id AS INT) AS item_id,
    TRIM(item_name) AS item_name,
    TRIM(category) AS category,
    TRY_CAST(price AS DECIMAL(10,2)) AS price,
    etl_created_at,
    etl_updated_at
FROM {{ source('bronze', 'items') }}
WHERE item_id IS NOT NULL
