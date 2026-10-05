ALTER TABLE Sales
ADD COLUMN CalculatedSalesAmount DECIMAL(18,2);

-- ---------------------------------------- Sales Amount ---------------------------------------
SET SQL_SAFE_UPDATES = 0;

UPDATE Sales
SET CalculatedSalesAmount =
    CAST(UnitPrice AS DECIMAL(18,2))
    * CAST(OrderQuantity AS DECIMAL(18,2))
    * (
        1 - CAST(UnitPriceDiscountPct AS DECIMAL(18,4))
      )
WHERE UnitPrice IS NOT NULL
  AND OrderQuantity IS NOT NULL;

SET SQL_SAFE_UPDATES = 1;

-- ------------------------------------- Verify --------------------------------------------------
Select * From Sales;
