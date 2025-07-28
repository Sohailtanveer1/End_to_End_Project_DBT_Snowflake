{{ config(materialized='incremental',
pre_hook = "TRUNCATE TABLE {{source('silver','stg_order_lines')}}") }}

SELECT
    order_line_id,
    order_id,
    item_id,
    quantity,
    unit_price,
    quantity * unit_price AS total_price,
    etl_timestamp
FROM {{ ref('clean_order_lines') }}
