-- ======================================================
-- E-COMMERCE CAPSTONE ANALYTICS QUERIES
-- ======================================================

# Top selling product by sold
SELECT 
    product_id, SUM(qty) AS total_sold
FROM
    sales_fact
GROUP BY product_id
ORDER BY total_sold DESC;