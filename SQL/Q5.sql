ALTER TABLE Sales
ADD COLUMN ProductionCost DECIMAL(18,2);

-- ------------------------------------ Production Cost ------------------------------------------
SET SQL_SAFE_UPDATES = 0;

UPDATE Sales
SET ProductionCost =
    CAST(TRIM(ProductStandardCost) AS DECIMAL(18,4))
    *
    CAST(TRIM(OrderQuantity) AS DECIMAL(18,4))
WHERE TRIM(ProductStandardCost) <> ''
  AND TRIM(OrderQuantity) <> '';

SET SQL_SAFE_UPDATES = 1;

-- ----------------------------------- Verify --------------------------------------------
Select * From Sales;