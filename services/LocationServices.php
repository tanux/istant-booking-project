<?php
define('NUMBER_HOUR',6);
class LocationServices {
	
	
	/**
	 * Get Location's List
	 * @return array
	 */
	public function getLocationList(){
		$dbAdapter = ManageDatabase::getDbAdapter();
		$select = $dbAdapter->select()->from('locations');
		$stmt = $dbAdapter->query($select);
		return $stmt->fetchAll();
	}
	
	/**
	 * Check and return no avalilable date
	 * @return array
	 */
	public function getNoAvailableDate(){
		$dbAdapter = ManageDatabase::getDbAdapter();
		Zend_Db_Table::setDefaultAdapter($dbAdapter);
		$counterDateTable = new Zend_Db_Table('counter_date');
		$where = $counterDateTable->getAdapter()->quoteInto('counter= ?', NUMBER_HOUR);
		$select = $dbAdapter->select()->from('counter_date','date')->where($where);		
		$stmt = $dbAdapter->query($select);
		if ($stmt->rowCount() > 0)
			return $stmt->fetchAll();
	}
	
	/**
	 * 
	 * Add Location in Location's List
	 * @param Location $location
	 * @return String $id
	 */
	public function addLocation($location){
		$locationData = LocationServices::setLocationData($location);
		$dbAdapter = ManageDatabase::getDbAdapter();	
		Zend_Db_Table::setDefaultAdapter($dbAdapter);
		$locationTable = new Zend_Db_Table('locations');
		return $locationTable->insert($locationData);			
	}
	
	/**
	 * Delete Location from Locations' List
	 * @param Location $location
	 * @return int the number of row affected
	 */
	public function deleteLocation($location){
		$dbAdapter = ManageDatabase::getDbAdapter();
		Zend_Db_Table::setDefaultAdapter($dbAdapter);
		$locationTable = new Zend_Db_Table('locations');
		$where = $locationTable->getAdapter()->quoteInto('id= ?', $location->id);
		return $locationTable->delete($where);
	}
	
	/**
	 * Save Location's Changes
	 * @param Location $location
	 * @return String $id
	 */
	public function saveChangesLocation($location){
		$dbAdapter = ManageDatabase::getDbAdapter();	
		Zend_Db_Table::setDefaultAdapter($dbAdapter);
		$locationTable = new Zend_Db_Table('locations');
		$locationData = LocationServices::setLocationData($location);
		$where = $locationTable->getAdapter()->quoteInto('id= ?', $location->id);
		return $locationTable->update($locationData, $where);
	}
	
	/**
	 * Set location data	 
	 * @param Location $location
	 */
	private function setLocationData($location){
		$locationData=array(
			'city'=>$location->city,
			'address'=>$location->address,
			'telephone_number'=>$location->telephoneNumber,
			'reception_days'=>$location->receptionDays		
		);
		return $locationData;
	}	
}

?>