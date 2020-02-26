/*
CSC454
Final Project
Michal Chowaniak
*/

-- to add, edit,delete a new client first add to users, clients, usercontactdetails,useraddresses  

BEGIN
-- insert a new client requires inserting data into 4 tables.
-- if inserting into one table fails the rest information is not saved too, preventing data not being uniformed. 

INSERT INTO users (usrid, firstname, lastname,businessname,username, PASSWORD, taxid)
SELECT 54,'Patrick','McSaint',NULL,NULL,'password',123456789 FROM dual;
INSERT INTO clients (clientnumber,credittermsid, usrid)
SELECT 1021, 2, 54 FROM dual;
INSERT INTO usercontactdetails (usercontactdetailid,homephone,workphone,cellphone,fax,personalemail,workemail,webaddress,usrid)
SELECT 20021, NULL, 1182223333, 1182223335,NULL,'test@test.com', NULL,'test.com',54 FROM dual;
INSERT INTO useraddresses (useraddressid,streetname,streetnumber,aptnumber,city,state,zipcode,country,addresstype,usrid)
SELECT 500053,'N Test Ave',1214,NULL,'Tinytown',NULL,'50500',NULL,'client',54 FROM dual;

-- update client information accross 4 tables
UPDATE users SET firstname = 'patricsia' WHERE usrid = 54;
UPDATE clients SET credittermsid = 3 WHERE usrid = 54;
UPDATE usercontactdetails SET fax = 3332225555 WHERE usrid = 54;
UPDATE useraddresses SET aptnumber = 109 WHERE usrid = 54;



--delete client from all 4 tables
DELETE FROM clients WHERE usrid = 54;
DELETE FROM usercontactdetails WHERE usrid = 54;
DELETE FROM useraddresses WHERE usrid = 54;
DELETE FROM users WHERE usrid = 54;


COMMIT;


END;




