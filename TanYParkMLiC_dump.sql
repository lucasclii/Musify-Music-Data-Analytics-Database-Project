CREATE DATABASE  IF NOT EXISTS `musify` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `musify`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: musify
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `album_name` varchar(255) NOT NULL,
  `band_name` varchar(255) NOT NULL,
  `label_name` varchar(255) DEFAULT NULL,
  `release_year` year DEFAULT NULL,
  PRIMARY KEY (`album_name`,`band_name`),
  KEY `band_name` (`band_name`),
  KEY `label_name` (`label_name`),
  CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`band_name`) REFERENCES `bands` (`band_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `albums_ibfk_2` FOREIGN KEY (`label_name`) REFERENCES `labels` (`label_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES ('Epic Sounds','The Dynamics','Echo Label',2002),('Explorations in Sound','Sound Explorers','Soundwave Studios',2008),('Groove Nights','Groove Masters','Harmony Records',2003),('Invasion of Bass','Bass Invaders','Melodic Tunes Inc.',2004),('Melodic Echoes','Melody Makers','Tempo Tracks',2006),('Rebel Tunes','Treble Rebels','Riff Raff Records',2005),('Rhythmic Journey','Rhythmic Souls','Note Nirvana',2007),('Visionary Harmonics','Harmonic Visions','Bassline Studios',2004);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bands`
--

DROP TABLE IF EXISTS `bands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bands` (
  `band_name` varchar(255) NOT NULL,
  `founded_year` year DEFAULT NULL,
  `num_of_members` int DEFAULT NULL,
  PRIMARY KEY (`band_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bands`
--

LOCK TABLES `bands` WRITE;
/*!40000 ALTER TABLE `bands` DISABLE KEYS */;
INSERT INTO `bands` VALUES ('Bass Invaders',2004,5),('Groove Masters',2002,4),('Harmonic Visions',2003,6),('Melody Makers',2006,3),('Rhythmic Souls',2007,5),('Sound Explorers',2008,6),('The Dynamics',2001,5),('Treble Rebels',2005,4);
/*!40000 ALTER TABLE `bands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entertainment_company`
--

DROP TABLE IF EXISTS `entertainment_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entertainment_company` (
  `company_name` varchar(255) NOT NULL,
  `telephone_no` char(10) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `founded_year` year DEFAULT NULL,
  PRIMARY KEY (`company_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entertainment_company`
--

LOCK TABLES `entertainment_company` WRITE;
/*!40000 ALTER TABLE `entertainment_company` DISABLE KEYS */;
INSERT INTO `entertainment_company` VALUES ('Bass Beats Ltd.','6789012345','678 Scale Ave','Chord City','Tenor','90006',2010),('Epic Tunes','1234567890','123 Music Lane','Melodyville','Harmony','90001',1985),('Groove Giants','4567890123','456 Riff St','Pitch City','Alto','90004',2000),('Melody Makers','3456789012','345 Harmony Rd','Tune Town','Treble','90003',1995),('Pitch Perfect Co.','8901234567','890 Melody Ave','Harmonia','Bass','90008',2020),('Rhythm Records','5678901234','567 Tempo Tr','Noteville','Soprano','90005',2005),('SoundWave Inc.','2345678901','234 Beat Blvd','Rhythm City','Bass','90002',1990),('Treble Tones','7890123456','789 Note St','Sound City','Baritone','90007',2015);
/*!40000 ALTER TABLE `entertainment_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_name` varchar(255) NOT NULL,
  PRIMARY KEY (`genre_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES ('Classical'),('Country'),('Electronic'),('Hip Hop'),('Jazz'),('Pop'),('Reggae'),('Rock');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labels` (
  `label_name` varchar(255) NOT NULL,
  `telephone_no` char(10) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `founded_year` year DEFAULT NULL,
  PRIMARY KEY (`label_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels`
--

LOCK TABLES `labels` WRITE;
/*!40000 ALTER TABLE `labels` DISABLE KEYS */;
INSERT INTO `labels` VALUES ('Bassline Studios','9734567890','345 Bass Ave','Beat Town','Drum','90013',1996),('Echo Label','9912345678','123 Echo Rd','Echo City','Acoustic','90011',1986),('Harmony Records','9823456789','234 Harmony St','Melodia','Vocal','90012',1991),('Melodic Tunes Inc.','9645678901','456 Tune Way','Soundville','Chorus','90014',2001),('Note Nirvana','9378901234','789 Note Rd','Harmonica','Sax','90017',2016),('Riff Raff Records','9556789012','567 Riff Lane','Melody City','Guitar','90015',2006),('Soundwave Studios','9289012345','890 Wave Ave','Tone Town','Flute','90018',2021),('Tempo Tracks','9467890123','678 Tempo St','Rhythmville','Piano','90016',2011);
/*!40000 ALTER TABLE `labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL,
  `name_last` varchar(32) DEFAULT NULL,
  `name_first` varchar(32) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `band_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `company_name` (`company_name`),
  KEY `band_name` (`band_name`),
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`company_name`) REFERENCES `entertainment_company` (`company_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `members_ibfk_2` FOREIGN KEY (`band_name`) REFERENCES `bands` (`band_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Smith','John','Epic Tunes','The Dynamics'),(2,'Johnson','Emily','SoundWave Inc.','Groove Masters'),(3,'Williams','Mark','Melody Makers','Harmonic Visions'),(4,'Brown','Sarah','Groove Giants','Bass Invaders'),(5,'Jones','David','Rhythm Records','Treble Rebels'),(6,'Miller','Jessica','Bass Beats Ltd.','Melody Makers'),(7,'Davis','Michael','Treble Tones','Rhythmic Souls'),(8,'Garcia','Sophia','Pitch Perfect Co.','Sound Explorers');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_songs`
--

DROP TABLE IF EXISTS `playlist_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_songs` (
  `song_title` varchar(255) DEFAULT NULL,
  `album_name` varchar(255) DEFAULT NULL,
  `band_name` varchar(255) DEFAULT NULL,
  `playlist_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  KEY `song_title` (`song_title`,`album_name`,`band_name`),
  KEY `playlist_name` (`playlist_name`,`user_name`),
  CONSTRAINT `playlist_songs_ibfk_1` FOREIGN KEY (`song_title`, `album_name`, `band_name`) REFERENCES `songs` (`song_title`, `album_name`, `band_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `playlist_songs_ibfk_2` FOREIGN KEY (`playlist_name`, `user_name`) REFERENCES `playlists` (`playlist_name`, `user_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_songs`
--

LOCK TABLES `playlist_songs` WRITE;
/*!40000 ALTER TABLE `playlist_songs` DISABLE KEYS */;
INSERT INTO `playlist_songs` VALUES ('Epic Journey','Epic Sounds','The Dynamics','Rocking Playlist','user1'),('Groovy Night','Groove Nights','Groove Masters','Pop Hits','user2'),('Harmonic Dream','Visionary Harmonics','Harmonic Visions','Jazz Classics','user3'),('Bass Attack','Invasion of Bass','Bass Invaders','Electronic Vibes','user4'),('Rebel Anthem','Rebel Tunes','Treble Rebels','Hip Hop Beats','user5'),('Echo of Melody','Melodic Echoes','Melody Makers','Reggae Rhythms','user6'),('Soul Rhythm','Rhythmic Journey','Rhythmic Souls','Classical Moods','user7'),('Sound Adventure','Explorations in Sound','Sound Explorers','Country Roads','user8');
/*!40000 ALTER TABLE `playlist_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `playlist_name` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  PRIMARY KEY (`playlist_name`,`user_name`),
  KEY `user_name` (`user_name`),
  CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES ('Rocking Playlist','user1'),('Pop Hits','user2'),('Jazz Classics','user3'),('Electronic Vibes','user4'),('Hip Hop Beats','user5'),('Reggae Rhythms','user6'),('Classical Moods','user7'),('Country Roads','user8');
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `description` text,
  `song_title` varchar(255) DEFAULT NULL,
  `album_name` varchar(255) DEFAULT NULL,
  `band_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`review_id`,`user_name`),
  KEY `song_title` (`song_title`,`album_name`,`band_name`),
  KEY `user_name` (`user_name`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`song_title`, `album_name`, `band_name`) REFERENCES `songs` (`song_title`, `album_name`, `band_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'user1','Great track with amazing bass lines.','Epic Journey','Epic Sounds','The Dynamics'),(2,'user2','Pop perfection, catchy and upbeat.','Groovy Night','Groove Nights','Groove Masters'),(3,'user3','A jazz masterpiece, full of soul.','Harmonic Dream','Visionary Harmonics','Harmonic Visions'),(4,'user4','Electrifying rhythms, a true electronic gem.','Bass Attack','Invasion of Bass','Bass Invaders'),(5,'user5','Hip Hop at its finest, great lyrics.','Rebel Anthem','Rebel Tunes','Treble Rebels'),(6,'user6','A reggae rhythm that takes you to the beach.','Echo of Melody','Melodic Echoes','Melody Makers'),(7,'user7','A classical piece that is both moving and inspiring.','Soul Rhythm','Rhythmic Journey','Rhythmic Souls'),(8,'user8','A country song that feels like a road trip.','Sound Adventure','Explorations in Sound','Sound Explorers'),(9,'user1','Dynamic and powerful rock song.','Epic Journey','Epic Sounds','The Dynamics'),(10,'user2','Pop music at its best, very danceable.','Groovy Night','Groove Nights','Groove Masters'),(11,'user3','Smooth jazz with great instrumental solos.','Harmonic Dream','Visionary Harmonics','Harmonic Visions'),(12,'user4','A perfect blend of electronic beats and melodies.','Bass Attack','Invasion of Bass','Bass Invaders'),(13,'user5','Hard-hitting lyrics with a great hip hop beat.','Rebel Anthem','Rebel Tunes','Treble Rebels'),(14,'user6','Lively reggae track that\'s perfect for summer.','Echo of Melody','Melodic Echoes','Melody Makers'),(15,'user7','A timeless classical piece that is soothing.','Soul Rhythm','Rhythmic Journey','Rhythmic Souls'),(16,'user8','This country song is both heartfelt and nostalgic.','Sound Adventure','Explorations in Sound','Sound Explorers');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `song_title` varchar(255) NOT NULL,
  `album_name` varchar(255) NOT NULL,
  `band_name` varchar(255) NOT NULL,
  `song_length` int DEFAULT NULL,
  `genre_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`song_title`,`album_name`,`band_name`),
  KEY `album_name` (`album_name`,`band_name`),
  KEY `genre_name` (`genre_name`),
  CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`album_name`, `band_name`) REFERENCES `albums` (`album_name`, `band_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `songs_ibfk_2` FOREIGN KEY (`genre_name`) REFERENCES `genres` (`genre_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES ('Bass Attack','Invasion of Bass','Bass Invaders',190,'Electronic'),('Echo of Melody','Melodic Echoes','Melody Makers',215,'Reggae'),('Epic Journey','Epic Sounds','The Dynamics',210,'Rock'),('Groovy Night','Groove Nights','Groove Masters',180,'Pop'),('Harmonic Dream','Visionary Harmonics','Harmonic Visions',200,'Jazz'),('Rebel Anthem','Rebel Tunes','Treble Rebels',205,'Hip Hop'),('Soul Rhythm','Rhythmic Journey','Rhythmic Souls',220,'Classical'),('Sound Adventure','Explorations in Sound','Sound Explorers',195,'Country');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('user1','password1'),('user2','password2'),('user3','password3'),('user4','password4'),('user5','password5'),('user6','password6'),('user7','password7'),('user8','password8');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'musify'
--

--
-- Dumping routines for database 'musify'
--
/*!50003 DROP PROCEDURE IF EXISTS `AlbumWithLongestPlayTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlbumWithLongestPlayTime`()
BEGIN
    SELECT a.album_name, SUM(s.song_length) AS total_playtime
    FROM albums a
    JOIN songs s ON a.album_name = s.album_name AND a.band_name = s.band_name
    GROUP BY a.album_name
    ORDER BY total_playtime DESC
    LIMIT 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BandWithLatestAlbum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BandWithLatestAlbum`()
BEGIN
SELECT b.band_name, a.album_name, a.release_year
    FROM bands b
    JOIN albums a ON b.band_name = a.band_name
    JOIN (SELECT band_name, MAX(release_year) AS latest_year FROM albums GROUP BY band_name) 
		AS latest ON b.band_name = latest.band_name AND a.release_year = latest.latest_year;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateAccount`(IN newUser VARCHAR(255), IN newPassword VARCHAR(255))
BEGIN
    DECLARE userCount INT;

    -- Check if the username already exists
    SELECT COUNT(*) INTO userCount FROM users WHERE user_name = newUser;

    IF userCount = 0 THEN
        -- Insert the new user if the username doesn't exist
        INSERT INTO users (user_name, password) VALUES (newUser, newPassword);
    ELSE
        -- Raise an error if the username already exists
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Username already exists.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreatePlaylist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreatePlaylist`(
    IN input_playlist_name VARCHAR(255), 
    IN input_user_name VARCHAR(255)
)
BEGIN
    -- Check if a playlist with the same name already exists for the user
    DECLARE existingCount INT;
    SELECT COUNT(*) INTO existingCount FROM playlists WHERE playlist_name = input_playlist_name AND user_name = input_user_name;

    IF existingCount > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Playlist already exists.';
    ELSE
        INSERT INTO playlists (playlist_name, user_name) VALUES (input_playlist_name, input_user_name);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeletePlaylist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletePlaylist`(
    IN input_playlist_name VARCHAR(255),
    IN input_user_name VARCHAR(255)
)
BEGIN
    DECLARE existingCount_playlist INT;
    DECLARE existingCount_playlist_songs INT;
    
    SELECT COUNT(*) INTO existingCount_playlist FROM playlists 
    WHERE playlist_name = input_playlist_name AND user_name = input_user_name;

    SELECT COUNT(*) INTO existingCount_playlist_songs FROM playlist_songs
    WHERE playlist_name = input_playlist_name AND user_name = input_user_name;
    
    -- Delete from playlist_songs first to maintain referential integrity
    IF existingCount_playlist_songs > 0 THEN
        DELETE FROM playlist_songs
        WHERE playlist_name = input_playlist_name AND user_name = input_user_name;
    END IF;
    
    -- Then delete from playlists
    IF existingCount_playlist > 0 THEN
        DELETE FROM playlists 
        WHERE playlist_name = input_playlist_name AND user_name = input_user_name;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Playlist does not exist.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteSongFromPlaylist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteSongFromPlaylist`(
    IN p_song_title VARCHAR(255),
    IN p_album_name VARCHAR(255),
    IN p_band_name VARCHAR(255),
    IN p_playlist_name VARCHAR(255),
    IN p_user_name VARCHAR(255)
)
BEGIN
    DECLARE songInPlaylistExists INT;
    SELECT COUNT(*) INTO songInPlaylistExists
    FROM playlist_songs
    WHERE song_title = p_song_title AND album_name = p_album_name AND band_name = p_band_name 
      AND playlist_name = p_playlist_name AND user_name = p_user_name;

    -- Delete the song from the playlist if it exists
    IF songInPlaylistExists > 0 THEN
        DELETE FROM playlist_songs
        WHERE song_title = p_song_title AND album_name = p_album_name AND band_name = p_band_name 
          AND playlist_name = p_playlist_name AND user_name = p_user_name;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Song not found in the specified playlist.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAlbumReleaseYears` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAlbumReleaseYears`()
BEGIN
    SELECT album_name, release_year FROM albums;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFoundedYears` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFoundedYears`()
BEGIN
    SELECT founded_year FROM bands;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSongDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSongDetails`()
BEGIN
    SELECT s.song_title, a.album_name, b.band_name
    FROM songs s
    LEFT JOIN albums a ON s.album_name = a.album_name
    LEFT JOIN bands b ON s.band_name = b.band_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserPlaylists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserPlaylists`(IN p_user_name VARCHAR(255))
BEGIN
    SELECT playlist_name FROM playlists WHERE user_name = p_user_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserPlaylistsAndSongs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserPlaylistsAndSongs`(IN p_user_name VARCHAR(255))
BEGIN
    SELECT p.playlist_name, ps.song_title, s.album_name, s.band_name
    FROM playlists p
    JOIN playlist_songs ps ON p.playlist_name = ps.playlist_name
    JOIN songs s ON ps.song_title = s.song_title AND ps.album_name = s.album_name AND ps.band_name = s.band_name
    WHERE p.user_name = p_user_name
    ORDER BY p.playlist_name, ps.song_title;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_album_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_album_name`()
BEGIN
    SELECT album_name FROM albums;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_band_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_band_name`()
BEGIN
    SELECT band_name FROM bands;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_genre_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_genre_name`()
BEGIN
    SELECT genre_name FROM genres;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_songs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_songs`()
BEGIN
    SELECT song_title FROM songs;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_song_by_album` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_song_by_album`(IN p_album_name VARCHAR(255))
BEGIN
    SELECT a.album_name, s.song_title
    FROM albums a
    LEFT JOIN songs s ON a.album_name = s.album_name
    WHERE a.album_name = p_album_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_song_by_bands` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_song_by_bands`(IN p_band_name VARCHAR(255))
BEGIN
    SELECT b.band_name, s.song_title
    FROM bands b
    LEFT JOIN songs s ON b.band_name = s.band_name
    WHERE b.band_name = p_band_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_song_by_genre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_song_by_genre`(IN p_genre_name VARCHAR(255))
BEGIN
    SELECT g.genre_name, s.song_title
    FROM genres g
    LEFT JOIN songs s ON g.genre_name = s.genre_name
    WHERE g.genre_name = p_genre_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertSongIntoPlaylist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertSongIntoPlaylist`(
    IN p_song_title VARCHAR(255),
    IN p_album_name VARCHAR(255),
    IN p_band_name VARCHAR(255),
    IN p_playlist_name VARCHAR(255),
    IN p_user_name VARCHAR(255)
)
BEGIN
    DECLARE songExists INT;
    DECLARE playlistExists INT;
    DECLARE songInPlaylistExists INT;

    -- Check if the song exists in the songs table
    SELECT COUNT(*) INTO songExists
    FROM songs
    WHERE song_title = p_song_title AND album_name = p_album_name AND band_name = p_band_name;

    -- Check if the playlist exists in the playlists table
    SELECT COUNT(*) INTO playlistExists
    FROM playlists
    WHERE playlist_name = p_playlist_name AND user_name = p_user_name;

    -- Check if the song is already in the specified playlist
    SELECT COUNT(*) INTO songInPlaylistExists
    FROM playlist_songs
    WHERE song_title = p_song_title AND album_name = p_album_name AND band_name = p_band_name AND playlist_name = p_playlist_name AND user_name = p_user_name;

    -- Insert the song into the playlist if both song and playlist exist and song is not already in the playlist
    IF songExists > 0 AND playlistExists > 0 AND songInPlaylistExists = 0 THEN
        INSERT INTO playlist_songs (song_title, album_name, band_name, playlist_name, user_name)
        VALUES (p_song_title, p_album_name, p_band_name, p_playlist_name, p_user_name);
    ELSEIF songInPlaylistExists > 0 THEN
        -- Raise an error if the song is already in the playlist
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Song already exists in the specified playlist.';
    ELSE
        -- Raise an error if the song or playlist does not exist
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Song or playlist does not exist.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TopGenresBySongNums` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TopGenresBySongNums`()
BEGIN
	SELECT g.genre_name, COUNT(*) AS num_songs
	FROM genres g
	JOIN songs s ON g.genre_name = s.genre_name
	GROUP BY g.genre_name
	ORDER BY num_songs DESC
    LIMIT 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdatePlaylistName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePlaylistName`(
    IN old_playlist_name VARCHAR(255),
    IN new_playlist_name VARCHAR(255), 
    IN input_user_name VARCHAR(255)
)
BEGIN
    DECLARE existingCount_playlist INT;
    DECLARE existingCount_playlist_songs INT;

    SELECT COUNT(*) INTO existingCount_playlist FROM playlists 
    WHERE playlist_name = old_playlist_name AND user_name = input_user_name;

    SELECT COUNT(*) INTO existingCount_playlist_songs FROM playlist_songs
    WHERE playlist_name = old_playlist_name AND user_name = input_user_name;

    -- Update playlist if exists
    IF existingCount_playlist > 0 THEN
        UPDATE playlists 
        SET playlist_name = new_playlist_name 
        WHERE playlist_name = old_playlist_name AND user_name = input_user_name;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Playlist does not exist.';
    END IF;

    -- Update playlist in playlist_songs if exists
    IF existingCount_playlist_songs > 0 THEN
        UPDATE playlist_songs 
        SET playlist_name = new_playlist_name 
        WHERE playlist_name = old_playlist_name AND user_name = input_user_name;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateUserPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUserPassword`(IN p_user_name VARCHAR(255), IN p_new_password VARCHAR(255))
BEGIN
    UPDATE users SET password = p_new_password WHERE user_name = p_user_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UsersWithMostReviews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UsersWithMostReviews`()
BEGIN
	SELECT u.user_name, COUNT(*) AS num_reviews
	FROM users u
	JOIN reviews r ON u.user_name = r.user_name
	GROUP BY u.user_name
	ORDER BY num_reviews DESC
    LIMIT 5;
END ;;
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

-- Dump completed on 2023-12-07 15:14:42
