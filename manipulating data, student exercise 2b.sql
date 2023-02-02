--student exercise 2b
SELECT

CONCAT(FirstName, ' ', LastName) AS CustomerName, -- concatenate first & last names into one column of customer name

CASE
WHEN NumberCarsOwned in (2,3) THEN '2-3' -- returns customers with more than one car but upto 3 cars
WHEN NumberCarsOwned >= 4 THEN '4+' -- returns customers with more than 4 cars
end AS NumberofCarsOwned,
EmailAddress AS Email

FROM dimCustomer

WHERE HouseOwnerFlag=1 AND NumberCarsOwned >1 -- filters for customers with house owner flag 1 and has more than one car