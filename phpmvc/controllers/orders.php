<?php

	class Orders extends Controller
	{
		protected function Index()
		{
			$viewmodel = new OrderModel();
			$this->ReturnView($viewmodel->Index(), true);
		}

		protected function getOrders()
		{
			$viewmodel = new OrderModel();
			$this->ReturnView($viewmodel->getOrders(), true);
		}

		protected function placeOrder()
		{
			$viewmodel = new OrderModel();

			$_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

			$ordernumber 		= $_POST['ordernumber'];
			$customerid 		= $_POST['customerid'];
			$orderstatusid 		= $_POST['orderstatusid'];
			$paymentmode 		= $_POST['paymentmode'];
			$ordertotalprice 	= $_POST['ordertotalprice'];
			$totaldiscount 		= $_POST['totaldiscount'];
			$paymentfulfilled 	= $_POST['paymentfulfilled'];
			$houseno 			= $_POST['houseno'];
			$addressline1 		= $_POST['addressline1'];
			$addressline2 		= $_POST['addressline2'];
			$city 				= $_POST['city'];
			$state 				= $_POST['state'];
			$country 			= $_POST['country'];
			$zipcode 			= $_POST['zipcode'];
			$mobileno 			= $_POST['mobileno'];
			$createdby 			= $_POST['createdby'];
			$subscriberid 		= $_POST['subscriberid'];
			$bookid_array 				= $_POST['bookid'];
			$quantity_array 			= $_POST['quantity'];
			$bookprice_array 			= $_POST['bookprice'];
			$bookdiscount_array 		= $_POST['bookdiscount'];
			$actualprice_array	 		= $_POST['actualprice'];
			// $alerttypeid 		= $_POST['alerttypeid'];

			for ($i=0; $i < count($bookid_array); $i++) { 
				
				$bookid 		= mysql_real_escape_string($bookid_array[$i]);
				$quantity	 	= mysql_real_escape_string($quantity_array[$i]);
				$bookprice		= mysql_real_escape_string($bookprice_array[$i]);
				$bookdiscount 	= mysql_real_escape_string($bookdiscount_array[$i]);
				$actualprice 	= mysql_real_escape_string($actualprice_array[$i]);
			}




			$this->ReturnView($viewmodel->placeOrder($ordernumber, $customerid, $orderstatusid, $paymentmode, $ordertotalprice, $totaldiscount, $paymentfulfilled, $houseno, $addressline1, $addressline2, $city, $state, $country, $zipcode, $mobileno, $createdby, $subscriberid, $bookid, $quantity, $bookprice, $bookdiscount, $actualprice), true);
		}

		protected function getOrderDetails()
		{
			$viewmodel = new OrderModel();

			$id = $_POST['id'];

			$this->ReturnView($viewmodel->getOrderDetails($id), true);
		}

		protected function getOrderForCustomer()
		{
			$viewmodel = new OrderModel();

			$id = $_POST['id'];

			$this->ReturnView($viewmodel->getOrderForCustomer($id), true);
		}

		protected function updateOrder()
		{
			$viewmodel = new OrderModel();

			$id = $_POST['id'];

			$orderstatusid 			= $_POST['orderstatusid'];
			$modifiedby 			= $_POST['modifiedby'];

			$this->ReturnView($viewmodel->updateOrder($id, $orderstatusid, $modifiedby), true);
		}
	}