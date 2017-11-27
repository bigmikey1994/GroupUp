-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: Group_Up
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `Channel_users`
--

DROP TABLE IF EXISTS `Channel_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Channel_users` (
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` int(2) DEFAULT '2',
  PRIMARY KEY (`channel_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Channel_users_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `Groupchannel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Channel_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Channel_users`
--

LOCK TABLES `Channel_users` WRITE;
/*!40000 ALTER TABLE `Channel_users` DISABLE KEYS */;
INSERT INTO `Channel_users` VALUES (1,4,2),(1,5,2),(1,6,2),(1,9,2),(1,16,2),(1,17,2),(1,18,2),(1,19,2),(1,20,2),(1,24,2),(1,25,2),(1,26,2),(1,27,2),(1,28,2),(1,29,2),(1,30,2),(1,31,2),(1,32,2),(1,33,2),(1,34,2),(1,35,2),(2,20,2),(3,20,3);
/*!40000 ALTER TABLE `Channel_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Groupchannel`
--

DROP TABLE IF EXISTS `Groupchannel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Groupchannel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `private` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Groupchannel`
--

LOCK TABLES `Groupchannel` WRITE;
/*!40000 ALTER TABLE `Groupchannel` DISABLE KEYS */;
INSERT INTO `Groupchannel` VALUES (1,'default',0),(2,'test',0),(3,'testingitout',0);
/*!40000 ALTER TABLE `Groupchannel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MsgLog`
--

DROP TABLE IF EXISTS `MsgLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MsgLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `msg` text,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`,`user_id`),
  CONSTRAINT `MsgLog_ibfk_1` FOREIGN KEY (`channel_id`, `user_id`) REFERENCES `Channel_users` (`channel_id`, `user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MsgLog`
--

LOCK TABLES `MsgLog` WRITE;
/*!40000 ALTER TABLE `MsgLog` DISABLE KEYS */;
INSERT INTO `MsgLog` VALUES (1,1,4,'test','2017-11-01 19:53:43'),(2,1,4,'test','2017-11-01 19:55:48'),(3,1,4,'this was a triumph','2017-11-01 19:56:01'),(4,1,24,'test','2017-11-22 01:14:35'),(5,1,24,'test','2017-11-22 01:25:37'),(6,1,26,'test','2017-11-22 17:08:33'),(7,1,26,'test','2017-11-22 17:10:26'),(8,1,26,'test','2017-11-22 17:14:20'),(9,1,26,'test','2017-11-22 17:18:43'),(10,1,26,'test2','2017-11-22 17:27:02'),(11,1,26,'test','2017-11-22 18:04:51'),(12,1,27,'test','2017-11-22 18:05:17'),(13,1,28,'test','2017-11-22 18:16:21'),(14,1,26,'test','2017-11-22 18:27:03'),(15,1,26,'test','2017-11-22 18:27:06'),(16,1,26,'test','2017-11-22 18:27:11'),(17,1,29,'taur test','2017-11-23 01:03:04'),(18,1,20,'rawr','2017-11-23 01:03:07'),(19,1,20,'kk','2017-11-23 01:03:10'),(20,1,20,'I need to fix the chat box clearing itself again','2017-11-23 01:03:21'),(21,1,20,'test','2017-11-23 02:14:40'),(22,1,33,'test','2017-11-25 00:00:29'),(23,1,33,'test23','2017-11-25 00:01:34'),(24,1,20,'test','2017-11-25 00:39:04'),(25,1,20,'test','2017-11-25 00:39:06'),(26,1,20,'test','2017-11-25 00:39:06'),(27,1,20,'test','2017-11-25 00:39:06'),(28,1,20,'test','2017-11-25 00:39:06'),(29,2,20,'test','2017-11-25 00:46:08'),(30,1,35,'s','2017-11-25 01:08:58');
/*!40000 ALTER TABLE `MsgLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `password` varchar(256) NOT NULL,
  `dispname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (4,'name','€1þÛ†_@Þ÷	Ø8*³žV9:3!jØ’|›žõ\\','name'),(5,'test','€*aJ¸›tÂ‘¨O;g¦sæ_áæ“','test'),(6,'test2','€*aJ¸›tÂ‘¨O;g¦sæ_áæ“','test2'),(9,'test4','€*aJ¸›tÂ‘¨O;g¦sæ_áæ“','test4'),(16,'awkward','€1þÛ†_@Þ÷	Ø8*³žV9:3!jØ’|›žõ\\','awkward'),(17,'yolo','€ê6è‚¬\n%ób¿´<I°É¤ÊSœðe ›Õ’­]^','yolo'),(18,'username','€1þÛ†_@Þ÷	Ø8*³žV9:3!jØ’|›žõ\\','username'),(19,'SERVER','€pÅáÜòeê‰‚\'§ÒYA64b\'`+˜):º@«¸b=N˜›{ì','SERVER'),(20,'NotAFox','€ £A€Í´çÁËI_õŒ[','NotAFox'),(21,'NotAFox2','€ £A€Í´çÁËI_õŒ[',NULL),(22,'NotAFox3','€ £A€Í´çÁËI_õŒ[',NULL),(23,'NotAFox4','€ £A€Í´çÁËI_õŒ[','NotAFox4'),(24,'testtest','€E#V†ï‘\n_›ØÂä','testtest'),(25,'testtesttest','€£uÌ›ÔN|','testtesttest'),(26,'sexy','€âÒº!»ˆnG','sexy'),(27,'lolwat','€œæº“–Î\Zk','lolwat'),(28,'rawr','€iÞ¨ljòšˆ','rawr'),(29,'doubletrouble','€LGbaãzåÅ0®\nÊÊ','doubletrouble'),(30,'testestestest','€£uÌ›ÔN|','testestestest'),(31,'sadfasdf','€O|§ò1ÊuÝ¿äAë¿','sadfasdf'),(32,'sadfawefarewf','€fÍr¥É«@*ºt­0öR','sadfawefarewf'),(33,'asdfasdf','€í‘nõÝkÎ¯FEÿ‹<Êí','asdfasdf'),(34,'asdfasdfasdfasdf','€\'\ri(–†Û—)®©â5ê','asdfasdfasdfasdf'),(35,'sdsd','€0+¾}Â),=','sdsd');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger User_insert_encrypt before Insert on User for each row set new.password = des_encrypt(new.password) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger User_update_encrypt before update on User for each row set new.password = des_encrypt(new.password) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'Group_Up'
--
/*!50003 DROP PROCEDURE IF EXISTS `addmessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addmessage`(uid int(11), cid int(11), message text)
begin
insert into MsgLog(channel_id, user_id, msg)
values (cid, uid, message);
select MsgLog.id, MsgLog.channel_id, MsgLog.msg, User.dispname, MsgLog.time_stamp
from MsgLog
inner join User
on User.id = MsgLog.user_id
where MsgLog.id = last_insert_id();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createchannel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createchannel`(uid int(11), cname varchar(30), isprivate int(1))
begin insert into Groupchannel(name, private) values (cname, isprivate); insert into Channel_users (channel_id, user_id, role) values ((select max(id) from Groupchannel), uid, 3); select max(id) from Groupchannel; end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getchannels` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getchannels`(uid int(11))
BEGIN
SELECT Groupchannel.id, Groupchannel.name
FROM Groupchannel
INNER JOIN Channel_users
  ON Groupchannel.id = Channel_users.channel_id
WHERE Channel_users.user_id = uid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getmessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getmessage`(cide int(11))
begin
select MsgLog.id, MsgLog.channel_id, MsgLog.msg, User.dispname, MsgLog.time_stamp
from MsgLog
inner join User
on User.id = MsgLog.user_id
where MsgLog.channel_id = cide
;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(IN username varchar(30), IN pass varchar(30))
BEGIN
  SELECT id, name, dispname
  FROM User
  WHERE User.name = username AND User.password = DES_ENCRYPT(pass);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register`(in username varchar(30), in pass varchar(30))
begin
if not exists (select * from User where name = username)
  then insert into User (name,password,dispname) values (username, pass,username);
  select id, name, dispname
  from User
  where name = username;
  insert into Channel_users (channel_id, user_id) values(1, (select id from User where name = username));
end if;
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

-- Dump completed on 2017-11-26 19:43:25
