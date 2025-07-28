{{ config(materialized='incremental',
pre_hook = "TRUNCATE TABLE {{source('silver','stg_items')}}") }}

SELECT
    item_id,
    item_name,
    category,
    price,
    etl_timestamp
FROM {{ ref('clean_items') }}
