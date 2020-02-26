/*
CSC453
Final Project
Michal Chowaniak
*/



INSERT INTO users
(usrid, firstname, lastname, businessname, username, PASSWORD, taxid)
SELECT 1, 'John','Doe',NULL,'jdoe','password1',123456789 FROM dual UNION ALL
SELECT 2, 'Mike','Jordan','abc company','mjordan','password2',123456781 FROM dual UNION ALL
SELECT 3, 'Tom','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 4, 'Bob','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 5, 'Anna','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 6, 'Maria','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 7, 'Ann','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 8, 'Gabi','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 9, 'Dan','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 10, 'Rob','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 11, 'Mike','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 12, 'Micheal','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 13, 'Greg','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 14, 'aimee','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 15, 'Jacob','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 16, 'Shawn','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 17, 'Daniel','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 18, 'Ryan','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 19, 'James','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 20, 'David','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 21, 'Jack','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 22, 'Jordan','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 23, 'Kevin','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 24, 'Luke','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 25, 'Brandon','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 26, 'Harry','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 27, 'Kyle','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 28, 'Sebastian','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 29, 'tyler','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 30, 'Brian','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 31, 'Logan','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 32, 'Spencer','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 33, 'Max','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 34, 'Ali','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 35, 'Adam','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 36, 'Ted','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 37, 'Chris','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 38, 'Bella','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 39, 'Naomi','Doe',NULL,NULL,'password',123456789 FROM dual UNION ALL
SELECT 40,'Hanna','Doe',NULL,NULL,'password',123456781 FROM dual UNION ALL
SELECT 41,'Barbara','Doe',NULL,NULL,'password',123456781 FROM dual UNION ALL
SELECT 42,'Anna','Doe',NULL,NULL,'password',123456781 FROM dual UNION ALL
SELECT 43,'Brian','Doe',NULL,NULL,'password',123456781 FROM dual UNION ALL
SELECT 44,'Steven','Doe',NULL,NULL,'password',123456781 FROM dual UNION ALL
SELECT 45,'Greg','Doe',NULL,NULL,'password',123456781 FROM dual UNION ALL
SELECT 46,'Marcin','Doe',NULL,NULL,'password',123456781 FROM dual UNION ALL
SELECT 47,'Adam','Doe',NULL,NULL,'password',123456781 FROM dual UNION ALL
SELECT 48,'Chris','Doe',NULL,NULL,'password',123456781 FROM dual UNION ALL
SELECT 49,'Brandon','Doe',NULL,NULL,'password',123456781 FROM dual UNION ALL
SELECT 50,'Mary','Doe',NULL,NULL,'password',123456781 FROM dual UNION ALL
SELECT 51,'Tara','Doe',NULL,NULL,'password',123456781 FROM dual UNION ALL
SELECT 52,'Zoe','Doe',NULL,NULL,'password',123456781 FROM dual UNION ALL  
SELECT 53,'Fun','Doe',NULL,NULL,'password',123456781 FROM dual; 


--insert into userslogs
--(logtime, usrid)
--select TO_TIMESTAMP('10-FEB-1714:10:10.123000','DD-MON-RRHH24:MI:SS.FF'), 1  from dual union all
--select TO_TIMESTAMP('11-FEB-1714:10:11.123000','DD-MON-RRHH24:MI:SS.FF'), 1  from dual union all
--select TO_TIMESTAMP('12-FEB-1714:10:12.123000','DD-MON-RRHH24:MI:SS.FF'), 1  from dual union all
--select TO_TIMESTAMP('13-FEB-1714:10:13.123000','DD-MON-RRHH24:MI:SS.FF'), 1  from dual union all
--select TO_TIMESTAMP('14-FEB-1714:10:14.123000','DD-MON-RRHH24:MI:SS.FF'), 1  from dual union all
--select TO_TIMESTAMP('15-FEB-1714:10:15.123000','DD-MON-RRHH24:MI:SS.FF'), 1  from dual union all
--select TO_TIMESTAMP('16-FEB-1714:10:16.123000','DD-MON-RRHH24:MI:SS.FF'), 1  from dual union all
--select TO_TIMESTAMP('17-FEB-1714:10:17.123000','DD-MON-RRHH24:MI:SS.FF'), 1  from dual union all
--select TO_TIMESTAMP('18-FEB-1714:10:18.123000','DD-MON-RRHH24:MI:SS.FF'), 1  from dual;


