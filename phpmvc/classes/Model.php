<?php
	class Model
	{
		public static $_instance;		// The single instance
		protected $dbh;
		protected $stmt;

		// Get an instance of the Database 
	    // @return  instance
	    public static function getInstance()
	    {
	    	if(!self::$_instance){
	    		// If no instance then make one
	    		self::$_instance = new self();
	    	}

	    	return self::$_instance;
	    }

		public function __construct()
		{
			$this->dbh = new PDO("mysql:host=".DB_HOST.";dbname=".DB_NAME, DB_USER, DB_PASS);
		}

		public function query($query)
		{
			$this->stmt = $this->dbh->prepare($query);
		}

		//Binds the prep statement
		public function bind($param, $value, $type = null)
		{
	 		if (is_null($type)) {
	  			switch (true) {
	    			case is_int($value):
	      				$type = PDO::PARAM_INT;
	      				break;
	    			case is_bool($value):
	      				$type = PDO::PARAM_BOOL;
	      				break;
	    			case is_null($value):
	      				$type = PDO::PARAM_NULL;
	      				break;
	    				default:
	      				$type = PDO::PARAM_STR;
	  			}
			}
			$this->stmt->bindValue($param, $value, $type);
		}

		public function execute()
		{
			$this->stmt->execute();
		}

		public function resultSet()
		{
			$this->execute();
			return $this->stmt->fetchAll(PDO::FETCH_ASSOC);
		}

		public function fetch()
		{
			$this->execute();
			return $this->stmt->fetch();
		}

		public function lastInsertId()
		{
			return $this->dbh->lastInsertId();
		}

		public function single()
		{
			$this->execute();
			return $this->stmt->fetch(PDO::FETCH_ASSOC);
		}
	}






	