--manipulating tables, CUBE & ROllUP functions

SELECT

    Region,
    ProductCategory,
    ProductSubCategory,
    SUM(SalesAmount) AS SalesAmount

FROM vwOrdersALL

WHERE YEAR(OrderDate) = 2013
AND Currency = N'US Dollar'
-- cube functions returns subtotals and grand total rows
-- rollup serves the same purpose but is more efficient for hierachical data
--GROUP BY CUBE(Region, ProductCategory, ProductSubCategory)
GROUP BY ROllUP (Region, ProductCategory, ProductSubCategory)