INSERT INTO creditterms
(credittermsid, description)
SELECT 1, 'check on receipt' FROM dual UNION ALL
SELECT 2, 'credit cart on receipts' FROM dual UNION ALL
SELECT 3, 'credit card before order' FROM dual UNION ALL
SELECT 4, 'cc preauthorization' FROM dual UNION ALL
SELECT 5, '50% on order, 25% before shipmnt, 25% on del.' FROM dual UNION ALL
SELECT 6, 'check' FROM dual UNION ALL
SELECT 7, 'cash' FROM dual UNION ALL
SELECT 8, 'money order on receipt' FROM dual UNION ALL
SELECT 9, '*credit card before shippment*' FROM dual UNION ALL
SELECT 10, 'full payment before shipment' FROM dual;




INSERT INTO clients
(clientnumber,credittermsid,usrid)
SELECT 1000, 1,40 FROM dual UNION ALL
SELECT 1001, 1,39 FROM dual UNION ALL
SELECT 1002, 1,38 FROM dual UNION ALL
SELECT 1003, 1,37 FROM dual UNION ALL
SELECT 1004, 2,36 FROM dual UNION ALL
SELECT 1005, 2,35 FROM dual UNION ALL
SELECT 1006, 4,34 FROM dual UNION ALL
SELECT 1007, 10,33 FROM dual UNION ALL
SELECT 1008, 9,32 FROM dual UNION ALL
SELECT 1009, 9,31 FROM dual UNION ALL
SELECT 1010, 4,30 FROM dual UNION ALL
SELECT 1011, 8,29 FROM dual UNION ALL
SELECT 1012, 6,28 FROM dual UNION ALL
SELECT 1013, 4,27 FROM dual UNION ALL
SELECT 1014, 3,26 FROM dual UNION ALL
SELECT 1020, 2,25 FROM dual;



INSERT INTO billingterms
(billingtermsid, description)
SELECT 1 , 'net 10' FROM dual UNION ALL
SELECT 2 , 'net 20' FROM dual UNION ALL
SELECT 3 , 'net 30' FROM dual UNION ALL
SELECT 4 , 'net 40' FROM dual UNION ALL
SELECT 5 , 'on receipt' FROM dual UNION ALL
SELECT 6 , '2/10 net 5' FROM dual UNION ALL
SELECT 7 , '5/5 net 5' FROM dual UNION ALL
SELECT 8 , 'net 0' FROM dual;

INSERT INTO vendors
(vendornumber,billingtermsid,usrid)
SELECT 5000, 1, 25 FROM dual UNION ALL
SELECT 5001, 2, 23 FROM dual UNION ALL
SELECT 5002, 3, 22 FROM dual UNION ALL
SELECT 5003, 4, 21 FROM dual UNION ALL
SELECT 5004, 5, 20 FROM dual UNION ALL
SELECT 5005, 6, 19 FROM dual UNION ALL
SELECT 5006, 7, 18 FROM dual UNION ALL
SELECT 5007, 6, 17 FROM dual UNION ALL
SELECT 5008, 6, 16 FROM dual UNION ALL
SELECT 5009, 6, 15 FROM dual UNION ALL
SELECT 5010, 8, 14 FROM dual UNION ALL
SELECT 5011, 8, 13 FROM dual UNION ALL
SELECT 5012, 8, 12 FROM dual UNION ALL
SELECT 5013, 8, 11 FROM dual UNION ALL
SELECT 5014, 8, 10 FROM dual UNION ALL
SELECT 5015, 8, 9 FROM dual;



