# Exploratory Analysis - Walmart

## Table of Contents
- [1.0 Data Preparation](#1.0-Data-Preparation)

### Description
This analysis was done via MySQL Workbench. The purpose of this analysis is to answer business questions on how external economic factors and specific seasons are affecting walmart sales performance.

### 1.0 Data Preparation
Create a schema then use it as the default schema for analysis.

```sql
CREATE SCHEMA walmart_sales;
```
```sql
USE walmart_sales;
```

#### 1.1 Data Loading
Import the CSV file previously exported via Jupyter Notebooks
<p align="center" width="100%">
  <img width="35%" src="https://github.com/user-attachments/assets/c1862464-09f1-4910-9c48-88efac75c94a"> 
</p>

Create a new table and give an appropriate name. 
<p align="center" width="100%">
  <img width="55%" src="https://github.com/user-attachments/assets/bf65bf6a-e298-46b8-bcb7-914d07bc12f9"> 
</p>

Ensure the field types are correct for each column
<p align="center" width="100%">
  <img width="55%" src="https://github.com/user-attachments/assets/ca687b70-5bf5-4fec-8fbf-301ffe40d408"> 
</p>

Corrected the Date column replacing the field type from text to datetime. Then ensured the correct data format.

<p align="center" width="100%">
  <img width="55%" src="https://github.com/user-attachments/assets/a37b1f5e-f4f0-4206-9964-3f0d235954c5"> 
</p>

Finally, execute the Data Import task and ensure the correct number of rows from the cleaned dataset have been imported. There are 6435 rows.

***

### 1.2 Staging Table Creation
Objectives:
1. Create a staging table - We duplicate the original table to make experimental changes to keep the original table intact incase anything goes wrong.
2. Convert Date column data type from datetime to date - We want to get rid of the time format from 'YYYY-MM-DD HH:MM:SS' to 'YYYY-MM-DD'

#### 1.2.1 Create Staging Table
The 'Date' column data type is converted from datetime to date.

```sql
CREATE TABLE `walmart_staging` (
  `Store` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Weekly_Sales` double DEFAULT NULL,
  `Holiday_Flag` int DEFAULT NULL,
  `Temperature` double DEFAULT NULL,
  `Fuel_Price` double DEFAULT NULL,
  `CPI` double DEFAULT NULL,
  `Unemployment` double DEFAULT NULL,
  `day` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `year` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
```

#### 1.2.2 Insert Values from Source Table
```sql
INSERT INTO walmart_staging SELECT * FROM walmart;
```

#### 1.2.3 Preliminary Checks
Ensure the staging table 'walmart_staging' is populated, aligned with the source table and have the correct data types.
```sql
SELECT * FROM walmart_staging;
```

Ensure the format for Date is converted from from 'YYYY-MM-DD HH:MM:SS' to 'YYYY-MM-DD'.
```sql
SELECT Date FROM walmart_staging;
```

***

### 2.0 Exploratory Analysis

1. What is the total sales across all stores for each month?

```sql
SELECT
  Month,
  ROUND(SUM(Weekly_Sales), 2) AS Total_Sales
FROM walmart_staging
GROUP BY Month
ORDER BY Total_Sales DESC;
```
Output:
- The highest total sales across all walmart stores was in the July with a total sales amount of $650 million
- The lowest total sales was in January with an amount of $332.5 million

<kbd><img width="100%" alt="image" src="https://github.com/user-attachments/assets/2e634a2c-3b55-42ed-8da5-3f349008580a"></kbd>


2. How does the average weekly sales change over the years?

```sql
SELECT
	Year,
    ROUND(AVG(weekly_sales), 2) AS avg_weekly_sales
FROM walmart_staging
GROUP BY Year
ORDER BY Year; 
```
Output:
- The output shows an average of $1.05 million in 2010, $1.04 million in 2011 and $1.03 million in 2012
- This show the average weekly sales has been decreasing by approximately 5% each year
  
<kbd><img width="100%" alt="image" src="https://github.com/user-attachments/assets/26ae1ae2-ebe4-4182-b539-3da9fdc29f59"></kbd>


3. Which is the worst performing store during holiday weeks?

```sql
SELECT 
    Store,
	Date,
    ROUND(MIN(Weekly_sales), 2) AS weekly_sales,
    Holiday_Flag
FROM walmart_staging
WHERE Holiday_Flag = 1
GROUP BY Holiday_Flag, Store, Date
ORDER BY weekly_sales
LIMIT 1;
```
Output:
Store ID 33 has the lowest weekly sales amount of $215,359.21 in December, 2011.

<kbd><img width="100%" alt="image" src="https://github.com/user-attachments/assets/772eebfb-dc29-48b2-a995-798f3d8abfe7"></kbd>

4. Which is the best performing store during holiday weeks?

```sql
SELECT 
    Store,
	Date,
    ROUND(MAX(Weekly_sales), 2) AS weekly_sales,
    Holiday_Flag
FROM walmart_staging
WHERE Holiday_Flag = 1
GROUP BY Holiday_Flag, Store, Date
ORDER BY weekly_sales DESC
LIMIT 1;
```
Output:
Store ID 4 has the highest weekly sales amount of $3 million in December, 2011.

<kbd><img width="100%" alt="image" src="https://github.com/user-attachments/assets/ba9d351b-70b2-4ad9-b1dd-7948902521e6"></kbd>

5. Which store yielded the highest average weekly sales?

```sql
SELECT
  Store,
  ROUND(AVG(Weekly_Sales), 2) AS Avg_Weekly_Sales
FROM walmart_staging
GROUP BY Store
ORDER BY Avg_Weekly_Sales DESC
LIMIT 1;
```

Output:
Store ID 20 has the highest average weekly sales of $2.1 million

<kbd><img width="100%" alt="image" src="https://github.com/user-attachments/assets/8bb4a2f3-e92c-4f48-9b7c-1c6e12e70adf"></kbd>

6. Which store yielded the highest total sales?

```sql
SELECT
	Store,
    ROUND(SUM(Weekly_sales), 2) AS total_sales
FROM walmart_staging
GROUP BY Store
ORDER BY total_sales DESC
LIMIT 1;
```

Output:
Store ID 20 has the highest toal sales of $3.01 million

<kbd><img width="100%" alt="image" src="https://github.com/user-attachments/assets/6a5322ff-f3bb-4c09-a1c2-ed1a9304610a"></kbd>

7. Which weeks have the highest sales for each store?

```sql
WITH ranked_sales AS(SELECT 
	Store,
    Date,
    Weekly_sales,
    RANK() OVER(PARTITION BY Store ORDER BY Weekly_sales DESC) AS sales_rank
FROM walmart_staging)
```

Output:
- Most stores had their highest respective weekly sales in 24 December, 2010, or during Christmas Eve.
- The highest recorded sales was by store ID 14 with sales amount of $3,818,686.45

<kbd><img width="100%" alt="image" src="https://github.com/user-attachments/assets/f63c5307-4b9e-401d-a5be-9caf4ee2692a"></kbd>

8. What is the average weekly sales at different fuel price brackets?

```sql
SELECT
    CASE
		WHEN Fuel_Price < 2.5 THEN '< 2.5'
        WHEN Fuel_Price BETWEEN 2.5 AND 2.75 THEN '2.5 - 2.75'
		WHEN Fuel_Price BETWEEN 2.75 AND 3.0 THEN '2.75 - 3.0'
		WHEN Fuel_Price BETWEEN 3.0 AND 3.25 THEN '3.0 - 3.25'
		WHEN Fuel_Price BETWEEN 3.25 AND 3.5 THEN '3.25 - 3.5'
        ELSE '> 3.5'
	END AS fuel_bracket,
    ROUND(AVG(Weekly_sales), 2) AS avg_weekly_sales
FROM walmart_staging 
GROUP BY fuel_bracket;
```

Output:
- The highest average weekly sales is $1.09 million, between the fuel price bracket of 3.0 and 3.25.
- The lowest average weekly sales is $470.2 thousand, below the fuel price bracket of 2.5.
- The average weekly sales averages around $1 million when the price of fuel is > 2.5.
- The average weekly sales is at its lowest when the price of fuel is < 2.5.
- An increase in the price of fuel forces walmart to increase its product price to keep up with costs of raw materials, hence, the increase in average weekly sales.

Output:

<kbd><img width="100%" alt="image" src="https://github.com/user-attachments/assets/a23369d5-ec58-4cdb-a02a-18733cf4a6f0"></kbd>

9. How does unemployment rate affect weekly sales?

```sql
SELECT
	CASE 
		WHEN Unemployment < 3.0 THEN '< 3.0'
        WHEN Unemployment BETWEEN 3.0 AND 3.99 THEN '3.0 - 3.99'
        WHEN Unemployment BETWEEN 4.0 AND 4.99 THEN '4.0 - 4.99'
        WHEN Unemployment BETWEEN 5.0 AND 5.99 THEN '5.0 - 5.99'
        WHEN Unemployment BETWEEN 6.0 AND 6.99 THEN '6.0 - 6.99'
        WHEN Unemployment BETWEEN 7.0 AND 7.99 THEN '7.0 - 7.99'
        WHEN Unemployment BETWEEN 8.0 AND 8.99 THEN '8.0 - 8.99'
        ELSE '> 9.0'
	END AS unemployment_bracket,
    ROUND(AVG(Weekly_sales), 2) AS avg_weekly_sales
FROM walmart_staging
GROUP BY unemployment_bracket
ORDER BY avg_weekly_sales DESC;
```

Output:
- The average weekly sales is at its highest of $2.14 million in the unemployment bracket between 3.0 and 3.99
- The average weekly sales is at its lowest of $863.3 thousand in the unemployment bracket > 9.0
- Average weekly sales is around $1 million when the unemployment bracket is > 4.0
- Stores are at their highest average weekly sales when unemployment is < 4.0

<kbd><img width="100%" alt="image" src="https://github.com/user-attachments/assets/f1f2bfff-856f-4f18-8738-114048112cb2"></kbd>

10. What is the average weekly sales at different CPI brackets?

```sql
SELECT 
	FLOOR(CPI/ 10) * 10 AS CPI_bracket,
    ROUND(AVG(Weekly_sales), 2) AS avg_weekly_sales
FROM walmart_staging
GROUP BY cpi_bracket
ORDER BY avg_weekly_sales DESC;
```

Output:
- Average weekly sales are around $1 million. The highest average weekly sales of $1.23 million belongs to the 180 CPI bracket.
- The lowest average weekly sales of $948.8 thousand is within the 190 CPI bracket.

<kbd><img width="100%" alt="image" src="https://github.com/user-attachments/assets/66c83fed-6a60-4ec0-9c8e-eb991ba65299"></kbd>

