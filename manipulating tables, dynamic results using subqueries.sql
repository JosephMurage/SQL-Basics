--manipulating tables, dynamic results using subqueries

SELECT

    InvoiceNumber,
    InvoiceLineNumber,
    OrderDate,
    SalesAmount,
    ProductName,
    ProductSubCategory


FROM vwOrdersALL

WHERE OrderDate = (Select MAX(OrderDate) FROM vwOrdersALL) -- dynamic INNER query to return most recent date at the time of querying, whose results are used by the outer query