-- ======================================================
-- E-COMMERCE CAPSTONE TEST DATA
-- ======================================================

-- warehouse
INSERT INTO warehouse VALUES ('WH1','Chennai');
INSERT INTO warehouse VALUES ('WH2','Bangalore');

-- product
INSERT INTO product(product_name,category,price_per_qty)
VALUES
('Laptop','Electronics',50000),
('Phone','Electronics',20000);

-- inventory
INSERT INTO inventory(warehouse_id,product_id,stock_qty)
VALUES
('WH1',1,20),
('WH2',1,10);

-- customer
INSERT INTO customer(customer_fname,customer_lname,email,location,age,mobile)
VALUES
('Ram','K','ram@mail.com','Hyderabad',25,'9999999999');

-- testing
INSERT INTO orders(customer_id,order_date,order_status)
VALUES
(1,Now(),'Pending');

select * from orders;

INSERT INTO order_items(order_id,warehouse_id,product_id,qty)
VALUES
(1,'WH1',1,2);

select * from order_items;
select * from inventory;

delete from order_items where order_id = 1;