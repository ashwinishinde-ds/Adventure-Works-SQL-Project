CREATE TABLE Sales AS

SELECT *
FROM FactInternetSales

UNION ALL

SELECT *
FROM Fact_Internet_Sales_New;

-- ------------------------------ Verify ----------------------------------
select * From Sales;
