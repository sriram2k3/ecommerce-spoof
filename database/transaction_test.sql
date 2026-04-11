-- ======================================================
-- E-COMMERCE CAPSTONE DATABASE TRANSACTION TEST
-- ======================================================
-- =========================
-- RESET FLOW
-- =========================
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE order_items;
TRUNCATE TABLE payments;
TRUNCATE TABLE orders;

SET FOREIGN_KEY_CHECKS = 1;

-- =========================================
-- TEST 1 : CREATE ORDER + ADD ITEM
-- =========================================

START TRANSACTION;

INSERT INTO orders (customer_id, order_date, order_status)
VALUES (1, NOW(), 'Pending');

INSERT INTO order_items (order_id, warehouse_id, product_id, qty)
VALUES (1,'WH1',1,2);

INSERT INTO payments (order_id, payment_type, payment_status)
VALUES (1,'UPI','Paid');

COMMIT;

-- =========================================
-- TEST 2 : MULTIPLE PRODUCTS IN SAME ORDER
-- =========================================

START TRANSACTION;

INSERT INTO orders (customer_id, order_date, order_status)
VALUES (2, NOW(), 'Pending');

INSERT INTO order_items (order_id, warehouse_id, product_id, qty)
VALUES
(2,'WH1',2,1),
(2,'WH2',3,2);

INSERT INTO payments (order_id, payment_type, payment_status)
VALUES (2,'Debit/Credit','Paid');

COMMIT;



-- =========================================
-- TEST 3 : OVERSelling INVENTORY
-- Should FAIL because of trigger
-- =========================================

START TRANSACTION;

INSERT INTO order_items (order_id, warehouse_id, product_id, qty)
VALUES (1,'WH1',1,500);

ROLLBACK;



-- =========================================
-- TEST 4 : CANCEL ORDER
-- =========================================

START TRANSACTION;

DELETE FROM order_items
WHERE order_id = 1;

UPDATE orders
SET order_status = 'Cancelled'
WHERE order_id = 1;

COMMIT;



-- =========================================
-- TEST 5 : VERIFY INVENTORY
-- =========================================

SELECT * FROM inventory;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM payments;