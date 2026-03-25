
-- 01_total_spent.sql
-- Calculate total spend per customer
SELECT 
    ID,
    Income,
    (MntWines + MntFruits + MntMeatProducts + 
     MntFishProducts + MntSweetProducts + MntGoldProds) AS total_spent
FROM customers;


-- 02_customer_segments.sql
-- Segment customers into High / Medium / Low based on total spend
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
FROM customers
ORDER BY total_spent DESC;


-- 03_campaign_responses.sql
-- Combine segments with campaign responses
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


-- 04_spending_by_category.sql
-- Average spend per product category for each customer segment
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


-- 05_channel_analysis.sql
-- Total purchases per channel for each customer segment
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
