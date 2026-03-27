# customer-marketing
Customer &amp; Marketing Analytics project analyzing Kaggle’s Customer Personality dataset. Segments customers by value, evaluates campaign responses, spending patterns, and channel usage to generate actionable insights and support marketing decisions.

# Customer & Marketing Analytics Project

## Project Overview
This project analyzes customer behavior and marketing campaign performance to identify the most valuable customers and which campaigns drive the best response. The goal is to provide actionable insights for business decision-making.

## Data
- **Dataset:** Marketing Campaign / Customer Personality Analysis (Kaggle)
- **Contents:** Customer demographics, spending by category, campaign responses, and purchase channels
- **Data Cleaning:** 
  - Income column: invalid/empty entries converted to NULL
  - Rows with NULL income were retained; numeric conversions applied
  - Spending columns ensured no NULLs (COALESCE to 0)

## SQL Analysis
- **Tables / Views created:**
  - `total_spent_per_customer` → total spend across all product categories
  - `customer_segments` → High / Medium / Low value segmentation
  - `campaign_responses_by_segment` → responses by segment per campaign
  - `avg_spending_by_category` → average spending per category per segment
  - `channel_usage_by_segment` → web/store/catalog purchase patterns

- **Insights from SQL:**
  - High-value customers spend most on AcceptedCmp5
  - Medium and Low-value customers respond more to the latest campaign (`Response`)
  - Web channel dominates for high-value customers, catalog for medium, store for low

## Power BI Dashboard
**Overview / KPIs:**
- Total Customers
- Total Revenue
- Average Customer Value
- Top Segment per Campaign (KPI card)

**Visuals:**
1. **Customer Segments:** High / Medium / Low value
2. **Campaign Performance:** Responses by campaign, segmented by High/Medium/Low
3. **Spending by Category:** Visualizing which products drive revenue
4. **Channel Usage:** Comparing web vs store vs catalog

**Key Insights:**
- Overall, the latest campaign (`Response`) drives the highest total responses
- Segment-level differences show High-value customers responded most to AcceptedCmp5
- Low and Medium segments respond more to the latest campaign, suggesting targeted campaigns by segment can improve ROI
- Spending patterns differ by segment, highlighting opportunities for tailored marketing
- Channel usage varies by segment, guiding distribution strategy

## Project Structure



# Customer & Marketing Analytics Project
## Project Overview

This project analyses customer behaviour and marketing campaign effectiveness to identify high-value segments, optimise campaigns, and understand purchasing patterns. The aim is to combine SQL analysis with a Power BI dashboard to deliver actionable business insights.

## Data

**Dataset:** Customer Personality Analysis / Marketing Campaign Dataset – Kaggle

**Contents:**

- Customer demographics (age, income, marital status, education)
- Spending by product category (wine, meat, fish, sweets, gold, fruit)
- Marketing campaign responses (AcceptedCmp1–5, Response)
- Purchase channels (Web, Store, Catalog)

## Initial observations:

- Education and marital status contain inconsistent labels
- Income column has blanks and a wide range
- Dt_Customer dates appear in different formats
- Data Preparation & SQL Analysis

## Steps Taken:

- CSV Import
- Examined dataset in Google Sheets for missing or inconsistent values.
- SQLite Setup
- Imported the cleaned CSV into SQLite
- Created tables and handled empty/null values
- SQL Queries
- Total spend per customer:
CREATE VIEW total_spent_per_customer AS
SELECT
    ID,
    Income,
    (MntWines + MntFruits + MntMeatProducts +
     MntFishProducts + MntSweetProducts + MntGoldProds) AS total_spent
FROM customers;

Queries were also created for:
- Campaign responses by segment
- Average spending by product category per segment
- Channel usage by segment

These views supplied the metrics used in Power BI.

## Power BI Dashboard

**Layout & Visuals:**

Top Row: 4 KPI cards
Total Customers
Total Revenue
Total Campaign Responses
Top Responding Segment
Middle Row: Campaign Responses
Chart: Stacked Bar
Purpose: Show which campaigns work best for each segment
Bottom Row (3 visuals):
Customer Value – Average spend by segment (Bar Chart)
Spending by Product Category – 100% Stacked Column Chart
Highlights relative preferences per segment
Channel Usage – 100% Stacked Column Chart
Percentages of Web, Store, and Catalog purchases per segment

**Design Improvements:**

Consistent colours for segments: High (Dark Blue), Medium (Light Blue), Low (Green)
Minimal additional colours to avoid clutter
Clear, descriptive titles
Data labels and axes cleaned for readability
🧠 Key Insights
1. Campaign Performance
Top campaigns overall: Response and Cmp5
Segment-specific performance:
High → Cmp5 slightly ahead of Response
Medium → Response, Cmp5, Cmp1
Low → Response, Cmp3, Cmp4
Worst performer: Cmp2
Implication: Segment-specific targeting is crucial to maximise ROI.
2. Customer Value
High → £2,200 average spend
Medium → £1,400 average spend
Low → £300 average spend
Implication: Retention and upselling should focus on High-value customers; Medium segment can be nurtured; Low segment is low-revenue but may respond to volume-based promotions.
3. Product Category Spending
Wine is the largest category for all segments, followed by Meat
Low segment has higher relative proportions of Gold, Fruit, Fish, and Sweets but overall volume is tiny
Implication: Segment-specific promotions: Wine and Meat for High/Medium; small, varied offers for Low.
4. Channel Usage
High → Web 26%, Store 43%, Catalog 30%
Medium → Web 18%, Store 42%, Catalog 30%
Low → Web 36%, Store 48%, Catalog 15%
Implication:
Multi-channel campaigns are effective for High and Medium customers
Store campaigns work best for Low; Catalog underperforms
Overall, Store campaigns perform strongly across all segments
5. Overall Recommendations
Develop segment-specific campaigns to maximise engagement.
Focus retention and upselling on High-value customers.
Tailor product promotions according to segment preferences.
Optimise marketing channels: multi-channel for High/Medium, Store-focused for Low.
