<?php
require_once '../library/database.inc.php';
class LoginService {	
	
	/**
	 * Execute Access if user is logged in  
	 * @return stdClass $user
	 */
	public static function verifiedLoggedIn(){
		$auth = Zend_Auth::getInstance();
		if ($auth->hasIdentity()){			
			return $auth->getIdentity();
		}
		else return null;
	}
		
	/**
	 * Execute login 
	 * @param String $username
	 * @param String $password
	 * @param String $user_type
	 * @return stdClass $user
	 */
	public static function doLogin($username,$password, $user_type){				
		$dbAdapter = getDbAdapter();		
		$authAdapter = new Zend_Auth_Adapter_DbTable($dbAdapter);
		if ($user_type == "managers")
			$itendityColumn = 'username';
		else
			$itendityColumn = 'email'; 
		$authAdapter->setTableName($user_type)
					->setIdentityColumn($itendityColumn)
					->setCredentialColumn('password')
					->setIdentity($username)
					->setCredential($password);	
		$auth = Zend_Auth::getInstance();		
		$result = $auth->authenticate($authAdapter);
		if ($result->isValid()){
			$user = $authAdapter->getResultRowObject(null,'password');
			$auth->getStorage()->write($user);			
			return $user;	
		}		
		else return null;	
	}
	
	/** 
	 * Execute logout
	 * @return void
	 */
	public static function doLogout(){
		$auth = Zend_Auth::getInstance();
		if ($auth->hasIdentity())		
			$auth->clearIdentity();
	}			
}
?>