CREATE DEFINER=`cammymcn_AglAdm`@`%` PROCEDURE `searchCode`(IN code varchar(3))
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
        AND c.DRG IN (SELECT 
            DRG
        FROM
            Procedures
        WHERE
            DRG LIKE CONCAT(code, '%')))
    JOIN Zipcodes AS z ON v.Zipcode = z.Zipcode)
ORDER BY c.Average_Total_Payments , c.Total_Discharges DESC;
END