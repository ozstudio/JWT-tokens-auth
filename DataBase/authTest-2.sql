-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 28, 2021 at 07:27 PM
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
-- Database: `authTest`
--

-- --------------------------------------------------------

--
-- Table structure for table `AspNetRoleClaims`
--

CREATE TABLE `AspNetRoleClaims` (
  `Id` int(11) NOT NULL,
  `ClaimType` text DEFAULT NULL,
  `ClaimValue` text DEFAULT NULL,
  `RoleId` varchar(767) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `AspNetRoles`
--

CREATE TABLE `AspNetRoles` (
  `Id` varchar(767) NOT NULL,
  `ConcurrencyStamp` text DEFAULT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `AspNetUserClaims`
--

CREATE TABLE `AspNetUserClaims` (
  `Id` int(11) NOT NULL,
  `ClaimType` text DEFAULT NULL,
  `ClaimValue` text DEFAULT NULL,
  `UserId` varchar(767) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `AspNetUserLogins`
--

CREATE TABLE `AspNetUserLogins` (
  `LoginProvider` varchar(300) NOT NULL,
  `ProviderKey` varchar(300) NOT NULL,
  `ProviderDisplayName` text DEFAULT NULL,
  `UserId` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `AspNetUsers`
--

CREATE TABLE `AspNetUsers` (
  `Id` varchar(767) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `ConcurrencyStamp` text DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `EmailConfirmed` bit(1) NOT NULL,
  `LockoutEnabled` bit(1) NOT NULL,
  `LockoutEnd` timestamp NULL DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `PasswordHash` text DEFAULT NULL,
  `PhoneNumber` text DEFAULT NULL,
  `PhoneNumberConfirmed` bit(1) NOT NULL,
  `SecurityStamp` text DEFAULT NULL,
  `TwoFactorEnabled` bit(1) NOT NULL,
  `UserName` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `AspNetUsers`
--

INSERT INTO `AspNetUsers` (`Id`, `AccessFailedCount`, `ConcurrencyStamp`, `Email`, `EmailConfirmed`, `LockoutEnabled`, `LockoutEnd`, `NormalizedEmail`, `NormalizedUserName`, `PasswordHash`, `PhoneNumber`, `PhoneNumberConfirmed`, `SecurityStamp`, `TwoFactorEnabled`, `UserName`) VALUES
('07be9a9b-ad5b-4d1f-b55d-15a10f4e8cc5', 0, '218fb117-2243-4a5e-8c48-d72f8b4026db', 'asdasd', b'0', b'1', NULL, 'ASDASD', 'OKI22232', 'AQAAAAEAACcQAAAAECe8sfS2dxK65GlpWD3TEeM8SVAX0EfWVzLbJtvJMkPn+e7fYTKmD7KZ2KarmI+vTw==', NULL, b'0', 'ZVTSVYIU5BCTKSUWSFYE3BEKM6R4N6AP', b'0', 'oki22232'),
('10ed1d0b-5d6f-4ba9-8283-2fe2e5ae622a', 0, '63998722-2e88-43bb-9032-8bdf967616bf', '', b'0', b'1', NULL, '', 'OL', 'AQAAAAEAACcQAAAAEBKXKK+v97so6eiuJjHeYlXU2DyuLiKdKMDcNuaNNe1MO+BGTWgZKbSOOiPYxYit/w==', NULL, b'0', 'ZMJO4OYNMRD2MB3UVCMFZSP6EUD6EEGM', b'0', 'ol'),
('4118c171-3bcf-4c93-81a7-301830ddb2f2', 0, '0e00c483-427c-44f9-b854-4ea2a2506094', 'oleg', b'0', b'1', NULL, 'OLEG', 'OLEG', 'AQAAAAEAACcQAAAAEBL0qVtFMuW5eB/vIb1jRmR/oxLBSY6O8Ip4Z75CcqMRIEf0JHVk3UJX1B07R0qKjA==', NULL, b'0', 'H227CPQO22U5FV4J4XRYTE6SLI4I5CYP', b'0', 'oleg');

-- --------------------------------------------------------

--
-- Table structure for table `__EFMigrationsHistory`
--

CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AspNetRoleClaims`
--
ALTER TABLE `AspNetRoleClaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_AspNetRoleClaims_AspNetRoles_RoleId` (`RoleId`);

--
-- Indexes for table `AspNetRoles`
--
ALTER TABLE `AspNetRoles`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `AspNetUserClaims`
--
ALTER TABLE `AspNetUserClaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_AspNetUserClaims_AspNetUsers_UserId` (`UserId`);

--
-- Indexes for table `AspNetUserLogins`
--
ALTER TABLE `AspNetUserLogins`
  ADD PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  ADD KEY `FK_AspNetUserLogins_AspNetUsers_UserId` (`UserId`);

--
-- Indexes for table `AspNetUsers`
--
ALTER TABLE `AspNetUsers`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `__EFMigrationsHistory`
--
ALTER TABLE `__EFMigrationsHistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AspNetRoleClaims`
--
ALTER TABLE `AspNetRoleClaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `AspNetUserClaims`
--
ALTER TABLE `AspNetUserClaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AspNetRoleClaims`
--
ALTER TABLE `AspNetRoleClaims`
  ADD CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `AspNetUserClaims`
--
ALTER TABLE `AspNetUserClaims`
  ADD CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `AspNetUserLogins`
--
ALTER TABLE `AspNetUserLogins`
  ADD CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
