<?php

class ManagerLoginService {
	
/**
	 * Execute login by Manager 
	 * @param String $username
	 * @param String $password
	 * @param String $user_type
	 * @return Manager $manager
	 */
	public function doLogin($username,$password, $user_type){		
		$manager = new Manager();
		$manager = LoginService::doLogin($username, $password, $user_type);
		return $manager;
	}
	
	/**
	 * Execute Access if user is logged in
	 * @return Manager $manager
	 */
	public function verifiedLoggedIn(){
		$manager = new Manager();
		$manager = LoginService::verifiedLoggedIn();
		return $manager;
	}

}

?>