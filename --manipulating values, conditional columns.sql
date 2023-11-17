--manipulating values, conditional columns
SELECT

    FirstName,
    IF(MiddleName IS NULL, 'UNKN', MiddleName) AS MiddleName,
    ISNULL(MiddleName, 'UNKN') AS MiddleName2, -- offers cleanest code
    COALESCE (MiddleName, 'UNKN') AS MiddleName3,-- offers more functionality of code gets more complex
    LastName,
    YearlyIncome,
    EmailAddress,
    IIF (YearlyIncome >50000, 'Above Average', 'Below Average') AS IncomeCategory,

    CASE
        when NumberChildrenAtHome=0 Then '0'
        when NumberChildrenAtHome=1 then '1'
        when NumberChildrenAtHome BETWEEN 2 and 4 then '2-4'
        when NumberChildrenAtHome >=5 THEN '5+'
        else 'UKNN'
    end AS NumberChildrenCategory,
    NumberChildrenAtHome AS ActualChildren

FROM DimCustomer
--IIF and WHERE only work when we use the IIF statement instead of its alias
WHERE IIF (YearlyIncome >50000, 'Above Average', 'Below Average') = 'Above Average'
