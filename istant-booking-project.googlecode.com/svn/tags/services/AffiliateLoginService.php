<?php

class AffiliateLoginService {
	
	/**
	 * Execute login by Affiliate 
	 * @param String $username
	 * @param String $password
	 * @param String $user_type
	 * @return Affiliate $affiliate
	 */
	public function doLogin($username,$password, $user_type){		
		$affiliate = new Affiliate();
		$affiliate = LoginService::doLogin($username, $password, $user_type);
		return $affiliate;
	}
	
	/**
	 * Execute Access if user is logged in
	 * @return Affiliate $affiliate
	 */
	public function verifiedLoggedIn(){
		$affiliate = new Affiliate();
		$affiliate = LoginService::verifiedLoggedIn();
		return $affiliate;
	}

}

?>