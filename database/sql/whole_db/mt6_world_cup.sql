-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-10-2025 a las 22:11:38
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mt6_world_cup`
--
CREATE DATABASE IF NOT EXISTS `mt6_world_cup` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mt6_world_cup`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `ID_Category_PK` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `ID_Hashtag_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories-posts`
--

DROP TABLE IF EXISTS `categories-posts`;
CREATE TABLE `categories-posts` (
  `ID_Category_FK` int(11) NOT NULL,
  `ID_Post_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `ID_Comment_PK` int(11) NOT NULL,
  `Body` varchar(256) NOT NULL,
  `ID_UserCreator_FK` int(11) NOT NULL,
  `ID_Post_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hashtags`
--

DROP TABLE IF EXISTS `hashtags`;
CREATE TABLE `hashtags` (
  `ID_Hashtag_PK` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hashtags-posts`
--

DROP TABLE IF EXISTS `hashtags-posts`;
CREATE TABLE `hashtags-posts` (
  `ID_Hashtag_FK` int(11) NOT NULL,
  `ID_Post_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `ID_Post_PK` int(11) NOT NULL,
  `Content_Title` varchar(50) NOT NULL,
  `Content_Body` varchar(1024) NOT NULL,
  `Content_Multimedia` varchar(100) DEFAULT NULL,
  `Upload_Date` datetime NOT NULL,
  `Modified_Date` datetime DEFAULT NULL,
  `Deleted_Date` datetime DEFAULT NULL,
  `ID_WorldCup_Year_FK` int(11) NOT NULL,
  `ID_User_FK` int(11) NOT NULL,
  `Visibility_State` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `ID_Role_PK` int(11) NOT NULL,
  `Rol_Name` varchar(30) NOT NULL,
  `Description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `ID_User_PK` int(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Phone_Number` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Profile_Picture` varchar(100) NOT NULL,
  `ID_Role_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `worldcup_editions`
--

DROP TABLE IF EXISTS `worldcup_editions`;
CREATE TABLE `worldcup_editions` (
  `ID_WorldCup_Year_PK` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `ID_Hashtag_FK` int(11) NOT NULL,
  `Official_Artwork_Multimedia` varchar(100) NOT NULL,
  `Final_Winner` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID_Category_PK`),
  ADD KEY `FK_Categories_Hashtags` (`ID_Hashtag_FK`);

--
-- Indices de la tabla `categories-posts`
--
ALTER TABLE `categories-posts`
  ADD KEY `FK_Categories_Posts_Categories` (`ID_Category_FK`),
  ADD KEY `FK_Categories_Posts_Posts` (`ID_Post_FK`);

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`ID_Comment_PK`),
  ADD KEY `FK_Comments_Posts` (`ID_Post_FK`),
  ADD KEY `FK_Comments_Users` (`ID_UserCreator_FK`);

--
-- Indices de la tabla `hashtags`
--
ALTER TABLE `hashtags`
  ADD PRIMARY KEY (`ID_Hashtag_PK`);

--
-- Indices de la tabla `hashtags-posts`
--
ALTER TABLE `hashtags-posts`
  ADD KEY `FK_Hashtags_Posts_Hashtags` (`ID_Hashtag_FK`),
  ADD KEY `FK_Hashtags_Posts_Posts` (`ID_Post_FK`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`ID_Post_PK`),
  ADD KEY `FK_Posts_Users` (`ID_User_FK`),
  ADD KEY `FK_Posts_WorldCup_Editions` (`ID_WorldCup_Year_FK`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID_Role_PK`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID_User_PK`),
  ADD KEY `FK_Users_Roles` (`ID_Role_FK`);

--
-- Indices de la tabla `worldcup_editions`
--
ALTER TABLE `worldcup_editions`
  ADD PRIMARY KEY (`ID_WorldCup_Year_PK`),
  ADD KEY `FK_WorldCup_Editions_Hashtags` (`ID_Hashtag_FK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `ID_Category_PK` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `ID_Comment_PK` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hashtags`
--
ALTER TABLE `hashtags`
  MODIFY `ID_Hashtag_PK` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `ID_Post_PK` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `ID_Role_PK` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `ID_User_PK` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `worldcup_editions`
--
ALTER TABLE `worldcup_editions`
  MODIFY `ID_WorldCup_Year_PK` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK_Categories_Hashtags` FOREIGN KEY (`ID_Hashtag_FK`) REFERENCES `hashtags` (`ID_Hashtag_PK`);

--
-- Filtros para la tabla `categories-posts`
--
ALTER TABLE `categories-posts`
  ADD CONSTRAINT `FK_Categories_Posts_Categories` FOREIGN KEY (`ID_Category_FK`) REFERENCES `categories` (`ID_Category_PK`),
  ADD CONSTRAINT `FK_Categories_Posts_Posts` FOREIGN KEY (`ID_Post_FK`) REFERENCES `posts` (`ID_Post_PK`);

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_Comments_Posts` FOREIGN KEY (`ID_Post_FK`) REFERENCES `posts` (`ID_Post_PK`),
  ADD CONSTRAINT `FK_Comments_Users` FOREIGN KEY (`ID_UserCreator_FK`) REFERENCES `users` (`ID_User_PK`);

--
-- Filtros para la tabla `hashtags-posts`
--
ALTER TABLE `hashtags-posts`
  ADD CONSTRAINT `FK_Hashtags_Posts_Hashtags` FOREIGN KEY (`ID_Hashtag_FK`) REFERENCES `hashtags` (`ID_Hashtag_PK`),
  ADD CONSTRAINT `FK_Hashtags_Posts_Posts` FOREIGN KEY (`ID_Post_FK`) REFERENCES `posts` (`ID_Post_PK`);

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `FK_Posts_Users` FOREIGN KEY (`ID_User_FK`) REFERENCES `users` (`ID_User_PK`),
  ADD CONSTRAINT `FK_Posts_WorldCup_Editions` FOREIGN KEY (`ID_WorldCup_Year_FK`) REFERENCES `worldcup_editions` (`ID_WorldCup_Year_PK`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_Users_Roles` FOREIGN KEY (`ID_Role_FK`) REFERENCES `roles` (`ID_Role_PK`);

--
-- Filtros para la tabla `worldcup_editions`
--
ALTER TABLE `worldcup_editions`
  ADD CONSTRAINT `FK_WorldCup_Editions_Hashtags` FOREIGN KEY (`ID_Hashtag_FK`) REFERENCES `hashtags` (`ID_Hashtag_PK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
