-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2020 at 11:05 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ex1_books`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `first_name`, `last_name`, `birth_date`) VALUES
(1, 'Mark', 'Twain', '1945-01-01'),
(2, 'J.K.', 'Rolling', '1945-01-01'),
(3, 'Maya', 'Angelou', '1966-07-08'),
(4, 'Douglas', 'Adams', '1950-05-06');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `title` varchar(80) DEFAULT NULL,
  `type` varchar(80) DEFAULT NULL,
  `fk_author_id` int(11) DEFAULT NULL,
  `fk_publisher_id` int(11) DEFAULT NULL,
  `fk_read_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `title`, `type`, `fk_author_id`, `fk_publisher_id`, `fk_read_id`) VALUES
(1, 'The Gilded Age: A Tale of Today', 'Novel', 1, 1, 1001),
(2, 'Harry Potter and the Philosopher\'s Stone', 'Novel', 2, 1, 1002),
(3, 'I Know Why the Caged Bird Sings', 'Autobiography ', 3, 1, 1003),
(4, 'The Prince and the Pauper', 'Novel', 1, 1, 1004),
(5, 'A Connecticut Yankee in King Arthur\'s Court ', 'Novel', 1, 1, 1005),
(6, 'The American Claimant', 'Novel', 1, 1, 1006);

-- --------------------------------------------------------

--
-- Table structure for table `library`
--

CREATE TABLE `library` (
  `library_id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `fk_book_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `library`
--

INSERT INTO `library` (`library_id`, `name`, `address`, `fk_book_id`) VALUES
(1, 'Austrian National Library', 'Josefsplatz 1, 1015 Wien', 1),
(2, 'Wienbibliothek im Rathaus', '1 Felderstraße, Innere Stadt Wien, Wien, 1082, Austria', 2),
(3, 'Central Library on the Gürtel', 'Urban-Loritz-Platz 2A, 1070 Wien', 3);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `name`, `address`) VALUES
(1, 'abc', '1558  Park Street'),
(2, 'aaa', '2513  Monroe Street'),
(3, 'ccc', 'Libellengasse 49'),
(4, 'bbb', '33915 75th Hwy, Plaquemine, LA, 70764');

-- --------------------------------------------------------

--
-- Table structure for table `read`
--

CREATE TABLE `read` (
  `read_id` int(11) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `fk_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `read`
--

INSERT INTO `read` (`read_id`, `date_start`, `date_end`, `fk_user_id`) VALUES
(1001, '2020-01-05', '2020-02-28', 1),
(1002, '2019-11-25', '2020-01-01', 2),
(1003, '2019-10-11', '2020-02-01', 3),
(1004, '2006-05-05', '2008-10-12', 1),
(1005, '2015-12-01', '0000-00-00', 1),
(1006, '2019-01-05', '2019-02-12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(8) NOT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `phone` int(15) DEFAULT NULL,
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `phone`, `birth_date`) VALUES
(1, 'Eri', 'Nagy', 123456, '1989-05-12'),
(2, 'Eva', 'Ave', 583456, '1990-06-11'),
(3, 'Ana', 'Musk', 166456, '1988-01-12'),
(4, 'Sony', 'Tucker', 9988999, '1990-06-23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_author_id` (`fk_author_id`),
  ADD KEY `fk_publisher_id` (`fk_publisher_id`),
  ADD KEY `fk_read_id` (`fk_read_id`);

--
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`library_id`),
  ADD KEY `fk_book_id` (`fk_book_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indexes for table `read`
--
ALTER TABLE `read`
  ADD PRIMARY KEY (`read_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`fk_publisher_id`) REFERENCES `publisher` (`publisher_id`),
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`fk_read_id`) REFERENCES `read` (`read_id`);

--
-- Constraints for table `library`
--
ALTER TABLE `library`
  ADD CONSTRAINT `library_ibfk_1` FOREIGN KEY (`fk_book_id`) REFERENCES `book` (`book_id`);

--
-- Constraints for table `read`
--
ALTER TABLE `read`
  ADD CONSTRAINT `read_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
