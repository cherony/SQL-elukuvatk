-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Palvelin: 127.10.150.2:3306
-- Luontiaika: 19.10.2013 klo 12:10
-- Palvelimen versio: 5.1.69
-- PHP:n versio: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Tietokanta: `elokuvatietokanta`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `asiakas`
--

CREATE TABLE IF NOT EXISTS `asiakas` (
  `asiakasnumero` int(6) unsigned zerofill NOT NULL,
  `etunimi` varchar(16) DEFAULT NULL,
  `sukunimi` varchar(20) DEFAULT NULL,
  `tilausnumero` int(4) DEFAULT NULL,
  PRIMARY KEY (`asiakasnumero`),
  KEY `tilausnumero` (`tilausnumero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vedos taulusta `asiakas`
--

INSERT INTO `asiakas` (`asiakasnumero`, `etunimi`, `sukunimi`, `tilausnumero`) VALUES
(002001, 'Aulikki', 'Elopera', NULL),
(002002, 'Asko', 'Iskuri', NULL),
(002003, 'Kalle', 'Kustaa', NULL),
(002004, 'Mikko', 'Mallikas', NULL),
(002005, 'Niilo', 'Pielinen', NULL);

-- --------------------------------------------------------

--
-- Rakenne taululle `tuotteet`
--

CREATE TABLE IF NOT EXISTS `tuotteet` (
  `tuotetunnus` int(6) NOT NULL,
  `nimi` varchar(208) NOT NULL,
  `formaatti` varchar(10) DEFAULT NULL,
  `julkaisuvuosi` int(4) NOT NULL,
  `kategoria` varchar(40) DEFAULT NULL,
  `varastossa` int(3) DEFAULT NULL,
  PRIMARY KEY (`tuotetunnus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vedos taulusta `tuotteet`
--

INSERT INTO `tuotteet` (`tuotetunnus`, `nimi`, `formaatti`, `julkaisuvuosi`, `kategoria`, `varastossa`) VALUES
(3001, 'Night of The Living Night', 'DVD', 2002, 'Kauhu', 3),
(3002, 'Pot Potter: Pottering Pot', 'VHS', 1995, 'Komedia', 2),
(3003, 'Non-Existence', 'Blu-ray', 2010, 'Scifi', 0),
(3004, 'Blueskies', 'Blu-ray', 2008, 'Kauhu', 1),
(3005, 'Skittles', 'DVD', 2001, 'Draama', 9),
(3006, 'Ultimate Mega Hype', 'VHS', 1997, 'Toiminta', 3);

-- --------------------------------------------------------

--
-- Rakenne taululle `tyontekija`
--

CREATE TABLE IF NOT EXISTS `tyontekija` (
  `tyontekija_ID` int(4) unsigned zerofill NOT NULL,
  `etunimi` varchar(16) NOT NULL,
  `sukunimi` varchar(20) NOT NULL,
  `hetu` varchar(12) NOT NULL,
  `palkkatiedot` varchar(10) NOT NULL,
  `tyovuoro_ID` int(4) DEFAULT NULL,
  PRIMARY KEY (`tyontekija_ID`),
  KEY `tyovuoro_ID` (`tyovuoro_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vedos taulusta `tyontekija`
--

INSERT INTO `tyontekija` (`tyontekija_ID`, `etunimi`, `sukunimi`, `hetu`, `palkkatiedot`, `tyovuoro_ID`) VALUES
(1001, 'Aatu', 'Aulispaa', '180389-AB82', '3600', NULL);

-- --------------------------------------------------------

--
-- Rakenne taululle `tyovuoro`
--

CREATE TABLE IF NOT EXISTS `tyovuoro` (
  `tyovuoro_ID` int(4) unsigned zerofill NOT NULL,
  `tyontekija_ID` int(4) unsigned zerofill DEFAULT NULL,
  `tyotunnit` int(6) DEFAULT NULL,
  `pvm` varchar(12) NOT NULL,
  PRIMARY KEY (`tyovuoro_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vedos taulusta `tyovuoro`
--

INSERT INTO `tyovuoro` (`tyovuoro_ID`, `tyontekija_ID`, `tyotunnit`, `pvm`) VALUES
(5001, 1001, 8, '16.10.2013'),
(5002, 1003, 5, '16.10.2013'),
(5003, 1004, 8, '17.10.2013'),
(5004, 1002, 8, '17.10.2013'),
(5005, 1001, 7, '18.10.2013'),
(5006, 1005, 9, '18.10.2013');

-- --------------------------------------------------------

--
-- Rakenne taululle `vuokraus`
--

CREATE TABLE IF NOT EXISTS `vuokraus` (
  `tilausnumero` int(6) unsigned zerofill NOT NULL,
  `tuotetunnus` int(6) DEFAULT NULL,
  `asiakasnumero` int(6) DEFAULT NULL,
  `tilauspvm` date DEFAULT NULL,
  `vuokraustunnus` int(4) DEFAULT NULL,
  PRIMARY KEY (`tilausnumero`),
  KEY `vuokraustunnus` (`vuokraustunnus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Rakenne taululle `yhteystiedot`
--

CREATE TABLE IF NOT EXISTS `yhteystiedot` (
  `yhteystieto_ID` int(4) unsigned zerofill NOT NULL,
  `katuosoite` varchar(30) NOT NULL,
  `postinumero` int(5) DEFAULT NULL,
  `postitoimipaikka` varchar(24) DEFAULT NULL,
  `puhelin` int(16) DEFAULT NULL,
  `sahkoposti` varchar(36) DEFAULT NULL,
  `tyontekija_ID` int(4) DEFAULT NULL,
  `asiakasnumero` int(4) DEFAULT NULL,
  PRIMARY KEY (`yhteystieto_ID`),
  KEY `tyontekija_ID` (`tyontekija_ID`),
  KEY `asiakasnumero` (`asiakasnumero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
