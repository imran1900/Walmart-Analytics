# Exploratory Analysis - Walmart
***

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

<p align="left" width="100%">
  <img width="15%" src="https://github.com/user-attachments/assets/2e634a2c-3b55-42ed-8da5-3f349008580a"> 
</p>


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

<p align="left" width="100%">
  <img width="15%" src="https://github.com/user-attachments/assets/26ae1ae2-ebe4-4182-b539-3da9fdc29f59"> 
</p>


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

<p align="left" width="100%">
  <img width="15%" src="https://github.com/user-attachments/assets/772eebfb-dc29-48b2-a995-798f3d8abfe7"> 
</p>