INSERT INTO usercontactdetails
(usercontactdetailid,homephone,workphone,cellphone,fax,personalemail,workemail,webaddress,usrid)
SELECT 20000, NULL, 1112223333, 1112223333,NULL,'test@test.com', NULL,'test.com',1 FROM dual UNION ALL
SELECT 20001, NULL, 1112223333, 1112223332,NULL,'test@test.com', NULL,NULL,2 FROM dual UNION ALL
SELECT 20002, NULL, 1112223333, 1112223331,NULL,'test@test.com', NULL,NULL,3 FROM dual UNION ALL
SELECT 20003, NULL, 1112223333, 1112223334,NULL,'test@test.com', NULL,'aaa.com',4 FROM dual UNION ALL
SELECT 20004, NULL, 1112223333, 1112223335,NULL,'test@test.com', NULL,'bbb.com',5 FROM dual UNION ALL
SELECT 20005, NULL, 1112223333, 1112223336,NULL,'test@test.com', NULL,NULL,6 FROM dual UNION ALL
SELECT 20006, NULL, 1112223333, 1112223337,NULL,'test@test.com', NULL,NULL,7 FROM dual UNION ALL
SELECT 20007, NULL, 1112223333, 1112223338,NULL,'test@test.com', NULL,NULL,8 FROM dual UNION ALL
SELECT 20008, NULL, 1112223333, 1112223339,NULL,'test@test.com', NULL,NULL,9 FROM dual UNION ALL
SELECT 20009, NULL, 1112223333, 1112223310,NULL,'test@test.com', NULL,NULL,10 FROM dual UNION ALL
SELECT 20010, NULL, NULL, 1112223311,NULL,'test@gmail.com', NULL,NULL,11 FROM dual UNION ALL
SELECT 20011, NULL, NULL, 1112223312,NULL,'test@gmail.com', NULL,NULL,12 FROM dual UNION ALL
SELECT 20012, NULL, NULL, 1112223313,NULL,'test@gmail.com', NULL,NULL,13 FROM dual UNION ALL
SELECT 20013, NULL, NULL, 1112223314,NULL,'test@gmail.com', NULL,NULL,14 FROM dual UNION ALL
SELECT 20014, NULL, NULL, 1112223315,NULL,'test@gmail.com', NULL,NULL,15 FROM dual UNION ALL
SELECT 20015, NULL, NULL, 1112223316,NULL,'test@gmail.com', NULL,NULL,16 FROM dual UNION ALL
SELECT 20016, NULL, NULL, 1112223317,NULL,'test@gmail.com', NULL,NULL,17 FROM dual UNION ALL
SELECT 20017, NULL, NULL, 1112223318,NULL,'test@gmail.com', NULL,NULL,18 FROM dual UNION ALL
SELECT 20018, NULL, NULL, 1112223319,NULL,'test@gmail.com', NULL,NULL,19 FROM dual UNION ALL
SELECT 20019, NULL, NULL, 1112223320,NULL,'test@gmail.com', NULL,NULL,20 FROM dual UNION ALL
SELECT 20020, NULL, NULL, 1112223311,NULL,'test@gmail.com', NULL,NULL,21 FROM dual;



