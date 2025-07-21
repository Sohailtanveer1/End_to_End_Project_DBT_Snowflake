

-- This script is intended to create the bronze layer tables in Snowflake
CREATE TABLE ECOM.bronze.customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    registration_date DATE,
    is_active BOOLEAN,
    etl_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    etl_updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE ECOM.bronze.orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20),
    etl_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    etl_updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE ECOM.bronze.items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    etl_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    etl_updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);


CREATE TABLE ECOM.bronze.order_lines (
    order_line_id INTEGER AUTOINCREMENT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    etl_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    etl_updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES ECOM.bronze.orders(order_id),
    FOREIGN KEY (item_id) REFERENCES ECOM.bronze.items(item_id)
);


CREATE TABLE ECOM.bronze.payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    status VARCHAR(20),
    etl_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    etl_updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE ECOM.bronze.shippings (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    shipping_date DATE,
    shipping_address VARCHAR(255),
    shipping_method VARCHAR(50),
    shipping_status VARCHAR(20),
    etl_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    etl_updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
