CREATE TABLE ECOM.silver.customers (
    customer_sk INT AUTOINCREMENT PRIMARY KEY,
    customer_id INT,
    name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    registration_date DATE,
    is_active BOOLEAN,
    customer_location VARCHAR(200),  -- derived column
    etl_created_at TIMESTAMP,
    etl_updated_at TIMESTAMP
);


CREATE TABLE ECOM.silver.items (
    item_sk INT AUTOINCREMENT PRIMARY KEY,
    item_id INT,
    item_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    etl_created_at TIMESTAMP,
    etl_updated_at TIMESTAMP
);

CREATE TABLE ECOM.silver.orders (
    order_sk INT AUTOINCREMENT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20),
    order_year INT, -- derived
    order_month INT, -- derived
    etl_created_at TIMESTAMP,
    etl_updated_at TIMESTAMP
);

CREATE TABLE ECOM.silver.order_lines (
    order_line_sk INT AUTOINCREMENT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    total_price DECIMAL(10,2),  -- derived = quantity * unit_price
    etl_created_at TIMESTAMP,
    etl_updated_at TIMESTAMP
);

CREATE TABLE ECOM.silver.payments (
    payment_sk INT AUTOINCREMENT PRIMARY KEY,
    payment_id INT,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    status VARCHAR(20),
    etl_created_at TIMESTAMP,
    etl_updated_at TIMESTAMP
);

CREATE TABLE ECOM.silver.shippings (
    shipping_sk INT AUTOINCREMENT PRIMARY KEY,
    shipping_id INT,
    order_id INT,
    shipping_date DATE,
    shipping_address VARCHAR(255),
    shipping_method VARCHAR(50),
    shipping_status VARCHAR(20),
    delivery_days INT, -- derived from order_date
    etl_created_at TIMESTAMP,
    etl_updated_at TIMESTAMP
);