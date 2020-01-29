CREATE DEFINER=`cammymcn_AglAdm`@`%` PROCEDURE `searchCodeByLocation`(IN code varchar(3), IN state varchar(2))
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
            DRG LIKE CONCAT(code, '%'))
		AND v.State IN (SELECT State FROM Provider WHERE State = state)
ORDER BY c.Average_Total_Payments , c.Total_Discharges DESC;
END