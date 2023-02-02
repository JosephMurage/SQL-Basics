--student exercise 2a
SELECT

SalesOrderNumber AS InvoiceNumber,
SalesOrderLineNumber AS InvoicelineNumber,
SalesAmount AS SalesAmount,
TaxAmt AS TaxAmount

FROM FactInternetSales

WHERE DATENAME(MONTH,OrderDate) = N'December' AND SalesTerritoryKey = 1