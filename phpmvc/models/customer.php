<?php

	class CustomerRegister extends Model 
	{

		public $customername;
		public $customertypeid;
		public $dateofbirth;
		public $lastlogindate;
		public $userid;
		public $password;
		public $secretquestion;
		public $secretanswer;
		public $mobileno;
		public $emailaddress;
		public $createdby;

		public function __construct($customername, $customertypeid, $dateofbirth, $lastlogindate, $userid, $password, $secretquestion, $secretanswer, $mobileno, $emailaddress, $createdby)
		{
			$this->customername 	= $customername;
			$this->customertypeid 	= $customertypeid;
			$this->dateofbirth		= $dateofbirth;
			$this->lastlogindate	= $lastlogindate;
			$this->userid			= $userid;
			$this->password 		= $password;
			$this->secretquestion 	= $secretquestion;
			$this->secretanswer 	= $secretanswer;
			$this->mobileno 		= $mobileno;
			$this->emailaddress		= $emailaddress;
			$this->createdby		= $createdby;

			echo $customername;

			$viewmodel->register();
		}

		// public function Index()
		// {
		// 	echo "Manjeet";
		// }


		// Customer Registration
		public function register()
		{
			
			$db = Db::getInstance();

			$sql = "INSERT INTO customer (customername, customertypeid, dateofbirth, lastlogindate, userid, password, secretquestion, secretanswer, mobileno, emailaddress, createdby) VALUES (:customername, :customertypeid, :dateofbirth, :lastlogindate, :userid, :password, :secretquestion, :secretanswer, :mobileno, :emailaddress, :createdby)";
			
			try
			{

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
				$this->bind(':createdby', 			$createdby);

				$this->execute();

				//Verify
				if($this->lastInsertId())
				{
					echo json_encode('true');
					// echo "Successfully Registered!";
				}
				else
				{
					echo json_encode('false');
					// echo "Failed";
				}

			}
			catch(Exception $e)
			{

				echo 'Caught exception: ',  $e->getMessage(), "\n";
			}
		}
	}


		// Customer Login
		// public function login($userid, $password)
		// {

		// 	$db = Db::getInstance();

		// 	date_default_timezone_set("Asia/Kolkata");
		// 	$currentDate = date('Y-m-d g:i:sA');

		// 	$sqllogin = 'SELECT * FROM customer WHERE userid = :userid AND password = :password';

		// 	$sqllast = 'UPDATE customer SET lastlogindate = :lastlogindate WHERE userid = :userid AND password = :password';

		// 	try
		// 	{

		// 		$db->beginTransaction();

		// 		// Compare Login
		// 		$this->query($sqllogin);

		// 		$this->bind(':userid', 		$userid, PDO::PARAM_STR);
		// 		$this->bind(':password', 	$password, PDO::PARAM_STR);

		// 		$row = $this->single();
			
		// 		if($row){

		// 			echo json_encode("true");

		// 			$this->query($sqllast);

		// 			$this->bind(':lastlogindate', 	$currentDate, PDO::PARAM_STR);
		// 			$this->bind(':userid', 			$userid, PDO::PARAM_STR);
		// 			$this->bind(':password', 		$password, PDO::PARAM_STR);

		// 			$this->execute();

		// 			echo "\n Login Success!";

		// 		} else {
		// 			echo json_encode("false");
		// 		}

		// 		$db->commit();

		// 	}
		// 	catch(Exception $e)
		// 	{
		// 		$db->rollback();
		// 		echo 'Caught exception: ',  $e->getMessage(), "\n";
		// 	}
		// }

	class GetCustomer extends Model
	{

		// Get All Customers Details
		public function getAllCustomer()
		{
			// Get Database Instance
			//$db = model::getInstance();

			try{

				$this->query("CALL `zen`.`getAllCustomers`()");
				// $customer = $this->resultSet();

				// header('Content-type: application/json');
				// echo json_encode($customer);
				$rows = $this->resultSet();
				echo json_encode($rows);

			}
			catch(Exception $e) 
			{
				echo 'Caught exception: ',  $e->getMessage(), "\n";
			}

		}


		// Change Password
		public function changePassword($userid, $password)
		{

			$sqloldpass = "SELECT customerid, customername, password, emailaddress FROM customer WHERE userid = :userid";

			$sqlupdatepass = "UPDATE customer SET 
							password = :password 
						WHERE userid = :userid";

			try
			{

				$db->beginTransaction();

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
		public function forgetPassword($userid, $emailaddress, $secretanswer)
		{
	
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
		public function updateCustomer($customername, $customertypeid, $dateofbirth, $mobileno, $emailaddress, $customeraddresstype, $houseno, $addressline1, $addressline2, $city, $state, $country, $zipcode, $modifiedby)
		{

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