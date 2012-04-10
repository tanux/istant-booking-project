<?php
define('FILE_CONFIG','../config/config.ini');
define('SITE_CONFIG','staging');
define('USERS_TABLE', 'users');
define('VERIFIED_IDENTITY', true);
class LoginService {	
	
	/**
	 * Execute Access if user is logged in  
	 * @return VOUser $user
	 */
	public function verifiedLoggedIn(){
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
	 * @return VOUser $user
	 */
	public function doLogin($username,$password){		
		$config = LoginService::getConfig();		
		$dbAdapter = new Zend_Db_Adapter_Pdo_Mysql($config);		
		$authAdapter = new Zend_Auth_Adapter_DbTable($dbAdapter);
		$authAdapter->setTableName(USERS_TABLE)
					->setIdentityColumn('username')
					->setCredentialColumn('password')
					->setIdentity($username)
					->setCredential($password);	
		$auth = Zend_Auth::getInstance();		
		$result = $auth->authenticate($authAdapter);
		if ($result->isValid()){			
			$user = new VOUser();
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
	public function doLogout(){
		$auth = Zend_Auth::getInstance();
		if ($auth->hasIdentity()){			
			$auth->clearIdentity();
			return true;
		}
		else return null;
	}

	/**
	 * Register Affiliate
	 * @param Affiliate $affiliate
	 */
	public function doRegister($affiliate){
				
	}
	
	/**
	 * Return database parameters 
	 */
	private function getConfig(){
		$config_file = new Zend_Config_Ini(FILE_CONFIG,SITE_CONFIG);
		if (isset($config_file)){
			$config = array(
				'host'     => $config_file->database->params->host,
				'username' => $config_file->database->params->username,
				'password' => $config_file->database->params->password,
				'dbname'   => $config_file->database->params->dbname
			);
			return $config;	
		}		
	}
}
?>