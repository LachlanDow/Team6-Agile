CREATE DEFINER=`cammymcn_AglAdm`@`%` PROCEDURE `findLatLong`(IN zip int(11))
BEGIN
SELECT * FROM Zipcodes
WHERE Zipcode=zip;
END