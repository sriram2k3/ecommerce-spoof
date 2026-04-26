-- ======================================================
-- E-COMMERCE CAPSTONE DATABASE sales_fact schema
-- ======================================================

CREATE TABLE sales_fact (
    fact_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    customer_id INT,
    warehouse_id VARCHAR(5),
    qty INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATETIME
);