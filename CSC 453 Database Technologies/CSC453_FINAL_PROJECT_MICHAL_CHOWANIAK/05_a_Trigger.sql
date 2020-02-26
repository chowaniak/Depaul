/*
CSC453
Final Project
Michal Chowaniak
*/


--step1. auto-increment logid in userslogs table
CREATE SEQUENCE seq_id START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER  triggerlogid
BEFORE INSERT ON userslogs
FOR EACH ROW 
BEGIN
SELECT seq_id.nextval INTO :NEW.logid FROM dual;
END;
/

--step2. 
--when transactions table is changed usrid and current time is inserted to userslogs table
CREATE OR REPLACE TRIGGER logusers
AFTER INSERT OR UPDATE ON transactions
FOR EACH ROW

DECLARE
tempuserid NUMBER :=0;

BEGIN

SELECT usrid
INTO tempuserid
FROM users
WHERE usrid = :NEW.usrid;

INSERT INTO userslogs (logtime, usrid)
VALUES ((SELECT LOCALTIMESTAMP FROM dual), tempuserid);

END;
/

