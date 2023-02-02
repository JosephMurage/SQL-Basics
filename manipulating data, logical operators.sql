--WHERE Class does not equal'H' OR Class IS NULL
SELECT

EnglishProductName,
EnglishDescription,
Color,
[Status],
Class
FROM DimProduct
-- use () to test an OR statement before AND, breaks the order of ops protocol
WHERE (Class <> 'H' OR Class IS NULL) AND [Status] IS NOT NULL



--advanced logical OPERATORs - using IN and BETWEEN to simplify multiple conditions

--WHERE Class does not equal'H' OR Class IS NULL
SELECT

EnglishProductName,
EnglishDescription,
Color,
[Status],
SafetyStockLevel
Class
FROM DimProduct

--WHERE SafetyStockLevel BETWEEN 500 AND 1000 AND [Status] IS NOT NULL --NB BETWEEN is inclusive on both ends
--WHERE (SafetyStockLevel >= 500 AND SafetyStockLevel <=1000) AND [Status] IS NOT NULL
WHERE Color IN (N'Black',N'Silver',N'White',N'Yellow')

--advaced logical operators - LIKE to identify partial matches in wildcards

SELECT 
FirstName,
EmailAddress
FROM DimCustomer

--WHERE FirstName LIKE 'R%',-- to look for an unspecified no of xters, before "R", use '%R' and "R%" for unspecified no of xters after it
--WHERE FirstName LIKE 'R__'-- looks for any first names that are like R followed by two other xters eg. Rob
--WHERE FirstName LIKE '_R%' looks for words that start with one xter before R, followed by any no of xters thereafter. finds any first names where the 2nd letter is "R"