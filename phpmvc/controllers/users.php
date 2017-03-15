<?php

	class Users extends Controller
	{
		public function register()
		{
			$viewmodel = new UserModel();
			$this->ReturnView($viewmodel->register(), true);
		}

		public function login()
		{
			$viewmodel = new UserModel();
			$this->ReturnView($viewmodel->login(), true);
		}
	}



	