# Pizza Sales Analysis and KPI Dashboard

## Project Overview

This project analyzes pizza sales data to calculate key performance indicators (KPIs) and derive business insights. The calculations for all KPIs and metrics (like Total Revenue, Average Order Value, Sales by Category, etc.) were first performed using SQL queries in PostgreSQL. These same calculations were then replicated and validated within Power BI to ensure correctness and visualize trends.

The SQL scripts provide the raw data aggregation and calculations, while Power BI is used to create interactive dashboards that visualize these metrics and provide deeper insights into trends, sales performance, and customer behavior.

### Key Features:
1. **KPIs and Metrics Calculation (SQL and Power BI)**:
   - **Total Revenue**: Sum of total revenue from all pizza orders.
   - **Average Order Value**: Average amount spent per order.
   - **Total Pizzas Sold**: Total number of pizzas sold across all orders.
   - **Total Orders**: Total number of distinct orders placed.
   - **Average Pizzas Per Order**: Average number of pizzas sold per order.
   - **Percentage of Sales by Category**: Percentage of sales from each pizza category.
   - **Percentage of Sales by Size**: Percentage of sales from each pizza size.
   - **Top 5 Best-Sellers**: Top 5 pizzas ranked by revenue, quantity sold, and total orders.
   - **Bottom 5 Worst-Sellers**: Bottom 5 pizzas ranked by revenue, quantity sold, and total orders.

2. **Power BI Visualizations**:
   - **Daily Trend for Total Orders**: A bar chart showing total orders per day.
   - **Monthly Trend for Total Orders**: A line chart showing total orders per month.
   - **Percentage of Sales by Pizza Category**: A pie chart showing the sales distribution by category.
   - **Percentage of Sales by Pizza Size**: A pie chart showing the sales distribution by pizza size.
   - **Total Pizzas Sold by Pizza Category**: A funnel chart showing the total pizzas sold by category.
   - **Top 5 Best-Sellers by Revenue, Quantity, and Orders**: Bar charts for the best-selling pizzas.
   - **Bottom 5 Worst-Sellers by Revenue, Quantity, and Orders**: Bar charts for the worst-selling pizzas.

## Project Structure

pizza-sales-analysis/
│
├── SQL/
│   ├── kpi_calculations.sql       # SQL queries for KPI calculations
│   ├── trend_analysis.sql         # SQL queries for daily and monthly trends
│   ├── sales_by_category.sql      # SQL query for sales by pizza category
│   ├── sales_by_size.sql          # SQL query for sales by pizza size
│   └── top_bottom_sellers.sql     # SQL query for best/worst sellers
│
├── PowerBI/
│   ├── Pizza_Sales_Analysis.pbix  # Power BI report file containing all charts and visuals
│   ├── Data_Connection_Example.pbix # Example Power BI file showing data connections
│
├── README.md                      # Project documentation
└── requirements.txt               # (Optional) Python dependencies, if any used for additional processing



## Requirements

### 1. **PostgreSQL Database**:
   - A **PostgreSQL** database is required to store and query pizza sales data.
   - The following columns are expected in the `pizza` table:
     - `order_id`: A unique identifier for each order.
     - `order_date`: The date and time when the order was placed.
     - `total_price`: The total price for the order.
     - `quantity`: The quantity of pizzas sold in the order.
     - `pizza_category`: The category of the pizza (e.g., "Veg", "Non-Veg").
     - `pizza_size`: The size of the pizza (e.g., "Small", "Medium", "Large").
     - `pizza_name`: The name of the pizza.

### 2. **Power BI**:
   - **Power BI Desktop** is required to open and interact with the reports.
   - To connect Power BI to the **PostgreSQL database**, you will need to configure the database connection in Power BI.

## Installation and Setup

