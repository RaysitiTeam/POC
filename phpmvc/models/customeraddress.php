<?php

	class CustomerAddressModel extends Model
	{
		public function Index()
		{
			echo "Manjeet";
		}

		public function addCustomerAddress($customerid, $customeraddresstype, $houseno, $addressline1, $addressline2, $city, $state, $country, $zipcode, $createdby)
		{
			$db = Db::getInstance();

			$sql = "INSERT INTO customeraddress (customerid, customeraddresstype, houseno, addressline1, addressline2, city, state, country, zipcode, createdby) VALUES (:customerid, :customeraddresstype, :houseno, :addressline1, :addressline2, :city, :state, :country, :zipcode, :createdby)";

			try
			{
				
				$this->query($sql);

				$this->bind(':customerid', 			$customerid);
				$this->bind('customeraddresstype', 	$customeraddresstype);
				$this->bind(':houseno', 			$houseno);
				$this->bind(':addressline1', 		$addressline1);
				$this->bind(':addressline2', 		$addressline2);
				$this->bind(':city',				$city);
				$this->bind(':state', 				$state);
				$this->bind(':country', 			$country);
				$this->bind(':zipcode',				$zipcode);
				$this->bind(':createdby',			$createdby);

				$this->execute();

				if ($this->lastInsertId()) {
					echo "Address Added Successfully!";
				}

			}
			catch(Exception $e)
			{
				echo 'Caught exception: ',  $e->getMessage(), "\n";
			}
		}


	}