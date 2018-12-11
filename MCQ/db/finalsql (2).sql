-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 11, 2018 at 03:01 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finalsql`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
CREATE TABLE IF NOT EXISTS `answers` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`answer_id`, `answer`, `question_id`) VALUES
(1, 'Cache-Control', 1),
(2, 'Connection', 2),
(3, 'Upgrade', 1),
(4, 'Accept', 1),
(5, 'Date', 1),
(6, 'Expect', 2),
(7, 'Accept', 2),
(8, 'From', 2),
(9, 'Age', 3),
(10, 'Location', 3),
(11, 'Server', 3),
(12, 'Range', 3),
(13, 'Allow', 4),
(14, 'Referrer', 4),
(15, 'Expires', 4),
(16, 'Last Modified', 4),
(17, 'Anchor', 5),
(18, 'Node', 5),
(19, 'Option', 5),
(20, 'This', 5),
(21, 'Tim-Berners Lee', 6),
(22, 'Vinton Cerf', 6),
(23, 'Hakon Wium Lie', 6),
(24, 'Brendan Eich', 6),
(25, 'All elements have beginning and ending tags', 7),
(26, 'Attribute value are not quoted', 7),
(27, 'All elements are nested properly', 7),
(28, 'None of the above', 7),
(29, 'Yellow', 8),
(30, 'Red', 8),
(31, 'Green', 8),
(32, 'Blue', 8),
(33, 'Yellow', 9),
(34, 'Red', 9),
(35, 'Green', 9),
(36, 'Blue', 9),
(37, 'Yellow', 10),
(38, 'Red', 10),
(39, 'Green', 10),
(40, 'Blue', 10),
(41, 'Jayson', 11),
(42, 'Velasco', 11),
(43, 'Caliway', 11);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) NOT NULL,
  `type_of_question` enum('enumeration','identification','multiple_choice','matching_type') NOT NULL,
  `answer_id` int(11) DEFAULT NULL,
  `no_of_answers` int(11) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `answer_id` (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `question`, `type_of_question`, `answer_id`, `no_of_answers`) VALUES
(1, '1. Which of the following do NOT belong to the general header fields?', 'multiple_choice', 4, NULL),
(2, '2. Which of the following do NOT belong to the request header fields?', 'multiple_choice', 5, NULL),
(3, '3.Which of the following do NOT belong to the response header fields?', 'multiple_choice', 12, NULL),
(4, '4. Which of the following do NOT belong to the entity header fields?', 'multiple_choice', 14, NULL),
(5, '5. Which of the following do NOT belong to the DOM object?', 'multiple_choice', 20, NULL),
(6, '6. Who is the father of the web?', 'multiple_choice', 21, NULL),
(7, '7. The following is the basic differences of XHTML to HTML except for?', 'multiple_choice', 26, NULL),
(8, '8. In the HSL Value, the 120 degree is what color?', 'multiple_choice', 31, NULL),
(9, '9. In the HSL value, the 240 degree is what color?', 'multiple_choice', 32, NULL),
(10, '10. In the HSL Value, the 0 degree is what color?', 'multiple_choice', 38, NULL),
(11, 'Give at least 3 standard methods in HTTP', 'enumeration', NULL, 2),
(12, 'Give the three versions of HTTP under IETF', 'enumeration', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userEmail` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `userPass` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userEmail`, `userId`, `userName`, `userPass`) VALUES
('jaysoncaliway@gmail.com', 1, 'jayson', 'asawa');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
