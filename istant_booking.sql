-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generato il: Mag 14, 2012 alle 17:26
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 AUTO_INCREMENT=27 ;

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
  `id_affiliate` int(10) NOT NULL,
  `id_customer` int(10) NOT NULL,
  `id_manager` int(10) NOT NULL,
  `id_location` int(10) NOT NULL,
  PRIMARY KEY (`id_affiliate`,`id_customer`,`id_manager`,`id_location`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf32 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `address` int(255) NOT NULL,
  `telephone_number` int(255) NOT NULL,
  `receptions_days` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 AUTO_INCREMENT=1 ;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
