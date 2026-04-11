-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2026 at 02:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auraacrackersdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `categoryImg` varchar(255) NOT NULL,
  `isActive` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryImg`, `isActive`) VALUES
(32, 'SPARKLERS', '', 1),
(33, 'FLOWER POTS', '', 1),
(34, 'SPECIAL FLOWER POTS', '', 1),
(35, 'CHAKKARS', '', 1),
(36, 'TWINKLING STAR (Glow Show)', '', 1),
(37, 'TWINKLE PENCILS', '', 1),
(38, 'ONE SOUND CRACKERS', '', 1),
(39, 'MULTI SOUND CRACKERS', '', 1),
(40, 'BIJILI', '', 1),
(41, 'BRAND BIJILI', '', 1),
(42, 'BOMB', '', 1),
(43, 'POWER DELUXE', '', 1),
(44, 'CELEBRATION GARLAND', '', 1),
(45, 'GARLAND PRIME', '', 1),
(46, 'ROCKETS', '', 1),
(47, 'PEACOCK FOUNTAINS', '', 1),
(48, 'SIREN', '', 1),
(49, 'BABY FANCY NOVELTIES', '', 1),
(50, 'COLOR RIDER SHOTS', '', 1),
(51, 'MULTI COLOUR SHOTS (Sky Blasters)', '', 1),
(52, 'MULTI COLOUR SHOTS BRAND', '', 1),
(53, 'AERIAL CHOTTA FANCY', '', 1),
(54, 'GALAXY SHOW', '', 1),
(55, 'GUJARATH FLOWER POTS', '', 1),
(56, 'SKY DANCERS', '', 1),
(57, 'MAGIC MOMENTS', '', 1),
(58, 'COCKTAIL FANCY', '', 1),
(59, 'PAPER BOMBS', '', 1),
(60, 'SPECIAL FOUNTAINS', '', 1),
(61, 'MINI COLOR CRACKLING FOUNTAIN', '', 1),
(62, '2\"  COLOUR FOUNTAINS', '', 1),
(63, '4\" COLOR FOUNTAINS', '', 1),
(64, 'COLOR MATCHES', '', 1),
(65, 'FAMILY PACKS', '', 1),
(66, 'GIFT BOXES', '', 1),
(67, 'NEW PRODUCTS', '', 1),
(68, 'STANDARD ITEMS', '', 1),
(69, 'FLOWER POT', '', 1),
(70, 'CHAKRAS', '', 1),
(71, 'TWINKLING', '', 1),
(72, 'ELECTRIC LAR CRACKERS', '', 1),
(73, 'GARLAND (CLASSIC)', '', 1),
(74, 'PAPER BOMB', '', 1),
(75, 'COLOR RIDER SHOT', '', 1),
(76, 'MULTI COLOR SHOT', '', 1),
(77, 'MINI ARIAL CHOTO FANCY', '', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
