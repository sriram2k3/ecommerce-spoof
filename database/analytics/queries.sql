-- ======================================================
-- E-COMMERCE CAPSTONE ANALYTICS QUERIES
-- ======================================================

# Top selling product by sold
SELECT 
    f.product_id,p.product_name, SUM(f.qty) AS total_sold
FROM
    sales_fact f
JOIN product_dim p ON f.product_id = p.product_id
GROUP BY f.product_id,p.product_name
ORDER BY total_sold DESC;

#Revenue by price category
SELECT p.price_category, sum(total_amount) as tot_revenue
FROM sales_fact f
JOIN product_dim p ON f.product_id = p.product_id
GROUP BY p.price_category;

#Revenue by age grooup
SELECT c.age_category, sum(total_amount) as tot_revenue
FROM sales_fact f 
JOIN customer_dim c ON f.customer_id = c.customer_id
GROUP BY C.age_category;