# 1)Which region has the highest sales?
SELECT 
    Region,
    SUM(Units_Sold) AS Total_Units_Sold
FROM supply_chain_data
GROUP BY Region
ORDER BY Total_Units_Sold DESC;

# 2)Which warehouse holds the most inventory?
SELECT 
    Warehouse_ID,
    SUM(Inventory_Level) AS Total_Inventory
FROM supply_chain_data
GROUP BY Warehouse_ID
ORDER BY Total_Inventory DESC;

# 3)Which SKUs are at or below their reorder point?
SELECT
    SKU_ID,
    COUNT(*) AS Low_Inventory_Records
FROM supply_chain_data
WHERE Inventory_Level <= Reorder_Point
GROUP BY SKU_ID
ORDER BY Low_Inventory_Records DESC;

# 4)Which suppliers have the longest lead times?
SELECT
    Supplier_ID,
    AVG(Supplier_Lead_Time_Days) AS Avg_Lead_Time_Days
FROM supply_chain_data
GROUP BY Supplier_ID
ORDER BY Avg_Lead_Time_Days DESC;

# 5)Which SKUs generate the highest revenue?
SELECT
    SKU_ID,
    SUM(Units_Sold * Unit_Price) AS Total_Revenue
FROM supply_chain_data
GROUP BY SKU_ID
ORDER BY Total_Revenue DESC
LIMIT 10;

# 6)Find the records with the highest inventory?
SELECT
    SKU_ID,
    Warehouse_ID,
    Inventory_Level,
    Reorder_Point
FROM supply_chain_data
ORDER BY Inventory_Level DESC
LIMIT 10;

# 7)Classify inventory risk.
SELECT
    SKU_ID,
    Warehouse_ID,
    Inventory_Level,
    Reorder_Point,
    CASE
        WHEN Inventory_Level <= Reorder_Point THEN 'High Risk'
        ELSE 'Normal'
    END AS Inventory_Status
FROM supply_chain_data
limit 20;

# 8)Which SKUs have total sales higher than the average SKU sales?
SELECT
    SKU_ID,
    SUM(Units_Sold) AS Total_Sales
FROM supply_chain_data
GROUP BY SKU_ID
HAVING SUM(Units_Sold) > (
    SELECT AVG(Total_Sales)
    FROM (
        SELECT SUM(Units_Sold) AS Total_Sales
        FROM supply_chain_data
        GROUP BY SKU_ID
    ) AS sku_sales
)
ORDER BY Total_Sales DESC;

# 9)Which warehouses hold more inventory than the average warehouse?
SELECT
    Warehouse_ID,
    SUM(Inventory_Level) AS Total_Inventory
FROM supply_chain_data
GROUP BY Warehouse_ID
HAVING SUM(Inventory_Level) > (
    SELECT AVG(Total_Inventory)
    FROM (
        SELECT SUM(Inventory_Level) AS Total_Inventory
        FROM supply_chain_data
        GROUP BY Warehouse_ID
    ) AS warehouse_inventory
)
ORDER BY Total_Inventory DESC;

# 10)Which 10 SKUs have the highest inventory value?
WITH sku_inventory AS (
    SELECT
        SKU_ID,
        SUM(Inventory_Level * Unit_Cost) AS Inventory_Value
    FROM supply_chain_data
    GROUP BY SKU_ID
)
SELECT
    SKU_ID,
    Inventory_Value
FROM sku_inventory
ORDER BY Inventory_Value DESC
LIMIT 10;

# 11)Which warehouses have the highest percentage of records at or below the reorder point?
WITH warehouse_risk AS (
    SELECT
        Warehouse_ID,
        AVG(
            CASE
                WHEN Inventory_Level <= Reorder_Point THEN 1
                ELSE 0
            END
        ) * 100 AS Risk_Percentage
    FROM supply_chain_data
    GROUP BY Warehouse_ID
)
SELECT
    Warehouse_ID,
    ROUND(Risk_Percentage, 2) AS Risk_Percentage
FROM warehouse_risk
ORDER BY Risk_Percentage DESC;

# 12)What is the revenue rank of each SKU within its region?
SELECT
    Region,
    SKU_ID,
    SUM(Units_Sold * Unit_Price) AS Revenue,
    RANK() OVER (
        PARTITION BY Region
        ORDER BY SUM(Units_Sold * Unit_Price) DESC
    ) AS Revenue_Rank
FROM supply_chain_data
GROUP BY Region, SKU_ID
ORDER BY Region, Revenue_Rank;

# 13)What percentage of each region's revenue comes from each SKU?
SELECT
    Region,
    SKU_ID,
    SUM(Units_Sold * Unit_Price) AS Revenue,
    ROUND(
        SUM(Units_Sold * Unit_Price) * 100.0
        / SUM(SUM(Units_Sold * Unit_Price)) OVER (PARTITION BY Region),
        2
    ) AS Regional_Revenue_Percentage
FROM supply_chain_data
GROUP BY Region, SKU_ID
ORDER BY Region, Regional_Revenue_Percentage DESC;

# 14)How do average sales differ between promoted and non-promoted records in each region?
SELECT
    Region,
    AVG(CASE WHEN Promotion_Flag = 1 THEN Units_Sold END) AS Avg_Promoted_Sales,
    AVG(CASE WHEN Promotion_Flag = 0 THEN Units_Sold END) AS Avg_Non_Promoted_Sales
FROM supply_chain_data
GROUP BY Region;