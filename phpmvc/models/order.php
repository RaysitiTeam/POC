<?php

	class OrderModel extends Model
	{
		public $ordernumber;
		public $customerid;
		public $orderstatusid;
		public $paymentmode;
		public $ordertotalprice;
		public $totaldiscount;
		public $paymentfulfilled;
		public $houseno;
		public $addressline1;
		public $addressline2;
		public $city;
		public $state;
		public $country;
		public $zipcode;
		public $mobileno;
		public $createdby;
		public $subscriberid;

		public function __construct($ordernumber, $customerid, $orderstatusid, $paymentmode, $ordertotalprice, $totaldiscount, $paymentfulfilled, $houseno, $addressline1, $addressline2, $city, $state, $country, $zipcode, $mobileno, $createdby, $subscriberid)
		{
			parent::__construct();

			$this->ordernumber 		= $ordernumber;
			$this->customerid 		= $customerid;
			$this->orderstatusid	= $orderstatusid;
			$this->paymentmode		= $paymentmode;
			$this->ordertotalprice	= $ordertotalprice;
			$this->totaldiscount 	= $totaldiscount;
			$this->paymentfulfilled	= $paymentfulfilled;
			$this->houseno 			= $houseno;
			$this->addressline1		= $addressline1;
			$this->addressline2		= $addressline2;
			$this->city 			= $city;
			$this->state 			= $state;
			$this->country 			= $country;
			$this->zipcode 			= $zipcode;
			$this->mobileno 		= $mobileno;
			$this->createdby		= $createdby;
			$this->subscriberid		= $subscriberid; 
		}

		// Place an Order
		public function placeOrder()
		{

			// $db = Db::getInstance();

			$sql = "INSERT INTO orders (ordernumber, customerid, orderstatusid, paymentmode, ordertotalprice, totaldiscount, paymentfulfilled, houseno, addressline1, addressline2, city, state, country, zipcode, mobileno, createdby, subscriberid) VALUES(:ordernumber, :customerid, :orderstatusid, :paymentmode, :ordertotalprice, :totaldiscount, :paymentfulfilled, :houseno, :addressline1, :addressline2, :city, :state, :country, :zipcode, :mobileno, :createdby,:subscriberid)";

			// $sql2 = "INSERT INTO orderlineitems (orderid, bookid, quantity, bookprice, bookdiscount, actualprice, createdby) VALUES (:orderid, :bookid, :quantity, :bookprice, :bookdiscount, :actualprice, :createdby);";

			try
			{
				// $db->beginTransaction();

				$this->query($sql);

				$this->bind(':ordernumber', 		$this->ordernumber);
				$this->bind(':customerid', 			$this->customerid);
				$this->bind(':orderstatusid', 		$this->orderstatusid);
				$this->bind(':paymentmode', 		$this->paymentmode);
				$this->bind(':ordertotalprice', 	$this->ordertotalprice);
				$this->bind(':totaldiscount', 	  	$this->totaldiscount);
				$this->bind(':paymentfulfilled', 	$this->paymentfulfilled);
				$this->bind(':houseno', 			$this->houseno);
				$this->bind(':addressline1', 		$this->addressline1);
				$this->bind(':addressline2', 		$this->addressline2);
				$this->bind(':city', 				$this->city);
				$this->bind(':state', 				$this->state);
				$this->bind(':country', 			$this->country);
				$this->bind(':zipcode', 			$this->zipcode);
				$this->bind(':mobileno', 			$this->mobileno);
				$this->bind(':createdby', 			$this->createdby);
				$this->bind(':subscriberid', 		$this->subscriberid);

				$this->execute();

				if($this->lastInsertId())
				{
					echo "true";
				} else {
					echo "false";
				}

				// $values = array();
				// foreach($_POST as $key => $value){
				// 	$qvalue = mysql_real_escape_string($value);
				// 	$values = "($orderid, $bookid, $quantity, $bookprice, $bookdiscount, $actualprice, $createdby, $qvalue)";
				// }

				// $query_values = implode(',', $values);

				// $this->query("INSERT INTO orderlineitems (orderid, bookid, quantity, bookprice, bookdiscount, actualprice, createdby) VALUES $query_values;");

				// $this->query($sql2);

				// $this->bind(':orderid', 			$orderid);
				// $this->bind(':bookid', 				$bookid);
				// $this->bind(':quantity', 			$quantity);
				// $this->bind(':bookprice', 			$bookprice);
				// $this->bind(':bookdiscount', 		$bookdiscount);
				// $this->bind(':actualprice', 		$actualprice);
				// $this->bind(':createdby', 			$createdby);

				// $this->execute(); 

				// echo '{"notice": {"text": "Order Placed!"}';

				// if($this->lastInsertId()){

				// 	$sql2 = "INSERT INTO alert (customerid, alerttypeid, createdby, subscriberid) VALUES (:customerid, :alerttypeid, :createdby, :subscriberid);";

				// 	try{

				// 		// $db = model::getInstance();					

				// 		$this->query($sql2);

				// 		$this->bind(':customerid', 			$customerid);
				// 		$this->bind(':alerttypeid', 		$alerttypeid);
				// 		$this->bind(':createdby', 			$createdby);
				// 		$this->bind(':subscriberid', 		$subscriberid);

				// 		$this->execute();

				// 		echo "Alert sent!";

				// 	} 
				// 	catch(Exception $e)
				// 	{

				// 		echo 'Caught exception: ',  $e->getMessage(), "\n";

				// 	}
				// }

				// $db->commit();

			}
			catch(Exception $e)
			{
				// $db->rollback();
				echo 'Caught exception: ',  $e->getMessage(), "\n";
			}
		}



		// Get All Orders
		public function getOrders()
		{
			// Get Database Instance
			//$db = model::getInstance();

			try{

				//$db->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );

				//$db->beginTransaction();

				$this->query("CALL `zen`.`getAllOrders`()");

				$customer = $this->resultSet();

				header('Content-type: application/json');
				echo json_encode($customer);

				//$db->commit();

			}
			catch(Exception $e) 
			{
				//$db->rollBack();
				echo 'Caught exception: ',  $e->getMessage(), "\n";
			}
		}




		// Get Order Details by Id
		public function getOrderDetails($id)
		{
			

			try
			{
				$this->query("CALL `zen`.`getOrderDetails`(:id);");

				$this->bind(':id', $id);

				$customer = $this->resultSet();

				header('Content-type: application/json');
				echo json_encode($customer);

			}
			catch(Exception $e)
			{
				echo 'Caught exception: ',  $e->getMessage(), "\n";
			}
		} 



		// Get Order for Customer
		public function getOrderForCustomer($id)
		{

			try
			{
				$this->query("CALL `zen`.`getOrderForCustomer`(:id);");

				$this->bind(':id',		$id);

				$customer = $this->resultSet();

				header('Content-type: application/json');
				echo json_encode($customer);

			}
			catch(Exception $e)
			{
				echo 'Caught exception: ',  $e->getMessage(), "\n";
			}
		}



		// Update Order
		public function updateOrder($id, $orderstatusid, $modifiedby)
		{

			try
			{
				$this->query("CALL `zen`.`editOrder`(:orderstatusid, :modifiedby, :id)");

				$this->bind(':orderstatusid', 			$orderstatusid);
				$this->bind(':modifiedby', 				$modifiedby);
				$this->bind(':id',						$id);

				$this->execute();

				echo '{"notice": {"text": "Order Status Updated!"}';

			}
			catch(Exception $e)
			{
				echo 'Caught exception: ',  $e->getMessage(), "\n";
			}
		}









	}