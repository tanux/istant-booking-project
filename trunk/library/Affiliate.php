<?php

class Affiliate {
	private $id;
	private $name;
	private $address;
	private $telephoneNumber;
	private $username;
	private $password;
	
	function __construct($name, $address, $telephoneNumber, $username, $password) {
		$this->name = $name;
		$this->address = $address;
		$this->telephoneNumber = $telephone_number;
		$this->username = $username;
		$this->password = $password;
	}
	/**
	 * @return the $id
	 */
	public function getId() {
		return $this->id;
	}

	/**
	 * @param field_type $id
	 */
	public function setId($id) {
		$this->id = $id;
	}

	/**
	 * @return the $name
	 */
	public function getName() {
		return $this->name;
	}

	/**
	 * @param field_type $name
	 */
	public function setName($name) {
		$this->name = $name;
	}

	/**
	 * @return the $address
	 */
	public function getAddress() {
		return $this->address;
	}

	/**
	 * @param field_type $address
	 */
	public function setAddress($address) {
		$this->address = $address;
	}

	/**
	 * @return the $telephoneNumber
	 */
	public function getTelephoneNumber() {
		return $this->telephoneNumber;
	}

	/**
	 * @param field_type $telephoneNumber
	 */
	public function setTelephoneNumber($telephoneNumber) {
		$this->telephoneNumber = $telephoneNumber;
	}

	/**
	 * @return the $username
	 */
	public function getUsername() {
		return $this->username;
	}

	/**
	 * @param field_type $username
	 */
	public function setUsername($username) {
		$this->username = $username;
	}

	/**
	 * @return the $password
	 */
	public function getPassword() {
		return $this->password;
	}

	/**
	 * @param field_type $password
	 */
	public function setPassword($password) {
		$this->password = $password;
	}	
}
?>