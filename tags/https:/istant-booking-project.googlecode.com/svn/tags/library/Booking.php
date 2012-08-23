<?php

class Booking {
	public $id;
	public $idAffiliate;
	public $idManager;	
	
	/**	 
	 * Customer Object
	 * @var Customer
	 */
	public $idCustomer;
	
	public $idLocation;
	public $visitDay;
	public $visitHour;
	public $cancelled;
}

?>