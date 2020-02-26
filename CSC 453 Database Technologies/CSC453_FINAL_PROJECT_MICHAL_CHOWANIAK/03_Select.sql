/*
CSC453
Final Project
Michal Chowaniak
*/



--1. client and vendor user id and client and vendor number
SELECT usrid AS user_id, clientnumber AS client_or_vendor_number
FROM clients
UNION
SELECT usrid, vendornumber
FROM vendors;

--2. find userid firstname and lastname which belongs both to clients and vendors
SELECT u.usrid, u.firstname, u.lastname
FROM users u
JOIN
(SELECT usrid
FROM clients
INTERSECT
SELECT usrid
FROM vendors v) v
ON v.usrid = u.usrid;

--3. find only clients, which are not vendors
SELECT c.usrid
FROM clients  c
WHERE NOT EXISTS (
  SELECT * FROM vendors  v
  WHERE c.usrid = v.usrid)
ORDER BY usrid;

--4. clients' usrid, first name and last name, invoice total and transaction description
SELECT u.usrid, u.firstname, u.lastname, t.total, t.transdescr
FROM users u
JOIN clients c
ON u.usrid = c.usrid
JOIN transactions t
ON t.usrid = u.usrid
WHERE t.transtypeid = 1
ORDER BY t.total DESC;

--5. payments received, total, type
SELECT t.transdate, t.total, tt.transtype
FROM transactions t
JOIN transactiontypes tt
ON t.transtypeid = tt.transtypeid
WHERE t.transtypeid =3;

--6 show users who have more than 1 transactions 
SELECT usrid, count(*)
FROM transactions
GROUP BY usrid
HAVING count(*) >1;

--7 show clients who do not have any transaction
SELECT c.clientnumber, c.usrid
FROM clients c
FULL OUTER JOIN transactions t
ON c.usrid = t.usrid
WHERE t.total IS NULL;


--8 find number of clients for each credit term
SELECT cl.credittermsid, cr.description, count(cl.credittermsid) AS number_of_clients
FROM clients cl
JOIN creditterms cr
ON cl.credittermsid = cr.credittermsid
GROUP BY cl.credittermsid, cr.description
ORDER BY count(cl.credittermsid) DESC;

--9 transactions over 40 days
SELECT t.transnumber, t.transdate, t.total, u.streetnumber, u.streetname, u.city, t.transtypeid
FROM transactions t
JOIN useraddresses u
ON t.usrid = u.usrid
WHERE t.transdate < CURRENT_DATE - 40;


--10  Previous month vendors' transactions
SELECT t.transnumber,t.transdate, u.businessname, t.total, r.transtype
FROM vendors v
INNER JOIN transactions t
ON v.usrid = t.usrid
INNER JOIN users u
ON t.usrid = u.usrid
INNER JOIN transactiontypes r
ON t.transtypeid = r.transtypeid
WHERE EXTRACT(MONTH FROM(t.transdate)) = EXTRACT(MONTH FROM(CURRENT_TIMESTAMP)) - 1;



--11 avg, min, max invoice amount per user
SELECT t1.usrid, t2.transtype, avg(t1.total) AS avg_inv_amt, MIN(t1.total) AS min_inv_amt, MAX(t1.total) AS max_inv_amt
FROM transactions t1
JOIN transactiontypes t2
ON t1.transtypeid = t2.transtypeid
WHERE t1.transtypeid = 1
GROUP BY t1.usrid, t2.transtype
ORDER BY t1.usrid;


--12 transactions posted to bank account 1001
SELECT t.transnumber, t.total, t.transdate, t.transdescr, u.firstname, u.lastname
FROM transactions t
JOIN users u
ON t.usrid = u.usrid
WHERE t.accountnumber = 1001;


--13 find ending balance for bank account 1001
SELECT 
(SELECT sum(t1.total) 
FROM transactions t1
WHERE (t1.accountnumber = 1001) AND (t1.transtypeid = 3)) -
(SELECT sum(t2.total)
FROM transactions t2
WHERE (t2.accountnumber = 1001) AND (t2.transtypeid = 6))
AS bank_balance
FROM dual;


--14 transactions  older then 60 days 
SELECT t.total, t.transnumber, t.transdate
FROM transactions t
WHERE t.total < ALL (SELECT t2.total
                    FROM transactions t2
                    WHERE t2.transdate > CURRENT_DATE-60)
ORDER BY t.transdate ;


--15 exclude transaction between 40 and 30 days in past
SELECT t.total, t.transnumber, transdate
FROM transactions t
WHERE t.total !=ALL 
                    (SELECT t2.total
                    FROM transactions t2
                    WHERE t2.transdate > CURRENT_DATE -40 
                    AND t2.transdate < CURRENT_DATE -30);






