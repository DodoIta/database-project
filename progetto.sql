-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Set 07, 2017 alle 16:37
-- Versione del server: 5.7.14
-- Versione PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `progetto`
--

-- --------------------------------------------------------

CREATE TABLE `lavoro` (
  `id_lavoro` smallint(20) NOT NULL AUTO_INCREMENT,
  `nome_lavoro` varchar(30) NOT NULL,
  PRIMARY KEY (`id_lavoro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Struttura della tabella `citta`
--

CREATE TABLE `citta` (
  `id_citta` smallint(20) NOT NULL AUTO_INCREMENT,
  `nome_citta` varchar(30) NOT NULL,
  PRIMARY KEY (`id_citta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Struttura della tabella `contatto`
--

CREATE TABLE `contatto` (
  `id_contatto` smallint(20) NOT NULL AUTO_INCREMENT,
  `utente` smallint(20) NOT NULL,
  PRIMARY KEY (`id_contatto`)
  /*KEY `utente` (`utente`)*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppo`
--

CREATE TABLE `gruppo` (
  `id_gruppo` smallint(10) NOT NULL AUTO_INCREMENT,
  `affinita` smallint(20) NOT NULL,
  `nome_gruppo` varchar(30) NOT NULL,
  PRIMARY KEY (`id_gruppo`)
  /*KEY `lavoro` (`affinita`)*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `offerta`
--

CREATE TABLE `offerta` (
  `id_offerta` smallint(50) NOT NULL AUTO_INCREMENT,
  `emittente` smallint(20) NOT NULL,
  `occupazione` smallint(20) NOT NULL,
  `num_posti` smallint(6) NOT NULL,
  `luogo` smallint(20) NOT NULL,
  `durata` date NOT NULL,
  PRIMARY KEY (`id_offerta`)
  /*KEY `utente` (`emittente`),
  KEY `lavoro` (`occupazione`),
  KEY `citta` (`luogo`)*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id_utente` smallint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `sesso` enum('m','f') NOT NULL,
  `email` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `data_nascita` date NOT NULL,
  `provenienza` smallint(20) DEFAULT NULL,
  `occupazione` smallint(20) NOT NULL,
  `luogo_lavoro` smallint(20) DEFAULT NULL,
  `curriculum` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_utente`),
  KEY `citta_nascita` (`provenienza`),
  KEY `lavoro` (`occupazione`),
  KEY `citta_lavoro` (`luogo_lavoro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Limiti per la tabella `utente`
--
ALTER TABLE `utente`
  ADD CONSTRAINT `utentecitta_fk_1` FOREIGN KEY (`provenienza`) REFERENCES `citta` (`id_citta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utentelavoro_fk` FOREIGN KEY (`occupazione`) REFERENCES `lavoro` (`id_lavoro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utentecitta_fk_2` FOREIGN KEY (`luogo_lavoro`) REFERENCES `citta` (`id_citta`) ON DELETE CASCADE ON UPDATE CASCADE;
/*
--
-- Limiti per la tabella `offerta`
--
ALTER TABLE `offerta`
  ADD CONSTRAINT `utente_fk` FOREIGN KEY (`emittente`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;
  ADD CONSTRAINT `lavoro_fk_2` FOREIGN KEY (`emittente`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;
  ADD CONSTRAINT `citta_fk` FOREIGN KEY (`emittente`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `contatto`
--
ALTER TABLE `contatto`
  ADD CONSTRAINT `id_utente` FOREIGN KEY (`utente`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `offerta`
--
ALTER TABLE `offerta`
  ADD CONSTRAINT `emittente` FOREIGN KEY (`emittente`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;

*/
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
