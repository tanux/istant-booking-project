<?php
define('FILE_CONFIG','../config/config.ini');
define('SITE_CONFIG','staging');
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
	public function doLogin($username,$password, $user_type){				
		$dbAdapter = LoginService::getDbAdapter();		
		$authAdapter = new Zend_Auth_Adapter_DbTable($dbAdapter);
		$authAdapter->setTableName($user_type)
					->setIdentityColumn('username')
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
	public function doLogout(){
		$auth = Zend_Auth::getInstance();
		if ($auth->hasIdentity()){			
			$auth->clearIdentity();
			return true;
		}
		else return null;
	}

	/**
	 * Send Affiliate's data to database
	 * @param Affiliate $affiliate
	 * @return int id
	 */
	public function doRegister($affiliate){		
		$dbAdapter = LoginService::getDbAdapter();	
		Zend_Db_Table::setDefaultAdapter($dbAdapter);
		$affiliateTable = new Zend_Db_Table('affiliates');
		$affiliate=array(
			'name'=>$affiliate->name,
			'address'=>$affiliate->address,
			'telephone_number'=>$affiliate->telephoneNumber, 
			'username'=>$affiliate->username,
			'password'=>$affiliate->password
		);				
		return $affiliateTable->insert($affiliate);					
	}
	
	/**
	 * Set database parameter from config file and database adapter
	 * @return Zend_Db_Adapter_Pdo_Mysql $dbAdapter 
	 */
	private function getDbAdapter(){
		$config_file = new Zend_Config_Ini(FILE_CONFIG,SITE_CONFIG);
		if (isset($config_file)){
			$config = array(
				'host'     => $config_file->database->params->host,
				'username' => $config_file->database->params->username,
				'password' => $config_file->database->params->password,
				'dbname'   => $config_file->database->params->dbname
			);
			$dbAdapter = new Zend_Db_Adapter_Pdo_Mysql($config);
			return $dbAdapter;	
		}		
	}	
}
?>