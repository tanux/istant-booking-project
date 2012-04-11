<?php
require_once '../library/database.inc.php';
class ManageUserDataService {
	
	/**
	 * Register Affiliate's data into database
	 * @param Affiliate $affiliate
	 * @return int id
	 */
	public function registerAffiliate($affiliate){		
		$dbAdapter = getDbAdapter();	
		Zend_Db_Table::setDefaultAdapter($dbAdapter);
		$affiliateTable = new Zend_Db_Table('affiliates');
		$affiliate=array(
			'name'=>$affiliate->name,
			'address'=>$affiliate->address,
			'city'=>$affiliate->city,
			'telephone_number'=>$affiliate->telephoneNumber, 
			'email'=>$affiliate->email,
			'password'=>$affiliate->password
		);				
		return $affiliateTable->insert($affiliate);					
	}
}
?>