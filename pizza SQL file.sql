-- 1. Total Revenue:
SELECT 
    ROUND(SUM(total_price)) AS "Total Revenue" 
FROM pizza;

-- 2. Average Order Value:
SELECT 
    SUM(total_price) / COUNT(DISTINCT order_id) AS "Avg Order Value"
FROM pizza;

-- 3. Total Pizzas Sold:
SELECT 
    SUM(quantity) AS "Total Pizza's Sold"
FROM pizza;

-- 4. Total Orders:
SELECT 
    COUNT(DISTINCT order_id) AS "Total Orders" 
FROM pizza;

-- 5. Average Pizzas Per Order:
SELECT 
    ROUND(SUM(quantity)::numeric / COUNT(DISTINCT order_id), 2) AS "Average Pizzas Per Order" 
FROM pizza;

-- B. Daily Trend for Total Orders:
SELECT 
    TO_CHAR(order_date, 'Day') AS "Day of Week", 
    COUNT(DISTINCT order_id) AS "Total Orders"
FROM pizza
GROUP BY TO_CHAR(order_date, 'Day')
ORDER BY 2 DESC;

-- C. Monthly Trend for Orders:
SELECT 
    TO_CHAR(order_date, 'Month') AS "Month", 
    COUNT(DISTINCT order_id) AS "Total Orders"
FROM pizza
GROUP BY TO_CHAR(order_date, 'Month')
ORDER BY 2 DESC;

-- D. % of Sales by Pizza Category:
SELECT 
    pizza_category,
    ROUND(SUM(total_price)::numeric, 2) AS "Total Revenue", 
    ROUND(
        (SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza))::numeric, 
        2
    ) AS "% of Sales by Pizza Category"
FROM pizza
GROUP BY pizza_category;

-- E. % of Sales by Pizza Size:
SELECT
    pizza_size, 
    ROUND(SUM(total_price)::numeric, 2) AS "Total Revenue", 
    ROUND(
        (SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza))::numeric, 
        2
    ) AS "% of Sales by Pizza Size"
FROM pizza
GROUP BY pizza_size
ORDER BY 3 DESC;

-- F. Total Pizzas Sold by Pizza Category:
SELECT 
    pizza_category, 
    SUM(quantity) AS "Total Pizzas Sold by Pizza"
FROM pizza
GROUP BY pizza_category
ORDER BY 2 DESC;

-- G. Top 5 Pizzas by Revenue:
SELECT 
    pizza_name, 
    SUM(total_price) AS "Total Revenue"
FROM pizza
GROUP BY pizza_name
ORDER BY 2 DESC
LIMIT 5;

-- H. Bottom 5 Pizzas by Revenue:
SELECT 
    pizza_name, 
    SUM(total_price) AS "Total Revenue"
FROM pizza
GROUP BY pizza_name
ORDER BY 2 ASC
LIMIT 5;

-- I. Top 5 Pizzas by Quantity:
SELECT 
    pizza_name, 
    SUM(quantity) AS Total_Pizza_Sold
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;

-- J. Bottom 5 Pizzas by Quantity:
SELECT 
    pizza_name, 
    SUM(quantity) AS Total_Pizza_Sold
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;

-- K. Top 5 Pizzas by Total Orders:
SELECT 
    pizza_name, 
    COUNT(DISTINCT order_id) AS "Total Orders"
FROM pizza
GROUP BY pizza_name
ORDER BY 2 DESC
LIMIT 5;

-- L. Bottom 5 Pizzas by Total Orders:
SELECT 
    pizza_name, 
    COUNT(DISTINCT order_id) AS "Total Orders"
FROM pizza
GROUP BY pizza_name
ORDER BY 2 ASC
LIMIT 5;
