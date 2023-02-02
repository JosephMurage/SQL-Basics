SELECT

da.AccountDescription AS AccountDescription,
SUM(ff.Amount) as Amount,
SUM(ff.Amount) / (
            SELECT
        SUM(ff.Amount) as Amount


        FROM FactFinance AS ff
            INNER JOIN DimAccount as da
            ON ff.AccountKey = da.AccountKey
            INNER JOIN DimScenario AS ds
            ON ff.ScenarioKey = ds.ScenarioKey
            INNER JOIN DimOrganization as do
            ON ff.OrganizationKey = do.OrganizationKey
            INNER JOIN DimDate AS dd
            ON ff.DateKey=dd.DateKey

        WHERE ds.ScenarioName=N'Actual'
            AND do.OrganizationName= N'Canadian Division'
            AND dd.CalendarYear=2013
            AND da.AccountType= N'Expenditures'
    ) AS PctOfTotal


FROM FactFinance AS ff
    INNER JOIN DimAccount as da
    ON ff.AccountKey = da.AccountKey
    INNER JOIN DimScenario AS ds
    ON ff.ScenarioKey = ds.ScenarioKey
    INNER JOIN DimOrganization as do
    ON ff.OrganizationKey = do.OrganizationKey
    INNER JOIN DimDate AS dd
    ON ff.DateKey=dd.DateKey

WHERE ds.ScenarioName=N'Actual'
    AND do.OrganizationName= N'Canadian Division'
    AND dd.CalendarYear=2013
    AND da.AccountType= N'Expenditures'

GROUP BY AccountDescription
ORDER BY Amount DESC