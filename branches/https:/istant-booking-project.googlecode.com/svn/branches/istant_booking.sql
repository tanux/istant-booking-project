-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generato il: Lug 12, 2012 alle 19:16
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `counter_date`
--

CREATE TABLE IF NOT EXISTS `counter_date` (
  `date` varchar(255) NOT NULL,
  `counter` int(1) NOT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 AUTO_INCREMENT=11 ;

--
-- Dump dei dati per la tabella `customers`
--

INSERT INTO `customers` (`id`, `firstname`, `lastname`, `email`, `telephone_number`) VALUES
(9, 'gaetano', 'esposito', 'tanux@mail.it', '2222222222222');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 AUTO_INCREMENT=17 ;

--
-- Dump dei dati per la tabella `locations`
--

INSERT INTO `locations` (`id`, `city`, `address`, `telephone_number`, `reception_days`) VALUES
(16, 'Angri', 'Via Vespucci, 37', '081-946487', '[{"label":"Lunedi","selected":true,"numberAssociated":1},{"label":"Martedi","selected":false,"numberAssociated":2},{"label":"Mercoledi","selected":true,"numberAssociated":3},{"label":"Giovedi","selected":false,"numberAssociated":4},{"label":"Venerdi","selected":false,"numberAssociated":5},{"label":"Sabato","selected":false,"numberAssociated":6}]');

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
