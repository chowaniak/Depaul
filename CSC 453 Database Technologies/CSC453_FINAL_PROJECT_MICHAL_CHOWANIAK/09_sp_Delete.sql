/*
CSC453
Final Project
Michal Chowaniak
*/



-- delete all user's information and transactions based on user id 


CREATE OR REPLACE PROCEDURE pdelalluserinfo (
tempusrid IN users.usrid%TYPE) AS

transcount NUMBER := 0;
clientcount NUMBER := 0;
vendorcount NUMBER := 0;
detailscount NUMBER := 0;
addresscount NUMBER := 0;
logcount NUMBER := 0;
usercount NUMBER := 0;
BEGIN

-- delete transactions
SELECT count(usrid)
INTO transcount
FROM transactions
WHERE usrid = tempusrid;

IF transcount <= 0 THEN
dbms_output.put_line('No transactions deleted for user id: ' || tempusrid);
ELSE
DELETE FROM transactions WHERE usrid = tempusrid;
dbms_output.put_line('Number of  transactions deleted for user id: ' || tempusrid || ' is ' || transcount);
END IF;


-- delete clients if exists
SELECT count(usrid)
INTO clientcount
FROM clients
WHERE usrid = tempusrid;

IF clientcount <=0 THEN
dbms_output.put_line('No client exists for this user id ' || tempusrid);
ELSE
DELETE FROM clients WHERE usrid = tempusrid;
dbms_output.put_line('Number of  records deleted from client table for user id: ' || tempusrid || ' is ' || clientcount);
END IF;


--delete vendors if exists
SELECT count(usrid)
INTO vendorcount
FROM vendors
WHERE usrid = tempusrid;

IF vendorcount <=0 THEN
dbms_output.put_line('No vendors deleted for user id: ' || tempusrid);
ELSE
DELETE FROM vendors WHERE usrid = tempusrid;
dbms_output.put_line('Number of  records deleted from vendor table for user id: ' || tempusrid || ' is ' || vendorcount);
END IF;

--delete contact details if exists
SELECT count(usrid)
INTO detailscount
FROM usercontactdetails
WHERE usrid = tempusrid;

IF detailscount <=0 THEN
dbms_output.put_line('No contact details deleted for user id: ' || tempusrid);
ELSE
DELETE FROM usercontactdetails WHERE usrid = tempusrid;
dbms_output.put_line('Number of  records deleted from usercontactdetails table for user id: ' || tempusrid || ' is ' || detailscount);
END IF;



-- delete addresses if exists
SELECT count(usrid)
INTO addresscount
FROM useraddresses
WHERE usrid = tempusrid;

IF addresscount <=0 THEN
dbms_output.put_line('No addresses deleted for user id: ' || tempusrid);
ELSE
DELETE FROM useraddresses WHERE usrid = tempusrid;
dbms_output.put_line('Number of  records deleted from useraddresses table for user id: ' || tempusrid || ' is ' || addresscount);
END IF;



-- delete logs if exists
SELECT count(usrid)
INTO logcount
FROM userslogs
WHERE usrid = tempusrid;

IF logcount <=0 THEN
dbms_output.put_line('No logs deleted for user id: ' || tempusrid);
ELSE
DELETE FROM userslogs WHERE usrid = tempusrid;
dbms_output.put_line('Number of  records deleted from userslogs table for user id: ' || tempusrid || ' is ' || logcount);
END IF;



-- delete user if exists
SELECT count(usrid)
INTO usercount
FROM users
WHERE usrid = tempusrid;

IF usercount <=0 THEN
dbms_output.put_line('No users deleted for user id: ' || tempusrid);
ELSE
DELETE FROM users WHERE usrid = tempusrid;
dbms_output.put_line('Number of  records deleted from users table for user id: ' || tempusrid || ' is ' || usercount);
END IF;


END;
/





