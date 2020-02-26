/*
CSC453
Final Project
Michal Chowaniak
*/



--/*
 
 DROP TABLE items; 
 DROP TABLE transactions;
 DROP TABLE accounts;
 DROP TABLE transactiontypes;
 DROP TABLE useraddresses;
 DROP TABLE usercontactdetails;
 DROP TABLE vendors;
 DROP TABLE clients; 
 DROP TABLE billingterms;
 DROP TABLE creditterms;
 DROP TABLE userslogs;
 DROP TABLE users;
 
 --*/
 
 
 

 CREATE TABLE users
(usrid NUMBER NOT NULL,
firstname VARCHAR2(20),
lastname VARCHAR2(50),
businessname VARCHAR2(50),
username VARCHAR2(30),
PASSWORD VARCHAR2(30),
taxid NUMBER(9),
CONSTRAINT userspk PRIMARY KEY (usrid)
);
 
CREATE TABLE userslogs
(logid NUMBER NOT NULL,
logtime TIMESTAMP NOT NULL,
usrid NUMBER NOT NULL,
CONSTRAINT userslogspk PRIMARY KEY (logid),
CONSTRAINT userslogsfk FOREIGN KEY (usrid) REFERENCES users (usrid)
);
 
 CREATE TABLE useraddresses 
 (useraddressid NUMERIC NOT NULL,
 streetname VARCHAR2(30),
 streetnumber VARCHAR2(10),
 aptnumber VARCHAR2(10),
 city VARCHAR2(20),
 state CHAR(2),
 zipcode CHAR(10),
 country VARCHAR2(20),
 addresstype VARCHAR2(15),
 usrid NUMBER NOT NULL,
 CONSTRAINT useraddressespk PRIMARY KEY (useraddressid),
 CONSTRAINT useraddressesfk1 FOREIGN KEY (usrid) REFERENCES users(usrid)
 );
 
 CREATE TABLE usercontactdetails
 (usercontactdetailid NUMBER NOT NULL,
 homephone VARCHAR2(15),
 workphone VARCHAR2(15),
 cellphone VARCHAR2(15),
 fax VARCHAR2(15),
 personalemail VARCHAR2(256),
 workemail VARCHAR2(256),
 webaddress VARCHAR2(256),
 usrid NUMBER NOT NULL,
 CONSTRAINT usercontactdetailspk PRIMARY KEY (usercontactdetailid),
 CONSTRAINT usercontactdetailsfk1 FOREIGN KEY (usrid) REFERENCES users(usrid)
 );
 
 
 
 
CREATE TABLE billingterms
(billingtermsid NUMBER(9) NOT NULL,
description VARCHAR2(50) NOT NULL,
CONSTRAINT billingtermspk PRIMARY KEY (billingtermsid)
);

 CREATE TABLE vendors
 (vendornumber NUMBER(9) NOT NULL,
 billingtermsid NUMBER(9) NOT NULL,
 usrid NUMBER NOT NULL,
 CONSTRAINT vendorspk PRIMARY KEY (vendornumber),
 CONSTRAINT vendorsfk2 FOREIGN KEY (billingtermsid) REFERENCES billingterms (billingtermsid),
 CONSTRAINT vendorsfk1 FOREIGN KEY (usrid) REFERENCES users (usrid)
 );

CREATE TABLE creditterms
(credittermsid NUMBER(9) NOT NULL,
description VARCHAR2(50)NOT NULL,
CONSTRAINT credittermspk PRIMARY KEY (credittermsid)
);
 
 CREATE TABLE clients
 (clientnumber NUMBER(9) NOT NULL ,
 credittermsid NUMBER(9) NOT NULL,
 usrid NUMBER NOT NULL,
 CONSTRAINT clientspk PRIMARY KEY (clientnumber),
 CONSTRAINT clientsfk2 FOREIGN KEY (credittermsid) REFERENCES creditterms (credittermsid),
 CONSTRAINT clientsfk1 FOREIGN KEY (usrid) REFERENCES users(usrid)
 ); 
 
 
 
 
 
 CREATE TABLE transactiontypes
 (transtypeid NUMBER(9) NOT NULL,
 transtype VARCHAR2(20),
 debitcreditrule VARCHAR2(50),
 CONSTRAINT transactiontypespk PRIMARY KEY (transtypeid)
 );
 
 CREATE TABLE accounts
 (accountnumber NUMBER(6) NOT NULL,
 accounttype VARCHAR2(20),
 accountname VARCHAR2(30),
 accountdescription VARCHAR2(100),
 accountdebit NUMBER,
 accountcredit NUMBER,
 CONSTRAINT accountspk PRIMARY KEY (accountnumber)
 );
 
 CREATE TABLE transactions
 (transnumber NUMBER NOT NULL,
 transdate DATE,
 transdescr VARCHAR2(256),
 total NUMBER,
 status VARCHAR2(20),
 usrid NUMBER NOT NULL,
 transtypeid NUMBER NOT NULL,
 accountnumber NUMBER(6) NOT NULL,
 CONSTRAINT transactionspk PRIMARY KEY (transnumber),
 CONSTRAINT transactionsfk1 FOREIGN KEY (usrid) REFERENCES users(usrid),
 CONSTRAINT transactionsfk2 FOREIGN KEY (transtypeid) REFERENCES transactiontypes (transtypeid),
 CONSTRAINT transactionsfk3 FOREIGN KEY (accountnumber) REFERENCES accounts (accountnumber)
 );
 
 
 CREATE TABLE items
 (itemnumber NUMBER NOT NULL,
 itemdescription VARCHAR2(100),
 itemquantity NUMBER,
 itemsaleamount NUMBER,
 itempurchaseamount NUMBER,
 transnumber NUMBER,
 accountnumber NUMBER(6) NOT NULL,
 CONSTRAINT itemspk PRIMARY KEY (itemnumber),
 CONSTRAINT itemsfk1 FOREIGN KEY (transnumber) REFERENCES transactions (transnumber),
 CONSTRAINT itemsfk2 FOREIGN KEY (accountnumber) REFERENCES accounts (accountnumber)
 );
