-- A basic query as part of SQL fundamentals course, including an OFFSET FETCH filter

SELECT
SalesOrderNumber AS InvoiceNumber,
OrderDate,
SUM(SalesAmount) AS InvoiceSubTotal,
SUM(TaxAmt) AS TaxAmount,
SUM(OrderQuantity) AS TotalQuantity

FROM FactInternetSales
WHERE SalesTerritoryKey=6

GROUP BY SalesOrderNumber, OrderDate
HAVING SUM(SalesAmount)>1000

ORDER BY InvoiceSubTotal desc

OFFSET 0 rows FETCH NEXT 10 rows ONLY