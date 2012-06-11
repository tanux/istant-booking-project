<?php

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
	 * 
	 * Add Location in Location's List
	 * @param Location $location
	 * @return int number of row affected
	 */
	public function addLocation($location){
		$data=array(
			'city'=>$location->city,
			'address'=>$location->address,
			'telephone_number'=>$location->telephoneNumber,
			'reception_days'=>$location->receptionDays		
		);
		$dbAdapter = ManageDatabase::getDbAdapter();		
		return $dbAdapter->insert('locations', $data);
		
	}

}

?>