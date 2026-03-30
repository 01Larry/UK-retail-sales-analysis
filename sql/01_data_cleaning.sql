-- UK Retail Sales -- Data Cleaning Workflow
-- Author: Lawrence Kipchirchir
-- Database: MySQL

-- 1. Setting Up Database
CREATE DATABASE IF NOT EXISTS uk_retail;
USE uk_retail;


-- 2. Creating Raw Staging Table
DROP TABLE IF EXISTS uk_retail_raw;
CREATE TABLE uk_retail_raw (
    InvoiceNo   VARCHAR(20),
    StockCode   VARCHAR(20),
    Description VARCHAR(255),
    Quantity    INT,
    InvoiceDate VARCHAR(40),
    UnitPrice   DECIMAL(10,2),
    CustomerID  VARCHAR(20),
    Country     VARCHAR(80)
);


-- 3. Loading Raw Data from CSV
LOAD DATA LOCAL INFILE 'C:/Users/User/Desktop/Data Projects/Uk retail store data.csv'
INTO TABLE uk_retail_raw
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(InvoiceNo, StockCode, Description, Quantity,
 InvoiceDate, @UnitPrice, CustomerID, Country)
SET UnitPrice = NULLIF(@UnitPrice, '');


-- 4. Fixing Date Column (converting VARCHAR to DATETIME)
ALTER TABLE uk_retail_raw ADD COLUMN InvoiceDate_Clean DATETIME;

UPDATE uk_retail_raw
SET InvoiceDate_Clean = STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i');


-- 5. Creating Final Cleaned Table
DROP TABLE IF EXISTS uk_retail_clean;
CREATE TABLE uk_retail_clean AS
SELECT
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate_Clean AS InvoiceDate,
    UnitPrice,
    (Quantity * UnitPrice) AS Sales,
    CustomerID,
    Country
FROM uk_retail_raw
WHERE
    Quantity      > 0
    AND UnitPrice > 0
    AND CustomerID IS NOT NULL;
