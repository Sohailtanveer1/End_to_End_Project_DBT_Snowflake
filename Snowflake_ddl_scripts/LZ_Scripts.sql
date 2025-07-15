-- Customers, Orders, Items, Order Lines, Payments, and Shippings Tables Creation Script
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    registration_date DATE,
    is_active BOOLEAN
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);


CREATE TABLE order_lines (
    order_line_id SERIAL PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE shippings (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    shipping_date DATE,
    shipping_address VARCHAR(255),
    shipping_method VARCHAR(50),
    shipping_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);