{{ config(materialized='incremental',
    pre_hook = "TRUNCATE TABLE {{source('bronze','clean_items')}}"
    ) 
}}

SELECT
    CAST(item_id AS INT) AS item_id,
    TRIM(item_name) AS item_name,
    TRIM(category) AS category,
    TRY_CAST(price AS DECIMAL(10,2)) AS price,
    etl_timestamp
FROM {{ ref('raw_items') }}