INSERT INTO useraddresses
(useraddressid,streetname,streetnumber,aptnumber,city,state,zipcode,country,addresstype,usrid)
SELECT 500001,'Test Ave',1111,NULL,'Freetown',NULL,'10000',NULL,'vendor',9 FROM dual UNION ALL
SELECT 500002,'Test Ave',1112,NULL,'Freetown',NULL,'10000',NULL,'vendor',10 FROM dual UNION ALL
SELECT 500003,'Test Ave',1113,NULL,'Freetown',NULL,'10000',NULL,'vendor',11 FROM dual UNION ALL
SELECT 500004,'Test Ave',1114,NULL,'Freetown',NULL,'10000',NULL,'vendor',12 FROM dual UNION ALL
SELECT 500005,'Test Ave',1115,NULL,'Freetown',NULL,'10000',NULL,'vendor',13 FROM dual UNION ALL
SELECT 500006,'Test Ave',1116,NULL,'Freetown',NULL,'10001',NULL,'vendor',14 FROM dual UNION ALL
SELECT 500007,'Test Ave',1117,NULL,'Freetown',NULL,'10002',NULL,'vendor',15 FROM dual UNION ALL
SELECT 500008,'Test Ave',1118,NULL,'Freetown',NULL,'10003',NULL,'vendor',16 FROM dual UNION ALL
SELECT 500009,'Test Ave',1119,NULL,'Freetown',NULL,'10000',NULL,'vendor',17 FROM dual UNION ALL
SELECT 500010,'Test Ave',1110,NULL,'Freetown',NULL,'10000',NULL,'vendor',18 FROM dual UNION ALL
SELECT 500011,'Test Ave',1121,NULL,'Freetown',NULL,'10000',NULL,'vendor',19 FROM dual UNION ALL
SELECT 500012,'Test Ave',1122,NULL,'Freetown',NULL,'10400',NULL,'vendor',20 FROM dual UNION ALL
SELECT 500013,'Test Ave',1123,NULL,'Freetown',NULL,'10000',NULL,'vendor',21 FROM dual UNION ALL
SELECT 500014,'Test Ave',1124,NULL,'Freetown',NULL,'10500',NULL,'vendor',22 FROM dual UNION ALL
SELECT 500015,'Test Ave',1125,NULL,'Freetown',NULL,'10000',NULL,'vendor',23 FROM dual UNION ALL
SELECT 500016,'Test Ave',1126,NULL,'Freetown',NULL,'10700',NULL,'vendor',24 FROM dual UNION ALL
SELECT 500017,'Best Ave',1127,NULL,'Feetown',NULL,'20001',NULL,'client',25 FROM dual UNION ALL
SELECT 500018,'Best Ave',1128,NULL,'Footown',NULL,'20002',NULL,'client',26 FROM dual UNION ALL
SELECT 500019,'Best Ave',1129,NULL,'Footown',NULL,'20003',NULL,'client',27 FROM dual UNION ALL
SELECT 500020,'Best Ave',1130,NULL,'Footown',NULL,'20004',NULL,'client',28 FROM dual UNION ALL
SELECT 500021,'Best Ave',1131,NULL,'Footown',NULL,'20005',NULL,'client',29 FROM dual UNION ALL
SELECT 500022,'Best Ave',1132,NULL,'Feetown',NULL,'20006',NULL,'client',30 FROM dual UNION ALL
SELECT 500023,'Best Ave',1133,NULL,'Feetown',NULL,'20007',NULL,'client',31 FROM dual UNION ALL
SELECT 500024,'Best Ave',1134,NULL,'Feetown',NULL,'20000',NULL,'client',32 FROM dual UNION ALL
SELECT 500025,'Best Ave',1135,NULL,'Feetown',NULL,'20000',NULL,'client',33 FROM dual UNION ALL
SELECT 500026,'Best Ave',1136,NULL,'Feetown',NULL,'20000',NULL,'client',34 FROM dual UNION ALL
SELECT 500027,'Best Ave',1137,NULL,'Feetown',NULL,'20000',NULL,'client',35 FROM dual UNION ALL
SELECT 500028,'Best Ave',1138,NULL,'Feetown',NULL,'20000',NULL,'client',36 FROM dual UNION ALL
SELECT 500029,'Best Ave',1139,NULL,'Fourtown',NULL,'20000',NULL,'client',37 FROM dual UNION ALL
SELECT 500030,'Best Ave',1140,NULL,'Fourtown',NULL,'20000',NULL,'client',38 FROM dual UNION ALL
SELECT 500031,'Best Ave',1141,NULL,'Feetown',NULL,'20000',NULL,'client',39 FROM dual UNION ALL
SELECT 500032,'Best Ave',1142,NULL,'Feetown',NULL,'20000',NULL,'client',40 FROM dual UNION ALL
SELECT 500033,'Best Ave',1142,NULL,'Feetown',NULL,'20000',NULL,'client',41 FROM dual UNION ALL
SELECT 500034,'Best Ave',1144,NULL,'Feetown',NULL,'20000',NULL,'client',42 FROM dual UNION ALL
SELECT 500035,'Best Ave',1145,NULL,'Feetown',NULL,'20000',NULL,'client',43 FROM dual UNION ALL
SELECT 500036,'Best Ave',1146,NULL,'Feetown',NULL,'20000',NULL,'client',44 FROM dual UNION ALL
SELECT 500037,'Best Ave',1147,NULL,'Feetown',NULL,'20000',NULL,'client',45 FROM dual UNION ALL
SELECT 500038,'Best Ave',1148,NULL,'Feetown',NULL,'20000',NULL,'client',46 FROM dual UNION ALL
SELECT 500039,'Best Ave',1149,NULL,'Feetown',NULL,'20000',NULL,'client',47 FROM dual UNION ALL
SELECT 500040,'Best Ave',1150,NULL,'Feetown',NULL,'20000',NULL,'client',48 FROM dual UNION ALL
SELECT 500041,'Best Ave',1151,NULL,'Feetown',NULL,'20000',NULL,'client',49 FROM dual UNION ALL
SELECT 500042,'Best Ave',1152,NULL,'Feeheights',NULL,'20000',NULL,'client',50 FROM dual UNION ALL
SELECT 500043,'Best Ave',1153,NULL,'Feeheights',NULL,'20000',NULL,'client',51 FROM dual UNION ALL
SELECT 500044,'Best Ave',1154,NULL,'Feeheights',NULL,'20000',NULL,'client',52 FROM dual UNION ALL
SELECT 500045,'Best Ave',1155,NULL,'Feeheights',NULL,'20000',NULL,'client',53 FROM dual UNION ALL
SELECT 500046,'Best Ave',1156,NULL,'Feeheights',NULL,'20000',NULL,'client',37 FROM dual UNION ALL
SELECT 500047,'Best Ave',1157,NULL,'Feeheights',NULL,'20000',NULL,'client',48 FROM dual UNION ALL
SELECT 500048,'Best Ave',1158,NULL,'Feeton',NULL,'20000',NULL,'client',50 FROM dual UNION ALL
SELECT 500049,'Best Ave',1158,NULL,'Feeton',NULL,'20000',NULL,'client',10 FROM dual UNION ALL
SELECT 500050,'Best Ave',1160,NULL,'Feeton',NULL,'20000',NULL,'client',20 FROM dual UNION ALL
SELECT 500051,'Best Ave',1161,NULL,'Feeton',NULL,'20000',NULL,'client',30 FROM dual UNION ALL
SELECT 500052,'Best Ave',1162,NULL,'Feeton',NULL,'20000',NULL,'client',40 FROM dual;











