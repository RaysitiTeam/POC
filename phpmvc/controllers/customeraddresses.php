<?php

	class CustomerAddresses extends Controller
	{
		protected function Index()
		{
			$viewmodel = new CustomerAddressModel();
			$this->ReturnView($viewmodel->Index(), true);
		}

		protected function addCustomerAddress()
		{
			$viewmodel = new CustomerAddressModel();

			$_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);


				$customerid 			= $_POST['customerid'];
				$customeraddresstype 	= $_POST['customeraddresstype'];
				$houseno 				= $_POST['houseno'];
				$addressline1 			= $_POST['addressline1'];
				$addressline2 			= $_POST['addressline2'];
				$city 					= $_POST['city'];
				$state					= $_POST['state'];
				$country 				= $_POST['country'];
				$zipcode 				= $_POST['zipcode'];
				$createdby 				= $_POST['createdby'];

				$final_array = array();
					$length = count($customerid);
						for($i = 0; $i < $length; $i++) 
						{
						    $final_array[$i]['customerid'] 			= $customerid[$i];
						    $final_array[$i]['customeraddresstype'] = $customeraddresstype[$i];
						    $final_array[$i]['houseno'] 			= $houseno[$i];
						    $final_array[$i]['addressline1'] 		= $addressline1[$i];
						    $final_array[$i]['addressline2'] 		= $addressline2[$i];
						    $final_array[$i]['city'] 				= $city[$i];
						    $final_array[$i]['state'] 				= $state[$i];
						    $final_array[$i]['country'] 			= $country[$i];
						    $final_array[$i]['zipcode'] 			= $zipcode[$i];
						    $final_array[$i]['createdby'] 			= $createdby[$i];
					    
						}

			//print_r($customerid);

			$this->ReturnView($viewmodel->addCustomerAddress($final_array), true);
		}

	}