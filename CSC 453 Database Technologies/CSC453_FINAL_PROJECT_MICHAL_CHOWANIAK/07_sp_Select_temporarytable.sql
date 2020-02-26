/*
CSC453
Final Project
Michal Chowaniak
*/



--Find all the transactions for userid   


CREATE GLOBAL TEMPORARY TABLE findtranstemptable
(temptransnumber NUMBER,
temptransdate DATE,
temptransdescr VARCHAR2(256),
temptotal NUMBER)
ON COMMIT PRESERVE ROWS;


CREATE OR REPLACE 
PROCEDURE pfindtransactionsgtt (
ptempusrid IN transactions.usrid%TYPE
)AS

BEGIN

INSERT INTO findtranstemptable (temptransnumber, temptransdate, temptransdescr, temptotal)
SELECT transnumber, transdate, transdescr, total
FROM transactions
WHERE usrid = ptempusrid;

END;
/

