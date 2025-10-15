-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2025 a las 05:36:45
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `ID_Category_PK` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `ID_Hashtag_FK` int(11) NOT NULL,
  `Description` varchar(2048) NOT NULL,
  `Is_Visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`ID_Category_PK`, `Name`, `ID_Hashtag_FK`, `Description`, `Is_Visible`) VALUES
(10, 'Jugadas', 23, 'Las jugadas más memorables de los mundiales son aquellas que marcaron un antes y un después en la historia del fútbol: goles imposibles, atajadas heroicas y momentos de genialidad que definieron campeonatos. Estas acciones se convierten en recuerdos eternos para los aficionados.', 1),
(11, 'Entrevistas', 24, 'Las entrevistas mas famosas de los jugadores, entrenadores y personalidades comparten sus experiencias, emociones y reflexiones sobre los triunfos, derrotas y aprendizajes que deja un mundial.', 0),
(12, 'Partidos', 25, 'Cada mundial está lleno de partidos históricos que se convierten en leyenda. Desde finales que mantuvieron al mundo en vilo, hasta encuentros sorpresivos donde los favoritos fueron derrotados, cada partido deja huella en la memoria de los fanáticos.', 1),
(13, 'Estadisticas', 26, 'Los números cuentan una parte fundamental de la historia del mundial: récords de goles, selecciones con más títulos, jugadores con mayor número de participaciones y datos curiosos que ayudan a dimensionar la grandeza del torneo.', 0),
(14, 'Asistentes', 27, 'El mundial no sería lo mismo sin la pasión de los aficionados. Los asistentes llevan la fiesta a los estadios con cánticos, banderas y colores que convierten cada encuentro en una celebración cultural y deportiva sin igual.', 0),
(15, 'Incidentes', 28, 'Incidentes que alteraron el curso de los mundiales: suspensiones, accidentes, altercados dentro y fuera de la cancha. Estos episodios forman parte del lado inesperado de la competencia.', 1),
(16, 'Polemicas', 29, 'Decisiones arbitrales controvertidas, jugadas dudosas y situaciones que generaron intensos debates entre jugadores, prensa y aficionados. Las polémicas son parte del folclore del torneo.', 0),
(17, 'Sedes', 30, 'Cada país anfitrión le da una identidad única al mundial. Las ciudades, los estadios y la organización reflejan la cultura local y crean un ambiente especial donde el fútbol se mezcla con la hospitalidad y las tradiciones de cada nación.', 1),
(18, 'Cultura', 31, 'El mundial es mucho más que fútbol: es un fenómeno cultural. Representa un punto de encuentro donde la música, la danza, la gastronomía y las tradiciones locales se unen para mostrar al mundo la diversidad y riqueza cultural de cada país sede.', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID_Category_PK`),
  ADD KEY `FK_categories_hashtags` (`ID_Hashtag_FK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `ID_Category_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK_categories_hashtags` FOREIGN KEY (`ID_Hashtag_FK`) REFERENCES `hashtags` (`ID_Hashtag_PK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
