-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generato il: Mar 21, 2012 alle 14:14
-- Versione del server: 5.5.16
-- Versione PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `authors_aut`
--

CREATE TABLE IF NOT EXISTS `authors_aut` (
  `id_aut` int(11) NOT NULL AUTO_INCREMENT,
  `fname_aut` varchar(255) NOT NULL,
  `lname_aut` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_aut`),
  UNIQUE KEY `fname_aut` (`fname_aut`,`lname_aut`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `authors_aut`
--

INSERT INTO `authors_aut` (`id_aut`, `fname_aut`, `lname_aut`) VALUES
(1, 'Dantes', 'Alighierie'),
(4, 'Niccolo', 'Machiavelli'),
(3, 'Umberto', 'Eco'),
(2, 'William', 'Shakespeare');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
