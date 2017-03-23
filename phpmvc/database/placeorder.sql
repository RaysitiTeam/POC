CREATE DEFINER=`root`@`localhost` PROCEDURE `placeOrder`(
			IN ordernumber		VARCHAR(200),
            IN customerid		INT(11),
            IN orderstatusid	INT(11),
            IN paymentmode		INT(11),
            IN ordertotalprice	DECIMAL(10,0),
            IN totaldiscount	DECIMAL(10,0),
            IN paymentfulfilled	TINYINT,
            IN houseno			VARCHAR(6),
            IN addressline1		VARCHAR(200),
            IN addressline2		VARCHAR(200),
            IN city				VARCHAR(200),
            IN state			VARCHAR(200),
            IN country			VARCHAR(200),
            IN zipcode			VARCHAR(6),
            IN mobileno			VARCHAR(13),
            IN createdby		VARCHAR(100),
            IN subscriberid		INT(11),
            IN bookid			INT(11),
            IN quantity			INT(11),
            IN bookprice		DECIMAL(10,0),
            IN bookdiscount		DECIMAL(10,0),
            IN actualprice		DECIMAL(10,0)
            
		)
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
		INSERT INTO `order` (ordernumber, customerid, orderstatusid, paymentmode, ordertotalprice, totaldiscount, paymentfulfilled, houseno, addressline1, addressline2, city, state, country, zipcode, mobileno, createdby, subscriberid) VALUES (ordernumber, customerid, orderstatusid, paymentmode, ordertotalprice, totaldiscount, paymentfulfilled, houseno, addressline1, addressline2, city, state, country, zipcode, mobileno, createdby, subscriberid);
        
        INSERT INTO orderlineitems (orderid, bookid, quantity, bookprice, bookdiscount, actualprice, createdby) VALUES (LAST_INSERT_ID(), bookid, quantity, bookprice, bookdiscount, actualprice, createdby);
        
		SELECT orderstatusid from `order` WHERE orderid = LAST_INSERT_ID();
        
        IF orderstatusid > 0 THEN 
        
        INSERT INTO ordertracking (orderstatusid, orderid) VALUES (orderstatusid, LAST_INSERT_ID());
        
        END IF;
        
	COMMIT;

END