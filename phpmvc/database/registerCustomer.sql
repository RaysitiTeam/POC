CREATE DEFINER=`root`@`localhost` PROCEDURE `registerCustomer`(
		IN customername			VARCHAR(150),
        IN customertypeid		INT(11),
        IN dateofbirth			DATE,
        IN lastlogindate		DATETIME,
        IN userid				VARCHAR(150),
        IN password				VARCHAR(150),
        IN secretquestion		VARCHAR(400),
        IN secretanswer			VARCHAR(400),
        IN mobileno				VARCHAR(13),
        IN emailaddress			VARCHAR(100),
        IN customeraddresstype	VARCHAR(100),
		IN houseno				INT(6),
		IN addressline1			VARCHAR(200),
		IN addressline2			VARCHAR(200),
		IN city					VARCHAR(200),
		IN state				VARCHAR(200),
		IN country				VARCHAR(200),
		IN zipcode				VARCHAR(6),
		IN createdby			VARCHAR(100)
	)
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
		
    
	START TRANSACTION;
	
		INSERT INTO customer (customername, customertypeid, dateofbirth, lastlogindate, userid, password, secretquestion, secretanswer, mobileno, emailaddress, createdby) VALUES (customername, customertypeid, dateofbirth, lastlogindate, userid, password, secretquestion, secretanswer, mobileno, emailaddress, createdby);
    
		INSERT INTO customeraddress (customerid, customeraddresstype, houseno, addressline1, addressline2, city, state, country, zipcode, createdby) VALUES (LAST_INSERT_ID(), customeraddresstype, houseno, addressline1, addressline2, city, state, country, zipcode, createdby);
        
        SELECT customeraddressid, customerid, customeraddresstype, houseno, addressline1, addressline2, city, state, country, zipcode FROM customeraddress WHERE customerid = LAST_INSERT_ID();
        
	COMMIT;


END