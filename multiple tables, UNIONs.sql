--multiple tables, UNIONs

SELECT
    -- sales and promo summary from Internet Sales
    fs.SalesOrderNumber as InvoiceNumber,
    fs.SalesOrderLineNumber AS InvoiceLineNumber,
    fs.OrderDate as OrderDate,
    fs.SalesAmount AS SalesAmount,
    fs.TaxAmt AS TaxAmt,
    fs.Freight AS FreightAmount,
    fs.OrderQuantity AS Quantity,

    dp.EnglishProductName AS ProductName,
    dpsc.EnglishProductSubcategoryName AS ProductSubCategory,
    dpc.EnglishProductCategoryName AS ProductSubCategory,

    dst.SalesTerritoryCountry AS Country,
    dst.SalesTerritoryRegion AS Region,
    /*
    dpr.EnglishPromotionName AS PromotionName,
    dpr.EnglishPromotionType AS PromotionType,
    dpr.EnglishPromotionCategory as PromotionCategory,
*/
    dcy.CurrencyName as Currency,
    'Web' AS Source
  
FROM FactInternetSales AS fs
    INNER JOIN DimProduct as dp
    ON fs.ProductKey=dp.ProductKey
    INNER JOIN DimProductSubcategory AS dpsc
    ON dp.ProductSubcategoryKey=dpsc.ProductSubcategoryKey
    INNER JOIN DimProductCategory as dpc
    ON dpsc.ProductCategoryKey=dpc.ProductCategoryKey
    INNER JOIN DimSalesTerritory AS dst
    ON fs.SalesTerritoryKey=dst.SalesTerritoryKey
    INNER JOIN DimCurrency as dcy
    ON fs.CurrencyKey=dcy.CurrencyKey

WHERE YEAR(OrderDate) IN (2012,2013)

UNION


SELECT
    --sales and promo summary from Reseller Sales
    fs.SalesOrderNumber as InvoiceNumber,
    fs.SalesOrderLineNumber AS InvoiceLineNumber,
    fs.OrderDate as OrderDate,
    fs.SalesAmount AS SalesAmount,
    fs.TaxAmt AS TaxAmt,
    fs.Freight AS FreightAmount,
    fs.OrderQuantity AS Quantity,

    dp.EnglishProductName AS ProductName,
    dpsc.EnglishProductSubcategoryName AS ProductSubCategory,
    dpc.EnglishProductCategoryName AS ProductSubCategory,

    dst.SalesTerritoryCountry AS Country,
    dst.SalesTerritoryRegion AS Region,
/*
    dpr.EnglishPromotionName AS PromotionName,
    dpr.EnglishPromotionType AS PromotionType,
    dpr.EnglishPromotionCategory as PromotionCategory,
*/
    dcy.CurrencyName as Currency,
    dr.ResellerName AS Source
  



FROM FactResellerSales AS fs
    INNER JOIN DimProduct as dp
    ON fs.ProductKey=dp.ProductKey
    INNER JOIN DimProductSubcategory AS dpsc
    ON dp.ProductSubcategoryKey=dpsc.ProductSubcategoryKey
    INNER JOIN DimProductCategory as dpc
    ON dpsc.ProductCategoryKey=dpc.ProductCategoryKey
    INNER JOIN DimSalesTerritory AS dst
    ON fs.SalesTerritoryKey=dst.SalesTerritoryKey
    INNER JOIN DimCurrency as dcy
    ON fs.CurrencyKey=dcy.CurrencyKey
    INNER JOIN DimReseller AS dr
    ON fs.ResellerKey=dr.ResellerKey

WHERE YEAR(OrderDate) IN (2012,2013)

ORDER BY OrderDate DESC