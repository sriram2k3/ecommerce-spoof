-- ======================================================
-- E-COMMERCE CAPSTONE DATABASE TRIGGERS
-- ======================================================

-- Trigger 1 - Calculate total price for a purchase based on product_id
DELIMITER //

CREATE TRIGGER tot_price_trig 
BEFORE INSERT ON order_items 
FOR EACH ROW 
BEGIN 
    SET NEW.tot_price = NEW.qty * (
        SELECT price_per_qty 
        FROM product 
        WHERE product_id = NEW.product_id
    );
END //

DELIMITER ;

-- Trigger 2 - Reduce inventory when order is placed
DELIMITER //

CREATE TRIGGER stockred_trig 
AFTER INSERT ON order_items 
FOR EACH ROW 
BEGIN 
    UPDATE inventory 
    SET stock_qty = stock_qty - NEW.qty 
    WHERE product_id = NEW.product_id 
      AND warehouse_id = NEW.warehouse_id;
END //

DELIMITER ;

-- Trigger 3 - Add stock back to inventory when order is cancelled
DELIMITER //

CREATE TRIGGER stockup_trig 
AFTER DELETE ON order_items 
FOR EACH ROW 
BEGIN 
    UPDATE inventory 
    SET stock_qty = stock_qty + OLD.qty 
    WHERE product_id = OLD.product_id 
      AND warehouse_id = OLD.warehouse_id;
END //

DELIMITER ;

-- Trigger 4 - Handling Overselling Inventory 
delimiter //
create trigger stockhoi_trig
before insert on order_items
for each row
begin
declare available_stock int;
SELECT 
    stock_qty
INTO available_stock FROM
    inventory
WHERE
    product_id = new.product_id
        AND warehouse_id = new.warehouse_id;
IF new.qty > available_stock
    THEN SIGNAL SQLSTATE '45000'
    SET message_text = 'Insufficient Stock'; 
end if;
end //
delimiter ;