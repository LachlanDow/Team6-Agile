CREATE DEFINER=`cammymcn_AglAdm`@`%` PROCEDURE `searchCodeMaxPrice`(IN code varchar(3), IN price int(7))
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
            DRG LIKE CONCAT(code, '%'))
		AND c.Average_Total_Payments < price)
    JOIN Zipcodes AS z ON v.Zipcode = z.Zipcode)
ORDER BY c.Average_Total_Payments , c.Total_Discharges DESC;
END