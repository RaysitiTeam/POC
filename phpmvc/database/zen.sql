-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2017 at 11:59 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zen`
--

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
    
		INSERT INTO `orders` (ordernumber, customerid, orderstatusid, paymentmode, ordertotalprice, totaldiscount, paymentfulfilled, houseno, addressline1, addressline2, city, state, country, zipcode, mobileno, createdby, subscriberid) VALUES (ordernumber, customerid, orderstatusid, paymentmode, ordertotalprice, totaldiscount, paymentfulfilled, houseno, addressline1, addressline2, city, state, country, zipcode, mobileno, createdby, subscriberid);
        
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

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE `alert` (
  `alertid` int(11) NOT NULL,
  `customerid` int(11) NOT NULL,
  `alerttypeid` int(11) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(100) NOT NULL,
  `sentdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subscriberid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alert`
--

INSERT INTO `alert` (`alertid`, `customerid`, `alerttypeid`, `createddate`, `createdby`, `sentdate`, `subscriberid`) VALUES
(2, 4, 29, '2017-02-23 07:02:24', 'manjeet', '2017-02-23 07:02:24', 2),
(3, 4, 29, '2017-02-23 07:08:28', 'manjeet', '2017-02-23 07:08:28', 2),
(4, 4, 29, '2017-02-23 07:11:08', 'manjeet', '2017-02-23 07:11:08', 2),
(5, 4, 29, '2017-02-23 07:12:35', 'manjeet', '2017-02-23 07:12:35', 2),
(6, 4, 29, '2017-02-23 07:46:05', 'manjeet', '2017-02-23 07:46:05', 2),
(7, 4, 29, '2017-02-23 07:48:43', 'manjeet', '2017-02-23 07:48:43', 1),
(8, 4, 29, '2017-02-23 07:59:43', 'manjeet', '2017-02-23 07:59:43', 1),
(9, 3, 1, '2017-02-28 12:18:36', '2017-01-01', '0000-00-00 00:00:00', 1),
(10, 3, 1, '2017-02-28 12:19:42', 'admin', '2016-12-31 18:30:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `alerttype`
--

CREATE TABLE `alerttype` (
  `alerttypeid` int(11) NOT NULL,
  `alerttypedescription` varchar(250) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` varchar(100) NOT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedby` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alerttype`
--

INSERT INTO `alerttype` (`alerttypeid`, `alerttypedescription`, `createddate`, `createdby`, `modifieddate`, `modifiedby`) VALUES
(29, 'Test', '2017-02-17 15:52:49', 'manjeet', '2017-02-17 15:52:49', NULL),
(30, 'Test', '2017-02-22 09:49:31', 'manjeet', '2017-02-22 09:49:31', NULL),
(31, 'Test', '2017-02-22 09:49:45', 'manjeet', '2017-02-22 09:49:45', NULL),
(32, 'Test', '2017-02-22 10:01:19', 'manjeet', '2017-02-22 10:01:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `areaid` int(11) NOT NULL,
  `areaname` varchar(500) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `createddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(100) NOT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedby` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`areaid`, `areaname`, `city`, `state`, `createddate`, `createdby`, `modifieddate`, `modifiedby`) VALUES
(1, 'Civil Lines', 'Bulandshahr', 'Uttar Pradesh', '2017-02-04 12:41:57', 'admin', '2017-02-04 07:11:57', NULL),
(2, 'Kengeri', 'Bulandshahr', 'Karnataka', '2017-02-04 12:42:41', 'admin', '2017-02-04 07:12:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `bookid` int(11) NOT NULL,
  `bookname` varchar(200) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `authorname` varchar(200) NOT NULL,
  `isbn` varchar(250) NOT NULL,
  `publishdate` datetime NOT NULL,
  `isupdate` tinyint(1) NOT NULL,
  `isdvdavailable` tinyint(1) NOT NULL,
  `issearchable` tinyint(1) NOT NULL,
  `bookprice` decimal(10,0) NOT NULL,
  `currentstock` int(11) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(100) NOT NULL,
  `modifieddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedby` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`bookid`, `bookname`, `categoryid`, `authorname`, `isbn`, `publishdate`, `isupdate`, `isdvdavailable`, `issearchable`, `bookprice`, `currentstock`, `createddate`, `createdby`, `modifieddate`, `modifiedby`) VALUES
