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
  `id_lavoro` smallint(3) NOT NULL AUTO_INCREMENT,
  `nome_lavoro` varchar(30) NOT NULL,
  PRIMARY KEY (`id_lavoro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `lavoro`
--

INSERT INTO `lavoro` (`id_lavoro`, `nome_lavoro`) VALUES
(1, 'Studente'),
(2, 'Studente Lavoratore'),
(3, 'Direttore'),
(4, 'Professore'),
(5, 'Cameriere'),
(6, 'Ingegnere'),
(7, 'Sviluppatore'),
(8, 'Giornalista'),
(9, 'Chef'),
(10, 'Artista'),
(11, 'Grafico'),
(12, 'Commercialista'),
(13, 'Esperto Marketing'),
(14, 'Ricercatore'),
(15, 'Sound Designer');

--
-- Struttura della tabella `citta`
--

CREATE TABLE `citta` (
  `id_citta` smallint(3) NOT NULL AUTO_INCREMENT,
  `nome_citta` varchar(30) NOT NULL,
  PRIMARY KEY (`id_citta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `citta`
--

INSERT INTO `citta` (`id_citta`, `nome_citta`) VALUES
(1, 'Teramo'),
(2, 'Urbino'),
(3, 'Fano'),
(4, 'Milano'),
(5, 'Roma'),
(6, 'Genova'),
(7, 'Torino'),
(8, 'Palermo'),
(9, 'Benevento'),
(10, 'Piacenza');

--
-- Struttura della tabella `contatto`
--

CREATE TABLE `contatto` (
  `id_contatto` smallint(3) NOT NULL AUTO_INCREMENT,
  `utente` smallint(3) NOT NULL,
  PRIMARY KEY (`id_contatto`),
  KEY `utente` (`utente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `contatto`
--

INSERT INTO `contatto` (`id_contatto`, `utente`) VALUES
(1, 16),
(2, 10),
(3, 1),
(4, 12),
(5, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppo`
--

CREATE TABLE `gruppo` (
  `id_gruppo` smallint(3) NOT NULL AUTO_INCREMENT,
  `affinita` smallint(3) NOT NULL,
  `nome_gruppo` varchar(30) NOT NULL,
  PRIMARY KEY (`id_gruppo`),
  KEY `citta_lavoro` (`affinita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `gruppo`
--

INSERT INTO `gruppo` (`id_gruppo`, `affinita`, `nome_gruppo`) VALUES
(1, 10, 'Gruppo Artisti'),
(2, 7, 'Gruppo Sviluppatori'),
(3, 4, 'Gruppo Professori'),
(4, 12, 'Gruppo Commercialisti');

-- --------------------------------------------------------

--
-- Struttura della tabella `offerta`
--

CREATE TABLE `offerta` (
  `id_offerta` smallint(3) NOT NULL AUTO_INCREMENT,
  `emittente` smallint(3) NOT NULL,
  `occupazione` smallint(3) NOT NULL,
  `num_posti` smallint(3) NOT NULL,
  `luogo` smallint(3) NOT NULL,
  `durata` date DEFAULT NULL,
  PRIMARY KEY (`id_offerta`),
  KEY `utente` (`emittente`),
  KEY `lavoro` (`occupazione`),
  KEY `citta` (`luogo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `offerta`
--

INSERT INTO `offerta` (`id_offerta`, `emittente`, `occupazione`, `num_posti`, `luogo`, `durata`) VALUES
(1, 4, 7, 10, 1, NULL),
(5, 4, 15, 3, 1, NULL),
(7, 4, 13, 1, 1, NULL),
(11, 4, 11, 5, 1, NULL),
(17, 4, 10, 30, 1, NULL);

-- --------------------------------------------------------
--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id_utente` smallint(3) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `sesso` enum('m','f') NOT NULL,
  `email` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `data_nascita` date NOT NULL,
  `provenienza` smallint(3) DEFAULT NULL,
  `occupazione` smallint(3) NOT NULL,
  `luogo_lavoro` smallint(3) DEFAULT NULL,
  `curriculum` varchar(300) DEFAULT NULL,
  `account` enum('free','premium') NOT NULL,
  PRIMARY KEY (`id_utente`),
  KEY `citta_nascita` (`provenienza`),
  KEY `lavoro` (`occupazione`),
  KEY `citta_lavoro` (`luogo_lavoro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`id_utente`, `nome`, `cognome`, `sesso`, `email`, `pass`, `data_nascita`, `provenienza`, `occupazione`, `luogo_lavoro`, `curriculum`, `account`) VALUES
(1, 'Davide', 'Cortellucci', 'm', 'd.cortellucci@campus.uniurb.it', 'progettobdd', '1994-03-28', 1, 1, 1, 'Sono uno studente di Informatica Applicata presso l\'Università di Urbino.', 'free'),
(4, 'Mario', 'Rossi', 'm', 'mario.rossi@hotmail.it', 'hrtvb', '1992-02-18', 7, 7, 6, 'Direttore presso l\'azienda...', 'premium'),
(10, 'Luca', 'Bianchi', 'm', 'bianco.90@yahoo.it', 'fgegw5y', '1994-07-15', 3, 2, NULL, 'Salve, sono uno studente lavoratore...', 'free'),
(12, 'Laura', 'Bianchi', 'f', 'bianchi.laura@outlook.com', 'hufnjfr', '1987-10-05', 1, 13, NULL, NULL, 'free'),
(16, 'Claudio', 'Dotti', 'm', 'cladotti94@gmail.com', 'grewyh6', '1994-05-21', 8, 7, 8, NULL, 'free');

-- --------------------------------------------------------

--
-- Struttura della tabella `nodo`
--

CREATE TABLE `nodo` (
  `id_nodo` smallint(3) NOT NULL AUTO_INCREMENT,
  `contatto` smallint(3) NOT NULL,
  `utente` smallint(3) NOT NULL,
  PRIMARY KEY (`id_nodo`),
  KEY `contatto` (`contatto`),
  KEY `utente` (`utente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `nodo`
--

INSERT INTO `nodo` (`id_nodo`, `contatto`, `utente`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `collaborazione`
--

CREATE TABLE `collaborazione` (
  `id_utente` smallint(3) DEFAULT NULL,
  `id_contatto` smallint(3) DEFAULT NULL,
  KEY `id_utente` (`id_utente`),
  KEY `id_contatto` (`id_contatto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `collaborazione`
--

INSERT INTO `collaborazione` (`id_utente`, `id_contatto`) VALUES
(1, 2),
(4, 5),
(4, 3),
(10, 1),
(10, 4),
(10, 3),
(12, 2),
(16, 4),
(16, 5),
(16, 2);

--
-- Struttura della tabella `appartenenza`
--

CREATE TABLE `appartenenza` (
  `id_utente` smallint(3) DEFAULT NULL,
  `id_gruppo` smallint(3) DEFAULT NULL,
  KEY `id_utente` (`id_utente`),
  KEY `id_gruppo` (`id_gruppo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `appartenenza`
--

INSERT INTO `appartenenza` (`id_utente`, `id_gruppo`) VALUES
(4, 2),
(16, 2);

--
-- Struttura della tabella `consultazione`
--

CREATE TABLE `consultazione` (
  `id_utente` smallint(3) DEFAULT NULL,
  `id_offerta` smallint(3) DEFAULT NULL,
  KEY `id_utente` (`id_utente`),
  KEY `id_offerta` (`id_offerta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `consultazione`
--

INSERT INTO `consultazione` (`id_utente`, `id_offerta`) VALUES
(1, 1),
(16, 1),
(12, 7);

--
-- Struttura della tabella `secondo`
--

CREATE TABLE `secondo` (
  `id_utente` smallint(3) DEFAULT NULL,
  `id_nodo` smallint(3) DEFAULT NULL,
  KEY `id_utente` (`id_utente`),
  KEY `id_nodo` (`id_nodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `secondo`
--

INSERT INTO `secondo` (`id_utente`, `id_nodo`) VALUES
(16, 1);

--
-- Struttura della tabella `terzo`
--

CREATE TABLE `terzo` (
  `id_utente` smallint(3) DEFAULT NULL,
  `id_nodo` smallint(3) DEFAULT NULL,
  `connessione` smallint(3) DEFAULT NULL,
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
