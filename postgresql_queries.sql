-- ==================================================================================
-- AMAZON PRODUCT ENGAGEMENT ANALYSIS - SQL QUERIES
-- ==================================================================================

-- 1. INITIAL INSPECTION
-- Viewing the first 20 rows of the raw data
SELECT * FROM customer LIMIT 20;

-- 2. BASIC STATISTICS
-- Counting total number of records in the table
SELECT COUNT(*) AS total_records   
FROM customer;                    

-- 3. CATEGORY ANALYSIS
-- Extracting only the main (top-level) category before the '|' symbol
SELECT
    SPLIT_PART(category, '|', 1) AS main_category
FROM customer;

-- Counting products under each main (top-level) category
SELECT
    SPLIT_PART(category, '|', 1) AS main_category,
    COUNT(*) AS product_count
FROM customer
GROUP BY main_category
ORDER BY product_count DESC;

-- 4. PERFORMANCE METRICS (RATINGS)
-- Finding average customer rating for each main category
SELECT
    SPLIT_PART(category, '|', 1) AS main_category,
    AVG(rating::NUMERIC) AS avg_rating
FROM customer
WHERE rating IS NOT NULL
GROUP BY main_category
ORDER BY avg_rating DESC;

-- Finding average number of ratings per product (Popularity) by main category
SELECT
    SPLIT_PART(category, '|', 1) AS main_category,
    AVG(rating_count::NUMERIC) AS avg_rating_count
FROM customer
WHERE rating_count IS NOT NULL
GROUP BY main_category
ORDER BY avg_rating_count DESC;

-- 5. ENGAGEMENT ANALYSIS (KEY INSIGHTS)
-- Calculate average engagement score for each main category
-- Insight: Identifies "Niche Dominance" (e.g., Musical Instruments vs Electronics)
SELECT
    SPLIT_PART(category, '|', 1) AS main_category,
    AVG(engagement_score) AS avg_engagement_score
FROM customer
WHERE engagement_score IS NOT NULL
GROUP BY main_category
ORDER BY avg_engagement_score DESC;

-- Analyze engagement based on discount levels
-- Insight: Tests the hypothesis that "Medium" discounts perform better than "Very High"
SELECT 
    discount_level,
    AVG(engagement_score) AS avg_engagement_score,
    COUNT(*) AS total_products
FROM customer
WHERE discount_level IS NOT NULL
GROUP BY discount_level
ORDER BY avg_engagement_score DESC;

-- Analyze engagement across different price ranges
SELECT
    price_range,
    AVG(rating::NUMERIC * rating_count::NUMERIC) AS avg_engagement_score
FROM customer
WHERE rating IS NOT NULL
  AND rating_count IS NOT NULL
GROUP BY price_range
ORDER BY avg_engagement_score DESC;

-- 6. STAR PERFORMERS
-- Find the top 5 "Star Products" by engagement score
-- Insight: Identifies brand power (e.g., Amazon Basics)
SELECT
    product_name,
    SPLIT_PART(category, '|', 1) AS main_category,
    discount_level,
    engagement_score
FROM customer
WHERE engagement_score IS NOT NULL
GROUP BY product_name, main_category, discount_level, engagement_score
ORDER BY engagement_score DESC
LIMIT 5;

-- 7. DASHBOARD OPTIMIZATION
-- Create a permanent "Dashboard View" for Power BI
-- This view pre-calculates the main category and cleans types for faster loading
CREATE OR REPLACE VIEW public.product_dashboard AS
SELECT
    product_id,
    product_name,
    SPLIT_PART(category, '|', 1) AS main_category,
    discounted_price,
    discount_level,
    price_range,
    rating::NUMERIC AS rating,
    rating_count::NUMERIC AS rating_count,
    engagement_score
FROM customer
WHERE rating IS NOT NULL
  AND engagement_score IS NOT NULL;