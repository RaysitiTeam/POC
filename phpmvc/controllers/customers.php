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
			
			$viewmodel = new GetCustomer();

			$this->ReturnView($viewmodel->getAllCustomer(), true);
		}

		protected function register()
		{
			

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
			$createdby 				= $_POST['createdby'];

			$viewmodel = new CustomerRegister($customername, $customertypeid, $dateofbirth, $lastlogindate, $userid, $password, $secretquestion, $secretanswer, $mobileno, $emailaddress, $createdby);

			//echo $register->customername;

			//$this->ReturnView($viewmodel->register($customername, $customertypeid, $dateofbirth, $lastlogindate, $userid, $password, $secretquestion, $secretanswer, $mobileno, $emailaddress, $createdby), true);
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