--multiple tables RIGHT JOIN

SELECT

dp.EnglishProductName AS ProductName,
dp.Color AS ProductColor,
ISNULL(dp.Size, 'UNKN') AS ProductSize,
ISNULL(SUM(fs.SalesAmount), 0) AS SalesAmount


FROM FactInternetSales AS fs
    RIGHT JOIN DimProduct AS dp
    ON fs.ProductKey = dp.ProductKey

WHERE dp.Status = N'Current'

GROUP BY dp.EnglishProductName, dp.Color, dp.Size

ORDER BY SalesAmount DESC

/*SELECT tests for number of current products to ensure the above INNER JOIN code is giving us what we need. NB inner join only returns rows that match in both tables
    EnglishProductName

FROM DimProduct

WHERE [Status] = N'Current'*/