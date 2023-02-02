-- manipulating data, percent of total

SELECT
    Source AS Reseller,
    SUM(SalesAmount) AS Sales,
    SUM(SalesAmount)/(SELECT SUM(SalesAmount) FROM vwOrdersALL WHERE Country= N'United States' AND Source <> N'web') AS PctOfTotal

FROM vwOrdersALL

WHERE Country= N'United States' AND Source <> N'web'

GROUP BY Source

ORDER BY Sales DESC