{{ 
    config(
        materialized='incremental',
        pre_hook = "TRUNCATE TABLE {{source('bronze','clean_orders')}}"
) }}

SELECT
    CAST(order_id AS INT) AS order_id,
    CAST(customer_id AS INT) AS customer_id,
    TRY_CAST(order_date AS DATE) AS order_date,
    TRY_CAST(total_amount AS DECIMAL(10,2)) AS total_amount,
    TRIM(status) AS status,
    etl_timestamp
FROM {{ ref('raw_orders') }}