(7, 'Science', 6, 'Manjeet Singh Bargoti', '1233434', '2017-02-13 00:00:00', 0, 1, 0, '450', 15, '2017-01-31 09:18:01', 'Manjeet', '2017-01-31 09:18:01', 'manjeet'),
(9, 'Math (Kannada)', 3, 'Manjeet Singh Bargoti', '12354599778787', '2017-02-03 12:28:50', 1, 0, 1, '348', 45, '2017-02-03 06:58:50', 'Admin', '2017-02-03 06:58:50', NULL),
(10, 'Physics', 3, 'Manjeet Singh Bargoti', '23432141', '2015-11-21 00:00:00', 1, 1, 1, '234', 17, '2017-02-06 09:47:37', 'manjeet', '2017-02-06 09:47:37', NULL),
(11, 'Economics', 2, 'Vishal', 'ADFGN92498', '2017-02-02 00:00:00', 1, 1, 1, '233', 21, '2017-02-27 07:57:25', 'admin', '2017-02-27 07:57:25', 'Manjeet'),
(13, 'Accountancy', 1, 'Manjeet', 'ASBN7477', '2017-01-01 00:00:00', 1, 1, 1, '238', 50, '2017-02-27 08:01:07', 'admin', '2017-02-27 08:01:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookdiscount`
--

CREATE TABLE `bookdiscount` (
  `bookdiscountid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `discountamount` decimal(10,0) NOT NULL,
  `validfrom` datetime NOT NULL,
  `validto` datetime NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(100) NOT NULL,
  `modifieddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedby` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookdiscount`
--

INSERT INTO `bookdiscount` (`bookdiscountid`, `bookid`, `discountamount`, `validfrom`, `validto`, `createddate`, `createdby`, `modifieddate`, `modifiedby`) VALUES
(2, 7, '30', '2017-02-15 00:00:00', '2017-04-15 00:00:00', '2017-02-27 09:51:06', 'admin', '2017-02-27 09:51:06', 'manjeet'),
(3, 7, '30', '2017-02-15 00:00:00', '2017-04-15 00:00:00', '2017-02-27 10:37:24', 'admin', '2017-02-27 10:37:24', 'manjeet');

-- --------------------------------------------------------

--
-- Table structure for table `booksubscriber`
--

CREATE TABLE `booksubscriber` (
  `subscriberid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `areaid` int(11) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(100) NOT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedby` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booksubscriber`
--

INSERT INTO `booksubscriber` (`subscriberid`, `name`, `areaid`, `city`, `state`, `isactive`, `createddate`, `createdby`, `modifieddate`, `modifiedby`) VALUES
(1, 'Manjeet', 2, 'Bangalore', 'Karnataka', 1, '2017-02-27 12:05:21', 'manjeet', '2017-02-27 12:05:21', 'manjeet'),
(2, 'Nagendra', 1, 'Bangalore', 'Karnataka', 1, '2017-02-27 12:06:09', 'nagendra', '2017-02-27 12:06:09', NULL),
(4, 'Manjeet', 1, 'Bulandshahr', 'Uttar Pradesh', 1, '2017-02-27 12:08:57', 'manjeet', '2017-02-27 12:08:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL,
  `categoryname` varchar(250) NOT NULL,
  `isactive` tinyint(1) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(100) NOT NULL,
  `modifieddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedby` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryid`, `categoryname`, `isactive`, `createddate`, `createdby`, `modifieddate`, `modifiedby`) VALUES
(1, 'Samsung', 1, '2017-02-17 15:23:53', 'admin', '2017-02-17 15:23:53', 'manjeet'),
(2, 'HP', 1, '2017-02-17 15:51:36', 'manjeet', '2017-02-17 15:51:36', NULL),
(3, 'HP', 1, '2017-02-17 15:52:49', 'manjeet', '2017-02-17 15:52:49', NULL),
(4, 'Dell', 0, '2017-02-28 12:50:10', 'admin', '2017-02-28 12:50:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerid` int(11) NOT NULL,
  `customername` varchar(150) NOT NULL,
  `customertypeid` int(11) NOT NULL,
  `registereddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateofbirth` date NOT NULL,
  `lastlogindate` datetime NOT NULL,
  `userid` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `secretquestion` varchar(400) NOT NULL,
  `secretanswer` varchar(400) NOT NULL,
  `mobileno` varchar(13) NOT NULL,
  `emailaddress` varchar(100) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(100) NOT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `modifiedby` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerid`, `customername`, `customertypeid`, `registereddate`, `dateofbirth`, `lastlogindate`, `userid`, `password`, `secretquestion`, `secretanswer`, `mobileno`, `emailaddress`, `createddate`, `createdby`, `modifieddate`, `modifiedby`) VALUES
(3, 'Manjeet Singh Bargoti', 1, '2017-03-01 12:56:26', '0000-00-00', '2017-03-01 02:05:07', 'mbargoti02', 'mbargoti1213', 'best player', 'Dhoni', '9411447236', 'msb.2905@gmail.com', '0000-00-00 00:00:00', 'Manjeet', NULL, 'Manjeet'),
(4, 'Vishal Bargoti', 3, '2017-03-01 12:43:07', '1996-08-30', '2017-03-02 01:07:05', 'manjeet07', 'mbargoti12', 'best player', 'Dhoni', '9675756933', 'manjeet.raysiti@gmail.com', '0000-00-00 00:00:00', 'Manjeet', NULL, 'vishal'),
(5, 'Manjeet', 1, '2017-03-01 12:56:26', '2017-02-02', '2017-03-24 12:23:45', 'vishal', 'Vishal12', 'best player', 'Dhoni', '9411447236', 'mbargoti@gmail.com', '0000-00-00 00:00:00', 'Manjeet', NULL, NULL),
(6, 'Manjeet', 1, '2017-03-01 12:56:26', '2017-02-02', '2017-03-01 02:05:07', 'mbargoti1', 'mbargoti', 'best player', 'Dhoni', '9411447236', 'mbargoti@gmail.com', '0000-00-00 00:00:00', 'Manjeet', NULL, NULL),
(7, 'Manjeet', 1, '2017-03-01 12:41:19', '2017-02-02', '2017-03-01 01:41:19', 'vishal2', 'vishal@122', 'best player', 'Dhoni', '9411447236', 'mbargoti@gmail.com', '0000-00-00 00:00:00', 'manjeet', NULL, NULL),
(8, 'Manjeet', 3, '2017-03-01 12:56:26', '2017-02-02', '2017-03-01 02:05:07', 'mbargoti', 'mbargoti', 'best player', 'Dhoni', '9411447236', 'mbargoti@gmail.com', '0000-00-00 00:00:00', 'manjeet', NULL, NULL),
(33, 'Vishal', 3, '2017-03-24 07:14:23', '1996-08-30', '2017-03-21 00:00:00', 'vbargoti', 'Vishal123', 'Fav. Player', 'Kohli', '9411447236', 'vishal@gmail.com', '2017-03-24 07:14:23', 'Vishal', NULL, NULL),
(34, 'Vishal', 3, '2017-03-24 07:16:21', '1996-08-30', '2017-03-21 00:00:00', 'vbargoti', 'Vishal123', 'Fav. Player', 'Kohli', '9411447236', 'vishal@gmail.com', '2017-03-24 07:16:21', 'Vishal', NULL, NULL),
(35, 'Vishal', 3, '2017-03-24 07:23:02', '1996-08-30', '2017-03-21 00:00:00', 'vbargoti', 'Vishal123', 'Fav. Player', 'Kohli', '9411447236', 'vishal@gmail.com', '2017-03-24 07:23:02', 'Vishal', NULL, NULL),
(36, 'Vishal Bargoti', 2, '2017-03-24 07:51:10', '1996-08-30', '2017-03-21 00:00:00', 'vbargoti', 'Vishal1234', 'Fav. Player', 'Kohli', '9411447236', 'vishal@gmail.com', '2017-03-24 07:51:10', 'Vishal', NULL, NULL),
(37, 'Vishal Bargoti', 2, '2017-03-24 07:53:03', '1996-08-30', '2017-03-21 00:00:00', 'vbargoti', 'Vishal1234', 'Fav. Player', 'Kohli', '9411447236', 'vishal@gmail.com', '2017-03-24 07:53:03', 'Vishal', NULL, NULL),
(38, 'Vishal Bargoti', 2, '2017-03-24 11:48:47', '1996-08-30', '2017-03-21 00:00:00', 'vbargoti', 'Vishal1234', 'Fav. Player', 'Kohli', '9411447236', 'vishal@gmail.com', '2017-03-24 11:48:47', 'Vishal', NULL, NULL),
(39, 'Vishal Bargoti', 2, '2017-03-24 11:49:38', '1996-08-30', '2017-03-21 00:00:00', 'vbargoti', 'Vishal1234', 'Fav. Player', 'Kohli', '9411447236', 'vishal@gmail.com', '2017-03-24 11:49:38', 'Vishal', NULL, NULL),
(40, 'Vishal Bargoti', 2, '2017-03-24 11:51:13', '1996-08-30', '2017-03-21 00:00:00', 'vbargoti', 'Vishal1234', 'Fav. Player', 'Kohli', '9411447236', 'vishal@gmail.com', '2017-03-24 11:51:13', 'Vishal', NULL, NULL),
(41, 'Vishal Bargoti', 2, '2017-03-24 11:58:14', '1996-08-30', '2017-03-21 00:00:00', 'vbargoti', 'Vishal1234', 'Fav. Player', 'Kohli', '9411447236', 'vishal@gmail.com', '2017-03-24 11:58:14', 'Vishal', NULL, NULL),
(42, 'Vishal Bargoti', 2, '2017-03-24 12:09:38', '1996-08-30', '2017-03-21 00:00:00', 'vbargoti', 'Vishal1234', 'Fav. Player', 'Kohli', '9411447236', 'vishal@gmail.com', '2017-03-24 12:09:38', 'Vishal', NULL, NULL),
(43, 'Vishal Bargoti', 2, '2017-03-25 09:39:20', '1996-08-30', '2017-03-21 00:00:00', 'vbargoti', 'Vishal1234', 'Fav. Player', 'Kohli', '9411447236', 'vishal@gmail.com', '2017-03-25 09:39:20', 'Vishal', NULL, NULL),
(44, 'Vishal Bargoti', 2, '2017-03-25 10:08:27', '1996-08-30', '2017-03-21 00:00:00', 'vbargoti', 'Vishal1234', 'Fav. Player', 'Kohli', '9411447236', 'vishal@gmail.com', '2017-03-25 10:08:27', 'V', NULL, NULL),
(45, 'Vishal Bargoti', 2, '2017-03-25 10:10:16', '1996-08-30', '2017-03-21 00:00:00', 'vbargoti', 'Vishal1234', 'Fav. Player', 'Kohli', '9411447236', 'vishal@gmail.com', '2017-03-25 10:10:16', 'V', NULL, NULL),
(46, 'Vishal Bargoti', 2, '2017-03-25 10:15:55', '1996-08-30', '2017-03-21 00:00:00', 'vbargoti', 'Vishal1234', 'Fav. Player', 'Kohli', '9411447236', 'vishal@gmail.com', '2017-03-25 10:15:55', 'Vishal', NULL, NULL),
(47, 'Vishal Bargoti', 2, '2017-03-25 10:16:37', '1996-08-30', '2017-03-21 00:00:00', 'vbargoti', 'Vishal1234', 'Fav. Player', 'Kohli', '9411447236', 'vishal@gmail.com', '2017-03-25 10:16:37', 'Vishal', NULL, NULL),
(48, 'Vishal Bargoti', 2, '2017-03-25 10:29:59', '1996-08-30', '2017-03-21 00:00:00', 'vbargoti', 'Vishal1234', 'Fav. Player', 'Kohli', '9411447236', 'vishal@gmail.com', '2017-03-25 10:29:59', 'Vishal', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customeraddress`
--

CREATE TABLE `customeraddress` (
  `customeraddressid` int(11) NOT NULL,
  `customerid` int(11) NOT NULL,
  `customeraddresstype` varchar(100) DEFAULT NULL,
  `houseno` varchar(6) NOT NULL,
  `addressline1` varchar(200) NOT NULL,
  `addressline2` varchar(200) DEFAULT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` varchar(100) NOT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `modifiedby` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customeraddress`
--

INSERT INTO `customeraddress` (`customeraddressid`, `customerid`, `customeraddresstype`, `houseno`, `addressline1`, `addressline2`, `city`, `state`, `country`, `zipcode`, `createddate`, `createdby`, `modifieddate`, `modifiedby`) VALUES
(1, 3, 'Home', '66', 'Shekhpur Garhwa', 'Lakhaoti', 'Bulandshahr', 'Uttar Pradesh', 'India', '203407', '2017-03-20 10:19:25', 'Manjeet', NULL, 'Manjeet'),
(2, 4, 'Work', '54', 'Delhi', 'Anand Vihar', 'East Delhi', 'New Delhi', 'India', '110092', '2017-02-21 07:31:30', 'Manjeet', NULL, 'ankur'),
(3, 5, 'Home', '21', 'Bulandshahr', 'Bulandshahr', 'Bulandshahr', 'Bulandshahr', 'Bulandshahr', '203407', '2017-02-21 05:27:23', 'Manjeet', NULL, NULL),
(4, 6, 'Home', '66', 'Bulandshahr', 'Bulandshahr', 'Bulandshahr', 'Bulandshahr', 'Bulandshahr', '203407', '2017-02-21 05:27:42', 'Manjeet', NULL, NULL),
(5, 7, 'Home', '66', 'Bulandshahr', 'Bulandshahr', 'Bulandshahr', 'Utar Pradesh', 'India', '203407', '2017-02-21 05:34:25', 'manjeet', NULL, NULL),
(23, 33, 'Home', '66', 'Shekhpur Garhwa', 'Lakhaoti', 'Bulandshahr', 'Uttar Pradesh', 'India', '203407', '2017-03-24 07:14:24', 'Vishal', NULL, NULL),
(24, 34, 'Home', '66', 'Shekhpur Garhwa', 'Lakhaoti', 'Bulandshahr', 'Uttar Pradesh', 'India', '203407', '2017-03-24 07:16:21', 'Vishal', NULL, NULL),
(25, 35, 'Home', '66', 'Shekhpur Garhwa', 'Lakhaoti', 'Bulandshahr', 'Uttar Pradesh', 'India', '203407', '2017-03-24 07:23:02', 'Vishal', NULL, NULL),
(26, 36, 'Home', '66', 'Shekhpur Garhwa', 'Lakhaoti', 'Bulandshahr', 'Uttar Pradesh', 'India', '203407', '2017-03-24 07:51:10', 'Vishal', NULL, NULL),
(27, 37, 'Home', '33', 'KST', 'Kengeri', 'Bangalore', 'Karnataka', 'India', '560060', '2017-03-24 07:53:03', 'Vishal', NULL, NULL),
(28, 38, 'Home', '33', 'KST', 'Kengeri', 'Bangalore', 'Karnataka', 'India', '560060', '2017-03-24 11:48:47', 'Vishal', NULL, NULL),
(29, 39, 'Home', '33', 'KST', 'Kengeri', 'Bangalore', 'Karnataka', 'India', '560060', '2017-03-24 11:49:38', 'Vishal', NULL, NULL),
(30, 40, 'Home', '33', 'KST', 'Kengeri', 'Bangalore', 'Karnataka', 'India', '560060', '2017-03-24 11:51:13', 'Vishal', NULL, NULL),
(31, 41, 'Home', '33', 'KST', 'Kengeri', 'Bangalore', 'Karnataka', 'India', '560060', '2017-03-24 11:58:14', 'Vishal', NULL, NULL),
(32, 42, 'Home', '33', 'KST', 'Kengeri', 'Bangalore', 'Karnataka', 'India', '560060', '2017-03-24 12:09:38', 'Vishal', NULL, NULL),
(33, 43, 'Home', '3', 'K', 'K', 'B', 'K', 'I', '5', '2017-03-25 09:39:20', 'Vishal', NULL, NULL),
(34, 44, 'Home', '3', 'K', 'K', 'B', 'K', 'I', '5', '2017-03-25 10:08:27', 'V', NULL, NULL),
(35, 45, 'Home', '3', 'K', 'K', 'B', 'K', 'I', '5', '2017-03-25 10:10:16', 'V', NULL, NULL),
(36, 48, 'Home', '33', 'KST', 'Kengeri', 'Bangalore', 'Karnataka', 'India', '560060', '2017-03-25 10:29:59', 'Vishal', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customertype`
--

CREATE TABLE `customertype` (
  `customertypeid` int(11) NOT NULL,
  `customertypename` varchar(200) NOT NULL,
  `isactive` tinyint(4) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` varchar(100) NOT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `modifiedby` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customertype`
--

INSERT INTO `customertype` (`customertypeid`, `customertypename`, `isactive`, `createddate`, `createdby`, `modifieddate`, `modifiedby`) VALUES
(1, 'Student', 0, '2017-02-27 06:00:18', 'admin', NULL, 'manjeet'),
(2, 'Shop', 0, '2017-02-04 07:23:56', 'admin', NULL, NULL),
(3, 'Teacher', 0, '2017-02-04 07:22:59', 'manjeet', NULL, NULL),
(4, 'Tution', 1, '2017-02-27 05:27:10', 'admin', NULL, NULL),
(5, 'School', 1, '2017-02-27 05:36:27', 'admin', NULL, NULL),
(6, 'New Type', 0, '2017-02-27 06:00:42', 'admin', NULL, 'manjeet');

-- --------------------------------------------------------

--
-- Table structure for table `orderlineitems`
--

CREATE TABLE `orderlineitems` (
  `orderlineitemid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `bookprice` decimal(10,0) NOT NULL,
  `bookdiscount` decimal(10,0) NOT NULL,
  `actualprice` decimal(10,0) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(100) NOT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedby` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderlineitems`
--

INSERT INTO `orderlineitems` (`orderlineitemid`, `orderid`, `bookid`, `quantity`, `bookprice`, `bookdiscount`, `actualprice`, `createddate`, `createdby`, `modifieddate`, `modifiedby`) VALUES
(5, 5, 7, 1, '248', '30', '218', '2017-02-23 07:43:02', 'manjeet', '2017-02-23 07:43:02', NULL),
(6, 6, 7, 1, '248', '30', '218', '2017-02-23 07:44:57', 'manjeet', '2017-02-23 07:44:57', NULL),
(7, 7, 10, 233, '340', '20', '360', '2017-02-23 07:46:05', 'manjeet', '2017-02-23 07:46:05', NULL),
(8, 8, 10, 233, '340', '20', '360', '2017-02-23 07:48:43', 'manjeet', '2017-02-23 07:48:43', NULL),
(9, 9, 10, 233, '340', '20', '360', '2017-02-23 07:59:43', 'manjeet', '2017-02-23 07:59:43', NULL),
(11, 12, 7, 1, '340', '30', '310', '2017-03-24 10:55:34', 'Manjeet', '2017-03-24 10:55:34', NULL),
(14, 15, 7, 1, '340', '30', '310', '2017-03-25 07:15:53', 'Manjeet', '2017-03-25 07:15:53', NULL),
(15, 16, 7, 1, '3', '3', '3', '2017-03-25 07:34:36', 'Manjeet', '2017-03-25 07:34:36', NULL),
(16, 17, 7, 1, '340', '30', '310', '2017-03-25 09:47:11', 'Manjeet', '2017-03-25 09:47:11', NULL),
(17, 20, 7, 1, '3', '3', '3', '2017-03-25 10:58:41', 'Manjeet', '2017-03-25 10:58:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL,
  `ordernumber` varchar(200) NOT NULL,
  `orderdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customerid` int(11) NOT NULL,
  `orderstatusid` int(11) NOT NULL,
  `paymentmode` int(11) NOT NULL,
  `ordertotalprice` decimal(10,0) NOT NULL,
  `totaldiscount` decimal(10,0) NOT NULL,
  `paymentfulfilled` tinyint(1) NOT NULL,
  `houseno` varchar(6) DEFAULT NULL,
  `addressline1` varchar(200) NOT NULL,
  `addressline2` varchar(200) DEFAULT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `mobileno` varchar(13) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(100) NOT NULL,
  `moifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedby` varchar(100) DEFAULT NULL,
  `subscriberid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderid`, `ordernumber`, `orderdate`, `customerid`, `orderstatusid`, `paymentmode`, `ordertotalprice`, `totaldiscount`, `paymentfulfilled`, `houseno`, `addressline1`, `addressline2`, `city`, `state`, `country`, `zipcode`, `mobileno`, `createddate`, `createdby`, `moifieddate`, `modifiedby`, `subscriberid`) VALUES
(5, '59', '2017-02-23 07:43:02', 3, 2, 1, '234', '30', 1, '66', 'Shekhpur Garhwa', 'Bulandshahr', 'Bulandshahr', 'Uttar Pradesh', 'India', '203407', '9411447236', '2017-02-23 07:43:02', 'manjeet', '2017-02-23 07:43:02', 'admin', 2),
(6, '59', '2017-02-23 07:44:57', 3, 3, 1, '234', '30', 1, '66', 'Shekhpur Garhwa', 'Bulandshahr', 'Bulandshahr', 'Uttar Pradesh', 'India', '203407', '9411447236', '2017-02-23 07:44:57', 'manjeet', '2017-02-23 07:44:57', NULL, 2),
(7, '1244', '2017-02-23 07:46:05', 4, 2, 1, '340', '20', 1, '55', 'KST', 'Kengeri', 'Bangalore', 'Karnataka', 'India', '560059', '9411447236', '2017-02-23 07:46:05', 'manjeet', '2017-02-23 07:46:05', NULL, 2),
(8, '1244', '2017-02-23 07:48:43', 4, 2, 1, '340', '20', 1, '55', 'KST', 'Kengeri', 'Bangalore', 'Karnataka', 'India', '560059', '9411447236', '2017-02-23 07:48:43', 'manjeet', '2017-02-23 07:48:43', NULL, 1),
(9, '1244', '2017-02-23 07:59:43', 4, 2, 1, '340', '20', 1, '55', 'KST', 'Kengeri', 'Bangalore', 'Karnataka', 'India', '560059', '9411447236', '2017-02-23 07:59:43', 'manjeet', '2017-02-23 07:59:43', NULL, 1),
(10, '214', '2017-03-24 10:16:20', 4, 2, 1, '340', '30', 1, '66', 'KST', 'Kengeri', 'Bangalore', 'Uttar Pradesh', 'India', '560060', '9411447236', '2017-03-24 10:16:20', 'Manjeet', '2017-03-24 10:16:20', NULL, 2),
(11, '214', '2017-03-24 10:53:35', 4, 2, 1, '340', '30', 1, '66', 'KST', 'Kengeri', 'Bangalore', 'Uttar Pradesh', 'India', '560060', '9411447236', '2017-03-24 10:53:35', 'Manjeet', '2017-03-24 10:53:35', NULL, 2),
(12, '214', '2017-03-24 10:55:34', 4, 2, 1, '340', '30', 1, '66', 'KST', 'Kengeri', 'Bangalore', 'Uttar Pradesh', 'India', '560060', '9411447236', '2017-03-24 10:55:34', 'Manjeet', '2017-03-24 10:55:34', NULL, 2),
(13, '214', '2017-03-25 06:32:40', 4, 2, 1, '340', '30', 1, '66', 'KST', 'Kengeri', 'Bangalore', 'Uttar Pradesh', 'India', '560060', '9411447236', '2017-03-25 06:32:40', 'Manjeet', '2017-03-25 06:32:40', NULL, 2),
(14, '214', '2017-03-25 06:34:27', 4, 2, 1, '340', '30', 1, '66', 'KST', 'Kengeri', 'Bangalore', 'Uttar Pradesh', 'India', '560060', '9411447236', '2017-03-25 06:34:27', 'Manjeet', '2017-03-25 06:34:27', NULL, 2),
(15, '214', '2017-03-25 07:15:53', 4, 2, 1, '340', '30', 1, '66', 'KST', 'Kengeri', 'Bangalore', 'Uttar Pradesh', 'India', '560060', '9411447236', '2017-03-25 07:15:53', 'Manjeet', '2017-03-25 07:15:53', NULL, 2),
(16, '214', '2017-03-25 07:34:36', 4, 2, 1, '340', '30', 1, '66', 'KST', 'Kengeri', 'Bangalore', 'Uttar Pradesh', 'India', '560060', '9411447236', '2017-03-25 07:34:36', 'Manjeet', '2017-03-25 07:34:36', NULL, 2),
(17, '214', '2017-03-25 09:47:11', 4, 2, 1, '340', '30', 1, '66', 'KST', 'Kengeri', 'Bangalore', 'Uttar Pradesh', 'India', '560060', '9411447236', '2017-03-25 09:47:11', 'Manjeet', '2017-03-25 09:47:11', NULL, 2),
(18, '214', '2017-03-25 09:54:27', 4, 2, 1, '340', '30', 1, '66', 'KST', 'Kengeri', 'Bangalore', 'Uttar Pradesh', 'India', '560060', '9411447236', '2017-03-25 09:54:27', 'Manjeet', '2017-03-25 09:54:27', NULL, 2),
(19, '214', '2017-03-25 10:57:41', 4, 2, 1, '340', '30', 1, '66', 'KST', 'Kengeri', 'Bangalore', 'Uttar Pradesh', 'India', '560060', '9411447236', '2017-03-25 10:57:41', 'Manjeet', '2017-03-25 10:57:41', NULL, 2),
(20, '214', '2017-03-25 10:58:41', 4, 2, 1, '340', '30', 1, '66', 'KST', 'Kengeri', 'Bangalore', 'Uttar Pradesh', 'India', '560060', '9411447236', '2017-03-25 10:58:41', 'Manjeet', '2017-03-25 10:58:41', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `orderstatusid` int(11) NOT NULL,
  `orderdescription` varchar(200) NOT NULL,
  `isactive` tinyint(4) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(100) NOT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedby` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`orderstatusid`, `orderdescription`, `isactive`, `createddate`, `createdby`, `modifieddate`, `modifiedby`) VALUES
(1, 'Confirm', 1, '2017-02-06 05:24:00', 'admin', '2017-02-06 05:24:00', 'manjeet'),
(2, 'Cancel', 1, '2017-02-06 05:24:16', 'admin', '2017-02-06 05:24:16', 'manjeet'),
(3, 'FulFilled', 1, '2017-02-22 06:20:56', 'admin', '2017-02-22 06:20:56', 'manjeet'),
(4, 'Deliver', 1, '2017-02-22 06:20:56', 'admin', '2017-02-22 06:20:56', 'manjeet'),
(5, 'Failed to Deliver', 1, '2017-02-22 06:21:16', 'admin', '2017-02-22 06:21:16', 'manjeet'),
(6, 'Test 1', 0, '2017-02-27 07:07:18', 'admin', '2017-02-27 07:07:18', 'manjeet'),
(7, 'Test 2', 0, '2017-02-27 07:10:38', 'manjeet', '2017-02-27 07:10:38', 'manjeet');

-- --------------------------------------------------------

--
-- Table structure for table `ordertracking`
--

CREATE TABLE `ordertracking` (
  `ordertrackingid` int(11) NOT NULL,
  `orderstatusid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `statusdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` varchar(100) NOT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedby` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertracking`
--

INSERT INTO `ordertracking` (`ordertrackingid`, `orderstatusid`, `orderid`, `statusdate`, `createddate`, `createdby`, `modifieddate`, `modifiedby`) VALUES
(1, 2, 1, '2017-02-23 06:44:48', '2017-02-23 06:44:48', '', '2017-02-23 06:44:48', ''),
(2, 3, 5, '2017-02-23 07:43:02', '2017-02-23 07:43:02', '', '2017-02-23 07:43:02', ''),
(3, 3, 6, '2017-02-23 07:44:57', '2017-02-23 07:44:57', '', '2017-02-23 07:44:57', ''),
(4, 2, 7, '2017-02-23 07:46:05', '2017-02-23 07:46:05', '', '2017-02-23 07:46:05', ''),
(5, 2, 8, '2017-02-23 07:48:43', '2017-02-23 07:48:43', '', '2017-02-23 07:48:43', ''),
(6, 2, 9, '2017-02-23 07:59:43', '2017-02-23 07:59:43', '', '2017-02-23 07:59:43', '');

-- --------------------------------------------------------

--
-- Table structure for table `paymentmode`
--

CREATE TABLE `paymentmode` (
  `paymentmodeid` int(11) NOT NULL,
  `modedescription` varchar(100) NOT NULL,
  `isactive` tinyint(4) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(100) NOT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedby` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymentmode`
--

INSERT INTO `paymentmode` (`paymentmodeid`, `modedescription`, `isactive`, `createddate`, `createdby`, `modifieddate`, `modifiedby`) VALUES
(1, 'Debit Card', 1, '2017-02-06 05:32:11', 'admin', '2017-02-06 05:32:11', 'manjeet'),
(2, 'Credit Card', 1, '2017-02-06 05:32:21', 'admin', '2017-02-06 05:32:21', 'manjeet'),
(4, 'COD', 0, '2017-02-06 05:32:33', 'admin', '2017-02-06 05:32:33', NULL),
(5, 'Net Banking', 1, '2017-02-06 05:32:46', 'manjeet', '2017-02-06 05:32:46', 'manjeet'),
(6, 'Paypal (IN)', 0, '2017-02-11 07:15:04', 'manjeet', '2017-02-11 07:15:04', 'manjeet'),
(7, 'EMI', 1, '2017-02-27 06:22:28', 'admin', '2017-02-27 06:22:28', 'manjeet');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`alertid`),
  ADD KEY `fk_alertsubscriberid` (`subscriberid`),
  ADD KEY `fk_alertcustomerid` (`customerid`);

--
-- Indexes for table `alerttype`
--
ALTER TABLE `alerttype`
  ADD PRIMARY KEY (`alerttypeid`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`areaid`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`bookid`),
  ADD KEY `fk_category` (`categoryid`);

--
-- Indexes for table `bookdiscount`
--
ALTER TABLE `bookdiscount`
  ADD PRIMARY KEY (`bookdiscountid`),
  ADD KEY `fk_bookdiscountid` (`bookid`);

--
-- Indexes for table `booksubscriber`
--
ALTER TABLE `booksubscriber`
  ADD PRIMARY KEY (`subscriberid`),
  ADD KEY `fk_booksubscriberareaid` (`areaid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerid`),
  ADD KEY `fk_customertype` (`customertypeid`);

--
-- Indexes for table `customeraddress`
--
ALTER TABLE `customeraddress`
  ADD PRIMARY KEY (`customeraddressid`),
  ADD KEY `fk_customerid` (`customerid`);

--
-- Indexes for table `customertype`
--
ALTER TABLE `customertype`
  ADD PRIMARY KEY (`customertypeid`);

--
-- Indexes for table `orderlineitems`
--
ALTER TABLE `orderlineitems`
  ADD PRIMARY KEY (`orderlineitemid`),
  ADD KEY `fk_orderlineitemsbook` (`bookid`),
  ADD KEY `fk_orderlineorder` (`orderid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `fk_ordercustomerid` (`customerid`),
  ADD KEY `fk_paymentmode` (`paymentmode`),
  ADD KEY `fk_ordersubscriberid` (`subscriberid`);

--
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`orderstatusid`);

--
-- Indexes for table `ordertracking`
--
ALTER TABLE `ordertracking`
  ADD PRIMARY KEY (`ordertrackingid`),
  ADD KEY `fk_trackorderstatusid` (`orderstatusid`),
  ADD KEY `fk_trackorderid` (`orderid`);

--
-- Indexes for table `paymentmode`
--
ALTER TABLE `paymentmode`
  ADD PRIMARY KEY (`paymentmodeid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alert`
--
ALTER TABLE `alert`
  MODIFY `alertid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `alerttype`
--
ALTER TABLE `alerttype`
  MODIFY `alerttypeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `areaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `bookid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `bookdiscount`
--
ALTER TABLE `bookdiscount`
  MODIFY `bookdiscountid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `booksubscriber`
--
ALTER TABLE `booksubscriber`
  MODIFY `subscriberid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `customeraddress`
--
ALTER TABLE `customeraddress`
  MODIFY `customeraddressid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `customertype`
--
ALTER TABLE `customertype`
  MODIFY `customertypeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `orderlineitems`
--
ALTER TABLE `orderlineitems`
  MODIFY `orderlineitemid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `orderstatus`
--
ALTER TABLE `orderstatus`
  MODIFY `orderstatusid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ordertracking`
--
ALTER TABLE `ordertracking`
  MODIFY `ordertrackingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `paymentmode`
--
ALTER TABLE `paymentmode`
  MODIFY `paymentmodeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `alert`
--
ALTER TABLE `alert`
  ADD CONSTRAINT `fk_alertcustomerid` FOREIGN KEY (`customerid`) REFERENCES `customer` (`customerid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_alertsubscriberid` FOREIGN KEY (`subscriberid`) REFERENCES `booksubscriber` (`subscriberid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`categoryid`) REFERENCES `category` (`categoryid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `bookdiscount`
--
ALTER TABLE `bookdiscount`
  ADD CONSTRAINT `fk_bookdiscountid` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `booksubscriber`
--
ALTER TABLE `booksubscriber`
  ADD CONSTRAINT `fk_booksubscriberareaid` FOREIGN KEY (`areaid`) REFERENCES `area` (`areaid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_customertype` FOREIGN KEY (`customertypeid`) REFERENCES `customertype` (`customertypeid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `customeraddress`
--
ALTER TABLE `customeraddress`
  ADD CONSTRAINT `fk_customerid` FOREIGN KEY (`customerid`) REFERENCES `customer` (`customerid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `orderlineitems`
--
ALTER TABLE `orderlineitems`
  ADD CONSTRAINT `fk_orderlineitemsbook` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orderlineorder` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_ordercustomerid` FOREIGN KEY (`customerid`) REFERENCES `customer` (`customerid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ordersubscriberid` FOREIGN KEY (`subscriberid`) REFERENCES `booksubscriber` (`subscriberid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_paymentmode` FOREIGN KEY (`paymentmode`) REFERENCES `paymentmode` (`paymentmodeid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `ordertracking`
--
ALTER TABLE `ordertracking`
  ADD CONSTRAINT `fk_trackorderid` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_trackorderstatusid` FOREIGN KEY (`orderstatusid`) REFERENCES `orderstatus` (`orderstatusid`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
