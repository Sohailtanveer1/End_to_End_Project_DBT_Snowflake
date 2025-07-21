-- This script is intended to create the gold layer views in Snowflake

CREATE TABLE ECOM.gold.dim_customer (
    customer_sk INT PRIMARY KEY,
    customer_id INT,
    name VARCHAR(100),
    customer_location VARCHAR(200),
    is_active BOOLEAN,
    registration_date DATE
);

CREATE TABLE ECOM.gold.dim_item (
    item_sk INT PRIMARY KEY,
    item_id INT,
    item_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE ECOM.gold.dim_date (
    date DATE PRIMARY KEY,
    year INT,
    month INT,
    quarter INT,
    week INT,
    day_of_week VARCHAR(10),
    is_weekend BOOLEAN
);

CREATE TABLE ECOM.gold.fact_sales (
    order_sk INT,
    customer_sk INT,
    item_sk INT,
    order_date DATE,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    payment_amount DECIMAL(10,2),
    shipping_date DATE,
    delivery_days INT,
    payment_method VARCHAR(50),
    shipping_method VARCHAR(50),
    order_status VARCHAR(20),
    shipping_status VARCHAR(20),
    PRIMARY KEY (order_sk, item_sk)
);
