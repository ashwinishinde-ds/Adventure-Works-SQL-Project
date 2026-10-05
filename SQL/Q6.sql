ALTER TABLE Sales
ADD COLUMN Profit DECIMAL(18,2);

-- ----------------------------------- Profit ------------------------------------------------
SET SQL_SAFE_UPDATES = 0;

UPDATE Sales
SET Profit =
    CAST(SalesAmount AS DECIMAL(18,2))
    - CAST(ProductionCost AS DECIMAL(18,2))
WHERE SalesAmount IS NOT NULL
  AND ProductionCost IS NOT NULL;

SET SQL_SAFE_UPDATES = 1;

-- ------------------------------- Verify -----------------------------------------------------
Select * From Sales;