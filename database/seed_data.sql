-- ======================================================
-- E-COMMERCE CAPSTONE DATABASE SEED DATA
-- ======================================================
-- =================================================
-- RESET TABLES
-- =================================================
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE order_items;
TRUNCATE TABLE orders;
TRUNCATE TABLE payments;
TRUNCATE TABLE inventory;
TRUNCATE TABLE product;
TRUNCATE TABLE warehouse;
TRUNCATE TABLE customer;

SET FOREIGN_KEY_CHECKS = 1;

-- =========================
-- WAREHOUSES
-- =========================

INSERT INTO warehouse (warehouse_id, location) VALUES
('WH1','Chennai'),
('WH2','Bangalore'),
('WH3','Hyderabad'),
('WH4','Mumbai');


-- =========================
-- PRODUCTS
-- =========================

INSERT INTO product (product_name, category, price_per_qty) VALUES
('Laptop','Electronics',60000),
('Smartphone','Electronics',25000),
('Headphones','Electronics',3000),
('Keyboard','Electronics',1500),
('Mouse','Electronics',800),
('Monitor','Electronics',12000),
('Tablet','Electronics',22000),
('Power Bank','Electronics',2000);


-- =========================
-- CUSTOMERS
-- =========================

INSERT INTO customer
(customer_fname,customer_lname,email,location,age,mobile)
VALUES
('Rahul','Sharma','rahul@mail.com','Delhi',28,'9876543210'),
('Anita','Verma','anita@mail.com','Chennai',32,'9876543211'),
('Karan','Mehta','karan@mail.com','Mumbai',24,'9876543212'),
('Priya','Nair','priya@mail.com','Bangalore',29,'9876543213'),
('Vikram','Singh','vikram@mail.com','Hyderabad',35,'9876543214');


-- =========================
-- INVENTORY
-- =========================

INSERT INTO inventory (warehouse_id, product_id, stock_qty) VALUES
('WH1',1,20),
('WH1',2,50),
('WH1',3,40),
('WH1',4,60),

('WH2',1,15),
('WH2',2,30),
('WH2',3,25),
('WH2',5,80),

('WH3',2,40),
('WH3',3,30),
('WH3',6,20),
('WH3',7,15),

('WH4',1,10),
('WH4',4,35),
('WH4',5,60),
('WH4',8,50);