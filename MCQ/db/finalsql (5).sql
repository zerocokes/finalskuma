-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 11, 2018 at 05:21 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;

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
(41, 'Get', 11),
(42, 'Head', 11),
(43, 'Post', 11),
(44, 'Put', 11),
(45, 'Delete', 11),
(46, 'Options', 11),
(47, 'Trace', 11),
(48, 'Connect', 11),
(49, 'HTTP 1.0', 12),
(50, 'HTTP 1.1', 12),
(51, 'HTTP 2', 12),
(52, 'General Request Header Fields', 13),
(53, 'Request Header Fields', 13),
(54, 'Response Header Fields', 13),
(55, 'Entity Header Fields', 13),
(56, 'Informational', 14),
(57, 'Success', 14),
(58, 'Redirection', 14),
(59, 'Client Error', 14),
(60, 'Server Error', 14),
(61, 'Safe', 15),
(62, 'Idempotent', 15),
(63, 'Cacheable', 15),
(64, 'RGB Value', 16),
(65, 'Hex Value', 16),
(66, 'HSL Value', 16),
(67, 'RGBA Value', 16),
(68, 'XHTML 1.0', 17),
(69, 'XHTML 1.1', 17),
(70, 'XHTML 1.2', 17),
(71, 'XHTML 2.0', 17),
(72, 'XHTML 5', 17),
(73, 'Author Style', 18),
(74, 'User Style', 18),
(75, 'User Agent Style', 18),
(76, '@media', 20),
(77, '@supports', 20),
(78, '@document', 20),
(82, 'Byte', 19),
(83, 'Char', 19),
(84, 'Class', 19),
(85, 'Const', 19),
(86, 'Debugger', 19),
(87, 'Float', 19),
(88, 'Abstract', 19),
(89, 'Boolean', 19),
(90, 'A. Hakom Wiun Lie and Bert Bos', 28),
(91, 'B. 500', 25),
(92, 'C. Brendan Eich', 26),
(93, 'D. 404', 23),
(94, 'E. DOM Exception', 27),
(95, 'F. 403', 24),
(96, 'G. Host', 29),
(97, 'H. 304', 21),
(98, 'I. 200', 22),
(99, 'J. Get', 30),
(100, 'Host', 31),
(101, 'Brendan Eich', 32),
(102, 'Web Clients', 3),
(103, 'World Wide Web', 34),
(104, 'Task', 35),
(105, 'Protocol', 36),
(106, 'Request', 37),
(107, 'Informational', 38),
(108, 'Redirection', 39),
(109, 'Trace', 40);

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `question`, `type_of_question`, `answer_id`, `no_of_answers`) VALUES
(1, '1. Which of the following do NOT belong to the general header fields?', 'multiple_choice', 4, NULL),
(2, '2. Which of the following do NOT belong to the request header fields?', 'multiple_choice', 2, NULL),
(3, '3.Which of the following do NOT belong to the response header fields?', 'multiple_choice', 12, NULL),
(4, '4. Which of the following do NOT belong to the entity header fields?', 'multiple_choice', 14, NULL),
(5, '5. Which of the following do NOT belong to the DOM object?', 'multiple_choice', 20, NULL),
(6, '6. Who is the father of the web?', 'multiple_choice', 21, NULL),
(7, '7. The following is the basic differences of XHTML to HTML except for?', 'multiple_choice', 26, NULL),
(8, '8. In the HSL Value, the 120 degree is what color?', 'multiple_choice', 31, NULL),
(9, '9. In the HSL value, the 240 degree is what color?', 'multiple_choice', 36, NULL),
(10, '10. In the HSL Value, the 0 degree is what color?', 'multiple_choice', 38, NULL),
(11, 'Give at least 3 standard methods in HTTP', 'enumeration', NULL, 3),
(12, 'Give the three versions of HTTP under IETF', 'enumeration', NULL, 3),
(13, 'Give 4 categories of standard message header fields', 'enumeration', NULL, 4),
(14, 'Give 5 categories of standard status code', 'enumeration', NULL, 5),
(15, 'Give 3 behavior of the HTTP standard request method', 'enumeration', NULL, 3),
(16, 'Give at least three ways how to specify colors in HTML', 'enumeration', NULL, 3),
(17, 'Give at least 3 version of XHTML', 'enumeration', NULL, 3),
(18, 'Give 3 conditional group rules', 'enumeration', NULL, 3),
(19, 'Give at least three reserved words in Javascript', 'enumeration', NULL, 3),
(20, 'Give 3 source of styles for HTML documentation', 'enumeration', NULL, 3),
(21, 'Not modified', 'matching_type', NULL, NULL),
(22, 'Ok', 'matching_type', NULL, NULL),
(23, 'Not found', 'matching_type', NULL, NULL),
(24, 'Forbidden', 'matching_type', NULL, NULL),
(25, 'Internal Server Error', 'matching_type', NULL, NULL),
(26, 'Javascript', 'matching_type', NULL, NULL),
(27, 'DOM object', 'matching_type', NULL, NULL),
(28, 'CSS', 'matching_type', NULL, NULL),
(29, 'Request Header Fields', 'matching_type', NULL, NULL),
(30, 'Idempotent Methods', 'matching_type', NULL, NULL),
(31, 'Maybe be a domain name or an IP address', 'identification', NULL, NULL),
(32, 'Who developed javascript?', 'identification', NULL, NULL),
(33, 'Primary consists of web browsers, but also includes web crawlers/spiders, web-based, email clients, web-based end user tools and applications, etc', 'identification', NULL, NULL),
(34, 'A global information medium which users can read and write via computers connected to the internet', 'identification', NULL, NULL),
(35, 'What is T is in the IETF?', 'identification', NULL, NULL),
(36, 'Set of rules need to be followed', 'identification', NULL, NULL),
(37, 'What is the R in the RFC?', 'identification', NULL, NULL),
(38, 'Indicates that the request has been received, and the process is being continued', 'identification', NULL, NULL),
(39, 'Indicates that further action must be taken in order to complete the request', 'identification', NULL, NULL),
(40, 'Request the server to \"echo\" back to the client the received request', 'identification', NULL, NULL);

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
