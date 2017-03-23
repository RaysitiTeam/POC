<?php

	//require('models/user.php');

	class Users extends Controller
	{
		//public static $instance;

		protected function register()
		{

			$viewmodel = new UserModel();

			// Sanitize Post
			$_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

			$name 		= $_POST['name'];
			$email 		= $_POST['email'];
			$password 	= $_POST['password'];

			
			$this->ReturnView($viewmodel->register($name, $email, $password), true);
		}

		protected function login()
		{
			$viewmodel = new UserModel();

			// Sanitize Post
			$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

			$email		=	$_POST['email'];
			$password 	= 	md5($post['password']);

			$this->ReturnView($viewmodel->login($email, $password), true);
		}
	}



	