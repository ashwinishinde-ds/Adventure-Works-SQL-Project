-- ----------------- Monthly Sales ------------------------

SELECT
    YEAR(DateField) AS Year,
    MONTH(DateField) AS MonthNo,
    MONTHNAME(DateField) AS Month,
    SUM(CAST(SalesAmount AS DECIMAL(18,2))) AS TotalSales
FROM Sales
WHERE DateField IS NOT NULL
GROUP BY
    YEAR(DateField),
    MONTH(DateField),
    MONTHNAME(DateField)
ORDER BY
    Year,
    MonthNo;