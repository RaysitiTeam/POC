<?php
	header("Access-Control-Allow-Origin: null");
	// Include Config 
	require('config.php');

	// Include Bootstrap.php for URL calling
	require('classes/Bootstrap.php');
	require('classes/Controller.php');
	require('classes/Model.php');

	// Require Controllers
	require('controllers/home.php');
	require('controllers/shares.php');
	require('controllers/users.php');
	require('controllers/customers.php');

	// Require Models
	require('models/home.php');
	require('models/share.php');
	require('models/user.php');
	require('models/customer.php');

	$bootstrap = new Bootstrap($_GET);

	$controller = $bootstrap->createController();

	if($controller){
		$controller->executeAction();
	}
