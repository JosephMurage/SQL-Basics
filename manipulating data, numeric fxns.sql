-- A basic representation of numeric fxns to manipulate data

SELECT top(10) percent

SalesOrderNumber AS InvoiceNumber,
OrderDate,
SUM(SalesAmount) AS InvoiceSubTotal,
ROUND(SUM(SalesAmount),1) AS InvoiceSubTotalRounded,

SUM(TaxAmt) AS TaxAmount,
FLOOR(SUM(TaxAmt)) AS TaxAmount,
SUM(OrderQuantity) AS TotalQuantity,
SUM(SalesAmount) + SUM(TaxAmt) AS InvoiceTotal

FROM FactInternetSales
WHERE SalesTerritoryKey=6

GROUP BY SalesOrderNumber, OrderDate
HAVING SUM(SalesAmount)>1000
ORDER BY InvoiceSubTotal desc