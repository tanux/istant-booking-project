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
	
	
}

?>