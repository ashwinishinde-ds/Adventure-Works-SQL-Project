ALTER TABLE Sales
ADD COLUMN DateField DATE;

-- ------------------------------------------ Date Field ------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;

UPDATE Sales
SET DateField = STR_TO_DATE(OrderDateKey, '%Y%m%d')
WHERE OrderDateKey IS NOT NULL
  AND OrderDateKey <> '';

SET SQL_SAFE_UPDATES = 1;

-- ---------------------------------------- Add Required Fields ---------------------------------------------------------
ALTER TABLE Sales
ADD COLUMN Year INT,
ADD COLUMN Monthno INT,
ADD COLUMN Monthfullname VARCHAR(20),
ADD COLUMN Quarter VARCHAR(2),
ADD COLUMN YearMonth VARCHAR(10),
ADD COLUMN Weekdayno INT,
ADD COLUMN Weekdayname VARCHAR(20),
ADD COLUMN FinancialMonth INT,
ADD COLUMN FinancialQuarter VARCHAR(2);

-- -------------------------------------- Calculate All Fields ----------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;

UPDATE Sales
SET
    Year = YEAR(DateField),

    Monthno = MONTH(DateField),

    Monthfullname = MONTHNAME(DateField),

    Quarter = CONCAT('Q', QUARTER(DateField)),

    YearMonth = DATE_FORMAT(DateField, '%Y-%b'),

    Weekdayno = WEEKDAY(DateField) + 1,

    Weekdayname = DAYNAME(DateField),

    FinancialMonth =
        CASE
            WHEN MONTH(DateField) >= 4
                THEN MONTH(DateField) - 3
            ELSE MONTH(DateField) + 9
        END,

    FinancialQuarter =
        CASE
            WHEN MONTH(DateField) BETWEEN 4 AND 6 THEN 'Q1'
            WHEN MONTH(DateField) BETWEEN 7 AND 9 THEN 'Q2'
            WHEN MONTH(DateField) BETWEEN 10 AND 12 THEN 'Q3'
            ELSE 'Q4'
        END
WHERE DateField IS NOT NULL;

SET SQL_SAFE_UPDATES = 1;

-- ---------------------------- Verify -------------------------------
select * From Sales;