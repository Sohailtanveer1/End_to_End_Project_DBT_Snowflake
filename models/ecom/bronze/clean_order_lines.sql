{{ config(materialized='incremental',
    pre_hook = "TRUNCATE TABLE {{source('bronze','clean_order_lines')}}"
    )
}}

SELECT
    order_line_id,
    CAST(order_id AS INT) AS order_id,
    CAST(item_id AS INT) AS item_id,
    TRY_CAST(quantity AS INT) AS quantity,
    TRY_CAST(unit_price AS DECIMAL(10,2)) AS unit_price,
    etl_timestamp
FROM {{ ref('raw_order_lines') }}
