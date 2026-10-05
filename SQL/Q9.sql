-- ------------------------------- Month Wise Sales ------------------------

SELECT
    MONTH(DateField) AS MonthNo,
    MONTHNAME(DateField) AS Month,
    SUM(CAST(SalesAmount AS DECIMAL(18,2))) AS TotalSales
FROM Sales
WHERE DateField IS NOT NULL
GROUP BY
    MONTH(DateField),
    MONTHNAME(DateField)
ORDER BY MonthNo;