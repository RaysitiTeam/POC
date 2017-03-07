<?php

	class UserModel extends Model
	{
		public function register()
		{
			// Sanitize Post
			$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

			$password = md5($post['password']);

			if($post['submit']) {
				// Insert into mysql
				$this->query('INSERT INTO users(name, email, password) VALUES(:name, :email, :password)');
				$this->bind(':name', 		$post['name']);
				$this->bind(':email', 		$post['email']);
				$this->bind(':password', 	$password);

				$this->execute();

				// Verify
				if($this->lastInsertId()){
					// Redirect
					header('Location: '.ROOT_URL.'users/login');
				}
			}
			return;
		}

		public function login()
		{
			// Sanitize Post
			$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

			$password = md5($post['password']);

			if($post['submit']) {
				// Compare Login
				$this->query('SELECT * FROM users WHERE email = :email AND password = :password');
				$this->bind(':email', 		$post['email']);
				$this->bind(':password', 	$password);

				$row = $this->single();
			
				if($row){
					echo "Logged In.";
				} else {
					echo "Incorrect Login.";
				}
			}
			return;
		}
	}