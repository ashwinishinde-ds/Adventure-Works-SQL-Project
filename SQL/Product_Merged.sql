CREATE TABLE Product_Merged AS

SELECT
    p.*,
    ps.EnglishProductSubcategoryName AS SubCategoryName,
    pc.EnglishProductCategoryName AS CategoryName

FROM `DimProduct` p

LEFT JOIN `DimProductSubCategory` ps
    ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey

LEFT JOIN `DimProductCategory` pc
    ON ps.ProductCategoryKey = pc.ProductCategoryKey;
    
-- ------------------------------- Verify ---------------------------------------------
select * From Product_Merged;