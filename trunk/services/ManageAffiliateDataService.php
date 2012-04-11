<?php
require_once '../library/database.inc.php';
class ManageAffiliateDataService {
	
	/**
	 * Save Affiliate's data into database
	 * @param Affiliate $affiliate	  
	 * @return  id
	 */
	public function saveAffiliateData($affiliate){		
		$dbAdapter = getDbAdapter();	
		Zend_Db_Table::setDefaultAdapter($dbAdapter);
		$affiliateTable = new Zend_Db_Table('affiliates');
		$affiliateData = ManageAffiliateDataService::setAffiliateData($affiliate);
		$affiliateTable->insert($affiliateData);
		return $dbAdapter->lastInsertId();			
	}	
	
	/**
	 * Update Affiliate's data	 
	 * @param Affiliate $affiliate
	 * @return int number of row updated
	 */
	public function updateAffiliateData($affiliate){
		$dbAdapter = getDbAdapter();	
		Zend_Db_Table::setDefaultAdapter($dbAdapter);
		$affiliateTable = new Zend_Db_Table('affiliates');
		$affiliateData = ManageAffiliateDataService::setAffiliateData($affiliate);
		$where = $affiliateTable->getAdapter()->quoteInto('id = ?', $affiliate->id); 
		return $affiliateTable->update($affiliateData, $where);
	}
	
	/**
	 * Set affiliate data	 
	 * @param Affiliate $affiliate
	 */
	private function setAffiliateData($affiliate){
		$affiliateData=array(
			'name'=>$affiliate->name,
			'address'=>$affiliate->address,
			'city'=>$affiliate->city,
			'telephone_number'=>$affiliate->telephoneNumber, 
			'email'=>$affiliate->email,
			'password'=>$affiliate->password
		);
		return $affiliateData;
	}
}
?>