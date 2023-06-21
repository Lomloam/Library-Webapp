CREATE DATABASE  IF NOT EXISTS `coollibrarysystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `coollibrarysystem`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: coollibrarysystem
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `name` varchar(100) NOT NULL,
  `birthDate` date DEFAULT NULL,
  `booksWritten` int DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES ('Author A','1990-01-01',10),('Author B','1985-05-15',5),('Author C','1980-11-30',15),('Author D','1995-07-22',8),('Author E','1998-04-12',12);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_writes_book`
--

DROP TABLE IF EXISTS `author_writes_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_writes_book` (
  `authorName` varchar(100) NOT NULL,
  `bookIsbn` int NOT NULL,
  PRIMARY KEY (`authorName`,`bookIsbn`),
  KEY `bookIsbn` (`bookIsbn`),
  CONSTRAINT `author_writes_book_ibfk_1` FOREIGN KEY (`authorName`) REFERENCES `author` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `author_writes_book_ibfk_2` FOREIGN KEY (`bookIsbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_writes_book`
--

LOCK TABLES `author_writes_book` WRITE;
/*!40000 ALTER TABLE `author_writes_book` DISABLE KEYS */;
INSERT INTO `author_writes_book` VALUES ('Author A',1),('Author B',2),('Author C',3),('Author D',4),('Author E',5),('Author A',6),('Author B',10),('Author C',11),('Author D',12),('Author E',12345678),('Author A',123456789),('Author B',234567890),('Author C',345678901),('Author D',456789012),('Author E',567890123),('Author A',678901234),('Author C',789012345),('Author D',890123456),('Author C',901234567);
/*!40000 ALTER TABLE `author_writes_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `isbn` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `publicationDate` date NOT NULL,
  `genre` enum('Fiction','Non-Fiction','Mystery','Science Fiction','Fantasy','Romance','Horror','Thriller','Historical Fiction','Biography') DEFAULT NULL,
  `readingLevel` enum('Childrens','Beginner','Intermediate','Hard','Expert') DEFAULT NULL,
  `publisher` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `numCopies` int DEFAULT '0',
  `numCopiesAvailable` int DEFAULT '0',
  PRIMARY KEY (`isbn`),
  KEY `publisher` (`publisher`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publisher`) REFERENCES `publisher` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'1984','1949-06-08','Science Fiction','Hard','Publisher D','A dystopian novel that portrays a totalitarian society and explores themes of surveillance and government control.',2,1),(2,'Pride and Prejudice','1813-01-28','Romance','Intermediate','Publisher E','Jane Austen\'s classic novel of love, societal expectations, and the power of first impressions.',2,2),(3,'The Shining','1977-01-28','Horror','Hard','Publisher F','A psychological horror novel by Stephen King, set in an isolated hotel where supernatural events unfold.',2,2),(4,'The Da Vinci Code','2003-04-01','Mystery','Expert','Publisher C','A thrilling mystery novel that combines art, history, and religion.',2,2),(5,'To Kill a Mockingbird','2010-07-01','Historical Fiction','Intermediate','Publisher B','A Pulitzer Prize-winning novel set in the 1930s, addressing racial injustice and moral development.',2,2),(6,'The Secret Garden','2022-03-15','Horror','Beginner','Publisher A','A classic children\'s novel about a young girl who discovers a hidden garden.',2,2),(10,'The Great Gatsby','1925-04-10','Fiction','Intermediate','Publisher G','F. Scott Fitzgerald\'s iconic novel set in the Roaring Twenties, exploring themes of wealth, love, and the American Dream.',2,1),(11,'The Hobbit','1937-09-21','Fantasy','Intermediate','Publisher H','A fantasy adventure novel by J.R.R. Tolkien, following the journey of Bilbo Baggins.',2,2),(12,'Gone Girl','2012-06-05','Thriller','Expert','Publisher I','A gripping psychological thriller about a missing wife and the dark secrets that unravel.',2,0),(12345678,'Book J','2013-06-14','Biography','Expert','Publisher J','This is Book J description.',3,3),(123456789,'Book A','2022-01-01','Fiction','Intermediate','Publisher A','This is Book A description.',3,3),(234567890,'Book B','2021-05-15','Non-Fiction','Beginner','Publisher B','This is Book B description.',3,1),(345678901,'Book C','2020-11-30','Mystery','Hard','Publisher C','This is Book C description.',3,3),(456789012,'Book D','2019-07-22','Science Fiction','Expert','Publisher D','This is Book D description.',3,3),(567890123,'Book E','2018-04-12','Fantasy','Intermediate','Publisher E','This is Book E description.',3,1),(678901234,'Book F','2017-09-18','Romance','Beginner','Publisher F','This is Book F description.',3,0),(789012345,'Book G','2016-03-05','Horror','Hard','Publisher G','This is Book G description.',3,3),(890123456,'Book H','2015-12-10','Thriller','Intermediate','Publisher H','This is Book H description.',3,3),(901234567,'Book I','2014-08-25','Historical Fiction','Beginner','Publisher I','This is Book I description.',3,3);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_copy`
--

DROP TABLE IF EXISTS `book_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_copy` (
  `copyId` int NOT NULL AUTO_INCREMENT,
  `bookIsbn` int NOT NULL,
  `available` bit(1) DEFAULT NULL,
  `library` varchar(50) NOT NULL,
  PRIMARY KEY (`copyId`),
  KEY `bookIsbn` (`bookIsbn`),
  KEY `library` (`library`),
  CONSTRAINT `book_copy_ibfk_1` FOREIGN KEY (`bookIsbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `book_copy_ibfk_2` FOREIGN KEY (`library`) REFERENCES `library` (`libraryName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_copy`
--

LOCK TABLES `book_copy` WRITE;
/*!40000 ALTER TABLE `book_copy` DISABLE KEYS */;
INSERT INTO `book_copy` VALUES (1,123456789,_binary '','Central Library'),(2,123456789,_binary '','North Branch Library'),(3,123456789,_binary '','Central Library'),(4,234567890,_binary '\0','North Branch Library'),(5,234567890,_binary '\0','Central Library'),(6,234567890,_binary '','Central Library'),(7,345678901,_binary '','North Branch Library'),(8,345678901,_binary '','Central Library'),(9,345678901,_binary '','North Branch Library'),(10,456789012,_binary '','Central Library'),(11,456789012,_binary '','Central Library'),(12,456789012,_binary '','North Branch Library'),(13,567890123,_binary '\0','Central Library'),(14,567890123,_binary '\0','North Branch Library'),(15,567890123,_binary '','Central Library'),(16,678901234,_binary '\0','Central Library'),(17,678901234,_binary '\0','North Branch Library'),(18,678901234,_binary '\0','Central Library'),(19,789012345,_binary '','North Branch Library'),(20,789012345,_binary '','Central Library'),(21,789012345,_binary '','Central Library'),(22,890123456,_binary '','North Branch Library'),(23,890123456,_binary '','Central Library'),(24,890123456,_binary '','North Branch Library'),(25,901234567,_binary '','Central Library'),(26,901234567,_binary '','Central Library'),(27,901234567,_binary '','North Branch Library'),(28,12345678,_binary '','Central Library'),(29,12345678,_binary '','Central Library'),(30,12345678,_binary '','North Branch Library'),(31,1,_binary '\0','Central Library'),(32,2,_binary '','North Branch Library'),(33,3,_binary '','Central Library'),(34,4,_binary '','North Branch Library'),(35,5,_binary '','Central Library'),(36,6,_binary '','North Branch Library'),(37,11,_binary '','Central Library'),(38,12,_binary '\0','North Branch Library'),(39,1,_binary '','Central Library'),(40,10,_binary '\0','North Branch Library'),(41,3,_binary '','Central Library'),(42,2,_binary '','North Branch Library'),(43,4,_binary '','Central Library'),(44,5,_binary '','North Branch Library'),(45,6,_binary '','Central Library'),(46,10,_binary '','North Branch Library'),(47,11,_binary '','Central Library'),(48,12,_binary '\0','North Branch Library');
/*!40000 ALTER TABLE `book_copy` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `book_copy_add` AFTER INSERT ON `book_copy` FOR EACH ROW begin 
call update_num_copies_all();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `book_copy_update` AFTER UPDATE ON `book_copy` FOR EACH ROW begin 
call update_num_copies_all();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `book_review`
--

DROP TABLE IF EXISTS `book_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_review` (
  `bookIsbn` int NOT NULL,
  `description` varchar(300) NOT NULL,
  `reviewId` int NOT NULL AUTO_INCREMENT,
  `readerNo` int DEFAULT NULL,
  PRIMARY KEY (`reviewId`),
  KEY `readerNo` (`readerNo`),
  KEY `bookIsbn` (`bookIsbn`),
  CONSTRAINT `book_review_ibfk_1` FOREIGN KEY (`readerNo`) REFERENCES `reader` (`readerNo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `book_review_ibfk_2` FOREIGN KEY (`bookIsbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_review`
--

LOCK TABLES `book_review` WRITE;
/*!40000 ALTER TABLE `book_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowing_history`
--

DROP TABLE IF EXISTS `borrowing_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowing_history` (
  `copyId` int NOT NULL,
  `readerNo` int NOT NULL,
  `dateBorrowed` date NOT NULL,
  `dateDue` date NOT NULL,
  PRIMARY KEY (`copyId`,`readerNo`),
  KEY `readerNo` (`readerNo`),
  CONSTRAINT `borrowing_history_ibfk_1` FOREIGN KEY (`readerNo`) REFERENCES `reader` (`readerNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `borrowing_history_ibfk_2` FOREIGN KEY (`copyId`) REFERENCES `book_copy` (`copyId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowing_history`
--

LOCK TABLES `borrowing_history` WRITE;
/*!40000 ALTER TABLE `borrowing_history` DISABLE KEYS */;
INSERT INTO `borrowing_history` VALUES (4,8,'2023-06-20','2023-06-27'),(5,7,'2023-06-20','2023-06-27'),(13,10,'2023-06-20','2023-06-27'),(14,9,'2023-06-20','2023-06-27'),(16,11,'2023-06-20','2023-06-27'),(17,7,'2023-06-20','2023-06-27'),(18,13,'2023-06-20','2023-06-27'),(31,17,'2023-06-21','2023-06-28'),(38,20,'2023-06-21','2023-06-28'),(40,20,'2023-06-21','2023-06-28'),(48,11,'2023-06-21','2023-06-28');
/*!40000 ALTER TABLE `borrowing_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `headlibrarian`
--

DROP TABLE IF EXISTS `headlibrarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `headlibrarian` (
  `staffNo` int NOT NULL,
  `libraryName` varchar(100) NOT NULL,
  `bonus` int NOT NULL,
  KEY `staffNo` (`staffNo`),
  KEY `libraryName` (`libraryName`),
  CONSTRAINT `headlibrarian_ibfk_1` FOREIGN KEY (`staffNo`) REFERENCES `librarian` (`staffNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `headlibrarian_ibfk_2` FOREIGN KEY (`libraryName`) REFERENCES `librarian` (`libraryName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `headlibrarian`
--

LOCK TABLES `headlibrarian` WRITE;
/*!40000 ALTER TABLE `headlibrarian` DISABLE KEYS */;
INSERT INTO `headlibrarian` VALUES (1,'Central Library',5000),(4,'North Branch Library',3000);
/*!40000 ALTER TABLE `headlibrarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `librarian` (
  `libraryName` varchar(100) NOT NULL,
  `staffNo` int NOT NULL,
  `hourlyWage` double NOT NULL,
  `hoursPerWeek` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`staffNo`),
  KEY `libraryName` (`libraryName`),
  CONSTRAINT `librarian_ibfk_1` FOREIGN KEY (`libraryName`) REFERENCES `library` (`libraryName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarian`
--

LOCK TABLES `librarian` WRITE;
/*!40000 ALTER TABLE `librarian` DISABLE KEYS */;
INSERT INTO `librarian` VALUES ('Central Library',1,20.5,40,'John Doe'),('Central Library',2,18.75,35,'Jane Smith'),('Central Library',3,22,37,'Michael Johnson'),('North Branch Library',4,19.25,38,'Emily Davis'),('North Branch Library',5,21.5,40,'Robert Wilson'),('North Branch Library',6,17.75,30,'Sarah Thompson'),('North Branch Library',7,20,35,'Christopher Lee');
/*!40000 ALTER TABLE `librarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library` (
  `libraryName` varchar(100) NOT NULL,
  `streetNo` int NOT NULL,
  `streetName` varchar(100) NOT NULL,
  `stateAbr` varchar(2) NOT NULL,
  `zipcode` int NOT NULL,
  `yearlyBudget` int NOT NULL,
  PRIMARY KEY (`libraryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` VALUES ('Central Library',123,'Main Street','CA',12345,1000000),('North Branch Library',456,'Oak Avenue','NY',67890,500000);
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `name` varchar(100) NOT NULL,
  `dateEstablished` date DEFAULT NULL,
  `booksPublished` int DEFAULT NULL,
  `streetNo` int DEFAULT NULL,
  `streetName` varchar(100) DEFAULT NULL,
  `stateAbr` varchar(2) DEFAULT NULL,
  `zipcode` int DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES ('Publisher A','2000-01-01',100,123,'Main Street','NY',10001),('Publisher B','1995-05-15',200,456,'Elm Avenue','CA',90210),('Publisher C','1980-11-30',50,789,'Oak Road','TX',77002),('Publisher D','2010-07-22',150,321,'Cedar Lane','IL',60601),('Publisher E','1998-04-12',75,987,'Pine Street','FL',33131),('Publisher F','2005-09-18',120,654,'Maple Avenue','CA',90001),('Publisher G','1985-03-05',80,789,'Spruce Drive','TX',75201),('Publisher H','2002-12-10',95,123,'Cypress Street','NY',10021),('Publisher I','1990-08-25',60,456,'Birch Lane','IL',60611),('Publisher J','2008-06-14',110,789,'Sycamore Road','FL',33602);
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reader`
--

DROP TABLE IF EXISTS `reader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reader` (
  `readerNo` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `streetNo` int NOT NULL,
  `streetName` varchar(100) NOT NULL,
  `stateAbr` varchar(2) NOT NULL,
  `zipcode` int NOT NULL,
  `fines` int DEFAULT '0',
  `telephone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`readerNo`),
  UNIQUE KEY `name` (`name`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reader`
--

LOCK TABLES `reader` WRITE;
/*!40000 ALTER TABLE `reader` DISABLE KEYS */;
INSERT INTO `reader` VALUES (7,'John Smith','johnsmith@example.com',123,'Main Street','CA',12345,169,'1234567890'),(8,'Emily Johnson','emilyjohnson@example.com',456,'Maple Avenue','NY',54321,10,'9876543210'),(9,'Michael Brown','michaelbrown@example.com',789,'Oak Street','TX',67890,3,'5678901234'),(10,'Sophia Davis','sophiadavis@example.com',321,'Cedar Road','FL',45678,0,'4321098765'),(11,'William Johnson','williamjohnson@example.com',654,'Pine Street','WA',23456,0,'9012345678'),(12,'Olivia Wilson','oliviawilson@example.com',987,'Elm Avenue','MA',76543,0,'3456789012'),(13,'James Anderson','jamesanderson@example.com',210,'Spruce Lane','IL',56789,0,'7890123456'),(14,'Emma Thomas','emmathomas@example.com',543,'Birch Street','PA',98765,0,'2109876543'),(15,'Alexander Davis','alexanderdavis@example.com',876,'Cypress Road','OH',34567,0,'8765432109'),(16,'Ava Martin','avamartin@example.com',109,'Sycamore Lane','MI',45678,0,'6543210987'),(17,'aadfs','kosar.liam@gmail.com',14317,'SE 78th Way','WA',98059,0,'4255983119'),(18,'John Jones','kosar.liam@gmail.com',14317,'SE 78th Way','MA',98059,0,'4255983119'),(19,'John Doe','johndoe@example.com',10,'Main Street','CA',12345,0,'1234567890'),(20,'Alice Johnson','alicejohnson@example.com',15,'Oak Avenue','NY',54321,0,'9876543210'),(21,'Michael Smith','michaelsmith@example.com',5,'Elm Street','TX',98765,0,'5551234567'),(22,'Sarah Thompson','sarahthompson@example.com',25,'Cedar Road','FL',67890,0,'1112223333'),(23,'David Wilson','davidwilson@example.com',8,'Pine Avenue','OH',45678,0,'9998887777'),(24,'Emily Davis','emilydavis@example.com',18,'Birch Street','IL',76543,0,'4445556666'),(25,'Jacob Anderson','jacobanderson@example.com',12,'Willow Road','PA',23456,0,'2223334444'),(26,'Olivia Garcia','oliviagarcia@example.com',30,'Maple Avenue','AZ',34567,0,'7776665555'),(27,'William Martinez','williammartinez@example.com',22,'Spruce Street','WA',56789,0,'8889990000'),(28,'Sophia Robinson','sophiarobinson@example.com',14,'Ash Road','GA',45678,0,'3334445555');
/*!40000 ALTER TABLE `reader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reader_registered_for_class`
--

DROP TABLE IF EXISTS `reader_registered_for_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reader_registered_for_class` (
  `readerNo` int NOT NULL,
  `className` varchar(100) NOT NULL,
  KEY `readerNo` (`readerNo`),
  KEY `className` (`className`),
  CONSTRAINT `reader_registered_for_class_ibfk_1` FOREIGN KEY (`readerNo`) REFERENCES `reader` (`readerNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reader_registered_for_class_ibfk_2` FOREIGN KEY (`className`) REFERENCES `reading_class` (`className`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reader_registered_for_class`
--

LOCK TABLES `reader_registered_for_class` WRITE;
/*!40000 ALTER TABLE `reader_registered_for_class` DISABLE KEYS */;
INSERT INTO `reader_registered_for_class` VALUES (7,'Mystery Book Class'),(8,'Fantasy Book Class'),(9,'Sci-Fi Book Class'),(10,'Romance Book Class'),(11,'Mystery Book Class'),(19,'Fantasy Book Class'),(20,'Mystery Book Class'),(21,'Romance Book Class'),(22,'Sci-Fi Book Class'),(23,'Fantasy Book Class'),(24,'Mystery Book Class'),(25,'Romance Book Class'),(26,'Sci-Fi Book Class'),(27,'Fantasy Book Class'),(28,'Mystery Book Class');
/*!40000 ALTER TABLE `reader_registered_for_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reading_class`
--

DROP TABLE IF EXISTS `reading_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reading_class` (
  `librarianNo` int NOT NULL,
  `libraryName` varchar(100) NOT NULL,
  `className` varchar(100) NOT NULL,
  `meetingDay` enum('Mon','Tues','Wed','Thurs','Fri','Sat','Sun') DEFAULT NULL,
  `numMembers` int DEFAULT '0',
  PRIMARY KEY (`className`),
  KEY `librarianNo` (`librarianNo`),
  KEY `libraryName` (`libraryName`),
  CONSTRAINT `reading_class_ibfk_1` FOREIGN KEY (`librarianNo`) REFERENCES `librarian` (`staffNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reading_class_ibfk_2` FOREIGN KEY (`libraryName`) REFERENCES `library` (`libraryName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reading_class`
--

LOCK TABLES `reading_class` WRITE;
/*!40000 ALTER TABLE `reading_class` DISABLE KEYS */;
INSERT INTO `reading_class` VALUES (1,'Central Library','Fantasy Book Class','Wed',10),(2,'Central Library','Mystery Book Class','Thurs',12),(6,'North Branch Library','Romance Book Class','Mon',6),(4,'North Branch Library','Sci-Fi Book Class','Tues',8);
/*!40000 ALTER TABLE `reading_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'coollibrarysystem'
--

--
-- Dumping routines for database 'coollibrarysystem'
--
/*!50003 DROP FUNCTION IF EXISTS `assess_fines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `assess_fines`(
preaderNo int,
pcopyId int
) RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
begin
declare message varchar(50);
declare pdateReturned date;
declare pfineRate int;
declare totalFineAmt int;
declare dateDifference int;
declare pdateDue date;
 select dateDue 
from borrowing_history where copyId = pcopyId and preaderNo = readerNo into pdateDue;
set pfineRate = 1;
select curdate() into pdateReturned;
select datediff(pdateReturned, pdateDue) into dateDifference;

if (dateDifference > 0)
then select (dateDifference * pfineRate) into totalFineAmt;
select concat("You've received a fine of: $", totalFineAmt) into message; 
else select 0 into totalFineAmt;
select "You've received no fine" into message;
end if;
update reader set fines = fines + totalFineAmt where readerNo = preaderNo;
return message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_out_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_out_book`(
preaderNo int,
pIsbn int,
plibrary varchar(50)
) RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
begin
declare message varchar(50);
declare pcopyId int;
declare pcheckoutDate date;
select curdate() into pcheckoutDate;
case
when not exists (select * from book where isbn = pIsbn) then
	select "No book with this isbn exists" into message;
when not exists (select * from reader where readerNo = preaderNo) then 
select "No reader with that id" into message;
when not exists (select * from library where plibrary = libraryName) then
select "Library doesn't exist" into message;
when ((select count(*) from book_copy where bookIsbn = pIsbn and available = 1 and library = plibrary) = 0)
 then select "Sorry, no available copies for that book" into message;
else (select copyId from book_copy where bookIsbn = pIsbn and available = 1 and library = plibrary limit 1) into pcopyId;
	update book_copy set available = 0 where copyId = pcopyId;
    insert into borrowing_history (copyId, readerNo, dateBorrowed, dateDue) values (pcopyId, preaderNo, pcheckoutDate,
    (select date_add(pcheckoutDate, interval 7 day)));
    select "Book successfully checked out" into message;
end case;
return message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `create_book_review` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `create_book_review`(
preaderNo int,
pbookIsbn int,
pdescription varchar(300)
) RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
begin
declare message varchar(50);

case 
when not exists (select * from reader where preaderNo = readerNo)
	then select "This reader does not exist" into message;
when not exists (select * from book where pbookIsbn = isbn)
	then select "This book does not exist" into message;
when exists (select * from book_review where readerNo = preaderNo and bookIsbn = pbookIsbn)
	then select "This reader has already reviewed this book" into message;
else insert into book_review values (preaderNo, pbookIsbn, pdescription);
	select "Success!" into message;
end case;
return message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `create_reading_class` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `create_reading_class`(
plibrarianNo int,
pclassName varchar(50),
pmeetingDay enum("Mon", "Tues", "Wed", "Thurs", "Fri", "Sat", "Sun")
) RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
begin
declare message varchar(50);
case
when not exists (select * from librarian where staffNo = plibrarianNo)
	then select "This librarian does not exist" into message;
when exists (select * from reading_class where className = pclassName and librarianNo = plibrarianNo)
	then select "This class already exists" into message;
else insert into reading_class (librarianNo, libraryName, className, meetingDay) values
(plibrarianNo, (select libraryName from librarian where staffNo = plibrarianNo), pclassName, pmeetingDay);
select "Success!" into message;
end case;
return message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `remove_reader` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `remove_reader`(
preaderName varchar(50) ,
preaderEmail varchar(50) ,
preaderNo int
) RETURNS varchar(100) CHARSET utf8mb4
    READS SQL DATA
begin
declare message varchar(100);
if exists (select * from reader where name = preaderName and email = preaderEmail and readerNo = preaderNo)
	then case 
when exists (select * from borrowing_history where readerNo = preaderNo)
	then select "This user cannot be deleted. They still have books checked out." into message;
    else select "Success!" into message;
    end case;
    else select "No user with those credentials"into message;
		end if;
	

    
    
return message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `return_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `return_book`(
preaderName varchar(50),
preaderEmail varchar(50),
pcopyId int,
plibrary varchar(50)
) RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
begin 
declare message varchar(50);
declare preaderNo int;

if not exists (select * from reader where name = preaderName and email = preaderEmail) 
	then select "No reader with those details" into message;
    return message;
    else (select readerNo from reader where name = preaderName and email = preaderEmail) into preaderNo;
    end if;
case
when not exists (select * from book_copy where copyId = pcopyId)
	then select "Copy does not exist" into message;
when not exists (select * from library where libraryName = plibrary) 
	then select "This library doesn't exist" into message;
when not exists (select * from borrowing_history where copyId = pcopyId and readerNo = preaderNo)
	then select "Reader does not have this copy checked out" into message;
else select assess_fines(preaderNo, pcopyId) into message;
delete from borrowing_history where preaderNo = readerNo and pcopyId = copyId;
update book_copy set available = 1, library = plibrary where copyId = pcopyId;
end case;

return message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_books` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_books`(
pgenre varchar(50),
preadingLevel varchar(50)
)
begin
case
when pgenre = "Any" and preadingLevel = "Any"
	then select isbn, title,  genre, readingLevel, publisher, description, numCopies, numCopiesAvailable, group_concat(authorName)
    from book left outer join author_writes_book on bookIsbn = isbn group by isbn;
when pgenre = "Any" 
	then select isbn, title,  genre, readingLevel, publisher, description, numCopies, numCopiesAvailable, group_concat(authorName)
    from book left outer join author_writes_book on bookIsbn = isbn where readingLevel = preadingLevel group by isbn;
when preadingLevel = "Any" 
	then select isbn, title,  genre, readingLevel, publisher, description, numCopies, numCopiesAvailable, group_concat(authorName)
    from book left outer join author_writes_book on bookIsbn = isbn where genre = pgenre group by isbn;
else  select isbn, title,  genre, readingLevel, publisher, description, numCopies, numCopiesAvailable, group_concat(authorName)
    from book left outer join author_writes_book on bookIsbn = isbn where genre = pgenre and readingLevel = preadingLevel group by isbn;
    end case;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_books_checked_out` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_books_checked_out`(
preaderNo int
)
begin
select  borrowing_history.readerNo,  book_copy.copyId,
borrowing_history.dateBorrowed, borrowing_history.dateDue, book.isbn, book.title
from borrowing_history left outer join book_copy on book_copy.copyId = borrowing_history.copyId 
left join book on book.isbn = book_copy.bookIsbn where preaderNo = borrowing_history.readerNo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_classe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_classe`(
preaderNo int
)
begin
select libraryName,  librarian.name, reading_class.className, meetingDay, numMembers from reader_registered_for_class
left outer join reading_class on reading_class.className = reader_registered_for_class.className left join 
librarian on reading_class.librarianNo = librarian.staffNo where readerNo = preaderNo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_classes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_classes`(
preaderNo int
)
begin
select reading_class.libraryName,  librarian.name, reading_class.className, meetingDay, numMembers from reader_registered_for_class
left outer join reading_class on reading_class.className = reader_registered_for_class.className left join 
librarian on reading_class.librarianNo = librarian.staffNo where readerNo = preaderNo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_fines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_fines`(
preaderNo int)
begin
select fines from reader where readerNo = preaderNo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_reviews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_reviews`(
pisbn int
)
begin
select * from book_review where pisbn = bookIsbn;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register_new_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_new_book`(
pisbn int,
ptitle varchar(100),
ppublicationDate date,
pgenre ENUM('Fiction', 'Non-Fiction', 'Mystery', 'Science Fiction', 'Fantasy', 
'Romance', 'Horror', 'Thriller', 'Historical Fiction', 'Biography'),
preadingLevel enum("Childrens", "Beginner", "Intermediate", "Hard", "Expert"),
ppublisher varchar(100),
pdescripiton varchar(1000)
)
begin 

declare exit handler for 1048 
select "No null values please";
declare exit handler for 1062
select "No duplicate isbn's!";

if not exists (select * from publisher where name = ppublisher)
	then insert into publisher (name) values (ppublisher);
    end if;

insert into book (isbn, title, publicationDate, genre, readingLevel, publisher, description) values 
(pisbn, ptitle, ppublicationDate, pgenre, preadingLevel, ppublisher, pdescription);
select "Success!";
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register_new_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_new_user`(
pname varchar(100),
pemail varchar(100),
ptelephone varchar(10),
pstreetNo int,
pstreetName varchar(50),
pstateAbr varchar(2),
pzipcode int
)
begin
declare message varchar(50);
if not exists (select * from reader where name = pname and email = pemail)
then insert into reader (name, email, telephone, streetNo, streetName, stateAbr, zipcode)
values (pname,  pemail, ptelephone, pstreetNo, pstreetName, pstateAbr, pzipcode);
select "Reader successfully registered" into message;
else select "Reader already exists" into message;
end if;
select message;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register_reader_for_class` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_reader_for_class`(
preaderNo int,
pclassName varchar(100)
)
begin
if not exists (select * from reader where readerNo = preaderNo)
then select "No reader exists with this id";
end if;
if not exists (select * from reading_class where className = pclassName) 
then select "No class with this name";
end if;
if not exists (select * from reader_registered_for_class where readerNo = preaderNo and className = pclassName)
then insert into reader_registered_for_class values (preaderNo, pclassName);
else select "This reader is already registered for this class";
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_num_copies_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_num_copies_all`()
begin
declare tempIsbn int;
declare row_not_found tinyint default false;
declare isbn_cursor cursor for select distinct isbn from book;
declare continue handler for not found
set row_not_found = true;

open isbn_cursor;
while row_not_found = false
do fetch isbn_cursor into tempIsbn;
	call update_num_copies_individual(tempIsbn);
end while;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_num_copies_individual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_num_copies_individual`(pisbn int)
begin
update book set numCopies = (select count(*) from book_copy where bookIsbn = pisbn) where isbn = pisbn;
update book set numCopiesAvailable = (select count(*) from book_copy where bookIsbn = pisbn and available = 1) where isbn = pisbn;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-21 15:16:04
