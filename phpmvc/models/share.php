<?php

	class ShareModel extends Model
	{
		public function Index()
		{
			$this->query('SELECT * FROM shares');
			$rows = $this->resultSet();
			echo json_encode($rows);
		}

		public function add()
		{
			// Sanitize Post
			$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

			if($post['submit']) {
				$this->query('INSERT INTO shares(title, body, link, user_id) VALUES(:title, :body, :link, :user_id)');
				$this->bind(':title', 	$post['title']);
				$this->bind(':body', 	$post['body']);
				$this->bind(':link', 	$post['link']);
				$this->bind(':user_id', 1);

				$this->execute();

				// Verify
				if($this->lastInsertId()){
					// Redirect
					header('Location: '.ROOT_URL.'shares');
				}
			}
			return;
		}
	}