# Flipkart-like E-commerce Capstone

## Goal
Build an end-to-end e-commerce platform with:
- Database design
- Backend APIs
- Data engineering pipeline
- Cloud deployment later

## Tech Stack
- MySQL
- Git & GitHub
- Python / Backend
- AWS (later)

## Author
Sri Ram

## Database Implementation Progress

Completed:
- Product table
- Customer table
- Warehouse table
- Inventory table
- Orders table
- Order items table
- Payments table

Implemented triggers:
- Auto calculate total price
- Reduce inventory on order
- Restore inventory on cancel

Implemented Transaction test
 - Placing order details
 - Adding order items
 - Updating inventory
 - Adding payment details
 - Test for multiple products in a order
 - Test for cancelling an order

## Analytics Layer (OLAP)

Implemented:
- sales_fact table (denormalized)
- ETL transformation from OLTP tables
- Sample analytics queries:
  - Top selling products
  - Revenue by warehouse
  - Daily revenue

Next Steps:
- Dimension tables
- Data simulation
- Dashboard (Power BI)
