# **Walmart-Analytics**

## **Description**
This dataset contains information on the factors influencing walmart's revenue, such as the price of fuel, consumer price index, air temparature in the region and unemployment rate for each given week. Walmart is one of the largest American multinational retail store that runs operations in the United states and in 23 other countries. The dataset provides the opportunity to explore the factors affecting walmart's profit margin and generate actionable insights.


## **Objectives**
This analysis seeks to identify patterns in Walmart's sales and derive actionable insights by exploring the factors affecting profit margins. The scope of this analysis includes:
- Sales Trends: Evaluating temporal sales performance to identify trends and seasonal fluctuations.
- Holiday Influence: Assess the impact of holiday seasons on sales performance, and determine the events that coincide with increases in revenue.
- Store-Level Performance: Benchmark sales of individual stores to distinguish high-performing and underperforming stores.
- Correlation with External Factors: Analyzing the relationship between sales and external economic factors including CPI, Fuel Price, Weather Conditions and Unemployment.


## Tech Stack
1. **Python**: Via **Jupyter Notebooks**, used for cleaning and imputation of raw data
2. **SQL**: Via **MySQL** Workbench, Used to perform exploratory analysis to uncover patterns and meaningful insights
3. **Power BI**: Used to create a dashboard to visualize sales trends


## **Dataset Features**
The columns included in the dataset are the following:
- **Store**: Unique identifier for each store
- **Date**: Sales week start date
- **Weekly_Sales**: Store sales for each given week
- **Holiday_Flag**: Mark on the presence or absence of a holiday
- **Temperature**: Air temperature in the region
- **Fuel_Price**: Fuel cost in the region
- **CPI**: Consumer price index, measure of inflation
- **Unemployment**: Unemployment rate in the region for the week


## Project Phases
#### 1. [Import Libraries and Data Cleaning](https://github.com/imran1900/Walmart-Analytics/blob/main/walmart_cleaning.ipynb) (Python)
#### 2. [Exploratory Data Analysis](https://github.com/imran1900/Walmart-Analytics/blob/main/walmart_SQL.md) (MySQL)
#### 3. [Visualization](https://github.com/imran1900/Walmart-Analytics/blob/main/walmart_visualization.pdf) (Power BI)

## **Executive Summary**

### Overview of Findings
WIP

Below is an overview page of the Power BI dashboard with charts and insights derived from them. The entire interactive dashboard can be downloaded [here](https://github.com/imran1900/Walmart-Analytics/blob/main/walmart_viz.pbix).

<kbd><img width="100%" alt="image" src="https://github.com/user-attachments/assets/429e6636-4529-44c1-99d0-4009bf407605"></kbd>

**Sales Trends and Holiday Influence**

<kbd><img width="100%" alt="image" src="https://github.com/user-attachments/assets/64b43b16-f147-41f2-9f23-7b792dfd205f"></kbd>

- Company sales peaked in December, 2010 with a monthly revenue of $288.7 million, and its second highest sales revenue is seen in December, 2011 with a monthly revenue of $288.1 million.
- Company sales fluctuate in April and between the months of June until year-end December. Outside of the months mentioned, sales return to normal levels hovering around a monthly revenue of $190 million. The month of April is associated with Spring/ Easter, June to August with Summer, September with Fall, and November/ December with Christmas. This corresponds to change in consumer behavior as a result of holiday seasons.
- Company sales are at its lowest in January with a monthly revenue of $163.7 million in 2011 and $168.9 in 2012 despite January being associated with the New Years holiday.
- The company's YoY growth increases by 7% from 2010 to 2011 from a total revenue of $2.29 million to $2.45 million. However, YoY drops by 18.3% from 2011 to 2012 because our dataset did not have data on November and December for 2012 which we is attributed to the highest monthly revenue.

**Store-Level Performance**



**Impact of External Economic Factors on Sales Revenue**
