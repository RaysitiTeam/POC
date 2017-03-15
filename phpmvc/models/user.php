<?php

	class UserModel extends Model
	{
		public function register()
		{
			// Sanitize Post
			$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

			$name		=	$_POST['name'];
			$email		=	$_POST['email'];
			$password 	= 	md5($post['password']);

				// Insert into mysql
				$this->query('INSERT INTO users(name, email, password) VALUES(:name, :email, :password)');
				$this->bind(':name', 		$name);
				$this->bind(':email', 		$email);
				$this->bind(':password', 	$password);

				$this->execute();

		}

		public function login()
		{
			// Sanitize Post
			$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

			$email		=	$_POST['email'];
			$password 	= 	md5($post['password']);

			if($post['submit']) {
				// Compare Login
				$this->query('SELECT * FROM users WHERE email = :email AND password = :password');
				$this->bind(':email', 		$email;
				$this->bind(':password', 	$password);

				$row = $this->single();
			
				if($row){
					echo "Logged In." ;
				} else {
					echo "Incorrect Login.";
				}
			}
			return;
		}
	}