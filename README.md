# Pizza Sales Analysis and KPI Dashboard
![Dashboard](https://github.com/pbisht2105/pizza_sql_power-bi_project/blob/main/Pizza%20Sales%20Dashboard%20Home.png)

## What is this project?

This project is focused on analyzing pizza sales data to compute key performance indicators (KPIs) and provide business insights. The analysis leverages **SQL** to calculate key metrics like Total Revenue, Average Order Value, and Sales by Category, which are then visualized using **Power BI**. The goal of this project is to enable pizzerias or similar businesses to make data-driven decisions by understanding sales trends, product performance, and customer behavior.

---

## Data Set Used
The data for this project is sourced from the Kaggle dataset:
- **Dataset Link:** [Pizza Dataset](https://www.kaggle.com/datasets/nextmillionaire/pizza-sales-dataset)

The dataset used in this project consists of **pizza sales transactions** from a pizzeria. Each record in the dataset represents an individual pizza order, and it includes the following fields:

- `order_id`: Unique identifier for each order.
- `order_date`: The date and time when the order was placed.
- `total_price`: The total price of the order.
- `quantity`: The number of pizzas sold in the order.
- `pizza_category`: The category of the pizza (e.g., "Veg", "Non-Veg").
- `pizza_size`: The size of the pizza (e.g., "Small", "Medium", "Large").
- `pizza_name`: The name of the pizza ordered.

This data is stored in a **PostgreSQL** database, and the analysis is conducted on this dataset to generate KPIs and trends.

---

## Questions, KPIs, or Business Problems

### Key Business Problems Addressed:
1. **Total Revenue**: What is the total revenue generated from all pizza orders?
2. **Average Order Value**: What is the average amount spent per order?
3. **Total Pizzas Sold**: How many pizzas have been sold across all orders?
4. **Total Orders**: How many distinct orders have been placed?
5. **Average Pizzas Per Order**: On average, how many pizzas are sold per order?
6. **Percentage of Sales by Category**: What percentage of total sales comes from each pizza category (e.g., Veg, Non-Veg)?
7. **Percentage of Sales by Size**: How do the sales break down by pizza size (Small, Medium, Large)?
8. **Top 5 Best-Sellers**: Which 5 pizzas are the best-sellers by revenue, quantity sold, and number of orders?
9. **Bottom 5 Worst-Sellers**: Which 5 pizzas are the worst-sellers by revenue, quantity sold, and number of orders?

### KPIs Generated:
- **Total Revenue**
- **Average Order Value**
- **Total Pizzas Sold**
- **Total Orders**
- **Percentage of Sales by Category**
- **Percentage of Sales by Size**
- **Top 5 Best-Sellers**
- **Bottom 5 Worst-Sellers**
- **Sales Trends (Daily/Monthly)**

---

## Process

### 1. **Data Aggregation and SQL Queries**
   The first step of the project was to aggregate the raw sales data using SQL queries. Each SQL query is designed to compute one of the KPIs or business metrics, such as the **Total Revenue**, **Average Order Value**, **Sales by Category**, etc. The queries are written to work on a PostgreSQL database, assuming the pizza sales data is already stored in a `pizza` table.

   Example SQL queries:
   - **Total Revenue Calculation**:
     ```sql
     SELECT ROUND(SUM(total_price)) AS "Total Revenue" 
     FROM pizza;
     ```

   - **Top 5 Best-Selling Pizzas by Revenue**:
     ```sql
     SELECT pizza_name, SUM(total_price) AS "Total Revenue"
     FROM pizza
     GROUP BY pizza_name
     ORDER BY "Total Revenue" DESC
     LIMIT 5;
     ```

### 2. **Data Import into Power BI**
   After aggregating the data through SQL queries, the results are either directly imported into Power BI from the PostgreSQL database or exported as CSV files and then loaded into Power BI.

### 3. **Creating Visualizations in Power BI**
   Using Power BI, a series of interactive charts and graphs were created to visualize the data:
   - **Bar charts** for daily and monthly trends.
   - **Pie charts** for sales distribution by category and size.
   - **Funnel charts** for total pizzas sold by category.
   - **Bar charts** for top and bottom-selling pizzas.

### 4. **Dashboard Creation**
   The final step was to organize these visualizations into an interactive dashboard in Power BI. The dashboard allows users to filter the data by date, pizza category, size, etc., to gain deeper insights into the pizza sales performance.

---

## Dashboard

Here is a screenshot of the Power BI dashboard showing various visualizations related to pizza sales:

![Power BI Dashboard Screenshot](https://github.com/pbisht2105/pizza_sql_power-bi_project/blob/main/Pizza%20Sales%20Dashboard%20Home.png) 
![Power BI Dashboard Page2](https://github.com/pbisht2105/pizza_sql_power-bi_project/blob/main/Pizza%20Sales%20Dashboard%20Page2.png)  

### Key Features of the Dashboard:
- **Total Revenue Over Time**: A line chart showing revenue trends by day/month.
- **Percentage of Sales by Pizza Category**: A pie chart showing how sales are distributed across different pizza categories.
- **Sales Breakdown by Pizza Size**: A pie chart showing how sales are divided by pizza size.
- **Top 5 Best-Selling Pizzas**: Bar charts showing the best-selling pizzas in terms of revenue and quantity sold.

---

## Final Conclusion

This project provides valuable insights into pizza sales, helping businesses optimize their operations and marketing strategies. By using SQL for data aggregation and Power BI for visualization, we were able to uncover patterns in sales performance, identify best- and worst-selling pizzas, and highlight key areas for improvement.

### Recommendations for Businesses:
- **Focus on Promoting Best-Sellers**: Given that **Thai Chicken Pizza** generates the highest revenue, businesses should consider promoting it further through special offers.
- **Improve Marketing for Underperforming Pizzas**: The **Brie Carre Pizza**, which is a worst-seller, might need a pricing or promotional overhaul to improve its performance.
- **Optimize Inventory for High-Demand Sizes**: Since **Large** pizzas are the most popular, ensure that these are adequately stocked to meet demand.
- **Leverage Peak Days and Months**: Based on the busiest days and months (Friday, Saturday, January, May, and July), businesses can plan targeted marketing campaigns and promotional offers to boost sales during peak periods.

This project demonstrates the power of data analysis and visualization tools (SQL and Power BI) to extract meaningful insights from raw sales data and drive business success.

---

## SQL Queries

```sql
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
