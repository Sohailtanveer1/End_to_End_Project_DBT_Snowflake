{% snapshot customer_snapshot %}
{{
  config(
    target_schema='gold', 
    target_database='your_database',  
    unique_key='customer_id',
    strategy='check', 
    check_cols=['name', 'email', 'city', 'state'],
    invalidate_hard_deletes=True
  )
}}

SELECT * FROM {{ ref('stg_customers') }}

{% endsnapshot %}
