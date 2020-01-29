CREATE DEFINER=`cammymcn_AglAdm`@`%` PROCEDURE `searchNameMaxPrice`(IN search varchar(50), IN price int(7))
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
		AND c.Average_Total_Payments < price
ORDER BY c.DRG, c.Average_Total_Payments , c.Total_Discharges DESC;
END