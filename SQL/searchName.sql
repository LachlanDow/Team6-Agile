CREATE DEFINER=`cammymcn_AglAdm`@`%` PROCEDURE `searchName`(in search varchar(50))
BEGIN
SELECT DISTINCT
    c.DRG,
    c.Average_Total_Payments,
    c.Total_Discharges,
    v.Name,
    v.Street_Address,
    v.Zipcode,
    v.HRR
FROM
    Procedures AS c,
    Provider AS v
WHERE
    v.ProviderID = c.ProviderID
        AND c.DRG IN (SELECT 
            DRG
        FROM
            Procedures
        WHERE
            DRG LIKE CONCAT('%', search, '%'))
ORDER BY c.DRG, c.Average_Total_Payments , c.Total_Discharges DESC;
END