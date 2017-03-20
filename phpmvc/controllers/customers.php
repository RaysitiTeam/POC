<?php

	class Customers extends Controller
	{
		protected function Index()
		{
			$viewmodel = new CustomerModel();
			$this->ReturnView($viewmodel->Index(), true);
		}

		protected function getCustomer()
		{
			$viewmodel = new CustomerModel();
			$this->ReturnView($viewmodel->getAllCustomer(), true);
		}

		protected function register()
		{
			$viewmodel = new CustomerModel();
			$this->ReturnView($viewmodel->register(), true);
		}

		protected function login()
		{
			$viewmodel = new CustomerModel();
			$this->ReturnView($viewmodel->login(), true);
		}

		protected function changePassword()
		{
			$viewmodel = new CustomerModel();
			$this->ReturnView($viewmodel->changePassword(), true);
		}

		protected function forgetPassword()
		{
			$viewmodel = new CustomerModel();
			$this->ReturnView($viewmodel->forgetPassword(), true);	
		}

		protected function updateCustomer()
		{
			$viewmodel = new CustomerModel();
			$this->ReturnView($viewmodel->updateCustomer(), true);	
		}
	}