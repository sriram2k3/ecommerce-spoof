-- ======================================================
-- E-COMMERCE CAPSTONE ETL script
-- ======================================================

INSERT INTO sales_fact(
    order_id,
    product_id,
    customer_id,
    warehouse_id,
    qty,
    unit_price, 
    total_amount,
    order_date
)
SELECT 
    o.order_id,
    oi.product_id,
    o.customer_id,
    oi.warehouse_id,
    oi.qty,
    p.price_per_qty,
    oi.tot_price,
    o.order_date
FROM
    orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN product p 
    ON p.product_id = oi.product_id;