### 1. **Clone the Repository**:
   
   Clone the project repository to your local machine:
   
   ```bash
   git clone https://github.com/your-username/pizza-sales-analysis.git
   cd pizza-sales-analysis

2. PostgreSQL Database Setup:
Ensure your PostgreSQL database is set up and contains the pizza table with the required schema and data.
If your data is in another format (e.g., CSV, Excel), you can import it into PostgreSQL.
3. Run SQL Queries:
The SQL queries are located in the SQL/ folder. You can execute the SQL queries directly in your PostgreSQL environment to compute the KPIs and analyze trends. The queries calculate metrics like Total Revenue, Average Order Value, and others, which can then be used for visualization in Power BI.
Example of a SQL query for Total Revenue:
sql
Copy code
SELECT ROUND(SUM(total_price)) AS "Total Revenue" 
FROM pizza;

4. Power BI Setup:
Open Power BI Desktop and load the .pbix file from the PowerBI/ folder.
Connect Power BI to the PostgreSQL database or import the results of the SQL queries as CSV files.
Power BI will automatically visualize the data from the SQL queries.
5. Data Transformation in Power BI:
All the data transformations (such as aggregations, filtering, and grouping) are already done in the SQL queries.
Power BI is used to visualize the results and create interactive dashboards.
6. Viewing and Interacting with the Dashboard:
Once the data is loaded and connected, the Power BI dashboard will display various visualizations such as bar charts, pie charts, and funnel charts.
Use interactive features such as slicers and drill-through to explore the data and gain insights into pizza sales performance.
Example SQL Queries
1. Total Revenue:
sql
Copy code
SELECT ROUND(SUM(total_price)) AS "Total Revenue" 
FROM pizza;

2. Percentage of Sales by Pizza Category:
sql
Copy code
SELECT 
    pizza_category,
    ROUND(SUM(total_price)::numeric, 2) AS "Total Revenue", 
    ROUND(
        (SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza))::numeric, 
        2
    ) AS "% of Sales by Pizza Category"
FROM pizza
GROUP BY pizza_category;

3. Top 5 Best-Selling Pizzas by Revenue:
sql
Copy code
SELECT pizza_name, SUM(total_price) AS "Total Revenue"
FROM pizza
GROUP BY pizza_name
ORDER BY "Total Revenue" DESC
LIMIT 5;

4. Monthly Trend for Total Orders:
sql
Copy code
SELECT 
    TO_CHAR(order_date, 'Month') AS "Month", 
    COUNT(DISTINCT order_id) AS "Total Orders"
FROM pizza
GROUP BY TO_CHAR(order_date, 'Month')
ORDER BY "Total Orders" DESC;

Power BI Visualizations
Once the SQL queries are executed and results are imported into Power BI, you can generate the following visualizations:
Daily Trend for Total Orders: A bar chart showing total orders per day of the week.
Monthly Trend for Total Orders: A line chart showing total orders for each month.
Percentage of Sales by Pizza Category: A pie chart visualizing sales distribution by pizza category.
Percentage of Sales by Pizza Size: A pie chart showing sales by pizza size.
Total Pizzas Sold by Pizza Category: A funnel chart for pizzas sold by category.
Top 5 Best-Sellers by Revenue, Quantity, and Orders: Bar charts for top 5 best-sellers.
Bottom 5 Worst-Sellers by Revenue, Quantity, and Orders: Bar charts for bottom 5 worst-sellers.
Future Enhancements
Real-Time Data: Set up automated data refresh in Power BI Service for real-time analytics.
Customer Segmentation: Implement customer segmentation based on purchasing behavior.
Predictive Analytics: Use machine learning to predict future trends and customer preferences.
License
This project is licensed under the MIT License - see the LICENSE file for details.

Contributing
Contributions are welcome! If you'd like to contribute, please fork the repository, create a new branch, and submit a pull request with your changes.
markdown
Copy code

### What this Markdown includes:
1. **Directory structure** is formatted as a code block with indentations.
2. **SQL examples** are inside code blocks (` ```sql `).
3. Proper use of **headings** for sections.
4. Detailed instructions on how to set up and use both PostgreSQL and Power BI.
5. Future enhancements and license information at the end.

This should be good to go! Let me know if you need any further tweaks or additions.
