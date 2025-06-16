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
