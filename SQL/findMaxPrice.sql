CREATE DEFINER=`cammymcn_AglAdm`@`%` PROCEDURE `findMaxPrice`()
BEGIN
SELECT 
    MAX(Average_Total_Payments)
FROM
    Procedures;
END