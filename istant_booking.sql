-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generato il: Ago 02, 2012 alle 12:50
-- Versione del server: 5.5.16
-- Versione PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `istant_booking`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `affiliates`
--

CREATE TABLE IF NOT EXISTS `affiliates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `telephone_number` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`email`),
  UNIQUE KEY `telephone_number` (`telephone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `affiliates_customers`
--

CREATE TABLE IF NOT EXISTS `affiliates_customers` (
  `id_affiliates` int(10) NOT NULL,
  `id_customers` int(10) NOT NULL,
  PRIMARY KEY (`id_affiliates`,`id_customers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_affiliate` int(10) NOT NULL,
  `id_customer` text NOT NULL,
  `id_manager` int(10) NOT NULL,
  `id_location` int(10) NOT NULL,
  `visit_day` varchar(255) NOT NULL,
  `visit_hour` varchar(255) NOT NULL,
  `cancelled` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dump dei dati per la tabella `bookings`
--

INSERT INTO `bookings` (`id`, `id_affiliate`, `id_customer`, `id_manager`, `id_location`, `visit_day`, `visit_hour`, `cancelled`) VALUES
(1, 0, '{"id":"12","firstName":"Gaetano","lastName":"Esposito","email":"tanux87@mail.it","telephoneNumber":"3392321107"}', 1, 1, '16/07/2012', '{"hour":"15.00","index":0,"busy":true}', 'false'),
(2, 0, '{"id":"12","firstName":"Gaetanos","lastName":"Esposito","email":"tanux87@mail.it","telephoneNumber":"3392321107"}', 1, 1, '23/07/2012', '{"hour":"20.00","index":5,"busy":true}', 'false'),
(3, 0, '{"id":"12","firstName":"Gaetanos","lastName":"Esposito","email":"tanux87@mail.it","telephoneNumber":"3392321107"}', 1, 1, '30/07/2012', '{"busy":true,"index":5,"hour":"20.00"}', 'false'),
(4, 0, '{"id":"12","firstName":"Gaetanos","lastName":"Esposito","email":"tanux87@mail.it","telephoneNumber":"3392321107"}', 1, 1, '30/07/2012', '{"busy":true,"index":4,"hour":"19.00"}', 'false'),
(5, 0, '{"id":"13","firstName":"Concetta","lastName":"Natale","email":"cettina@mail.it","telephoneNumber":"3333333333"}', 1, 1, '23/07/2012', '{"busy":true,"index":2,"hour":"17.00"}', 'false'),
(6, 0, '{"id":"13","firstName":"Concetta","lastName":"Natale","email":"cettina@mail.it","telephoneNumber":"3333333333"}', 1, 1, '30/07/2012', '{"busy":true,"index":0,"hour":"15.00"}', 'false'),
(7, 0, '{"id":"13","firstName":"Concetta","lastName":"Natale","email":"cettina@mail.it","telephoneNumber":"3333333333"}', 1, 1, '30/07/2012', '{"busy":true,"index":1,"hour":"16.00"}', 'false'),
(8, 0, '{"id":"13","firstName":"Concetta","lastName":"Natale","email":"cettina@mail.it","telephoneNumber":"3333333333"}', 1, 1, '30/07/2012', '{"busy":true,"index":2,"hour":"17.00"}', 'false'),
(9, 0, '{"id":"12","firstName":"Gaetanos","lastName":"Esposito","email":"tanux87@mail.it","telephoneNumber":"3392321107"}', 1, 1, '30/07/2012', '{"busy":true,"index":3,"hour":"18.00"}', 'false');

-- --------------------------------------------------------

--
-- Struttura della tabella `counter_date`
--

CREATE TABLE IF NOT EXISTS `counter_date` (
  `date` varchar(255) NOT NULL,
  `counter` int(1) NOT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `counter_date`
--

INSERT INTO `counter_date` (`date`, `counter`) VALUES
('16/07/2012', 1),
('23/07/2012', 2),
('30/07/2012', 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone_number` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 AUTO_INCREMENT=14 ;

--
-- Dump dei dati per la tabella `customers`
--

INSERT INTO `customers` (`id`, `firstname`, `lastname`, `email`, `telephone_number`) VALUES
(12, 'Gaetanos', 'Esposito', 'tanux87@mail.it', '3392321107'),
(13, 'Concetta', 'Natale', 'cettina@mail.it', '3333333333');

-- --------------------------------------------------------

--
-- Struttura della tabella `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `telephone_number` varchar(255) NOT NULL,
  `reception_days` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `locations`
--

INSERT INTO `locations` (`id`, `city`, `address`, `telephone_number`, `reception_days`) VALUES
(1, 'Angri', 'Via Vespucci, 37', '081', '[{"numberAssociated":1,"selected":true,"label":"Lunedi"},{"numberAssociated":2,"selected":false,"label":"Martedi"},{"numberAssociated":3,"selected":false,"label":"Mercoledi"},{"numberAssociated":4,"selected":false,"label":"Giovedi"},{"numberAssociated":5,"selected":false,"label":"Venerdi"},{"numberAssociated":6,"selected":false,"label":"Sabato"}]');

-- --------------------------------------------------------

--
-- Struttura della tabella `managers`
--

CREATE TABLE IF NOT EXISTS `managers` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `managers`
--

INSERT INTO `managers` (`id`, `firstname`, `lastname`, `username`, `password`) VALUES
(1, 'Salvatore', 'Coppola', 'test', 'test');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
