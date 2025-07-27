{{ config(materialized='incremental',
pre_hook = "TRUNCATE TABLE {{source('silver','stg_orders')}}") }}

SELECT
    item_id,
    item_name,
    category,
    price,
    etl_created_at,
    etl_updated_at
FROM {{ ref('clean_items') }}
