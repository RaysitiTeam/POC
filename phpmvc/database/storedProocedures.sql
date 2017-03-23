DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addBookDiscount` (IN `bookid` INT(11), IN `discountamount` DECIMAL(10,0), IN `validfrom` DATETIME, IN `validto` DATETIME, IN `createdby` VARCHAR(100))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
		INSERT INTO bookdiscount (bookid, discountamount, validfrom, validto, createdby) VALUES (bookid, discountamount, validfrom, validto, createdby);
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addBookSubscriber` (IN `name` VARCHAR(200), IN `areaid` INT(11), IN `city` VARCHAR(200), IN `state` VARCHAR(200), IN `isactive` TINYINT, IN `createdby` VARCHAR(100))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
		INSERT INTO booksubscriber(name, areaid, city, state, isactive, createdby) VALUES(name, areaid, city, state, isactive, createdby);
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addCustomerAddress` (IN `customerid` INT(11), IN `customeraddresstype` VARCHAR(100), IN `houseno` INT(6), IN `addressline1` VARCHAR(200), IN `addressline2` VARCHAR(200), IN `city` VARCHAR(200), IN `state` VARCHAR(200), IN `country` VARCHAR(200), IN `zipcode` VARCHAR(6), IN `createdby` VARCHAR(100))  BEGIN
	
    INSERT INTO customeraddress
		(
			customerid,
            customeraddresstype,
			houseno,
            addressline1,
            addressline2,
            city,
            state,
            country,
            zipcode,
            createdby
        )
	VALUES 
		(
			customerid,
            customeraddresstype,
			houseno,
            addressline1,
            addressline2,
            city,
            state,
            country,
            zipcode,
            createdby
        );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addCustomerType` (IN `customertypename` VARCHAR(200), IN `isactive` TINYINT, IN `createdby` VARCHAR(100))  BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
        
	START TRANSACTION;
    
		INSERT INTO customertype (customertypename, isactive, createdby) VALUES (customertypename, isactive, createdby);
    
    COMMIT;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewAlert` (IN `customerid` INT(11), IN `alerttypeid` INT(11), IN `createdby` VARCHAR(100), IN `sentdate` DATETIME, IN `subscriberid` INT(11))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
        
	START TRANSACTION;
    
		INSERT INTO alert(customerid, alerttypeid, createdby, sentdate, subscriberid) VALUES(customerid, alerttypeid, createdby, sentdate, subscriberid);
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewBook` (IN `bookname` VARCHAR(200), IN `categoryid` INT(11), IN `authorname` VARCHAR(200), IN `isbn` VARCHAR(250), IN `publishdate` DATETIME, IN `isupdate` TINYINT, IN `isdvdavailable` TINYINT, IN `issearchable` TINYINT, IN `bookprice` DECIMAL(10,0), IN `currentstock` INT(11), IN `createdby` VARCHAR(100))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
        
	START TRANSACTION;
    
		INSERT INTO book (bookname, categoryid, authorname, isbn, publishdate, isupdate, isdvdavailable, issearchable, bookprice, currentstock, createdby) VALUES (bookname, categoryid, authorname, isbn, publishdate, isupdate, isdvdavailable, issearchable, bookprice, currentstock, createdby);
        
	COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewCategory` (IN `categoryname` VARCHAR(250), IN `isactive` TINYINT, IN `createdby` VARCHAR(100))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
        
	START TRANSACTION;
    
		INSERT INTO category(categoryname, isactive, createdby) VALUES(categoryname, isactive, createdby);
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addOrderStatus` (IN `orderdescription` VARCHAR(100), IN `isactive` TINYINT, IN `createdby` VARCHAR(100))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
        
	START TRANSACTION;
    
		INSERT INTO orderstatus (orderdescription, isactive, createdby) VALUES (orderdescription, isactive, createdby);
        
	COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addPaymentmode` (IN `modedescription` VARCHAR(100), IN `isactive` TINYINT, IN `createdby` VARCHAR(100))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
        
	START TRANSACTION;
    
		INSERT INTO paymentmode (modedescription, isactive, createdby) VALUES (modedescription, isactive, createdby);
    
    COMMIT;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `alertCategory` (IN `alerttypedescription` VARCHAR(250), INOUT `categoryname` VARCHAR(250), IN `isactive` TINYINT, IN `createdby` VARCHAR(100))  BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
        
        
	START TRANSACTION;
		
        INSERT INTO alerttype (alerttypedescription, createdby) VALUES (alerttypedescription, createdby);
        
        INSERT INTO category (categoryname, isactive, createdby) VALUES (categoryname, isactive, createdby);
        
	COMMIT;
	

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `customerAddressType` ()  BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
    
    START TRANSACTION;
    
	SELECT customeraddressid, customerid, customeraddresstype, houseno, addressline1, addressline2, city, state, country, zipcode FROM customeraddress WHERE customerid = 3;

	COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editBook` (IN `bookname` VARCHAR(200), IN `categoryid` INT(11), IN `authorname` VARCHAR(200), IN `isbn` VARCHAR(250), IN `publishdate` DATETIME, IN `isupdate` TINYINT, IN `isdvdavailable` TINYINT, IN `issearchable` TINYINT, IN `bookprice` DECIMAL(10,0), IN `currentstock` INT(11), IN `modifiedby` VARCHAR(100), IN `id` INT(11))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
		UPDATE book SET
			bookname		= bookname,
            categoryid		= categoryid,
            authorname		= authorname,
            isbn			= isbn,
            publishdate		= publishdate,
            isupdate		= isupdate,
            isdvdavailable	= isdvdavailable,
            issearchable	= issearchable,
            bookprice		= bookprice,
            currentstock	= currentstock,
            modifiedby		= modifiedby
        WHERE bookid = id;
	
    COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editBookDiscount` (IN `discountamount` DECIMAL(10,0), IN `validfrom` DATETIME, IN `validto` DATETIME, IN `modifiedby` VARCHAR(100), IN `id` INT(11))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
		UPDATE bookdiscount SET
			discountamount	= discountamount,
            validfrom		= validfrom,
            validto			= validto,
            modifiedby		= modifiedby
        WHERE bookid = id;
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editBookSubscriber` (IN `name` VARCHAR(200), IN `city` VARCHAR(200), IN `state` VARCHAR(200), IN `isactive` TINYINT, IN `modifiedby` VARCHAR(100), IN `id` INT(11))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
        
	START TRANSACTION;
		
        UPDATE booksubscriber SET
			name		= name,
            city		= city,
            state		= state,
            isactive	= isactive,
            modifiedby	= modifiedby
        WHERE subscriberid = id;
	
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editCategory` (IN `categoryname` VARCHAR(250), IN `isactive` TINYINT, IN `modifiedby` VARCHAR(100), IN `id` INT(11))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
		UPDATE category SET
			categoryname	= categoryname,
            isactive		= isactive,
            modifiedby		= modifiedby
        WHERE categoryid = id;
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editCustomer` (IN `customername` VARCHAR(150), IN `customertypeid` INT(11), IN `dateofbirth` DATE, IN `mobileno` VARCHAR(13), IN `emailaddress` VARCHAR(100), IN `customeraddresstype` VARCHAR(100), IN `houseno` VARCHAR(6), IN `addressline1` VARCHAR(200), IN `addressline2` VARCHAR(200), IN `city` VARCHAR(200), IN `state` VARCHAR(200), IN `country` VARCHAR(200), IN `zipcode` VARCHAR(6), IN `modifiedby` VARCHAR(100), IN `id` INT(11))  BEGIN
	
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
        
	START TRANSACTION;
    
    UPDATE customer SET 
			customername	= customername,
            customertypeid	= customertypeid,
            dateofbirth		= dateofbirth,
            mobileno		= mobileno,
            emailaddress	= emailaddress,
            modifiedby		= modifiedby
	WHERE customerid = id;
    
    UPDATE customeraddress SET
			customeraddresstype = customeraddresstype,
			houseno				= houseno,
			addressline1		= addressline1,
			addressline2		= addressline2,
			city				= city,
			state				= state,
			country				= country,
			zipcode				= zipcode,
			modifiedby			= modifiedby
	WHERE customerid	= id;
	
    COMMIT;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editCustomerAddress` (IN `customeraddresstype` VARCHAR(100), IN `houseno` VARCHAR(6), IN `addressline1` VARCHAR(200), IN `addressline2` VARCHAR(200), IN `city` VARCHAR(200), IN `state` VARCHAR(200), IN `country` VARCHAR(200), IN `zipcode` VARCHAR(6), IN `modifiedby` VARCHAR(100), IN `id` INT(11))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
        
	START TRANSACTION;
    
    UPDATE customeraddress SET
		customeraddresstype = customeraddresstype,
        houseno				= houseno,
        addressline1		= addressline1,
        addressline2		= addressline2,
        city				= city,
        state				= state,
        country				= country,
        zipcode				= zipcode,
        modifiedby			= modifiedby
	WHERE customeraddressid = id;
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editCustomerType` (IN `customertypename` VARCHAR(200), IN `isactive` TINYINT, IN `modifiedby` VARCHAR(100), IN `id` INT(11))  BEGIN
	
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
		UPDATE customertype SET
			customertypename	= customertypename,
			isactive			= isactive,
            modifiedby			= modifiedby
		WHERE customertypeid = id;
        
	COMMIT;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editOrder` (IN `orderstatusid` INT(11), IN `modifiedby` VARCHAR(100), IN `id` INT(11))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
		UPDATE `order` SET
        
			orderstatusid	= orderstatusid,
            modifiedby		= modifiedby
		
        WHERE orderid = id;
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editOrderStatus` (IN `orderdescription` VARCHAR(100), IN `isactive` TINYINT, IN `modifiedby` VARCHAR(100), IN `id` INT(11))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
    UPDATE orderstatus SET
		orderdescription	= orderdescription,
        isactive			= isactive,
        modifiedby			= modifiedby
	WHERE orderstatusid = id;

	COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editPaymentmode` (IN `modedescription` VARCHAR(100), IN `isactive` TINYINT, IN `modifiedby` VARCHAR(100), IN `id` INT(11))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
        
	START TRANSACTION;
    
    UPDATE paymentmode SET
		modedescription		= modedescription,
        isactive			= isactive,
        modifiedby			= modifiedby
	WHERE paymentmodeid = id;
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllAlert` ()  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
		SELECT alertid, customerid, alerttypeid, sentdate, subscriberid FROM alert;
	
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllBook` ()  BEGIN
	SELECT bookid, bookname, categoryid, authorname, isbn, publishdate, isdvdavailable, bookprice, currentstock FROM book;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllBookDiscounts` ()  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
        
	START TRANSACTION;
    
		SELECT bookdiscountid, bookid, discountamount, validfrom, validto FROM bookdiscount;
        
	COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllBookSubscribers` ()  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
		SELECT subscriberid, name, areaid, city, state, isactive FROM booksubscriber;
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCategories` ()  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
		SELECT categoryid, categoryname, isactive FROM category;
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCustomerAddress` ()  BEGIN
	SELECT customeraddressid, houseno, addressline1, addressline2, city, state, country, zipcode FROM customeraddress;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCustomers` ()  BEGIN
	SELECT customerid, customername, customertypeid, registereddate, dateofbirth, lastlogindate, userid, mobileno, emailaddress FROM customer;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllOrders` ()  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
	SELECT orderid, ordernumber, orderdate, customerid, paymentmode, ordertotalprice, totaldiscount, paymentfulfilled, houseno, addressline1, addressline2, city, state, country, mobileno FROM `order`;
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getBookSubscribersAriaId` (IN `id` INT(11))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;

		SELECT subscriberid, name, areaid, city, state, isactive FROM booksubscriber WHERE areaid = id;
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCustomerAddressType` ()  BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
    
    START TRANSACTION;
    
	SELECT customeraddressid, customerid, customeraddresstype, houseno, addressline1, addressline2, city, state, country, zipcode FROM customeraddress WHERE customerid = 3;

	COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCustomerType` ()  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;

	START TRANSACTION;
    
		SELECT customertypename, isactive, createdby FROM customertype;

	COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrderDetails` (IN `id` INT(11))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
		SELECT orderid, ordernumber, orderdate, customerid, paymentmode, ordertotalprice, totaldiscount, paymentfulfilled, houseno, addressline1, addressline2, city, state, country, mobileno FROM `order` WHERE orderid = id OR ordernumber = id;
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrderForCustomer` (IN `id` INT(11))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
	SELECT orderid, ordernumber, orderdate, customerid, paymentmode, ordertotalprice, totaldiscount, paymentfulfilled, houseno, addressline1, addressline2, city, state, country, mobileno FROM `order` WHERE customerid = id;
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrderStatus` ()  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
		SELECT orderstatusid, orderdescription, isactive, createddate FROM orderstatus;
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPaymentmode` ()  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
        
	START TRANSACTION;

		SELECT paymentmodeid, modedescription, isactive FROM paymentmode;

	COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getSingleAlert` (IN `id` INT(11))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
	
    START TRANSACTION;
    
		SELECT alertid, customerid, alerttypeid, sentdate, subscriberid FROM alert WHERE customerid = id OR alertid = id;
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getSingleBook` (IN `id` INT(11))  BEGIN

		DECLARE EXIT HANDLER FOR SQLEXCEPTION
			BEGIN
				ROLLBACK;
			END;
		
        START TRANSACTION;
        
			SELECT bookid, bookname, categoryid, authorname, isbn, publishdate, isdvdavailable, bookprice, currentstock FROM book WHERE bookid = id;

		COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getSingleCategory` (IN `id` INT(11))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
        
	START TRANSACTION;
    
		SELECT categoryid, categoryname, isactive FROM category WHERE categoryid = id;
    
    COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `placeOrder` (IN `ordernumber` VARCHAR(200), IN `customerid` INT(11), IN `orderstatusid` INT(11), IN `paymentmode` INT(11), IN `ordertotalprice` DECIMAL(10,0), IN `totaldiscount` DECIMAL(10,0), IN `paymentfulfilled` TINYINT, IN `houseno` VARCHAR(6), IN `addressline1` VARCHAR(200), IN `addressline2` VARCHAR(200), IN `city` VARCHAR(200), IN `state` VARCHAR(200), IN `country` VARCHAR(200), IN `zipcode` VARCHAR(6), IN `mobileno` VARCHAR(13), IN `createdby` VARCHAR(100), IN `subscriberid` INT(11), IN `bookid` INT(11), IN `quantity` INT(11), IN `bookprice` DECIMAL(10,0), IN `bookdiscount` DECIMAL(10,0), IN `actualprice` DECIMAL(10,0))  BEGIN

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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registerCustomer` (IN `customername` VARCHAR(150), IN `customertypeid` INT(11), IN `dateofbirth` DATE, IN `lastlogindate` DATETIME, IN `userid` VARCHAR(150), IN `password` VARCHAR(150), IN `secretquestion` VARCHAR(400), IN `secretanswer` VARCHAR(400), IN `mobileno` VARCHAR(13), IN `emailaddress` VARCHAR(100), IN `customeraddresstype` VARCHAR(100), IN `houseno` INT(6), IN `addressline1` VARCHAR(200), IN `addressline2` VARCHAR(200), IN `city` VARCHAR(200), IN `state` VARCHAR(200), IN `country` VARCHAR(200), IN `zipcode` VARCHAR(6), IN `createdby` VARCHAR(100))  BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			ROLLBACK;
		END;
		
    
	START TRANSACTION;
	
		INSERT INTO customer (customername, customertypeid, dateofbirth, lastlogindate, userid, password, secretquestion, secretanswer, mobileno, emailaddress, createdby) VALUES (customername, customertypeid, dateofbirth, lastlogindate, userid, password, secretquestion, secretanswer, mobileno, emailaddress, createdby);
    
		INSERT INTO customeraddress (customerid, customeraddresstype, houseno, addressline1, addressline2, city, state, country, zipcode, createdby) VALUES (LAST_INSERT_ID(), customeraddresstype, houseno, addressline1, addressline2, city, state, country, zipcode, createdby);
        
        SELECT customeraddressid, customerid, customeraddresstype, houseno, addressline1, addressline2, city, state, country, zipcode FROM customeraddress WHERE customerid = LAST_INSERT_ID();
        
	COMMIT;


END$$

DELIMITER ;