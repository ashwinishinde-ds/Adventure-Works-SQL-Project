-- ------------------------ Year Wise Sales -------------------------------------

SELECT
    YEAR(DateField) AS Year,
    SUM(CAST(SalesAmount AS DECIMAL(18,2))) AS TotalSales
FROM Sales
WHERE DateField IS NOT NULL
GROUP BY YEAR(DateField)
ORDER BY Year;