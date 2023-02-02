-- multiple tables, INNER JOINs

SELECT Top(100)

CONCAT (dc.FirstName, ' ', dc.LastName) AS CustomerName,
dc.EmailAddress AS EmailAddress,
SUM(fs.SalesAmount) AS AmountSpent
--dcy.CurrencyName AS Currency is also redundant because the WHERE statement is already pulling currencyname from the factsales table
FROM FactInternetSales AS fs
    INNER JOIN DimCustomer AS dc -- returns only matching row values from the currency key [pk] column in dimcustomer & factinternetsales' customerkey column
    ON fs.CustomerKey = dc.CustomerKey
    INNER JOIN DimCurrency AS dcy -- returns only matching row values from dimcurrency[PK] column & factinternetsales' currencykey column 
    ON fs.CurrencyKey = dcy.CurrencyKey

WHERE dcy.CurrencyName = N'US Dollar'

GROUP BY dc.FirstName, dc.LastName, dc.EmailAddress --dcy.CurrencyName is now redundant since the same attribute is already executed by the WHERE statement[superior&oreferred]

--HAVING dcy.CurrencyName = N'US Dollar'

ORDER BY AmountSpent DESC