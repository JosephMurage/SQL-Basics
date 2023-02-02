--return the collation properties of this database instance
-- SQL_Latin1_General_CP1 tells us that our database supports English & German xters as well as xters used by most western countries
-- _CI_AS tells us that our database is case insensitive
SELECT CONVERT(varchar(256), SERVERPROPERTY('collation'))

SELECT*

FROM DimProduct
--the text 'silver' or 'Silver' below is used to show that the data is case insensitive
WHERE Color='Silver'

-- AS is Accent sensitive as below
SELECT FrenchDescription

FROM DimProduct
WHERE FrenchDescription='Acier chromé.'

SELECT FrenchDescription

FROM DimProduct
WHERE FrenchDescription='Acier chrome.'