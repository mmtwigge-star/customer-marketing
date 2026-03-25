# customer-marketing
Customer &amp; Marketing Analytics project analyzing Kaggle’s Customer Personality dataset. Segments customers by value, evaluates campaign responses, spending patterns, and channel usage to generate actionable insights and support marketing decisions.

# Customer & Marketing Analytics

## Project Overview
This project analyzes Kaggle’s **Customer Personality Analysis / Marketing Campaign** dataset to identify valuable customers, evaluate marketing campaigns, and uncover spending and channel patterns.

## What I’ve Done So Far

1. **Dataset Inspection**
   - Downloaded CSV from Kaggle.
   - Explored columns in Google Sheets.
   - Noted issues: missing `Income`, inconsistent `Education` & `Marital_Status`, messy `Dt_Customer` formats.

2. **Data Preparation**
   - Exported clean CSV from Sheets.
   - Imported data into SQLite.
   - Created table `customers` for analysis.

3. **SQL Analysis**
   - Calculated total spend per customer.
   - Segmented customers into High / Medium / Low value.
   - Combined segments with campaign responses.
   - Analyzed spending by product category.
   - Analyzed channel usage (Web / Store / Catalog).

## Next Steps
- Build Power BI dashboard with:
  - Customer segments overview
  - Campaign performance by segment
  - Spending by category
  - Channel usage
