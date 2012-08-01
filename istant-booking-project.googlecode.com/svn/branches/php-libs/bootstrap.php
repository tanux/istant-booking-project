<?php
require 'Doctrine/ORM/Tools/Setup.php';
$lib = ""; //Doctrine/Common/ClassLoader.php
Doctrine\ORM\Tools\Setup::registerAutoloadDirectory($lib);

use Doctrine\ORM\Tools\Setup;
use Doctrine\ORM\EntityManager;
$paths = array("../library/entities");
$isDevMode = false;
$dbParams = array(
    'driver'   => 'pdo_mysql',
    'user'     => 'root',
    'password' => '',
    'dbname'   => 'istant_booking',
);
//$dbParams = ManageDatabase::getDbAdapter()->getConfig();
$config = Setup::createAnnotationMetadataConfiguration($paths, $isDevMode);
$em = EntityManager::create($dbParams, $config);


