SELECT
    TOP 5 p.TransactionDate
    , p.Price
    , p.PostCode
    , p.PAON
    , p.SAON
    , pt.PropertyTypeName
FROM
    PricePaidSW12 p
LEFT JOIN PropertyTypeLookup pt ON p.PropertyType = pt.PropertyTypeCode
WHERE
    p.Street = 'ORMELEY ROAD'
ORDER BY
    p.TransactionDate ASC;


SELECT * FROM PropertyTypeLookup