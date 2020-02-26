/*
CSC453
Final Project
Michal Chowaniak
*/


-- update a transaction total based on transaction number
CREATE OR REPLACE PROCEDURE updatetranstotal (
temptransnumb IN transactions.transnumber%TYPE,
temptranstotal IN transactions.total%TYPE
)AS

BEGIN
IF (temptransnumb >= 0) THEN
UPDATE transactions SET total = temptranstotal WHERE transnumber = temptransnumb;

ELSE
dbms_output.put_line('invalid transaction, update failed ');

END IF;

END;
/

