-- use this code to generate historical trading data from the trading database

SELECT
--fact table attributes to return
    hist.FactID,
    hist.Date,
    hist.[Open],
    hist.High,
    hist.Low,
    hist.[Close],
    hist.AdjClose,
    hist.Volume,
--security(dim) table attributes
    sec.Company,
    sec.Symbol,
    sec.Industry,
    sec.IndexWeighting,
--exchange(dim) table attributes
    exc.Symbol AS Xchange

FROM dbo.FactPrices_Daily AS hist
-- return all the matching rows in the fact table and security table using the security id as the PK and the id(fact table) as the FK
INNER JOIN dbo.dimSecurity AS sec
ON hist.SecurityID= sec.ID
-- return all the matching rows in the fact table and exchange table using the exchange id as the PK and the id(fact table) as the FK
INNER JOIN dbo.dimExchange AS exc
ON sec.ExchangeID = exc.ID