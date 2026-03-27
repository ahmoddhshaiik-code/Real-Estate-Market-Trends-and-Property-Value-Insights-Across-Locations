create database real_es;
use real_es;

-- =====================================================
-- REAL ESTATE MARKET ANALYSIS SQL QUERIES
-- =====================================================

-- 1. What is the total number of properties in the dataset?
SELECT COUNT(*) AS total_properties
FROM real_estate;


-- 2. What is the average sale price of all properties?
SELECT AVG(sale_price) AS average_sale_price
FROM real_estate;

-- 3. Which zoning type has the highest average sale price?
SELECT ms_zoning, AVG(sale_price) AS avg_sale_price
FROM real_estate
GROUP BY ms_zoning
ORDER BY avg_sale_price DESC;

-- 4. How many properties exist in each zoning category?
SELECT ms_zoning, COUNT(*) AS total_properties
FROM real_estate
GROUP BY ms_zoning
ORDER BY total_properties DESC;

-- 5. Which building type has the highest average property value?
SELECT bldg_type, AVG(sale_price) AS avg_sale_price
FROM real_estate
GROUP BY bldg_type
ORDER BY avg_sale_price DESC;

-- 6. How does lot configuration influence average sale price?
SELECT lot_config, AVG(sale_price) AS avg_sale_price
FROM real_estate
GROUP BY lot_config
ORDER BY avg_sale_price DESC;

-- 7. What is average sale price by overall condition?
SELECT overall_cond, AVG(sale_price) AS avg_sale_price
FROM real_estate
GROUP BY overall_cond
ORDER BY overall_cond;

-- 8. Which exterior material has the highest average sale price?
SELECT exterior_1st, AVG(sale_price) AS avg_sale_price
FROM real_estate
GROUP BY exterior_1st
ORDER BY avg_sale_price DESC
LIMIT 7;

-- 9. What is the average basement area by zoning type?
SELECT ms_zoning, AVG(total_bsmt_sf) AS avg_basement_area
FROM real_estate
GROUP BY ms_zoning
ORDER BY avg_basement_area DESC;

-- 10. Which construction years have the highest average sale prices?
SELECT year_built, AVG(sale_price) AS avg_sale_price
FROM real_estate
GROUP BY year_built
ORDER BY avg_sale_price DESC
LIMIT 5;

-- 11. Compare renovated years and average property value
SELECT year_remod_add, AVG(sale_price) AS avg_sale_price
FROM real_estate
GROUP BY year_remod_add
ORDER BY avg_sale_price DESC
LIMIT 5;

-- 12. Top 10 highest priced properties
SELECT id, sale_price, lot_area, total_bsmt_sf, year_built
FROM real_estate
ORDER BY sale_price DESC
LIMIT 10;

-- 13. Top 10 largest lot area properties
SELECT id, lot_area, sale_price
FROM real_estate
ORDER BY lot_area DESC
LIMIT 10;

-- 14. Top 10 largest basement properties
SELECT id, total_bsmt_sf, sale_price
FROM real_estate
ORDER BY total_bsmt_sf DESC
LIMIT 10;

-- 15. Which zoning type contains most expensive individual property?
SELECT ms_zoning, MAX(sale_price) AS highest_sale_price
FROM real_estate
GROUP BY ms_zoning
ORDER BY highest_sale_price DESC;

-- 16. Which building condition occurs most frequently?
SELECT overall_cond, COUNT(*) AS frequency
FROM real_estate
GROUP BY overall_cond
ORDER BY frequency DESC;

-- 17. Properties built after 2000 and their average price
SELECT AVG(sale_price) AS avg_modern_property_price
FROM real_estate
WHERE year_built > 2000;

-- 18. Properties built before 1980 and their average price
SELECT AVG(sale_price) AS avg_old_property_price
FROM real_estate
WHERE year_built < 1980;

-- 19. Count properties by exterior material
SELECT exterior_1st, COUNT(*) AS total_properties
FROM real_estate
GROUP BY exterior_1st
ORDER BY total_properties DESC
LIMIT 5;

-- 20. Find properties with both large lot and high price
SELECT id, lot_area, sale_price
FROM real_estate
WHERE lot_area > 10000
ORDER BY sale_price DESC
LIMIT 10;