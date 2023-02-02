SELECT
GETDATE() AS DateTimeStamp,

DueDate,
ShipDate,

DATEDIFF(DAY,ShipDate, DueDate) AS DaysBetweenShipDateandDueDate,

DATEDIFF(HOUR,ShipDate, DueDate) AS HoursBetweenShipDateandDueDate,

DATEADD(DAY,10, DueDate) AS DueDatePlusTenDays

FROM FactInternetSales