<?php

class Location {
	private $id;
	private $cityName;
	private $address;
	private $telephoneNumber;
	private $receptionDays;
	
	function __construct($cityName, $address, $telephoneNumber, $receptionDays) {
		$this->cityName = $cityName;
		$this->address = $address;
		$this->telephoneNumber = $telephoneNumber;
		$this->receptionDays = $receptionDays;
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
}
?>