<?php

class CustomersService {
	
	/**
	 * Get Customer's List
	 * @return Customer[]
	 */
	public function getCustomerList(){
		//$customerList[] = new Customer();
		$dbAdapter = ManageDatabase::getDbAdapter();
		$select = $dbAdapter->select()->from('customers');
		$stmt = $dbAdapter->query($select);
		return $stmt->fetchAll();
	}

}

?>