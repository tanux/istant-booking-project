<?php

class BookingServices {
	
	/**
	 * 
	 * Add Booking of Visit to Booking List
	 * @param Booking $booking
	 * @return int number of row affected
	 */
	public function addBooking($booking){
		$bookingData = BookingServices::setBookingData($booking);
		$dbAdapter = ManageDatabase::getDbAdapter();			
		if ($dbAdapter->insert('bookings', $bookingData) > 0)
			return BookingServices::updateCounterDate($booking->visitDay);
		else 
			return null;		
	}
	
	/**
	 * 
	 * Get Booking List
	 * @param String $idLocation
	 * @param String $date
	 * @return array booking list
	 */
	public function getBookingList($idLocation, $date){
		$dbAdapter = ManageDatabase::getDbAdapter();
		Zend_Db_Table::setDefaultAdapter($dbAdapter);		
		$bookingsDateTable = new Zend_Db_Table('bookings');
		$where1 = $bookingsDateTable->getAdapter()->quoteInto('id_location= ?', $idLocation);
		$where2 = $bookingsDateTable->getAdapter()->quoteInto('visit_day= ?', $date);
		$select = $dbAdapter->select()->from('bookings','id_customer')->where($where1)->where($where2);
		$stmt = $dbAdapter->query($select);
		return $stmt->fetchAll();
	}
	
	/**
	 * 
	 * Return busy hour for certain visit_day
	 * @param String $visit_day
	 * @return array
	 */
	public function getBusyHour($visit_day){
		$dbAdapter = ManageDatabase::getDbAdapter();
		Zend_Db_Table::setDefaultAdapter($dbAdapter);		
		$bookingsDateTable = new Zend_Db_Table('bookings');
		$where = $bookingsDateTable->getAdapter()->quoteInto('visit_day= ?', $visit_day);
		$select = $dbAdapter->select()->from('bookings','visit_hour')->where($where);
		$result = $dbAdapter->query($select);
		return $result->fetchAll();
	}
	
	
	/**
	 * 
	 * Update counter date
	 * @param $date
	 * @return int number of row affected
	 */
	private function updateCounterDate($date){
		$dbAdapter = ManageDatabase::getDbAdapter();	
		Zend_Db_Table::setDefaultAdapter($dbAdapter);		
		$counterDateTable = new Zend_Db_Table('counter_date');
		$where = $counterDateTable->getAdapter()->quoteInto('date= ?', $date);
		$select = $dbAdapter->select()->from('counter_date','counter')->where($where);
		$result = $dbAdapter->query($select);		
		$counter =  $result->fetch();
		$counter = (int)$counter['counter'];
		
		if (!($counter >= 1 && $counter<=6)){
			$counterDateData = array('date'=>$date, 'counter'=>1);
			return $dbAdapter->insert('counter_date', $counterDateData);	
		}		
		elseif ($counter<6){			
			$counterDateData = array('date'=>$date, 'counter'=>$counter+1);
			return $counterDateTable->update($counterDateData, $where);		
		}
	}
	
	/**
	 * Set booking data	 
	 * @param Booking $booking
	 * @return Booking $bookingData
	 */
	private function setBookingData($booking){
		$bookingData=array(
			'id_affiliate'=>$booking->idAffiliate,
			'id_customer'=>$booking->idCustomer,
			'id_location'=>$booking->idLocation,
			'id_manager'=>$booking->idManager,
			'visit_day'=>$booking->visitDay,
			'visit_hour'=>$booking->visitHour		
		);
		return $bookingData;
	}

}

?>