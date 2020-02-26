/*
CSC453
Final Project
Michal Chowaniak
*/


-- procedure to insert new account

CREATE OR REPLACE PROCEDURE pnewaccount(
t_acc_number IN accounts.accountnumber%TYPE, 
t_acc_type IN accounts.accounttype%TYPE, 
t_acc_name IN accounts.accountname%TYPE, 
t_acc_description IN accounts.accountdescription%TYPE
) AS


BEGIN

IF (t_acc_type = 'asset') OR (t_acc_type ='expense') THEN
INSERT INTO accounts (accountnumber, accounttype,accountname, accountdescription, accountdebit,accountcredit)
VALUES (t_acc_number, t_acc_type, t_acc_name,  t_acc_description,1,0 ); -- account debit is 1
elsif (t_acc_type = 'income') OR (t_acc_type = 'cost of goods sold') OR (t_acc_type = 'equity') THEN
INSERT INTO accounts (accountnumber, accounttype,accountname, accountdescription, accountdebit,accountcredit)
VALUES (t_acc_number, t_acc_type, t_acc_name,  t_acc_description,0,1 ); -- acountdebit is 0
ELSE
dbms_output.put_line('Please enter correct account name');
END IF;

COMMIT;
END;
/
