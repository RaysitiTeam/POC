<?php

	class Customers extends Controller
	{
		protected function Index()
		{
			$viewmodel = new CustomerModel();
			$this->ReturnView($viewmodel->Index(), true);
		}

		protected function getCustomer()
		{
			
			$viewmodel = new CustomerModel();

			

			$this->ReturnView($viewmodel->getAllCustomer(), true);
		}

		protected function register()
		{
			$viewmodel = new CustomerModel();

			// Senitize Post data
			$_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

			$customername 			= $_POST['customername'];
			$customertypeid 		= $_POST['customertypeid'];
			$dateofbirth 			= $_POST['dateofbirth'];
			$lastlogindate 			= $_POST['lastlogindate'];
			$userid 				= $_POST['userid'];
			$password 				= $_POST['password'];
			$secretquestion 		= $_POST['secretquestion'];
			$secretanswer 			= $_POST['secretanswer'];
			$mobileno 				= $_POST['mobileno'];
			$emailaddress 			= $_POST['emailaddress'];
			$customeraddresstype 	= $_POST['customeraddresstype'];
			$houseno_array				= $_POST['houseno'];
			$addressline1_array			= $_POST['addressline1'];
			$addressline2_array			= $_POST['addressline2'];
			$city_array 				= $_POST['city'];
			$state_array 				= $_POST['state'];
			$country_array 				= $_POST['country'];
			$zipcode_array 				= $_POST['zipcode'];
			//$createdby 				= $_POST['createdby'];

			for ($i=0; $i <= $_POST['city']; $i++) { 
				
				$houseno 		= $_POST['houseno'][$i];
				$addressline1 	= $_POST['addressline1'][$i];
				$addressline2 	= $_POST['addressline2'][$i];
				$city 			= $_POST['city'][$i];
				$state 			= $_POST['state'][$i];
				$country 		= $_POST['country'][$i];
				$zipcode 		= $_POST['zipcode'][$i];
				$createdby 		= $_POST['createdby'][$i];
			}

			$this->ReturnView($viewmodel->register($customername, $customertypeid, $dateofbirth, $lastlogindate, $userid, $password, $secretquestion, $secretanswer, $mobileno, $emailaddress, $customeraddresstype, $houseno, $addressline1, $addressline2, $city, $state, $country, $zipcode, $createdby), true);
		}

		protected function login()
		{
			$viewmodel = new CustomerModel();

			// Sanitize Post
			$_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

			$userid			=	$_POST['userid'];
			$password 		= 	$_POST['password'];

			$this->ReturnView($viewmodel->login($userid, $password), true);
		}

		protected function changePassword()
		{
			$viewmodel = new CustomerModel();

			$userid				= $_POST['userid'];
			$password			= $_POST['password'];

			$this->ReturnView($viewmodel->changePassword($userid, $password), true);
		}

		protected function forgetPassword()
		{
			$viewmodel = new CustomerModel();

			$userid			= $_POST['userid'];
			$emailaddress	= $_POST['emailaddress'];
			$secretanswer	= $_POST['secretanswer'];

			$this->ReturnView($viewmodel->forgetPassword($userid, $emailaddress, $secretanswer), true);	
		}

		protected function updateCustomer()
		{
			$viewmodel = new CustomerModel();

			$_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

			$id = $_POST['id'];

			$customername 			= $_POST['customername'];
			$customertypeid 		= $_POST['customertypeid'];
			$dateofbirth 			= $_POST['dateofbirth'];
			$mobileno 				= $_POST['mobileno'];
			$emailaddress 			= $_POST['emailaddress'];
			$customeraddresstype 	= $_POST['customeraddresstype'];
			$houseno 				= $_POST['houseno'];
			$addressline1 			= $_POST['addressline1'];
			$addressline2 			= $_POST['addressline2'];
			$city 					= $_POST['city'];
			$state 					= $_POST['state'];
			$country 				= $_POST['country'];
			$zipcode 				= $_POST['zipcode'];
			$modifiedby 			= $_POST['modifiedby'];

			$this->ReturnView($viewmodel->updateCustomer($customername, $customertypeid, $dateofbirth, $mobileno, $emailaddress, $customeraddresstype, $houseno, $addressline1, $addressline2, $city, $state, $country, $zipcode, $modifiedby), true);	
		}
	}