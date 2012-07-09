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
	 * Update counter date
	 * @param $date
	 * @return int number of row affected
	 */
	public function updateCounterDate($date){
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
			'id_manager'=>$booking->idManager,
			'visit_day'=>$booking->visitDay,
			'visit_hour'=>$booking->visitHour		
		);
		return $bookingData;
	}

}

?>