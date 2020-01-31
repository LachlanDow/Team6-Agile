CREATE DEFINER=`cammymcn_AglAdm`@`%` PROCEDURE `searchCodeByStateInPriceRange`(IN code varchar(3), IN state varchar(2), IN low int(7), IN high int(7))
BEGIN
SELECT DISTINCT
    c.DRG,
    c.Average_Total_Payments,
    c.Total_Discharges,
    v.Name,
    v.Street_Address,
    v.HRR,
    z.Lattiude,
    z.Longitude
FROM
    ((Procedures AS c
    JOIN Provider AS v ON v.ProviderID = c.ProviderID
        AND v.State IN (SELECT 
            State
        FROM
            Provider
        WHERE
            State = state)
        AND c.DRG IN (SELECT 
            DRG
        FROM
            Procedures
        WHERE
            DRG LIKE CONCAT(code, '%'))
        AND c.Average_Total_Payments BETWEEN low AND high)
    JOIN Zipcodes AS z ON v.Zipcode = z.Zipcode)
ORDER BY c.Average_Total_Payments , c.Total_Discharges DESC;
END