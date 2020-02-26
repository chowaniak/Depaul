/*
CSC453
Final Project
Michal Chowaniak
*/


-- procedure to insert new account
EXECUTE pnewaccount (1014,'expense','advertising','avertising expenses');


-- SELECT: procedure to find all transactions for particular user
var precords refcursor;
EXECUTE pfindtransactions (21, :precords);
print precords;

-- SELECT with temporary tables: procedure to find all transactions for particular user 
EXECUTE pfindtransactionsgtt (36);
SELECT * FROM findtranstemptable;




-- update a transaction total based on transaction number
EXECUTE updatetranstotal (16,1500);


-- delete all user's information and transactions based on user id 
EXECUTE pdelalluserinfo (20);


