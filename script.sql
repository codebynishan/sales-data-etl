SELECT * FROM superstore;

ALTER TABLE superstore
RENAME COLUMN "Customer ID" TO customer_id;

ALTER TABLE superstore
RENAME COLUMN "Order ID" TO order_id;

ALTER TABLE superstore
RENAME COLUMN "Order Date" TO order_date;

ALTER TABLE superstore
RENAME COLUMN "Ship Mode" TO ship_mode;

ALTER TABLE superstore
RENAME COLUMN "Ship Date" TO ship_date;

ALTER TABLE superstore
RENAME COLUMN "Customer Name" TO customer_name;

ALTER TABLE superstore
RENAME COLUMN "Product ID" TO product_id;

ALTER TABLE superstore
RENAME COLUMN "Postal Code" TO postal_code;

ALTER TABLE superstore
RENAME COLUMN "Product Name" TO product_name;

SELECT SUM("Sales") AS total_revenue
FROM superstore;


SELECT COUNT(DISTINCT Customer ID) AS total_customers
FROM superstore;

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM superstore;

SELECT customer_name, SUM("Sales") AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT 
    order_date,
    ship_date,
    (TO_DATE(ship_date, 'DD/MM/YYYY') - TO_DATE(order_date, 'DD/MM/YYYY')) AS delivery_days
FROM superstore;

SELECT 
    product_name,
    SUM("Sales") AS total_revenue
FROM superstore
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;

SELECT 
    COUNT(*) AS late_orders
FROM superstore
WHERE (TO_DATE(ship_date, 'DD/MM/YYYY') - TO_DATE(order_date, 'DD/MM/YYYY')) > 4;


SELECT DISTINCT("Category"),COUNT("Sub-Category") 
 FROM superstore
 GROUP BY "Category";

 
SELECT *
FROM superstore;

SELECT 
    "Category",
    "Sub-Category",
    COUNT(*) AS subcategory_count
FROM superstore
GROUP BY "Category", "Sub-Category"
ORDER BY subcategory_count DESC
LIMIT 1;

SELECT 
    ship_mode,
    COUNT(*) AS usage_count
FROM superstore
GROUP BY ship_mode
ORDER BY usage_count DESC
LIMIT 1;


SELECT 
    "Region",
    COUNT(*) AS total_orders
FROM superstore
GROUP BY "Region"
ORDER BY total_orders DESC;




