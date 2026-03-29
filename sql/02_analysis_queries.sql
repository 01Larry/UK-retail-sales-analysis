-- UK Retail Sales -- Analysis Queries
-- Author: Lawrence Kipchirchir
-- Database: MySQL | Table: uk_retail_clean


-- 1. Core Business KPIs
SELECT
    COUNT(DISTINCT InvoiceNo)  AS total_orders,
    COUNT(DISTINCT CustomerID) AS total_customers,
    SUM(Sales)                 AS total_revenue,
    AVG(Sales)                 AS avg_order_value
FROM uk_retail_clean;


-- 2. Monthly Revenue Trend
SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS month,
    SUM(Sales) AS revenue
FROM uk_retail_clean
GROUP BY month
ORDER BY month;


-- 3. Monthly Active Customers
SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS month,
    COUNT(DISTINCT CustomerID) AS active_customers
FROM uk_retail_clean
GROUP BY month
ORDER BY month;


-- 4. Sales by Country
SELECT
    Country,
    SUM(Sales) AS revenue
FROM uk_retail_clean
GROUP BY Country
ORDER BY revenue DESC;


-- 5. Top 10 Products by Revenue
SELECT
    Description,
    SUM(Quantity) AS total_quantity,
    SUM(Sales)    AS revenue
FROM uk_retail_clean
GROUP BY Description
ORDER BY revenue DESC
LIMIT 10;


-- 6. Customer Purchase Frequency
SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS number_of_orders,
    SUM(Sales)                AS total_spent
FROM uk_retail_clean
GROUP BY CustomerID
ORDER BY total_spent DESC;


-- 7. RFM Analysis
SELECT
    CustomerID,
    DATEDIFF(MAX(InvoiceDate), MIN(InvoiceDate)) AS recency,
    COUNT(DISTINCT InvoiceNo)                    AS frequency,
    SUM(Sales)                                   AS monetary
FROM uk_retail_clean
GROUP BY CustomerID
ORDER BY monetary DESC;


-- 8. Average Order Value by Month
SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m')      AS month,
    SUM(Sales) / COUNT(DISTINCT InvoiceNo) AS avg_order_value
FROM uk_retail_clean
GROUP BY month
ORDER BY month;


-- 9. Revenue by Month (Seasonality)
SELECT
    MONTH(InvoiceDate)     AS month_number,
    MONTHNAME(InvoiceDate) AS month_name,
    SUM(Sales)             AS revenue
FROM uk_retail_clean
GROUP BY month_number, month_name
ORDER BY month_number;