-- where INNER join does not work

SELECT

dp.EnglishProductName AS ProductName,
dp.Color AS ProductColor,
dp.Size AS ProductSize,
SUM(fs.SalesAmount) AS SalesAmount




FROM FactInternetSales AS fs
    INNER JOIN DimProduct AS dp
    ON fs.ProductKey = dp.ProductKey

WHERE dp.Status = N'Current'

GROUP BY dp.EnglishProductName, Color, Size

ORDER BY SalesAmount DESC

/*SELECT tests for number of current products to ensure the above INNER JOIN code is giving us what we need. NB inner join only returns rows that match in both tables
    EnglishProductName

FROM DimProduct

WHERE [Status] = N'Current'*/