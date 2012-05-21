<?php

class CustomersService {
	
	/**
	 * Get Customer's List
	 * @return array
	 */
	public function getCustomerList(){
		$dbAdapter = ManageDatabase::getDbAdapter();
		$select = $dbAdapter->select()->from('customers');
		$stmt = $dbAdapter->query($select);
		return $stmt->fetchAll();
	}

}

?>