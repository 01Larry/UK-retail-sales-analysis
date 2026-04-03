# UK Retail Sales Analysis

End-to-end UK retail sales analysis using MySQL, Excel and Tableau

## Live Dashboard
[View Interactive Dashboard](https://public.tableau.com/authoring/UKRetailSalesCustomerBehaviourdashboard/Dashboard1#1)

## Dashboard Preview
![UK Retail Sales Dashboard](dashboard/uk_retail_dashboard.png)

## Project Overview
This project analyses transactional data from a UK-based online retailer
covering December 2010 to December 2011. The goal was to uncover revenue
trends, customer behaviour patterns, and top-performing products through
SQL-based data cleaning and Tableau visualisation.

## Data Source
- **Dataset:** Online Retail Dataset from the UCI Machine Learning Repository
- **Source:** https://archive.ics.uci.edu/ml/datasets/Online+Retail
- **Records:** 397,880 rows | 9 columns
- **Period:** December 2010 – December 2011
- **Geography:** Transactions from a UK-based online retailer serving
  customers in 37 countries
- **Description:** This dataset contains transactional data including
  product purchases, quantities, pricing, customer IDs, and timestamps,
  used for analyzing sales performance, customer behavior, and market trends.

## Tools
- **MySQL** — Data cleaning and analysis queries
- **Excel** — Initial data exploration
- **Tableau** — Interactive dashboard and visualisation

## Data Cleaning (MySQL)
- Created a raw staging table and loaded the CSV using LOAD DATA LOCAL INFILE
- Converted InvoiceDate from VARCHAR to DATETIME using STR_TO_DATE()
- Handled empty UnitPrice values by converting blank strings to NULL using NULLIF()
- Derived a Sales column by multiplying Quantity by UnitPrice
- Removed records where Quantity or UnitPrice were zero or negative
- Excluded rows with missing CustomerID to ensure customer-level analysis accuracy
- Exported final cleaned table as uk_retail_clean for analysis and visualisation

## Analysis
- **Revenue Trend** — monthly revenue tracked across 12 months to identify
  seasonal patterns and peak trading periods
- **Sales by Country** — revenue distribution across 37 countries to identify
  the strongest and emerging markets
- **New vs Returning Customers** — customer segmentation showing 64% returning
  vs 36% new customers to assess loyalty and retention
- **Top 10 Products** — highest revenue-generating products ranked by total
  sales to identify key inventory priorities
- **RFM Analysis** — customers scored by recency, frequency and monetary value
  to support targeted marketing and segmentation
- **Average Order Value Trend** — monthly AOV tracked to measure changes in
  customer spending behaviour over time

## SQL Query Results

### 1. Core Business KPIs

| total_orders | total_customers | total_revenue | avg_order_value |
|---|---|---|---|
| 18,532 | 4,338 | £8,911,407.90 | £22.40 |

> The business processed 18,532 orders from 4,338 unique customers
> generating £8.91M in total revenue over 12 months with an average
> order value of £22.40.

---

### 2. Sales by Country (Top 5)

| Country | Revenue |
|---|---|
| United Kingdom | £7,308,391.55 |
| Netherlands | £285,446.34 |
| Ireland | £265,545.90 |
| Germany | £228,867.14 |
| France | £209,024.05 |

> The United Kingdom dominates at 82% of total revenue. Netherlands,
> Ireland and Germany are the strongest international markets despite
> significantly lower transaction volumes compared to the UK.

---

### 3. Top 10 Products by Revenue

| Description | Total Quantity | Revenue |
|---|---|---|
| Paper Craft Little Birdie | 80,995 | £168,469.60 |
| Regency Cakestand 3 Tier | 12,402 | £142,592.95 |
| White Hanging Heart T-Light Holder | 36,725 | £100,448.15 |
| Jumbo Bag Red Retrospot | 46,181 | £85,220.78 |
| Medium Ceramic Top Storage Jar | 77,916 | £81,416.73 |
| Postage | 3,120 | £77,803.96 |
| Party Bunting | 15,291 | £68,844.33 |
| Assorted Colour Bird Ornament | 35,362 | £56,580.34 |
| Manual | 7,173 | £53,779.93 |
| Rabbit Night Light | 27,202 | £51,346.20 |

> Paper Craft Little Birdie leads revenue at £168,469 driven by
> exceptionally high volume of 80,995 units. Medium Ceramic Top
> Storage Jar moved the highest quantity in the top 10 at 77,916
> units highlighting strong demand for everyday storage products.

---

### 4. Customer Purchase Frequency (Top 5)

| CustomerID | Number of Orders | Total Spent |
|---|---|---|
| 14646 | 73 | £280,206.02 |
| 18102 | 60 | £259,657.30 |
| 17450 | 46 | £194,550.79 |
| 16446 | 2 | £168,472.50 |
| 14911 | 201 | £143,825.06 |

> Customer 14646 placed 73 orders spending £280K — nearly 3% of total
> revenue from a single customer. Notably customer 16446 spent £168K
> in just 2 orders indicating high-value bulk purchasing behaviour.

---

### 5. RFM Analysis (Top 5 by Monetary Value)

| CustomerID | Recency (days) | Frequency | Monetary |
|---|---|---|---|
| 14646 | 353 | 73 | £280,206.02 |
| 18102 | 367 | 60 | £259,657.30 |
| 17450 | 359 | 46 | £194,550.79 |
| 16446 | 205 | 2 | £168,472.50 |
| 14911 | 372 | 201 | £143,825.06 |

> Customers 14646, 18102 and 17450 show high scores across all three
> RFM dimensions — long relationships, frequent purchases and high spend.
> Customer 14911 stands out with 201 orders over 372 days averaging
> roughly one order every two days making them the most frequent buyer.

---

## Results
- Total revenue of £8.91M across 18,532 orders
- United Kingdom generated £7.31M — 82% of total revenue
- 64% returning customer rate vs 36% new customers
- Strong Q4 revenue spike — November peaked at £1.2M
- Top product: Paper Craft Little Birdie at £168,469.60
- Top customer: ID 14646 with £280,206 spent across 73 orders

## Recommendations
- Focus retention efforts on the 36% new customers to grow the returning base
- Stock up high-revenue products ahead of Q4 to capitalise on seasonal demand
- Explore growth opportunities in Netherlands and Ireland — fastest growing
  non-UK markets after Germany
- Prioritise top RFM customers like 14646 and 18102 for loyalty programmes
  given their outsized contribution to total revenue
