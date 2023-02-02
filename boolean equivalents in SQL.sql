--returns products that are flagged as finished goods only. this =1 is the equivalent of TRUE in boolean fxns

SELECT*
FROM dbo.DimProduct
WHERE FinishedGoodsFlag = 1