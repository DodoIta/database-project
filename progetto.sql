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
  PRIMARY KEY (`id_contatto`),
  KEY `utente` (`utente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppo`
--

CREATE TABLE `gruppo` (
  `id_gruppo` smallint(10) NOT NULL AUTO_INCREMENT,
  `affinita` smallint(20) NOT NULL,
  `nome_gruppo` varchar(30) NOT NULL,
  PRIMARY KEY (`id_gruppo`),
  KEY `citta_lavoro` (`affinita`)
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
  PRIMARY KEY (`id_offerta`),
  KEY `utente` (`emittente`),
  KEY `lavoro` (`occupazione`),
  KEY `citta` (`luogo`)
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
  `account` enum('free','premium'),
  PRIMARY KEY (`id_utente`),
  KEY `citta_nascita` (`provenienza`),
  KEY `lavoro` (`occupazione`),
  KEY `citta_lavoro` (`luogo_lavoro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `nodo`
--

CREATE TABLE `nodo` (
  `id_nodo` smallint(20) NOT NULL AUTO_INCREMENT,
  `contatto` smallint(20) NOT NULL,
  `utente` smallint(20) NOT NULL,
  PRIMARY KEY (`id_nodo`),
  KEY `contatto` (`contatto`),
  KEY `utente` (`utente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `collaborazione`
--

CREATE TABLE `collaborazione` (
  `id_utente` smallint(20) DEFAULT NULL,
  `id_contatto` smallint(20) DEFAULT NULL,
  KEY `id_utente` (`id_utente`),
  KEY `id_contatto` (`id_contatto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Struttura della tabella `appartenenza`
--

CREATE TABLE `appartenenza` (
  `id_utente` smallint(20) DEFAULT NULL,
  `id_gruppo` smallint(20) DEFAULT NULL,
  KEY `id_utente` (`id_utente`),
  KEY `id_gruppo` (`id_gruppo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Struttura della tabella `consultazione`
--

CREATE TABLE `consultazione` (
  `id_utente` smallint(20) DEFAULT NULL,
  `id_offerta` smallint(20) DEFAULT NULL,
  KEY `id_utente` (`id_utente`),
  KEY `id_offerta` (`id_offerta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Struttura della tabella `secondo`
--

CREATE TABLE `secondo` (
  `id_utente` smallint(20) DEFAULT NULL,
  `id_nodo` smallint(20) DEFAULT NULL,
  KEY `id_utente` (`id_utente`),
  KEY `id_nodo` (`id_nodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Struttura della tabella `terzo`
--

CREATE TABLE `terzo` (
  `id_utente` smallint(20) DEFAULT NULL,
  `id_nodo` smallint(20) DEFAULT NULL,
  `connessione` smallint(20) DEFAULT NULL,
  KEY `id_utente` (`id_utente`),
  KEY `id_nodo` (`id_nodo`),
  KEY `connessione` (`connessione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Limiti per la tabella `utente`
--
ALTER TABLE `utente`
  ADD CONSTRAINT `utentecitta_fk_1` FOREIGN KEY (`provenienza`) REFERENCES `citta` (`id_citta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utentelavoro_fk` FOREIGN KEY (`occupazione`) REFERENCES `lavoro` (`id_lavoro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utentecitta_fk_2` FOREIGN KEY (`luogo_lavoro`) REFERENCES `citta` (`id_citta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `offerta`
--
ALTER TABLE `offerta`
  ADD CONSTRAINT `offertautente_fk` FOREIGN KEY (`emittente`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offertalavoro_fk` FOREIGN KEY (`occupazione`) REFERENCES `lavoro` (`id_lavoro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offertacitta_fk` FOREIGN KEY (`luogo`) REFERENCES `citta` (`id_citta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `gruppo`
--
ALTER TABLE `gruppo`
  ADD CONSTRAINT `cittagruppo_fk` FOREIGN KEY (`affinita`) REFERENCES `lavoro` (`id_lavoro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `contatto`
--
ALTER TABLE `contatto`
  ADD CONSTRAINT `utentecontatto_fk` FOREIGN KEY (`utente`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `nodo`
--
ALTER TABLE `nodo`
  ADD CONSTRAINT `nodocontatto_fk` FOREIGN KEY (`contatto`) REFERENCES `contatto` (`id_contatto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nodoutente_fk` FOREIGN KEY (`utente`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `collaborazione`
--
ALTER TABLE `collaborazione`
  ADD CONSTRAINT `collaborazioneutente_fk` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `collaborazionecontatto_fk` FOREIGN KEY (`id_contatto`) REFERENCES `contatto` (`id_contatto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `appartenenza`
--
ALTER TABLE `appartenenza`
  ADD CONSTRAINT `appartenenzautente_fk` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appartenenzagruppo_fk` FOREIGN KEY (`id_gruppo`) REFERENCES `gruppo` (`id_gruppo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `consultazione`
--
ALTER TABLE `consultazione`
  ADD CONSTRAINT `consultazioneutente_fk` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consultazioneofferta_fk` FOREIGN KEY (`id_offerta`) REFERENCES `offerta` (`id_offerta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `secondo`
--
ALTER TABLE `secondo`
  ADD CONSTRAINT `secondoutente_fk` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `secondonodo_fk` FOREIGN KEY (`id_nodo`) REFERENCES `nodo` (`id_nodo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `terzo`
--
ALTER TABLE `terzo`
  ADD CONSTRAINT `terzoutente_fk` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `terzonodo_fk` FOREIGN KEY (`id_nodo`) REFERENCES `nodo` (`id_nodo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `connessione_fk` FOREIGN KEY (`connessione`) REFERENCES `utente` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
