<?php
define('FILE_CONFIG','../config/config.ini');
define('SITE_CONFIG','staging');
class ManageDatabase {
	
	/**
	 * Set database parameter from config file and database adapter
	 * @return Zend_Db_Adapter_Pdo_Mysql $dbAdapter 
	 */
	public static function getDbAdapter() {
		$config_file = new Zend_Config_Ini ( FILE_CONFIG, SITE_CONFIG );
		if (isset ( $config_file )) {
			$config = array (
				'host' => $config_file->database->params->host, 
				'username' => $config_file->database->params->username, 
				'password' => $config_file->database->params->password, 
				'dbname' => $config_file->database->params->dbname
			);
			$dbAdapter = new Zend_Db_Adapter_Pdo_Mysql ( $config );
			return $dbAdapter;
		}
	}

}

?>