INSERT INTO transactiontypes
(transtypeid,transtype,debitcreditrule)
SELECT 1,'client invoice',NULL FROM dual UNION ALL
SELECT 2,'sales receipt',NULL FROM dual UNION ALL
SELECT 3,'payment received',NULL FROM dual UNION ALL
SELECT 4,'vendor invoice',NULL FROM dual UNION ALL
SELECT 5,'credit memo',NULL FROM dual UNION ALL
SELECT 6,'payment issued',NULL FROM dual UNION ALL
SELECT 7,'debit memo',NULL FROM dual;

INSERT INTO accounts
(accountnumber,accounttype,accountname,accountdescription,accountdebit,accountcredit)
SELECT 1000, 'asset', 'cash','petty cash',1,0 FROM dual UNION ALL
SELECT 1001, 'asset', 'bank','checking',1,0 FROM dual UNION ALL
SELECT 1002, 'asset', 'bank','savings',1,0 FROM dual UNION ALL
SELECT 1003, 'asset', 'fixed asset','truck',1,0 FROM dual UNION ALL
SELECT 1004, 'income', 'service','service',1,0 FROM dual UNION ALL
SELECT 1005, 'cost of goods sold', 'Cost of Goods sold', 'Cost of Goods sold',1,0 FROM dual UNION ALL
SELECT 1006, 'equity', 'capital','capital in',1,0 FROM dual UNION ALL
SELECT 1007, 'expense', 'telefone','telefone desc',1,0 FROM dual UNION ALL
SELECT 1008, 'expense', 'insurance','insurance desc',1,0 FROM dual UNION ALL
SELECT 1009, 'expense', 'fuel','fuel desc',1,0 FROM dual UNION ALL
SELECT 1010, 'liability','accounts payable','accounts payable',0,1 FROM dual;


