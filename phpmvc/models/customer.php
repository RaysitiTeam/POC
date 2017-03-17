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
			// Senitize Post data
			$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

			$customername 		= $_POST['customername'];
			$customertypeid		= $_POST['customertypeid'];
			$dateofbirth		= $_POST['dateofbirth'];
			$lastlogindate		= $_POST['lastlogindate'];
			$userid				= $_POST['userid'];
			$password			= $_POST['password'];
			$secretquestion		= $_POST['secretquestion'];
			$secretanswer		= $_POST['secretanswer'];
			$mobileno			= $_POST['mobileno'];
			$emailaddress		= $_POST['emailaddress'];
			$createdby			= $_POST['createdby'];

			$sql = "INSERT INTO customer (customername, customertypeid, dateofbirth, lastlogindate, userid, password, secretquestion, secretanswer, mobileno, emailaddress, createdby) VALUES (:customername, :customertypeid, :dateofbirth, :lastlogindate, :userid, :password, :secretquestion, :secretanswer, :mobileno, :emailaddress, :createdby)";

			try
			{
				// Insert into mysql
				$this->query($sql);

				// Bind the value
				$this->bind(':customername', 		$customername);
				$this->bind(':customertypeid',		$customertypeid);
				$this->bind(':dateofbirth',			$dateofbirth);
				$this->bind(':lastlogindate',		$lastlogindate);
				$this->bind(':userid',				$userid);
				$this->bind(':password',			$password);
				$this->bind(':secretquestion',		$secretquestion);
				$this->bind(':secretanswer',		$secretanswer);
				$this->bind(':mobileno',			$mobileno);
				$this->bind(':emailaddress',		$emailaddress);
				$this->bind(':createdby',			$createdby);

				$this->execute();

				// Verify
				if($this->lastInsertId())
				{
					echo json_encode('true');
					echo "Successfully Registered!";
				}
				else
				{
					echo json_encode('false');
					echo "Failed";
				}
			}
			catch(Exception $e)
			{
				echo "Error";
			}
		}



		// Get All Customers Details
		public function getAllCustomer()
		{
			$this->query("CALL `zen`.`getAllCustomers`()");
			$rows = $this->resultSet();
			header('Content-type: application/json');
			echo json_encode($rows);
		}
	}