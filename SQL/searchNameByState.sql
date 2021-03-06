CREATE DEFINER=`cammymcn_AglAdm`@`%` PROCEDURE `searchNameByState`(in search varchar(50), IN state varchar(2))
BEGIN
SELECT DISTINCT
    c.DRG,
    c.Average_Total_Payments,
    c.Total_Discharges,
    v.Name,
    v.Street_Address,
    v.HRR,
    z.Lattiude,
    z.Longitude,
    v.Zipcode
FROM
    ((Procedures AS c
    JOIN Provider AS v ON v.ProviderID = c.ProviderID
        AND c.DRG IN (SELECT 
            DRG
        FROM
            Procedures
        WHERE
            DRG LIKE CONCAT('%', search, '%'))
        AND v.State IN (SELECT 
            State
        FROM
            Provider
        WHERE
            State = state))
    JOIN Zipcodes AS z ON v.Zipcode = z.Zipcode)
ORDER BY c.DRG , c.Average_Total_Payments , c.Total_Discharges DESC;
END