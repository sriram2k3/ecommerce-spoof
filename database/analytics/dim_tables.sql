-- ======================================================
-- E-COMMERCE CAPSTONE DIMENSION TABLES
-- ======================================================

#product_dim
CREATE TABLE product_dim(
    SELECT
		product_id
		product_name,
        category,
	    CASE 
			WHEN price_per_qty < 5000 THEN 'Low'
            WHEN price_per_qty BETWEEN 5000 AND 20000 then 'Mid'
            ELSE 'Premium'
		END AS price_category
	FROM product
);

#customer_dim
CREATE TABLE customer_dim(
	 SELECT
		customer_id,
        CONCAT_WS(' ',customer_fname,customer_lname),
        email,
        location,
        CASE 
			WHEN age < 20 THEN 'Youth'
            WHEN age BETWEEN 20 AND 40 THEN 'Adult'
            ELSE 'Senior'
		END AS age_category
	FROM customer
);

#warehouse_dim
CREATE TABLE warehouse_dim AS
SELECT 
    warehouse_id,
    location
FROM warehouse;