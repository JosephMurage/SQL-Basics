--Multiple tables, Bridge Table
-- NB, marketting wants to see a list of sales reasons, along with sales amount for each
SELECT

--fs.SalesOrderNumber AS InvoiceNumber
--fs.SalesOrderLineNumber AS InvoiceLineNumber,
dsr.SalesReasonReasonType AS SalesReason,
SUM(fs.SalesAmount) AS SalesAmount

FROM FactInternetSales AS fs
   
    INNER JOIN FactInternetSalesReason AS fsr -- inner join to our bridging table using the two PKs from our fact table
    ON fs.SalesOrderNumber = fsr.SalesOrderNumber AND fs.SalesOrderLineNumber = fsr.SalesOrderLineNumber -- these are the two PKs from the factintsalestable

    -- innerjoin to the bridging table fsr.salesreasonkey as shown below
    INNER JOIN DimSalesReason AS dsr
    ON fsr.SalesReasonKey = dsr.SalesReasonKey

--WHERE fs.SalesOrderNumber = N'SO51178'

GROUP BY dsr.SalesReasonReasonType