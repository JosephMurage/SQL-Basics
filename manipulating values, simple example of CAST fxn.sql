/* simple example of CAST fxn
SELECT

SalesAmount,
CAST(SalesAmount AS int) AS SalesAmountCast,
OrderDate,
CAST(OrderDate AS Date) AS OrderDateCast
*/
SELECT

EnglishProductName,
ReorderPoint,
SafetyStockLevel,
--ReorderPoint / SafetyStockLevel AS PercentOfTotalSafetyStock -- returns 0 because the reorderpoint and safetystocklevel are integers (smallint) therefore need to be recasted as decimal values
CAST(ReorderPoint AS decimal(8,4)) / CAST(SafetyStockLevel AS decimal (8,4)) AS PercentOfTotalSafetyStock
FROM DimProduct
WHERE [Status] = 'current'
