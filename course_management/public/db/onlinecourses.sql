-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: online_courses
-- ------------------------------------------------------
-- Server version	5.7.21-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  `teach_by` varchar(255) DEFAULT NULL,
  `student` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'AWS Certified Solution','Want to pass the AWS Solutions Architect - Associate Exam? Want to become Amazon Web Services Certified?','IT&Software','AWS Certified Solutions Architect - Associate 2018','10/11/2018','10/12/2018','Instructor1',25),(2,'Learn Ethical Hacking From Scratch','Become an ethical hacker that can hack computer systems like black hat hackers and secure them like security experts.','IT&Software','Learning Ethical Hacking','10/11/2018','10/12/2018','Instructor2',20),(3,'The Complete Cyber Security Course : Hackers Exposed!','Become a Cyber Security Specialist, Learn How to Stop Hackers, Prevent Hacking, Learn IT Security','IT&Software','Cyber Security Course','15/12/2018','15/01/2019','Instructor3',30),(4,'The Complete Financial Analyst Course 2018','Excel, Accounting, Financial Statement Analysis, Business Analysis, Financial Math, PowerPoint','Business','Financial Analyst Course','10/12/2018','25/12/2018','Instructor3',30),(5,'Beginner to Pro in Excel','Financial Modeling in Excel that would allow you to walk into a job','Finance','Master Microsoft Excel','20/11/2018','20/12/2018','Instructor4',15),(6,'The Complete Personal Finance Course','students will be able to save, protect and make much more so that their net worth is significantly higher','Finance','The Complete Personal Finance Course','20/12/2018','20/01/2019','Instructor4',25),(7,'Complete Guitar System - Beginner to Advanced','All-in-one Guitar Course With a Proven Step-by-step Learning System.','Music','Complete Guitar','11/11/2018','11/12/2018','Instructor5',20),(8,'Music Theory Comprehensive Complete','A Complete College-Level Music Theory Curriculum. This edition of the course includes levels 1, 2, & 3.','Music','Music Theory Comprehensive Complete','15/01/2019','15/02/2019','Instructor6',30),(9,'BECOME A GREAT SINGER: Your Complete Vocal Training System','Immediately Improve Your Singing. (Any Level, Any Style)','Music','BECOME A GREAT SINGER','15/01/2019','15/02/2019','Instructor7',10),(10,'CompTIA A+ Certification 901. The Total Course','Everything you need to pass the A+ 220-901 Exam, from Mike Meyers, and Total Seminars.','IT&Software','CompTIA A+ Certification 901','11/11/2018','30/11/2018','Instructor1',30),(11,'The Complete Digital Marketing Course','Master Digital Marketing: Social Media Marketing, SEO, YouTube, Email, Facebook Marketing Strategy, Analytics & More!','Marketing','The Complete Digital Marketing ','09/09/2018','09/12/2018','Instructor3',50);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `gender` varchar(32) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'student1','qwerasdf','Tony','Stark','ironman','25/08/1981','Male','student'),(2,'instructor1','zaqwsx','Instructor1','Instructor','Instructor','26/08/1981','Female','instructor'),(3,'student2','12345','student2','student2','student2','27/08/1991','Female','student'),(4,'student3','asdfzxcv','Student3','Student3','Student3','01/01/2000','Male','student'),(5,'instructor2','password','Instructor2','Instructor2','Instructor2','15/06/1978','Female','instructor'),(6,'instructor3','54321','Instructor3','Instructor3','Instructor3','09/09/1999','Male','instructor');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-11 12:31:25
