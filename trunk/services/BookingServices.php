<?php

class BookingServices {
	
	/**
	 * 
	 * Do Booking of Visit
	 * @param Booking $booking
	 * @return int number of row affected
	 */
	public function doBooking($booking){
		$bookingData = BookingServices::setBookingData($booking);
		$dbAdapter = ManageDatabase::getDbAdapter();	
		return $dbAdapter->insert('bookings', $bookingData);		
	}
	
	/**
	 * Set booking data	 
	 * @param Booking $booking
	 * @return Booking $bookingData
	 */
	private function setBookingData($booking){
		$bookingData=array(
			'id_affiliate'=>$booking->id_affiliate,
			'id_customer'=>$booking->id_customer,
			'id_manager'=>$booking->id_manager,
			'visit_day'=>$booking->visit_day,
			'visit_hour'=>$booking->visit_hour		
		);
		return $bookingData;
	}

}

?>