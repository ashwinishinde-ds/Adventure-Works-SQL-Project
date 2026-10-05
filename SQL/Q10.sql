-- ---------------------------------- Quarter Wise Sales ----------------------------

SELECT
    QUARTER(DateField) AS Quarter,
    SUM(CAST(SalesAmount AS DECIMAL(18,2))) AS TotalSales
FROM Sales
WHERE DateField IS NOT NULL
GROUP BY QUARTER(DateField)
ORDER BY Quarter;