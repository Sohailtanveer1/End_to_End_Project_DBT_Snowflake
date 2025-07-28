{{ config(materialized='incremental',
pre_hook = "TRUNCATE TABLE {{source('silver','stg_payments')}}") }}

SELECT
    payment_id,
    order_id,
    payment_date,
    amount,
    payment_method,
    status,
    etl_timestamp
FROM {{ ref('clean_payments') }}
