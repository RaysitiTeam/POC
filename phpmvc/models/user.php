<?php

	//include('controllers/users.php');
	
	class UserModel extends Model
	{

		public function register($name, $email, $password)
		{

				// Insert into mysql
				$this->query('INSERT INTO users(name, email, password) VALUES(:name, :email, :password)');
				$this->bind(':name', 		$name);
				$this->bind(':email', 		$email);
				$this->bind(':password', 	$password);

				$result = $this->execute();

				if($this->lastInsertId()) {
					echo json_encode("true");
				} else {
					echo json_encode("false");
				}

		}

		public function login()
		{

				// Compare Login
				$this->query('SELECT * FROM users WHERE email = :email AND password = :password');
				$this->bind(':email', 		$email);
				$this->bind(':password', 	$password);

				$row = $this->single();
			
				if($row){
					echo json_encode("true");
				} else {
					echo json_encode("false");
				}
		}
	}