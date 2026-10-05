ALTER TABLE Sales
ADD COLUMN CustomerFullName VARCHAR(255),
ADD COLUMN Unit_Price DECIMAL(18,2);

ALTER TABLE Sales
ADD INDEX idx_sales_customerkey (CustomerKey(50));

-- ------------------------------------------ Customer FUll Name----------------------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;

UPDATE Sales s
JOIN DimCustomer c
    ON s.CustomerKey = c.CustomerKey
SET s.CustomerFullName = CONCAT(c.FirstName, ' ', c.LastName)
WHERE s.CustomerFullName IS NULL;

SET SQL_SAFE_UPDATES = 1;

-- -------------------------------------- Unit Price -----------------------------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;

UPDATE Sales s
JOIN DimProduct p
    ON s.ProductKey = p.ProductKey
SET s.Unit_Price = CAST(p.`Unit price` AS DECIMAL(18,2))
WHERE s.Unit_Price IS NULL;

SET SQL_SAFE_UPDATES = 1;

-- -------------------------------------- Verify ---------------------------------------------------------------------------------------
select * From Sales;