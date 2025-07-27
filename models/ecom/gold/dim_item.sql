{{ config(materialized='table') }}

SELECT
    ROW_NUMBER() OVER (ORDER BY item_id) AS item_sk,
    item_id,
    item_name,
    category,
    price
FROM {{ ref('stg_items') }}
