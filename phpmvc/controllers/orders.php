<?php

	class Orders extends Controller
	{
		protected function Index()
		{
			$viewmodel = new OrderModel();
			$this->ReturnView($viewmodel->Index(), true);
		}

		protected function getOrders()
		{
			$viewmodel = new OrderModel();
			$this->ReturnView($viewmodel->getOrders(), true);
		}

		protected function placeOrder()
		{
			$viewmodel = new OrderModel();
			$this->ReturnView($viewmodel->placeOrder(), true);
		}

		protected function getOrderDetails()
		{
			$viewmodel = new OrderModel();
			$this->ReturnView($viewmodel->getOrderDetails(), true);
		}

		protected function getOrderForCustomer()
		{
			$viewmodel = new OrderModel();
			$this->ReturnView($viewmodel->getOrderForCustomer(), true);
		}

		protected function updateOrder()
		{
			$viewmodel = new OrderModel();
			$this->ReturnView($viewmodel->updateOrder(), true);
		}
	}