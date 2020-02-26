/*
CSC453
Final Project
Michal Chowaniak
*/



-- update state for vendors with city= Freetown
DECLARE

CURSOR curaddress
IS

  SELECT u.usrid, u.firstname, u.lastname, v.vendornumber, A.streetname, A.streetnumber ,A.city
  FROM users u
  JOIN vendors v
  ON u.usrid = v.usrid
  JOIN useraddresses A
  ON v.usrid = A.usrid
  FOR UPDATE;
  
  
addressrow curaddress%rowtype;


BEGIN

  OPEN curaddress;
  
  loop
    fetch curaddress INTO addressrow;
    IF addressrow.city = 'Freetown' THEN
    UPDATE useraddresses SET useraddresses.state = 'IL' WHERE useraddresses.usrid = addressrow.usrid; 
    ELSE
    UPDATE useraddresses SET useraddresses.state = 'MN' WHERE useraddresses.usrid = addressrow.usrid; 
    END IF;
    exit WHEN curaddress%notfound;
  END loop;
END;  
/