INSERT INTO transactions
(transnumber,transdate,transdescr,total,status,usrid,transtypeid,accountnumber)
SELECT 1, to_date('01-Jan-2017','dd-mon-yyyy'),'service performed',1000,NULL,40,1,1004 FROM dual UNION ALL
SELECT 2, to_date('01-Jan-2017','dd-mon-yyyy'),'service performed',500,NULL,39,1,1004 FROM dual UNION ALL
SELECT 3, to_date('05-Jan-2017','dd-mon-yyyy'),'service performed',300,NULL,38,1,1004 FROM dual UNION ALL
SELECT 4, to_date('10-Jan-2017','dd-mon-yyyy'),'service performed',100,NULL,37,1,1004 FROM dual UNION ALL
SELECT 5, to_date('15-Jan-2017','dd-mon-yyyy'),'service performed',1500,NULL,36,1,1004 FROM dual UNION ALL
SELECT 6, to_date('01-Feb-2017','dd-mon-yyyy'),'payment received',1000,NULL,40,3,1001 FROM dual UNION ALL
SELECT 7, to_date('01-Feb-2017','dd-mon-yyyy'),'payment received',500,NULL,39,3,1001 FROM dual UNION ALL
SELECT 8, to_date('01-Feb-2017','dd-mon-yyyy'),'payment received',300,NULL,38,3,1001 FROM dual UNION ALL
SELECT 9, to_date('01-Feb-2017','dd-mon-yyyy'),'payment received',100,NULL,37,3,1001 FROM dual UNION ALL
SELECT 10, to_date('02-Feb-2017','dd-mon-yyyy'),'payment received',1500,NULL,36,3,1001 FROM dual UNION ALL
SELECT 11, to_date('03-Feb-2017','dd-mon-yyyy'),'vendor invoice',100,NULL,24,4,1007 FROM dual UNION ALL
SELECT 12, to_date('04-Feb-2017','dd-mon-yyyy'),'vendor invoice',150,NULL,23,4,1007 FROM dual UNION ALL
SELECT 13, to_date('05-Feb-2017','dd-mon-yyyy'),'vendor invoice',155,NULL,22,4,1008 FROM dual UNION ALL
SELECT 14, to_date('06-Feb-2017','dd-mon-yyyy'),'vendor invoice',300,NULL,21,4,1009 FROM dual UNION ALL
SELECT 15, to_date('07-Feb-2017','dd-mon-yyyy'),'vendor invoice',500,NULL,20,4,1007 FROM dual UNION ALL
SELECT 16, to_date('01-Jan-2017','dd-mon-yyyy'),'service performed',1,NULL,40,1,1004 FROM dual UNION ALL
SELECT 17, to_date('01-Jan-2017','dd-mon-yyyy'),'service performed',5,NULL,39,1,1004 FROM dual UNION ALL
SELECT 18, to_date('05-Jan-2017','dd-mon-yyyy'),'service performed',3,NULL,38,1,1004 FROM dual UNION ALL
SELECT 19, to_date('10-Jan-2017','dd-mon-yyyy'),'service performed',1,NULL,37,1,1004 FROM dual UNION ALL
SELECT 20, to_date('15-Jan-2017','dd-mon-yyyy'),'service performed',15,NULL,36,1,1004 FROM dual UNION ALL
SELECT 21, to_date('01-Feb-2017','dd-mon-yyyy'),'payment received',10,NULL,40,3,1001 FROM dual UNION ALL
SELECT 22, to_date('01-Feb-2017','dd-mon-yyyy'),'payment received',50,NULL,39,3,1001 FROM dual UNION ALL
SELECT 23, to_date('01-Feb-2017','dd-mon-yyyy'),'payment received',30,NULL,38,3,1001 FROM dual UNION ALL
SELECT 24, to_date('01-Feb-2017','dd-mon-yyyy'),'payment received',10,NULL,37,3,1001 FROM dual UNION ALL
SELECT 25, to_date('02-Feb-2017','dd-mon-yyyy'),'payment received',15,NULL,36,3,1001 FROM dual UNION ALL
SELECT 26, to_date('03-Feb-2017','dd-mon-yyyy'),'vendor invoice',10,NULL,24,4,1001 FROM dual UNION ALL
SELECT 27, to_date('04-Feb-2017','dd-mon-yyyy'),'vendor invoice',15,NULL,23,4,1007 FROM dual UNION ALL
SELECT 28, to_date('05-Feb-2017','dd-mon-yyyy'),'vendor invoice',15,NULL,22,4,1008 FROM dual UNION ALL
SELECT 29, to_date('06-Feb-2017','dd-mon-yyyy'),'vendor invoice',30,NULL,21,4,1009 FROM dual UNION ALL
SELECT 30, to_date('07-Feb-2017','dd-mon-yyyy'),'vendor invoice',50,NULL,20,4,1007 FROM dual UNION ALL
SELECT 31, to_date('08-Feb-2017','dd-mon-yyyy'),'payment issued',50,NULL,20,6,1001 FROM dual UNION ALL
SELECT 32, to_date('08-Feb-2017','dd-mon-yyyy'),'payment issued',500,NULL,20,6,1001 FROM dual;


