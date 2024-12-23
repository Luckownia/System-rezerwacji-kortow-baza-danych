-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: tenis
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cennik`
--

DROP TABLE IF EXISTS `cennik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cennik` (
  `id_cennika` int NOT NULL AUTO_INCREMENT,
  `id_kortu` int DEFAULT NULL,
  `cena_za_godzine` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_cennika`),
  KEY `id_kortu` (`id_kortu`),
  CONSTRAINT `cennik_ibfk_1` FOREIGN KEY (`id_kortu`) REFERENCES `korty` (`id_kortu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cennik`
--

LOCK TABLES `cennik` WRITE;
/*!40000 ALTER TABLE `cennik` DISABLE KEYS */;
INSERT INTO `cennik` VALUES (1,1,50.00),(2,2,40.00),(3,3,70.00),(4,4,60.00),(5,5,45.00);
/*!40000 ALTER TABLE `cennik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korty`
--

DROP TABLE IF EXISTS `korty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `korty` (
  `id_kortu` int NOT NULL AUTO_INCREMENT,
  `nazwa_kortu` varchar(50) NOT NULL,
  `lokalizacja` varchar(100) NOT NULL,
  `typ_nawierzchni` enum('trawa','mączka','beton') NOT NULL,
  `status` enum('aktywny','nieaktywny') DEFAULT 'aktywny',
  `godzina_otwarcia` time DEFAULT NULL,
  `godzina_zamkniecia` time DEFAULT NULL,
  PRIMARY KEY (`id_kortu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korty`
--

LOCK TABLES `korty` WRITE;
/*!40000 ALTER TABLE `korty` DISABLE KEYS */;
INSERT INTO `korty` VALUES (1,'Kort 1','Centrum Sportowe','mączka','aktywny','08:00:00','16:00:00'),(2,'Kort 2','Park Miejski','trawa','aktywny','08:00:00','16:00:00'),(3,'Kort 3','Hala Sportowa','beton','aktywny','08:00:00','16:00:00'),(4,'Kort 4','Osiedle Sportowe','beton','aktywny','08:00:00','16:00:00'),(5,'Kort 5','Park Rozrywki','trawa','aktywny','08:00:00','16:00:00');
/*!40000 ALTER TABLE `korty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platnosci`
--

DROP TABLE IF EXISTS `platnosci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platnosci` (
  `id_platnosci` int NOT NULL AUTO_INCREMENT,
  `id_rezerwacji` int NOT NULL,
  `kwota` decimal(10,2) NOT NULL,
  `status` enum('oczekująca','opłacona','anulowana') DEFAULT 'oczekująca',
  `data_platnosci` date DEFAULT NULL,
  PRIMARY KEY (`id_platnosci`),
  KEY `platnosci_ibfk_1` (`id_rezerwacji`),
  CONSTRAINT `platnosci_ibfk_1` FOREIGN KEY (`id_rezerwacji`) REFERENCES `rezerwacje` (`id_rezerwacji`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platnosci`
--

LOCK TABLES `platnosci` WRITE;
/*!40000 ALTER TABLE `platnosci` DISABLE KEYS */;
INSERT INTO `platnosci` VALUES (15,8,300.00,'opłacona','2024-12-22'),(16,10,105.00,'opłacona','2024-12-22'),(17,11,60.00,'opłacona','2024-12-22'),(20,8,300.00,'opłacona','2024-12-22'),(21,9,180.00,'oczekująca',NULL),(22,18,200.00,'opłacona','2024-12-22'),(23,19,150.00,'opłacona','2024-12-22'),(24,20,200.00,'opłacona','2024-12-22'),(25,21,250.00,'opłacona','2024-12-22'),(26,19,150.00,'opłacona','2024-12-22'),(27,19,150.00,'opłacona',NULL),(28,19,150.00,'opłacona',NULL),(29,20,250.00,'opłacona','2024-12-22'),(30,21,300.00,'opłacona','2024-12-25'),(31,21,100.00,'opłacona',NULL),(33,16,45.00,'opłacona','2024-12-22'),(34,15,50.00,'oczekująca','2024-12-22'),(35,18,100.00,'oczekująca','2024-12-22'),(36,25,100.00,'oczekująca','2024-12-22'),(40,10,150.00,'opłacona','2024-12-22'),(41,27,120.00,'opłacona','2024-12-22'),(42,29,80.00,'opłacona','2024-12-22'),(43,30,80.00,'opłacona','2024-12-22'),(44,31,80.00,'opłacona','2024-12-22'),(45,32,80.00,'opłacona','2024-12-22');
/*!40000 ALTER TABLE `platnosci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezerwacje`
--

DROP TABLE IF EXISTS `rezerwacje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rezerwacje` (
  `id_rezerwacji` int NOT NULL AUTO_INCREMENT,
  `id_uzytkownika` int NOT NULL,
  `id_kortu` int NOT NULL,
  `data_rezerwacji` date NOT NULL,
  `godzina_start` time NOT NULL,
  `godzina_koniec` time NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_rezerwacji`),
  KEY `id_uzytkownika` (`id_uzytkownika`),
  KEY `id_kortu` (`id_kortu`),
  CONSTRAINT `rezerwacje_ibfk_1` FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownicy` (`id_uzytkownika`),
  CONSTRAINT `rezerwacje_ibfk_2` FOREIGN KEY (`id_kortu`) REFERENCES `korty` (`id_kortu`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezerwacje`
--

LOCK TABLES `rezerwacje` WRITE;
/*!40000 ALTER TABLE `rezerwacje` DISABLE KEYS */;
INSERT INTO `rezerwacje` VALUES (8,1,1,'2024-12-25','10:00:00','12:00:00','zakończony'),(9,2,1,'2024-12-25','11:00:00','13:00:00','zarezerwowany'),(10,3,2,'2024-12-22','14:00:00','15:00:00','zakończony'),(11,1,1,'2024-12-22','14:00:00','16:00:00','zakończony'),(12,1,1,'2024-12-22','14:00:00','16:00:00','zarezerwowany'),(13,2,1,'2024-12-22','14:00:00','16:00:00','zarezerwowany'),(14,1,1,'2024-12-22','14:00:00','16:00:00','zarezerwowany'),(15,1,1,'2024-12-22','10:00:00','11:00:00','zarezerwowany'),(16,5,5,'2024-12-22','12:00:00','13:00:00','zakończony'),(17,1,1,'2024-12-22','08:00:00','09:00:00','zarezerwowany'),(18,1,1,'2024-12-22','10:00:00','12:00:00','zakończony'),(19,2,2,'2024-12-23','14:00:00','15:30:00','zakończony'),(20,1,1,'2024-12-25','10:00:00','12:00:00','zakończony'),(21,2,1,'2024-12-25','11:00:00','13:00:00','zakończony'),(24,3,3,'2024-12-22','14:00:00','16:00:00','oczekująca'),(25,1,1,'2024-12-22','10:00:00','12:00:00','oczekująca'),(26,1,1,'2024-12-22','10:00:00','12:00:00','oczekująca'),(27,5,4,'2024-12-22','10:00:00','12:00:00','zakończony'),(28,5,2,'2024-12-22','10:00:00','12:00:00','oczekująca'),(29,1,2,'2024-12-23','10:00:00','12:00:00','zakończony'),(30,1,2,'2024-12-24','10:00:00','12:00:00','zakończony'),(31,1,2,'2024-12-29','10:00:00','12:00:00','zarezerwowana'),(32,1,2,'2024-12-30','10:00:00','12:00:00','zarezerwowana');
/*!40000 ALTER TABLE `rezerwacje` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sprawdz_godziny_otwarcia` BEFORE INSERT ON `rezerwacje` FOR EACH ROW BEGIN
    DECLARE start_godzina TIME;
    DECLARE koniec_godzina TIME;
    
    -- Pobieramy godziny otwarcia i zamknięcia dla danego kortu
    SELECT k.godzina_otwarcia, k.godzina_zamkniecia
    INTO start_godzina, koniec_godzina
    FROM korty k
    WHERE k.id_kortu = NEW.id_kortu;

    -- Sprawdzamy, czy godzina rozpoczęcia i zakończenia rezerwacji mieszczą się w godzinach otwarcia i zamknięcia
    IF NEW.godzina_start < start_godzina OR NEW.godzina_koniec > koniec_godzina THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Rezerwacja jest poza godzinami otwarcia dla tego kortu';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `rezerwacje_z_płatnościami`
--

DROP TABLE IF EXISTS `rezerwacje_z_płatnościami`;
/*!50001 DROP VIEW IF EXISTS `rezerwacje_z_płatnościami`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rezerwacje_z_płatnościami` AS SELECT 
 1 AS `id_rezerwacji`,
 1 AS `id_uzytkownika`,
 1 AS `id_kortu`,
 1 AS `data_rezerwacji`,
 1 AS `godzina_start`,
 1 AS `godzina_koniec`,
 1 AS `platnosc_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statystyki_wykorzystania_obiektow`
--

DROP TABLE IF EXISTS `statystyki_wykorzystania_obiektow`;
/*!50001 DROP VIEW IF EXISTS `statystyki_wykorzystania_obiektow`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statystyki_wykorzystania_obiektow` AS SELECT 
 1 AS `kort_id`,
 1 AS `kort_nazwa`,
 1 AS `lokalizacja`,
 1 AS `nawierzchnia`,
 1 AS `liczba_rezerwacji`,
 1 AS `zakonczone_rezerwacje`,
 1 AS `aktywne_rezerwacje`,
 1 AS `oczekujace_rezerwacje`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `szczegoly_rezerwacji`
--

DROP TABLE IF EXISTS `szczegoly_rezerwacji`;
/*!50001 DROP VIEW IF EXISTS `szczegoly_rezerwacji`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `szczegoly_rezerwacji` AS SELECT 
 1 AS `id_rezerwacji`,
 1 AS `imie`,
 1 AS `nazwisko`,
 1 AS `nazwa_kortu`,
 1 AS `data_rezerwacji`,
 1 AS `godzina_start`,
 1 AS `godzina_koniec`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `uzytkownicy`
--

DROP TABLE IF EXISTS `uzytkownicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uzytkownicy` (
  `id_uzytkownika` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `data_rejestracji` date DEFAULT NULL,
  PRIMARY KEY (`id_uzytkownika`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzytkownicy`
--

LOCK TABLES `uzytkownicy` WRITE;
/*!40000 ALTER TABLE `uzytkownicy` DISABLE KEYS */;
INSERT INTO `uzytkownicy` VALUES (1,'Wojciech','Kowalski','wojciech.kowalski@example.com','129971261','2024-12-21'),(2,'Jakub','Nowak','jakub.nowak@example.com','123976547','2024-12-21'),(3,'Krzysztof','Lewandowski','krzysztof.lewandowski@example.com','789654321','2024-12-21'),(4,'Magdalena','Adamska','magdalena.adamska@example.com','123123123','2024-12-15'),(5,'Piotr','Nowak','piotr.nowak@example.com','123987654','2024-12-22'),(7,'Jan','Kowalski','jan.kowalski@example.com',NULL,'2024-12-22'),(8,'Anna','Nowak','anna.nowak@example.com',NULL,'2024-12-01'),(9,'Marek','Lewandowski','marek.lewandowski@example.com',NULL,'2024-12-22');
/*!40000 ALTER TABLE `uzytkownicy` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_uzytkownicy` BEFORE INSERT ON `uzytkownicy` FOR EACH ROW BEGIN
    IF NEW.data_rejestracji IS NULL THEN
        SET NEW.data_rejestracji = CURDATE();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'tenis'
--

--
-- Dumping routines for database 'tenis'
--
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_rezerwacje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_rezerwacje`(
    IN uzytkownik_id INT, 
    IN kort_id INT, 
    IN godzina_start TIME,  -- Akceptujemy tylko godzinę
    IN godzina_koniec TIME,  -- Akceptujemy tylko godzinę
    IN data_rezerwacji DATE -- Podajemy datę rezerwacji
)
BEGIN
    DECLARE dostepny INT;
    DECLARE pelna_godzina_start DATETIME;
    DECLARE pelna_godzina_koniec DATETIME;
    DECLARE cena_za_godzine DECIMAL(10, 2);
    DECLARE koszt DECIMAL(10, 2);
    DECLARE czas_trwania INT;

    -- Tworzymy pełny datetime na podstawie podanej daty i godziny
    SET pelna_godzina_start = CONCAT(data_rezerwacji, ' ', godzina_start);
    SET pelna_godzina_koniec = CONCAT(data_rezerwacji, ' ', godzina_koniec);

    -- Sprawdzamy, czy w tym czasie nie ma innych rezerwacji na danym korcie
    SELECT COUNT(*) INTO dostepny
    FROM rezerwacje
    WHERE id_kortu = kort_id 
    AND (
        (pelna_godzina_start < godzina_koniec AND pelna_godzina_koniec > godzina_start) -- Sprawdzanie czy czasy się nakładają
    );

    IF dostepny = 0 THEN
        -- Jeśli nie ma nakładającej się rezerwacji, dodajemy nową
        INSERT INTO rezerwacje (id_uzytkownika, id_kortu, data_rezerwacji, godzina_start, godzina_koniec, status)
        VALUES (uzytkownik_id, kort_id, data_rezerwacji, pelna_godzina_start, pelna_godzina_koniec, 'oczekująca');
        
        -- Pobieramy cenę za godzinę z tabeli cennik
        SELECT c.cena_za_godzine
        INTO cena_za_godzine
        FROM cennik c
        WHERE c.id_kortu = kort_id;
        
        -- Obliczamy czas trwania rezerwacji w godzinach
        SET czas_trwania = TIMESTAMPDIFF(MINUTE, pelna_godzina_start, pelna_godzina_koniec) / 60.0;
        
        -- Obliczamy koszt rezerwacji
        SET koszt = cena_za_godzine * czas_trwania;

        -- Jeśli koszt został obliczony, dodajemy go do tabeli 'platnosci'
        IF koszt IS NOT NULL THEN
            INSERT INTO platnosci (id_rezerwacji, kwota, status, data_platnosci)
            VALUES (LAST_INSERT_ID(), koszt, 'oczekująca', NULL);  -- Ustawiamy NULL, bo data płatności będzie ustalana później
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Brak odpowiedniego cennika dla tej rezerwacji.';
        END IF;

    ELSE
        -- Jeśli kort jest zajęty, zgłaszamy błąd
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Kort jest już zajęty w tym czasie';
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `oplac_platnosc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `oplac_platnosc`(IN platnosc_id INT)
BEGIN
    DECLARE platnosc_status ENUM('oczekująca', 'opłacona', 'anulowana');
    DECLARE rezerwacja_id INT;
    
    -- Pobieramy status płatności oraz id rezerwacji
    SELECT status, id_rezerwacji
    INTO platnosc_status, rezerwacja_id
    FROM platnosci
    WHERE id_platnosci = platnosc_id;

    -- Sprawdzamy, czy status płatności jest 'oczekująca'
    IF platnosc_status = 'oczekująca' THEN
        -- Zaktualizuj płatność na 'opłacona' i ustaw datę płatności
        UPDATE platnosci
        SET status = 'opłacona', data_platnosci = CURDATE()
        WHERE id_platnosci = platnosc_id;

        -- Zaktualizuj status rezerwacji na 'zarezerwowana'
        UPDATE rezerwacje
        SET status = 'zarezerwowana'
        WHERE id_rezerwacji = rezerwacja_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Płatność już została opłacona lub anulowana.';
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sprawdz_dostepnosc_kortow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sprawdz_dostepnosc_kortow`(
    IN sprawdzana_data DATE,   -- Podajemy tylko datę (dzień)
    IN godzina_start TIME,     -- Podajemy godzinę rozpoczęcia
    IN godzina_koniec TIME     -- Podajemy godzinę zakończenia
)
BEGIN
    SELECT 
        k.id_kortu, 
        k.nazwa_kortu, 
        k.lokalizacja, 
        k.typ_nawierzchni
    FROM korty k
    WHERE NOT EXISTS (
        -- Sprawdzamy, czy istnieje rezerwacja dla tego kortu w podanym czasie
        SELECT 1
        FROM rezerwacje r
        WHERE r.id_kortu = k.id_kortu
        AND r.status IN ('oczekująca', 'zarezerwowany')  -- Uwzględniamy tylko rezerwacje oczekujące lub zarezerwowane
        AND r.data_rezerwacji = sprawdzana_data   -- Sprawdzamy, czy rezerwacja jest na ten dzień
        AND (
            -- Sprawdzamy, czy godziny rezerwacji się nakładają na podane godziny
            (r.godzina_start < godzina_koniec AND r.godzina_koniec > godzina_start)
        )
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usun_rezerwacje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usun_rezerwacje`(IN rezerwacja_id INT)
BEGIN
    -- Sprawdzamy, czy rezerwacja o podanym ID istnieje
    DECLARE rezerwacja_istnieje INT;

    SELECT COUNT(*)
    INTO rezerwacja_istnieje
    FROM rezerwacje
    WHERE id_rezerwacji = rezerwacja_id;

    -- Jeśli rezerwacja istnieje, usuwamy ją
    IF rezerwacja_istnieje > 0 THEN
        DELETE FROM rezerwacje
        WHERE id_rezerwacji = rezerwacja_id;

        -- Zwracamy komunikat, że rezerwacja została usunięta
        SELECT 'Rezerwacja została usunięta.' AS komunikat;
    ELSE
        -- Jeśli rezerwacja nie istnieje, zwracamy komunikat o błędzie
        SELECT 'Rezerwacja o podanym ID nie istnieje.' AS komunikat;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `rezerwacje_z_płatnościami`
--

/*!50001 DROP VIEW IF EXISTS `rezerwacje_z_płatnościami`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rezerwacje_z_płatnościami` AS select `r`.`id_rezerwacji` AS `id_rezerwacji`,`r`.`id_uzytkownika` AS `id_uzytkownika`,`r`.`id_kortu` AS `id_kortu`,`r`.`data_rezerwacji` AS `data_rezerwacji`,`r`.`godzina_start` AS `godzina_start`,`r`.`godzina_koniec` AS `godzina_koniec`,`p`.`status` AS `platnosc_status` from (`rezerwacje` `r` join `platnosci` `p` on((`r`.`id_rezerwacji` = `p`.`id_rezerwacji`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statystyki_wykorzystania_obiektow`
--

/*!50001 DROP VIEW IF EXISTS `statystyki_wykorzystania_obiektow`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `statystyki_wykorzystania_obiektow` AS select `k`.`id_kortu` AS `kort_id`,`k`.`nazwa_kortu` AS `kort_nazwa`,`k`.`lokalizacja` AS `lokalizacja`,`k`.`typ_nawierzchni` AS `nawierzchnia`,count(`r`.`id_rezerwacji`) AS `liczba_rezerwacji`,sum((case when (`r`.`status` = 'zakończony') then 1 else 0 end)) AS `zakonczone_rezerwacje`,sum((case when (`r`.`status` = 'zarezerwowany') then 1 else 0 end)) AS `aktywne_rezerwacje`,sum((case when (`r`.`status` = 'oczekująca') then 1 else 0 end)) AS `oczekujace_rezerwacje` from (`korty` `k` left join `rezerwacje` `r` on((`k`.`id_kortu` = `r`.`id_kortu`))) group by `k`.`id_kortu`,`k`.`nazwa_kortu`,`k`.`lokalizacja`,`k`.`typ_nawierzchni` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `szczegoly_rezerwacji`
--

/*!50001 DROP VIEW IF EXISTS `szczegoly_rezerwacji`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `szczegoly_rezerwacji` AS select `r`.`id_rezerwacji` AS `id_rezerwacji`,`u`.`imie` AS `imie`,`u`.`nazwisko` AS `nazwisko`,`k`.`nazwa_kortu` AS `nazwa_kortu`,`r`.`data_rezerwacji` AS `data_rezerwacji`,`r`.`godzina_start` AS `godzina_start`,`r`.`godzina_koniec` AS `godzina_koniec`,`r`.`status` AS `status` from ((`rezerwacje` `r` join `uzytkownicy` `u` on((`r`.`id_uzytkownika` = `u`.`id_uzytkownika`))) join `korty` `k` on((`r`.`id_kortu` = `k`.`id_kortu`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-22 19:17:11
