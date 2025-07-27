{{ config(materialized='ephemeral') }}

SELECT
    item_id,
    item_name,
    category,
    price,
    current_timestamp as etl_timestamp

FROM {{ source('raw', 'items') }}
WHERE item_id IS NOT NULL
