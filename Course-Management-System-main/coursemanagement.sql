-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: coursemanagement
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_name` varchar(20) DEFAULT NULL,
  `admin_username` varchar(20) DEFAULT NULL,
  `admin_password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('Course Admin','admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(30) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'True',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (100,'Computer Science','True'),(200,'Business Management','True'),(300,'Test','True');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `instructor_id` int(11) DEFAULT NULL,
  `instructor_name` varchar(20) DEFAULT NULL,
  `instructor_email` varchar(25) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  KEY `module_id` (`module_id`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'Sayar Dhakal','sayar@gmail.com',100),(2,'Ram Yadav','ram@gmail.com',110),(3,'Subi Shrestha','subi@gmail.com',80),(4,'Dipesh Pandey','dipesh@gmail.com',50),(6,'Sujan Bhusal','sujan@gmail.com',70),(8,'Saroj Karki','saroj@gmail.com',160),(9,'Kapil Poudel','kapil@gmail.com',150),(5,'Srisab Dhakal','srisab@gmail.com',30),(10,'Sandesh Kandel','sandesh@gmail.com',140),(7,'Bristi Dhakal','bristi@gmail.com',170),(1,'Bina Sapkota','bina@gmail.com',10);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `module_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `module_name` varchar(25) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `module_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (10,100,4,'Personal Development for ',2),(20,100,4,'Introduction to Programmi',3),(30,100,4,'Introduction to Web Techn',1),(40,100,4,'Computing Mathematics and',4),(50,100,4,'Introduction to Database ',2),(60,100,4,'Introduction to Programmi',6),(70,100,5,'Software Engineering',3),(80,100,5,'Object-Oriented Design & ',8),(90,100,5,'Software Project Manageme',9),(100,100,5,'System Analysis and Desig',5),(110,100,5,'Research and Development ',11),(120,100,5,'Introductory Computer Net',1),(130,100,6,'Big Data',10),(140,100,6,'Complex System',77),(150,100,6,'High Perfomance Computing',5),(160,100,6,'AI & Machine Learning',6),(170,200,4,'Academic English',7),(180,200,4,'Undergraduate study and r',8),(190,200,4,'Foundation Mathematics',9),(200,200,4,'Introduction to IT',10),(210,200,4,'Introduction to Business',10),(220,200,4,'Foundation Statistics',9),(230,200,5,'Global Business',10),(240,200,5,'Accounting & Finance',2),(250,200,5,'Principles of Marketing',3);
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` int(11) DEFAULT NULL,
  `student_name` varchar(25) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `marks` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (3,'Ram',130,60),(3,'Ram',140,60),(3,'Ram',150,60),(3,'Ram',160,60),(5,'hari',140,0),(5,'hari',150,0),(7,'Bijay',230,70),(7,'Bijay',240,0),(7,'Bijay',250,0),(7,'Bijay',260,0),(8,'Kumar',170,50),(8,'Kumar',180,50),(8,'Kumar',190,50),(8,'Kumar',220,50),(2,'Sagar',230,0),(2,'Sagar',240,0),(2,'Sagar',250,0),(2,'Sagar',260,0);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-14 19:23:24
