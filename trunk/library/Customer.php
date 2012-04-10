<?php

class Customer {
	private $id;
	private $firstName;
	private $lastName;
	private $email;
	private $telephoneNumber;
	
	function __construct($firstName, $lastName,$email,$telephoneNumber) {
		$this->firstName = $firstName;
		$this->lastName = $lastName;
		$this->email = $email;
		$this->telephoneNumber = $telephoneNumber;
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
	 * @return the $firstName
	 */
	public function getFirstName() {
		return $this->firstName;
	}

	/**
	 * @param field_type $firstName
	 */
	public function setFirstName($firstName) {
		$this->firstName = $firstName;
	}

	/**
	 * @return the $lastName
	 */
	public function getLastName() {
		return $this->lastName;
	}

	/**
	 * @param field_type $lastName
	 */
	public function setLastName($lastName) {
		$this->lastName = $lastName;
	}

	/**
	 * @return the $email
	 */
	public function getEmail() {
		return $this->email;
	}

	/**
	 * @param field_type $email
	 */
	public function setEmail($email) {
		$this->email = $email;
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
}
?>