INSERT INTO items
(itemnumber,itemdescription,itemquantity,itemsaleamount,itempurchaseamount,transnumber,accountnumber)
SELECT 1,'kitchen remodeling per sq ft',1,300,NULL,1,1004 FROM dual UNION ALL
SELECT 2,'bath remodeling per sq ft',1,350,NULL,1,1004 FROM dual UNION ALL
SELECT 3,'roof installation per sq ft',1,500,NULL,1,1004 FROM dual UNION ALL
SELECT 4,'tile installation per sq ft',1,200,NULL,1,1004 FROM dual UNION ALL
SELECT 5,'sink and faucet',1,50,NULL,1,1004 FROM dual UNION ALL
SELECT 6,'shower door instalation per sq ft',1,300,NULL,1,1004 FROM dual UNION ALL
SELECT 7,'cabinets inst per sq ft',1,1000,NULL,1,1004 FROM dual UNION ALL
SELECT 8,'hardwood floor installation per sq ft',1,10,NULL,1,1004 FROM dual UNION ALL
SELECT 9,'painting per hour',1,100,NULL,1,1004 FROM dual UNION ALL
SELECT 10,'window instllation per hour',1,100,NULL,1,1004 FROM dual UNION ALL
SELECT 11,'front door per',1,300,NULL,1,1004 FROM dual UNION ALL
SELECT 12,'gutters instllation per ln ft',1,100,NULL,1,1004 FROM dual UNION ALL
SELECT 13,'siding installation per sq ft',1,15,NULL,1,1004 FROM dual UNION ALL
SELECT 14,'new garage  per sq ft',1,100,NULL,1,1004 FROM dual UNION ALL
SELECT 15,'garage door inst per sq ft',1,25,NULL,1,1004 FROM dual UNION ALL
SELECT 16,'concrete driveway per sq ft',1,300,NULL,1,1004 FROM dual;



