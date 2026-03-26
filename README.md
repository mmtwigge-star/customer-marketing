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
