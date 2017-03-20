<?php

	class CustomerModel extends Model 
	{

		public function Index()
		{
			echo "Manjeet";
		}


		// Customer Registration
		public function register()
		{
			// Get Database Instance
			//$db = model::getInstance();

			// Senitize Post data
			$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

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
			$houseno				= $_POST['houseno'];
			$addressline1			= $_POST['addressline1'];
			$addressline2			= $_POST['addressline2'];
			$city 					= $_POST['city'];
			$state 					= $_POST['state'];
			$country 				= $_POST['country'];
			$zipcode 				= $_POST['zipcode'];
			$createdby 				= $_POST['createdby'];

			$sql = "CALL `zen`.`registerCustomer`(:customername, :customertypeid, :dateofbirth, :lastlogindate, :userid, :password, :secretquestion, :secretanswer, :mobileno, :emailaddress, :customeraddresstype, :houseno, :addressline1, :addressline2, :city, :state, :country, :zipcode, :createdby)";

			
			try
			{

				//$db->beginTransaction();

				$this->query($sql);

				// Bind the value
				$this->bind(':customername', 		$customername);
				$this->bind(':customertypeid', 		$customertypeid);
				$this->bind(':dateofbirth', 		$dateofbirth);
				$this->bind(':lastlogindate', 		$lastlogindate);
				$this->bind(':userid', 				$userid);
				$this->bind(':password', 			$password);
				$this->bind(':secretquestion', 		$secretquestion);
				$this->bind(':secretanswer', 		$secretanswer);
				$this->bind(':mobileno', 			$mobileno);
				$this->bind(':emailaddress', 		$emailaddress);
				$this->bind(':customeraddresstype',	$customeraddresstype);
				$this->bind(':houseno', 			$houseno);
				$this->bind(':addressline1', 		$addressline1);
				$this->bind(':addressline2', 		$addressline2);
				$this->bind(':city', 				$city);
				$this->bind(':state', 				$state);
				$this->bind(':country', 			$country);
				$this->bind(':zipcode', 			$zipcode);
				$this->bind(':createdby', 			$createdby);

				$register = $this->execute();

				//Verify
				if($register)
				{
					echo json_encode('true');
					echo "Successfully Registered!";
				}
				else
				{
					echo json_encode('false');
					echo "Failed";
				}

				//$db->commit();

			}
			catch(Exception $e)
			{
				//$db->rollBack();

				echo 'Caught exception: ',  $e->getMessage(), "\n";
			}
		}


		// Customer Login
		public function login()
		{

			date_default_timezone_set("Asia/Kolkata");
			$currentDate = date('Y-m-d g:i:sA');

			// Sanitize Post
			$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

			$userid			=	$_POST['userid'];
			$password 		= 	$_POST['password'];

			$sqllogin = 'SELECT * FROM customer WHERE userid = :userid AND password = :password';

			$sqllast = 'UPDATE customer SET lastlogindate = :lastlogindate WHERE userid = :userid AND password = :password';

			try
			{

				// Compare Login
				$this->query($sqllogin);

				$this->bind(':userid', 		$userid, PDO::PARAM_STR);
				$this->bind(':password', 	$password, PDO::PARAM_STR);

				$row = $this->single();
			
				if($row){

					echo json_encode("true");

					$this->query($sqllast);

					$this->bind(':lastlogindate', 	$currentDate, PDO::PARAM_STR);
					$this->bind(':userid', 			$userid, PDO::PARAM_STR);
					$this->bind(':password', 		$password, PDO::PARAM_STR);

					$this->execute();

					echo "\n Login Success!";

				} else {
					echo json_encode("false");
				}
			}
			catch(Exception $e)
			{
				echo 'Caught exception: ',  $e->getMessage(), "\n";
			}
		}



		// Get All Customers Details
		public function getAllCustomer()
		{
			// Get Database Instance
			//$db = model::getInstance();

			try{

				//$db->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );

				//$db->beginTransaction();

				$this->query("CALL `zen`.`getAllCustomers`()");
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


		// Change Password
		public function changePassword()
		{


			$userid				= $_POST['userid'];
			$password			= $_POST['password'];

			$sqloldpass = "SELECT customerid, customername, password, emailaddress FROM customer WHERE userid = :userid";

			$sqlupdatepass = "UPDATE customer SET 
							password = :password 
						WHERE userid = :userid";

			try
			{

				// $db->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
				//$model = model::getInstance();

				//$model->beginTransaction();

				$this->query($sqloldpass);

				$this->bind(":userid", $userid, PDO::PARAM_STR);

				$this->execute();

				$result = $this->fetch();

				// header('Content-type: application/json');
				// echo json_encode($result);

				$oldpassword 	= $result['password'];
				$customerid 	= $result['customerid'];
				$emailaddress 	= $result['emailaddress'];
				$customername	= $result['customername'];

				//echo "Old Password " . $oldpassword;

				if($customerid != null)
				{
					$this->query($sqlupdatepass);

					$this->bind(':userid', 		$userid, PDO::PARAM_STR);
					$this->bind(':password', 	$password, PDO::PARAM_STR);


					if($password == $oldpassword) {

						echo "Please enter new Password. Your old password is " .$oldpassword. ".";

					} else if($password == null){ 

						echo "Please enter a valid Password.";

					} else if($userid == null) {

						echo "Please enter a valid userid!";

					}else if(strlen($password)>25 || strlen($password)<8) {

						echo "Password must be betwwen 8 & 25";

					} else {

						$update = $this->execute();
						echo "New Password " . $password;

						if($update) {

							
							

						}	
						
					}

				}
				//$db->commit();
			}
			catch(Exception $e)
			{
				//$db->rollBack();
				echo 'Caught exception: ',  $e->getMessage(), "\n";
			}

		}



		// Forget Password
		public function forgetPassword()
		{
			$userid			= $_POST['userid'];
			$emailaddress	= $_POST['emailaddress'];
			$secretanswer	= $_POST['secretanswer'];



			$sqlsecretqus = "SELECT customerid, userid, secretquestion, secretanswer FROM customer WHERE emailaddress = :emailaddress AND secretanswer = :secretanswer";

			try
			{

				$this->query($sqlsecretqus );

				$this->bind(':emailaddress', $emailaddress, PDO::PARAM_STR);
				$this->bind(':secretanswer', $secretanswer, PDO::PARAM_STR);

				$this->execute();

				$result = $this->fetch();

				$customerid 		= $result['customerid'];
				$userid				= $result['userid'];
				$secretquestion 	= $result['secretquestion'];
				$rightsecretanswer 	= $result['secretanswer'];

				if($rightsecretanswer == $secretanswer && $rightsecretanswer != null) {

					echo $customerid . "\n" . $userid . "\n";

					echo "Password reset link sent to your Registered email address.";

					// Send a Verification Email

					// Alert record created

				} else {

					echo "Your Secret Answer is Wrong. Please enter correct Secret Answer!";

				}
			}
			catch(Exception $e)
			{
				echo 'Caught exception: ',  $e->getMessage(), "\n";
			}

		}



		// Update Customer
		public function updateCustomer()
		{

			$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

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

			$sqlupdate = "CALL `zen`.`editCustomer`(:customername, :customertypeid, :dateofbirth, :mobileno, :emailaddress, :customeraddresstype, :houseno, :addressline1, :addressline2, :city, :state, :country, :zipcode, :modifiedby, :id)";

			try
			{

				$this->query($sqlupdate);

				$this->bind(':customername', 			$customername);
				$this->bind(':customertypeid', 			$customertypeid);
				$this->bind(':dateofbirth', 			$dateofbirth);
				$this->bind(':mobileno', 				$mobileno);
				$this->bind(':emailaddress', 			$emailaddress);
				$this->bind(':customeraddresstype', 	$customeraddresstype);
				$this->bind(':houseno', 				$houseno);
				$this->bind(':addressline1', 			$addressline1);
				$this->bind(':addressline2', 			$addressline2);
				$this->bind(':city', 					$city);
				$this->bind(':state', 					$state);
				$this->bind(':country', 				$country);
				$this->bind(':zipcode', 				$zipcode);
				$this->bind(':modifiedby', 				$modifiedby);
				$this->bind(':id',						$id);

				$this->execute();

				echo "Update Successfully!";

			}
			catch(Exception $e)
			{
				echo 'Caught exception: ',  $e->getMessage(), "\n";
			}

		}



	}