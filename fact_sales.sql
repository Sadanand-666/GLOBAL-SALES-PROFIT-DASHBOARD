SHOW TABLES;
DESCRIBE superstore;  
SELECT COUNT(*), MIN(OrderDate), MAX(OrderDate) FROM superstore;

DROP TABLE fact_sales;

CREATE TABLE fact_sales AS
SELECT
    CAST(`Row ID` AS SIGNED) AS RowID,
    `Order ID` AS OrderID,
    STR_TO_DATE(`Order Date`, '%d-%m-%Y') AS OrderDate,
    STR_TO_DATE(`Ship Date`, '%d-%m-%Y') AS ShipDate,
    `Ship Mode` AS ShipMode,
    `Customer ID` AS CustomerID,
    `Customer Name` AS CustomerName,
    `Segment` AS Segment,
    `Country/Region` AS CountryRegion,
    `City` AS City,
    `State` AS State,
    CAST(`Postal Code` AS CHAR) AS PostalCode,
    `Region` AS Region,
    `Product ID` AS ProductID,
    `Category` AS Category,
    `Sub-Category` AS SubCategory,
    `Product Name` AS ProductName,
    CAST(`Sales` AS DECIMAL(12,2)) AS Sales,
    CAST(`Quantity` AS SIGNED) AS Quantity,
    CAST(`Discount` AS DECIMAL(5,2)) AS Discount,
    CAST(`Profit` AS DECIMAL(12,2)) AS Profit
FROM `superstore`;

SELECT OrderDate, ShipDate FROM fact_sales LIMIT 10;

SELECT MIN(Sales) AS MinSales, MAX(Sales) AS MaxSales,
       MIN(Profit) AS MinProfit, MAX(Profit) AS MaxProfit
FROM fact_sales;

SELECT COUNT(*) FROM fact_sales;

SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
    ROUND(SUM(Sales),2) AS TotalSales
FROM fact_sales
GROUP BY Month
ORDER BY Month;

SELECT 
    Category,
    ROUND(SUM(Profit),2) AS TotalProfit
FROM fact_sales
GROUP BY Category
ORDER BY TotalProfit DESC
limit 10;

SELECT 
    Region,
    ROUND(SUM(Sales),2) AS TotalSales
FROM fact_sales
GROUP BY Region
ORDER BY TotalSales DESC
limit 10;

SELECT 
    ProductName,
    ROUND(SUM(Sales),2) AS TotalSales
FROM fact_sales
GROUP BY ProductName
ORDER BY TotalSales DESC
LIMIT 5;







