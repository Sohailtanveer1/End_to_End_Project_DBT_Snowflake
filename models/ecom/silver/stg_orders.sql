{{ config(materialized='incremental',
pre_hook = "TRUNCATE TABLE {{source('silver','stg_orders')}}") }}

SELECT
    order_id,
    customer_id,
    order_date,
    total_amount,
    status,
    DATE_PART('year', order_date) AS order_year,
    DATE_PART('month', order_date) AS order_month,
    etl_timestamp
FROM {{ ref('clean_orders') }}
