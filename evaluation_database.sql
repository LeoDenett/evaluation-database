-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2021 at 05:28 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evaluation_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_cinema`
--

CREATE TABLE `admin_cinema` (
  `id` int(11) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `mail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_cinema`
--

INSERT INTO `admin_cinema` (`id`, `lastname`, `firstname`, `mail`) VALUES
(1, 'Denett', 'Leonel', 'evaluationtest@test.com');

-- --------------------------------------------------------

--
-- Table structure for table `cinema`
--

CREATE TABLE `cinema` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `adress` varchar(60) NOT NULL,
  `city` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cinema`
--

INSERT INTO `cinema` (`id`, `name`, `adress`, `city`) VALUES
(1, 'Cinemania', 'Av. TodoBoke', 'Landivisiau');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `age` int(2) NOT NULL,
  `tel` int(10) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `firstname`, `lastname`, `age`, `tel`, `mail`, `password`) VALUES
(1, 'Rapha', 'Poti', 24, 101010101, 'raphi@raphi.com', 'fb101af2f6136a0837f6266c3c9e6ce0'),
(2, 'Andrea', 'Potis', 20, 2020202020, 'andrea@andrea.com', '0eca2c39a6114805302be9d8f14f4f1e'),
(3, 'Gabi', 'Denis', 21, 2020202022, 'gabi@gabi.com', 'a5b03048ebe345c488e0ca30eff6ab0c');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `time` varchar(260) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id`, `name`, `genre`, `time`) VALUES
(1, 'Narnia', 'Fantasy', '2h30min'),
(2, 'Terminator', 'Action', '2h10min');

-- --------------------------------------------------------

--
-- Table structure for table `paiement`
--

CREATE TABLE `paiement` (
  `id` int(11) NOT NULL,
  `type_paiment` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paiement`
--

INSERT INTO `paiement` (`id`, `type_paiment`) VALUES
(1, 'Cinema'),
(2, 'En ligne');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `start_movie` datetime NOT NULL,
  `id_film` int(11) NOT NULL,
  `id_paiement` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_seance` int(11) NOT NULL,
  `id_tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `start_movie`, `id_film`, `id_paiement`, `id_client`, `id_seance`, `id_tarif`) VALUES
(1, '2021-09-28 20:16:00', 1, 1, 1, 2, 3),
(2, '2021-09-29 17:30:00', 2, 2, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `seance`
--

CREATE TABLE `seance` (
  `id` int(11) NOT NULL,
  `salle` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seance`
--

INSERT INTO `seance` (`id`, `salle`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tarif`
--

CREATE TABLE `tarif` (
  `id` int(11) NOT NULL,
  `price` decimal(60,0) NOT NULL,
  `category` varchar(260) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tarif`
--

INSERT INTO `tarif` (`id`, `price`, `category`) VALUES
(1, '8', 'Adult'),
(2, '6', 'Etudiant'),
(3, '5', 'Enfant(12 ans)');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_cinema`
--
ALTER TABLE `admin_cinema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinema`
--
ALTER TABLE `cinema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_film` (`id_film`),
  ADD KEY `fk_id_paiement` (`id_paiement`),
  ADD KEY `fk_id_client` (`id_client`),
  ADD KEY `fk_id_seance` (`id_seance`),
  ADD KEY `fk_id_tarif` (`id_tarif`);

--
-- Indexes for table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tarif`
--
ALTER TABLE `tarif`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_cinema`
--
ALTER TABLE `admin_cinema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cinema`
--
ALTER TABLE `cinema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seance`
--
ALTER TABLE `seance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tarif`
--
ALTER TABLE `tarif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_id_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `fk_id_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `fk_id_paiement` FOREIGN KEY (`id_paiement`) REFERENCES `paiement` (`id`),
  ADD CONSTRAINT `fk_id_seance` FOREIGN KEY (`id_seance`) REFERENCES `seance` (`id`),
  ADD CONSTRAINT `fk_id_tarif` FOREIGN KEY (`id_tarif`) REFERENCES `tarif` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
