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
	
	/**
	 * 
	 * Add Customer in Customer's List
	 * @param Customer $customer
	 * @return int the number of row affected
	 */
	public function addCustomer($customer){
		$data=array(
			'firstname' => $customer->firstName,
			'lastname' => $customer->lastName,
			'email' => $customer->email,
			'telephone_number' => $customer->telephoneNumber
		);
		$dbAdapter = ManageDatabase::getDbAdapter();		
		return $dbAdapter->insert('customers', $data);
	}

}

?>