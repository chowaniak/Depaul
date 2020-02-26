/*
CSC453
Final Project
Michal Chowaniak
*/

BEGIN
INSERT INTO transactions
(transnumber,transdate,transdescr,total,status,usrid,transtypeid,accountnumber)
SELECT 900, to_date('3-Mar-2017','dd-mon-yyyy'),'test service performed',500,NULL,39,1,1004 FROM dual UNION ALL
SELECT 901, to_date('4-Mar-2017','dd-mon-yyyy'),'test service performed',600,NULL,38,2,1004 FROM dual UNION ALL
SELECT 902, to_date('5-Mar-2017','dd-mon-yyyy'),'test service performed',700,NULL,39,3,1000 FROM dual UNION ALL
SELECT 903, to_date('6-Mar-2017','dd-mon-yyyy'),'test service performed',400,NULL,15,3,1000 FROM dual UNION ALL
SELECT 904, to_date('7-Mar-2017','dd-mon-yyyy'),'test service performed',300,NULL,20,4,1007 FROM dual UNION ALL
SELECT 905, to_date('8-Mar-2017','dd-mon-yyyy'),'test service performed',200,NULL,25,5,1007 FROM dual UNION ALL
SELECT 906, to_date('9-Mar-2017','dd-mon-yyyy'),'test service performed',100,NULL,50,1,1004 FROM dual;

END;
/

SELECT * FROM userslogs;



