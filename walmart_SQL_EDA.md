# Exploratory Analysis - Walmart
***

### Description
This analysis via MySQL Workbench with MySQL as the language for analysis. The purpose of this analysis is to answer the business questions of how external economic factors and specific seasons are affecting walmart sales performance.

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

#### 1.2 Staging Table Creation
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

### 2.0 Exploratory Analysis
