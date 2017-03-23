<?php

	class OrderModel extends Model
	{

		// Place an Order
		public function placeOrder($ordernumber, $customerid, $orderstatusid, $paymentmode, $ordertotalprice, $totaldiscount, $paymentfulfilled, $houseno, $addressline1, $addressline2, $city, $state, $country, $zipcode, $mobileno, $createdby, $subscriberid, $bookid, $quantity, $bookprice, $bookdiscount, $actualprice)
		{

			$sql ="CALL `zen`.`placeOrder`(:ordernumber, :customerid, :orderstatusid, :paymentmode, :ordertotalprice, :totaldiscount, :paymentfulfilled, :houseno, :addressline1, :addressline2, :city, :state, :country, :zipcode, :mobileno, :createdby, :subscriberid, :bookid, :quantity, :bookprice, :bookdiscount, :actualprice);";

			try
			{
				$this->query($sql);

				$this->bind(':ordernumber', 		$ordernumber);
				$this->bind(':customerid', 			$customerid);
				$this->bind(':orderstatusid', 		$orderstatusid);
				$this->bind(':paymentmode', 		$paymentmode);
				$this->bind(':ordertotalprice', 	$ordertotalprice);
				$this->bind(':totaldiscount', 	  	$totaldiscount);
				$this->bind(':paymentfulfilled', 	$paymentfulfilled);
				$this->bind(':houseno', 			$houseno);
				$this->bind(':addressline1', 		$addressline1);
				$this->bind(':addressline2', 		$addressline2);
				$this->bind(':city', 				$city);
				$this->bind(':state', 				$state);
				$this->bind(':country', 			$country);
				$this->bind(':zipcode', 			$zipcode);
				$this->bind(':mobileno', 			$mobileno);
				$this->bind(':createdby', 			$createdby);
				$this->bind(':subscriberid', 		$subscriberid);
				$this->bind(':bookid', 				$bookid);
				$this->bind(':quantity', 			$quantity);
				$this->bind(':bookprice', 			$bookprice);
				$this->bind(':bookdiscount', 		$bookdiscount);
				$this->bind(':actualprice', 		$actualprice);

				$this->execute();

				echo '{"notice": {"text": "Order Placed!"}';

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
			}
			catch(Exception $e)
			{
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