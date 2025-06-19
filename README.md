# **Walmart-Analytics**

The dataset can be downloaded [here](https://www.kaggle.com/datasets/mikhail1681/walmart-sales)

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

<kbd><img width="100%" alt="image" src="https://github.com/user-attachments/assets/0ea30e58-d60d-4ea7-9b36-cf6d95035d3f"></kbd>

- Company sales peaked in December, 2010 with a monthly revenue of $288.7 million, and its second highest sales revenue is seen in December, 2011 with a monthly revenue of $288.1 million.
- Company sales fluctuate in April and between the months of June until year-end December. Outside of the months mentioned, sales return to normal levels hovering around a monthly revenue of $190 million. The month of April is associated with Spring/ Easter, June to August with Summer, September with Fall, and November/ December with Christmas. This corresponds to change in consumer behavior as a result of holiday seasons.
- Company sales are at its lowest in January with a monthly revenue of $163.7 million in 2011 and $168.9 in 2012 despite January being associated with the New Years holiday.
- The company's YoY growth increases by 7% from 2010 to 2011, a total revenue of $2.29 million to $2.45 million. However, YoY growth drops by 18.3% from 2011 to 2012 due to unavailability of data for the months November and December which can be attributed to the highest monthly revenue.

**Store-Level Performance**

<kbd><img width="100%" alt="image" src="https://github.com/user-attachments/assets/1a21c77e-0b10-4a26-97cc-ecdc1995c4cc"></kbd>

- In each year, store ID's 2, 4, 13 and 20 are consistently within the top 5 stores by sales revenue. The highest sales revenue was made by store 20 amounting to a grand total $301.4 million. $278.9 million were made from Non-Holiday sales and $22.4 million from Holiday sales.
- On the contrary, store ID's 4, 5, 33, 36 and 44 are all consistently within the lowest 5 stores by sales revenue. Store 33 has the lowest sales revenue for each consecutive year with its lowest sales revenue of $11.4 million in 2012. $10.9 million were from Non-Holiday sales and $569 thousand were Holiday sales.

**Impact of External Economic Factors on Sales Revenue**

<kbd><img width="100%" alt="image" src="https://github.com/user-attachments/assets/88c03b26-93e3-4633-b7c9-8e1ab9699230"></kbd>

<kbd><img width="60%" alt="image" src="https://github.com/user-attachments/assets/f2ab0a06-40bf-48d8-b820-23b475bf0fa7"></kbd>

- Referencing the correlation matrix, there is little to no correlation between external economic factors affecting walmart sales revenue.
- The chart shows fuel tends to peak between Spring - Summer. Seasonal peaks for fuel usually occur in April, May and November then troughs in January and September. We can attibtue this to the peaks found in our chart. $3.96 per litre in May, 2011 and $3.97 in April, 2012
- Temperature averages around 60°F and peaks in Summer between the months of June - August. However no adverse effect on sales revenue despite high temperature levels.
- Over the 3 years, CPI levels averages between 168.1 and 175.5. CPI peaks in the months of November - December, 168.6 in November, 2010, and 173.75 in December, 2011. Despite reaching yearly highs, it hasn't influenced consumer spending behaviors.
- Over the 3 years, unemployment averages around 8.0, with its lowest at 7.8 between October - December in 2011, and highest at 8.62 between February - March in 2010. Unemployment levels seems to decrease over time an stabilizes towards year-end. Despite this, changing unemployment levels do not affect sales revenue.

**Insights and Recommendation**
- Focus marketing efforts towards peak months, especially in the months November - December, by advertising holiday promotions 1 or 2 months prior to the actual holiday season, or having a holiday campaign collaboration with influencers for better awareness outreach.
- Establish strong brand presence on popular social media platforms such as instagram, tik tok or facebook to have better outreach to all age categories and also compliments holiday collaboration with influencers.
- Divide stocks based on store sales performance instead of equal proportions to keep up with consumer demands and bolster stocks for products with high sales conversion ratio.
- Implement aggresive marketing strategies to stores that are making below average sales revenue. One strategy is to boost visibility and awareness of the store and its promotions through social media, collaboration with influencers, or strategic banner placement. Another strategy is to host in-store events such as product launches or workshops to create a buzz and attracts potential yet curious consumers. Lastly, encourage online customers from social media to visit stores by offering exclusive in-store promotions and discounts.
