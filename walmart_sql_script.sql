# Create a new schema called walmart_sales
CREATE SCHEMA walmart_sales;

# Set walmart_sales as the default schema 
USE walmart_sales;

SELECT * FROM walmart;


# Because Date column is in datetime format, we'll need to convert from datetime to date 
# First, we'll create a staging table to perform changes to our original table
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

# Input values from the source table into our staging table
INSERT INTO walmart_staging SELECT * FROM walmart;

# Verifying the Date column is in date format
SELECT * FROM walmart_staging;
SELECT Date FROM walmart_staging;

# Duplicate checks
WITH duplicate_cte AS(
SELECT *,
	ROW_NUMBER() OVER(
		PARTITION BY 
			 `Store`,
			  `Date`,
			  `Weekly_Sales`,
			  `Holiday_Flag`,
			  `Temperature`,
			  `Fuel_Price`,
			  `CPI`,
			  `Unemployment`) AS row_num 
FROM walmart_staging
)
SELECT * FROM duplicate_cte
WHERE row_num > 1;

SELECT * FROM walmart_staging;

# Q1: What is the total sales across all stores for each month?
# The output shows that the highest total sales across all walmart stores was in the December, 2012 with a total sales amount of $288.7 million
# Conversely, the lowest toal sales was in January, 2011 with a total sales of $163.7 million

SELECT
  Date,
  ROUND(SUM(Weekly_Sales), 2) AS Total_Sales
FROM walmart_staging
GROUP BY Date
ORDER BY Total_Sales DESC;
    
# Q2: How does the average weekly sales change over the years?
# The output shows an average of $1.05 million in 2010, $1.04 million in 2011 and $1.03 million in 2012
# This show the average weekly sales has been decreasing by approximately 5% each year

SELECT
	Year,
    ROUND(AVG(weekly_sales), 2) AS avg_weekly_sales
FROM walmart_staging
GROUP BY Year
ORDER BY Year;    

# Q3: Which is the worst performing store during holiday weeks?
# Based on the output, store ID 33 has the lowest weekly sales amount of $215,359.21 in December, 2011.

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

# Q4: Which is the best performing store during holiday weeks?
# Based on the output, store ID 4 has the highest weekly sales amount of $3 million in December, 2011.

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

# Q5: Which store yielded the highest average weekly sales?
# Store ID 20 has the highest average weekly sales of $2.1 million
SELECT
  Store,
  ROUND(AVG(Weekly_Sales), 2) AS Avg_Weekly_Sales
FROM walmart_staging
GROUP BY Store
ORDER BY Avg_Weekly_Sales DESC
LIMIT 1;

    
# Q6: Which store yielded the highest total sales?
# Store ID 20 has the highest toal sales of $3.01 million
SELECT
	Store,
    ROUND(SUM(Weekly_sales), 2) AS total_sales
FROM walmart_staging
GROUP BY Store
ORDER BY total_sales DESC;

# Q7: Which weeks have the highest sales for each store?
# Based on the output, most stores had their highest respective weekly sales in 24 December, 2010, or during Christmas Eve.
WITH ranked_sales AS(SELECT 
	Store,
    Date,
    Weekly_sales,
    RANK() OVER(PARTITION BY Store ORDER BY Weekly_sales DESC) AS sales_rank
FROM walmart_staging)

SELECT 
	Store,
    Date,
    Weekly_sales 
FROM ranked_sales 
WHERE sales_rank = 1;

# Q8: What is the average weekly sales at different fuel price brackets?
# The highest average weekly sales is $1.09 million, between the fuel price bracket of 3.0 and 3.25 
# The lowest average weekly sales is $470.2 thousand, below the fuel price bracket of 2.5
# Based on the weekly sales, it seems that the average weekly sales averages around $1 million when the price of fuel is > 2.5
# On the other hand the average weekly sales is at its lowest when the price of fuel is < 2.5
# An increase in the price of fuel forces walmart to increase its product price to keep up with costs of raw materials, hence
# the increase in average weekly sales
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

# Q9: How does unemployment rate affect weekly sales?
# The average weekly sales is at its highest of $2.14 million in the unemployment bracket between 3.0 and 3.99
# The average weekly sales is at its lowest of $863.3 thousand in the unemployment bracket > 9.0
# Based on the output, it seems that average weekly sales is around $1 million when the unemployment bracket is > 4.0
# On the other hand, stores are at their highest average weekly sales when unemployment is < 4.0

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
	

# Q10: What is the average weekly sales at different CPI brackets?
# Based on the output, average weekly sales are around $1 million. The highest average weekly sales of $1.23 million belongs to the 180 CPI bracket.
# The lowest average weekly sales of $948.8 thousand is within the 190 CPI bracket.

SELECT 
	FLOOR(CPI/ 10) * 10 AS CPI_bracket,
    ROUND(AVG(Weekly_sales), 2) AS avg_weekly_sales
FROM walmart_staging
GROUP BY cpi_bracket
ORDER BY avg_weekly_sales DESC;
