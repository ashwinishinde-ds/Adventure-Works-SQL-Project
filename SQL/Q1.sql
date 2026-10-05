ALTER TABLE Sales
ADD INDEX idx_sales_productkey (ProductKey(50));

SHOW INDEX FROM Sales;

-- ----------------------------------- Product Name --------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;

UPDATE Sales s
JOIN DimProduct p
    ON s.ProductKey = p.ProductKey
SET s.ProductName = p.EnglishProductName;

SET SQL_SAFE_UPDATES = 1;

-- -------------------------------------- Verify ---------------------------------------------------------------------------------------
select * From Sales;