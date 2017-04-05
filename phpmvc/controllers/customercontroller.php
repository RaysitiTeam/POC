<?php

	class CustomerController extends Controller
	{

		protected function getCustomer()
		{
			
			$viewmodel = new CustomerModel();

			$viewmodel->getAllCustomer();
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

			$viewmodel = new CustomerModel();

			$viewmodel->register($customername, $customertypeid, $dateofbirth, $lastlogindate, $userid, $password, $secretquestion, $secretanswer, $mobileno, $emailaddress, $createdby);

		}

		protected function login()
		{
	
			// Sanitize Post
			$_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

			$userid			=	$_POST['userid'];
			$password 		= 	$_POST['password'];

			$viewmodel = new CustomerModel();

			$viewmodel->login($userid, $password);

		}

		protected function changePassword()
		{

			$userid				= $_POST['userid'];
			$password			= $_POST['password'];

			$viewmodel = new CustomerModel();

			$viewmodel->changePassword($userid, $password);
		}

		protected function forgetPassword()
		{

			$userid			= $_POST['userid'];
			$emailaddress	= $_POST['emailaddress'];
			$secretanswer	= $_POST['secretanswer'];

			$viewmodel = new CustomerModel();

			$viewmodel->forgetPassword($userid, $emailaddress, $secretanswer);	
		}

		protected function updateCustomer()
		{

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

			$viewmodel = new CustomerModel();

			$viewmodel->updateCustomer($customername, $customertypeid, $dateofbirth, $mobileno, $emailaddress, $customeraddresstype, $houseno, $addressline1, $addressline2, $city, $state, $country, $zipcode, $modifiedby);	
		}
	}