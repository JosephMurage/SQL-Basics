CREATE VIEW vsGLTrans
--this view contains the info required to create financial statements
AS

SELECT

    --FactGLTran attributes
    gl.FactGLTranID,
    gl.GLTranAmount,
    gl.JournalID,
    gl.GLTranDescription,
    gl.GLTranDate,

    --GL Accounts
    acc.AlternateKey as 'GlAcctNum',
    acc.GLAcctName,
    acc.[Statement],
    acc.Category,
    acc.Subcategory,

    -- Store Account details
    sto.AlternateKey AS 'StoreNum',
    sto.StoreName,
    sto.ManagerID,
    sto.PreviousManagerID,
    sto.ContactTel,
    sto.AddressLine1,
    sto.AddressLine2,
    sto.ZipCode,

    -- Regiion attributes/details
    reg.AlternateKey as 'RegionNum',
    reg.RegionName,
    reg.SalesRegionName,

    --last Refresh date
    CONVERT(datetime2, GETDATE() at time ZONE 'UTC' AT time ZONE 'Central Standard Time') AS 'LastRefreshDate'





FROM FactGLTran AS gl
    INNER JOIN dimGLAcct AS acc ON gl.GLAcctID=acc.GLAcctID
    INNER JOIN dimStore AS sto ON gl.StoreID=sto.StoreID
    INNER JOIN dimRegion AS reg ON sto.RegionID=reg.RegionID

GO