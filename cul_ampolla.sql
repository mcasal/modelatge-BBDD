-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 12, 2020 at 11:39 AM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cul_ampolla`
--

-- --------------------------------------------------------

--
-- Table structure for table `Brand`
--

CREATE TABLE `Brand` (
  `idBrand` int(11) NOT NULL,
  `idProvider` int(11) NOT NULL,
  `NameBrand` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Brand`
--

INSERT INTO `Brand` (`idBrand`, `idProvider`, `NameBrand`) VALUES
(1, 1, 'Clotet');

-- --------------------------------------------------------

--
-- Table structure for table `Client`
--

CREATE TABLE `Client` (
  `idClient` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `adress` varchar(45) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `register` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Client`
--

INSERT INTO `Client` (`idClient`, `name`, `adress`, `telephone`, `email`, `register`) VALUES
(1, 'Aitor Tilla', 'C/Santblancat n98', '658854710', 'aitor@tilla.es', '2020-02-12 12:25:36');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `idEmployee` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`idEmployee`, `name`) VALUES
(1, 'Pepito de los Palotes');

-- --------------------------------------------------------

--
-- Table structure for table `Frame`
--

CREATE TABLE `Frame` (
  `idFrame` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Frame`
--

INSERT INTO `Frame` (`idFrame`, `type`, `color`) VALUES
(1, 'pasta', 'rojo');

-- --------------------------------------------------------

--
-- Table structure for table `Glasses`
--

CREATE TABLE `Glasses` (
  `idGlasses` int(11) NOT NULL,
  `idBrand` int(11) NOT NULL,
  `idFrame` int(11) NOT NULL,
  `idLenses` int(11) NOT NULL,
  `price` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Glasses`
--

INSERT INTO `Glasses` (`idGlasses`, `idBrand`, `idFrame`, `idLenses`, `price`) VALUES
(2, 1, 1, 1, '39');

-- --------------------------------------------------------

--
-- Table structure for table `Lenses`
--

CREATE TABLE `Lenses` (
  `idLenses` int(11) NOT NULL,
  `graduated` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Lenses`
--

INSERT INTO `Lenses` (`idLenses`, `graduated`, `color`) VALUES
(1, '5 - 2', 'naranja');

-- --------------------------------------------------------

--
-- Table structure for table `NewClient`
--

CREATE TABLE `NewClient` (
  `idNewClient` int(11) NOT NULL,
  `idClient` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Provider`
--

CREATE TABLE `Provider` (
  `idProvider` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `adress` varchar(300) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `nif` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Provider`
--

INSERT INTO `Provider` (`idProvider`, `name`, `adress`, `telephone`, `fax`, `nif`) VALUES
(1, 'Dust Glasses', 'C/Provença 36', '935877458', NULL, 'P475123'),
(2, 'Ulleres de Goma', 'Avda. Josep Tarradellas n78', '9325688989', '932658410', 'K47512');

-- --------------------------------------------------------

--
-- Table structure for table `Sale`
--

CREATE TABLE `Sale` (
  `idSale` int(11) NOT NULL,
  `idEmployee` int(11) NOT NULL,
  `idGlasses` int(11) NOT NULL,
  `idClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Sale`
--

INSERT INTO `Sale` (`idSale`, `idEmployee`, `idGlasses`, `idClient`) VALUES
(1, 1, 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Brand`
--
ALTER TABLE `Brand`
  ADD PRIMARY KEY (`idBrand`),
  ADD KEY `fk_Brand_Provider_idx` (`idProvider`);

--
-- Indexes for table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`idClient`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`idEmployee`);

--
-- Indexes for table `Frame`
--
ALTER TABLE `Frame`
  ADD PRIMARY KEY (`idFrame`);

--
-- Indexes for table `Glasses`
--
ALTER TABLE `Glasses`
  ADD PRIMARY KEY (`idGlasses`),
  ADD KEY `fk_Glasses_Brand1_idx` (`idBrand`),
  ADD KEY `fk_Glasses_Frame1_idx` (`idFrame`),
  ADD KEY `fk_Glasses_Lenses1_idx` (`idLenses`);

--
-- Indexes for table `Lenses`
--
ALTER TABLE `Lenses`
  ADD PRIMARY KEY (`idLenses`);

--
-- Indexes for table `NewClient`
--
ALTER TABLE `NewClient`
  ADD PRIMARY KEY (`idNewClient`),
  ADD KEY `fk_NewClient_Client1_idx` (`idClient`);

--
-- Indexes for table `Provider`
--
ALTER TABLE `Provider`
  ADD PRIMARY KEY (`idProvider`);

--
-- Indexes for table `Sale`
--
ALTER TABLE `Sale`
  ADD PRIMARY KEY (`idSale`),
  ADD KEY `fk_Sale_Employee1_idx` (`idEmployee`),
  ADD KEY `fk_Sale_Glasses1_idx` (`idGlasses`),
  ADD KEY `fk_Sale_Client1_idx` (`idClient`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Brand`
--
ALTER TABLE `Brand`
  MODIFY `idBrand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Client`
--
ALTER TABLE `Client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `idEmployee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Frame`
--
ALTER TABLE `Frame`
  MODIFY `idFrame` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Glasses`
--
ALTER TABLE `Glasses`
  MODIFY `idGlasses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Lenses`
--
ALTER TABLE `Lenses`
  MODIFY `idLenses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `NewClient`
--
ALTER TABLE `NewClient`
  MODIFY `idNewClient` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Provider`
--
ALTER TABLE `Provider`
  MODIFY `idProvider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Sale`
--
ALTER TABLE `Sale`
  MODIFY `idSale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Brand`
--
ALTER TABLE `Brand`
  ADD CONSTRAINT `fk_Brand_Provider` FOREIGN KEY (`idProvider`) REFERENCES `Provider` (`idProvider`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Glasses`
--
ALTER TABLE `Glasses`
  ADD CONSTRAINT `fk_Glasses_Brand1` FOREIGN KEY (`idBrand`) REFERENCES `Brand` (`idBrand`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Glasses_Frame1` FOREIGN KEY (`idFrame`) REFERENCES `Frame` (`idFrame`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Glasses_Lenses1` FOREIGN KEY (`idLenses`) REFERENCES `Lenses` (`idLenses`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `NewClient`
--
ALTER TABLE `NewClient`
  ADD CONSTRAINT `fk_NewClient_Client1` FOREIGN KEY (`idClient`) REFERENCES `Client` (`idClient`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Sale`
--
ALTER TABLE `Sale`
  ADD CONSTRAINT `fk_Sale_Client1` FOREIGN KEY (`idClient`) REFERENCES `Client` (`idClient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Sale_Employee1` FOREIGN KEY (`idEmployee`) REFERENCES `Employee` (`idEmployee`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Sale_Glasses1` FOREIGN KEY (`idGlasses`) REFERENCES `Glasses` (`idGlasses`) ON DELETE NO ACTION ON UPDATE NO ACTION;
