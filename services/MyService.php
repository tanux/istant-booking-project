<?php
class MyService {
/**
	 * Retrieve all the records from the table
	 * @return an array of VOAuthor
	 */
	public function getData() {
		//connect to the database.
		//we could have used an abstracting layer for connecting to the database.
		//for the sake of simplicity, I choose not to.
		$mysql = mysql_connect("localhost", "root", "");
		mysql_select_db("test");
		//retrieve all rows
		$query = "SELECT id_aut, fname_aut, lname_aut FROM authors_aut ORDER BY fname_aut";
		$result = mysql_query($query);
		$ret = array();
		while ($row = mysql_fetch_object($result, "VOAuthor")) {
			$ret[] = $row;
		}
		mysql_free_result($result); 
		return $ret;
	}
	/**
	 * Update one item in the table
	 * @param VOAuthor to be updated 
	 * @return NULL
	 */
	public function saveData($author) {
		if ($author == NULL)
			return NULL;
		//logMe($author);
		//connect to the database.
		$mysql = mysql_connect("localhost", "root", "");
		mysql_select_db("test");
		if ($author->id_aut > 0) {
			//save changes
			$query = "UPDATE authors_aut SET fname_aut='".$author->fname_aut.":', lname_aut='".$author->lname_aut.":' WHERE id_aut=".  $author->id_aut;
		} else {
			//add new record
			$query = "INSERT INTO authors_aut (fname_aut, lname_aut) VALUES ('".$author->fname_aut.":', '".$author->lname_aut.":')";
		}
		$result = mysql_query($query);
		return NULL;
	}
}
?>