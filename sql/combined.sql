
-- ===============================================
-- Customer & Marketing Analytics - Analysis SQL
-- Combined queries for Power BI dashboard
-- Safe to run multiple times (drops existing views first)
-- ===============================================

-- 1️⃣ Total spend per customer
DROP VIEW IF EXISTS total_spent_per_customer;
CREATE VIEW total_spent_per_customer AS
SELECT 
    ID,
    Income,
    (MntWines + MntFruits + MntMeatProducts + 
     MntFishProducts + MntSweetProducts + MntGoldProds) AS total_spent
FROM customers;

-- 2️⃣ Customer Segmentation
DROP VIEW IF EXISTS customer_segments;
CREATE VIEW customer_segments AS
SELECT
    ID,
    (MntWines + MntFruits + MntMeatProducts + 
     MntFishProducts + MntSweetProducts + MntGoldProds) AS total_spent,
    CASE 
        WHEN (MntWines + MntFruits + MntMeatProducts + 
              MntFishProducts + MntSweetProducts + MntGoldProds) > 2000 THEN 'High'
        WHEN (MntWines + MntFruits + MntMeatProducts + 
              MntFishProducts + MntSweetProducts + MntGoldProds) > 1000 THEN 'Medium'
        ELSE 'Low'
    END AS customer_segment
FROM customers;

-- 3️⃣ Campaign Responses by Segment
DROP VIEW IF EXISTS campaign_responses_by_segment;
CREATE VIEW campaign_responses_by_segment AS
WITH total AS (
    SELECT
        ID,
        (MntWines + MntFruits + MntMeatProducts + 
         MntFishProducts + MntSweetProducts + MntGoldProds) AS total_spent,
        CASE 
            WHEN (MntWines + MntFruits + MntMeatProducts + 
                  MntFishProducts + MntSweetProducts + MntGoldProds) > 2000 THEN 'High'
            WHEN (MntWines + MntFruits + MntMeatProducts + 
                  MntFishProducts + MntSweetProducts + MntGoldProds) > 1000 THEN 'Medium'
            ELSE 'Low'
        END AS customer_segment,
        AcceptedCmp1,
        AcceptedCmp2,
        AcceptedCmp3,
        AcceptedCmp4,
        AcceptedCmp5,
        Response
    FROM customers
)
SELECT customer_segment, 'AcceptedCmp1' AS campaign, SUM(AcceptedCmp1) AS responses
FROM total
GROUP BY customer_segment
UNION ALL
SELECT customer_segment, 'AcceptedCmp2', SUM(AcceptedCmp2)
FROM total
GROUP BY customer_segment
UNION ALL
SELECT customer_segment, 'AcceptedCmp3', SUM(AcceptedCmp3)
FROM total
GROUP BY customer_segment
UNION ALL
SELECT customer_segment, 'AcceptedCmp4', SUM(AcceptedCmp4)
FROM total
GROUP BY customer_segment
UNION ALL
SELECT customer_segment, 'AcceptedCmp5', SUM(AcceptedCmp5)
FROM total
GROUP BY customer_segment
UNION ALL
SELECT customer_segment, 'Response', SUM(Response)
FROM total
GROUP BY customer_segment
ORDER BY customer_segment, campaign;

-- 4️⃣ Average Spending by Product Category per Segment
DROP VIEW IF EXISTS avg_spending_by_category;
CREATE VIEW avg_spending_by_category AS
SELECT 
    customer_segment,
    ROUND(AVG(MntWines),2) AS avg_wines,
    ROUND(AVG(MntFruits),2) AS avg_fruits,
    ROUND(AVG(MntMeatProducts),2) AS avg_meat,
    ROUND(AVG(MntFishProducts),2) AS avg_fish,
    ROUND(AVG(MntSweetProducts),2) AS avg_sweets,
    ROUND(AVG(MntGoldProds),2) AS avg_gold
FROM (
    SELECT
        *,
        CASE 
            WHEN (MntWines + MntFruits + MntMeatProducts + 
                  MntFishProducts + MntSweetProducts + MntGoldProds) > 2000 THEN 'High'
            WHEN (MntWines + MntFruits + MntMeatProducts + 
                  MntFishProducts + MntSweetProducts + MntGoldProds) > 1000 THEN 'Medium'
            ELSE 'Low'
        END AS customer_segment
    FROM customers
)
GROUP BY customer_segment;

-- 5️⃣ Channel Usage by Segment
DROP VIEW IF EXISTS channel_usage_by_segment;
CREATE VIEW channel_usage_by_segment AS
SELECT
    customer_segment,
    SUM(NumWebPurchases) AS web_purchases,
    SUM(NumCatalogPurchases) AS catalog_purchases,
    SUM(NumStorePurchases) AS store_purchases
FROM (
    SELECT
        *,
        CASE 
            WHEN (MntWines + MntFruits + MntMeatProducts + 
                  MntFishProducts + MntSweetProducts + MntGoldProds) > 2000 THEN 'High'
            WHEN (MntWines + MntFruits + MntMeatProducts + 
                  MntFishProducts + MntSweetProducts + MntGoldProds) > 1000 THEN 'Medium'
            ELSE 'Low'
        END AS customer_segment
    FROM customers
)
GROUP BY customer_segment;
