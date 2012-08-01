<?php
require_once('bootstrap.php');

$em->getConfiguration()->setMetadataDriverImpl(
    new \Doctrine\ORM\Mapping\Driver\DatabaseDriver(
        $em->getConnection()->getSchemaManager()
    )
);

$cmf = new Doctrine\ORM\Tools\DisconnectedClassMetadataFactory();
$cmf->setEntityManager($em);
$metadata = $cmf->getAllMetadata();
$cme = new Doctrine\ORM\Tools\Export\ClassMetadataExporter();
$exporter = $cme->getExporter('xml', '../library/entities');
$exporter->setMetadata($metadata);
$exporter->export();