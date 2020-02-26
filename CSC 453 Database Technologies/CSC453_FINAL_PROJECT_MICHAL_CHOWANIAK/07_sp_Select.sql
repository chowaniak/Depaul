/*
CSC453
Final Project
Michal Chowaniak
*/



--Find all the transactions for userid   



CREATE OR REPLACE 
PROCEDURE pfindtransactions (
ptempusrid IN transactions.usrid%TYPE,
precords out sys_refcursor
)AS

BEGIN

OPEN precords FOR
SELECT transnumber, transdate, CAST (transdescr AS VARCHAR(20)), total
FROM transactions
WHERE usrid = ptempusrid
ORDER BY usrid;


END;
/

