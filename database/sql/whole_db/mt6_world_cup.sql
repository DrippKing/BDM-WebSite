-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-10-2025 a las 04:59:14
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
  `ID_Hashtag_FK` int(11) NOT NULL,
  `Description` varchar(2048) NOT NULL,
  `Is_Visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` VALUES(10, 'Jugadas', 23, 'Las jugadas más memorables de los mundiales son aquellas que marcaron un antes y un después en la historia del fútbol: goles imposibles, atajadas heroicas y momentos de genialidad que definieron campeonatos. Estas acciones se convierten en recuerdos eternos para los aficionados.', 1);
INSERT INTO `categories` VALUES(11, 'Entrevistas', 24, 'Las entrevistas mas famosas de los jugadores, entrenadores y personalidades comparten sus experiencias, emociones y reflexiones sobre los triunfos, derrotas y aprendizajes que deja un mundial.', 0);
INSERT INTO `categories` VALUES(12, 'Partidos', 25, 'Cada mundial está lleno de partidos históricos que se convierten en leyenda. Desde finales que mantuvieron al mundo en vilo, hasta encuentros sorpresivos donde los favoritos fueron derrotados, cada partido deja huella en la memoria de los fanáticos.', 1);
INSERT INTO `categories` VALUES(13, 'Estadisticas', 26, 'Los números cuentan una parte fundamental de la historia del mundial: récords de goles, selecciones con más títulos, jugadores con mayor número de participaciones y datos curiosos que ayudan a dimensionar la grandeza del torneo.', 0);
INSERT INTO `categories` VALUES(14, 'Asistentes', 27, 'El mundial no sería lo mismo sin la pasión de los aficionados. Los asistentes llevan la fiesta a los estadios con cánticos, banderas y colores que convierten cada encuentro en una celebración cultural y deportiva sin igual.', 0);
INSERT INTO `categories` VALUES(15, 'Incidentes', 28, 'Incidentes que alteraron el curso de los mundiales: suspensiones, accidentes, altercados dentro y fuera de la cancha. Estos episodios forman parte del lado inesperado de la competencia.', 1);
INSERT INTO `categories` VALUES(16, 'Polemicas', 29, 'Decisiones arbitrales controvertidas, jugadas dudosas y situaciones que generaron intensos debates entre jugadores, prensa y aficionados. Las polémicas son parte del folclore del torneo.', 0);
INSERT INTO `categories` VALUES(17, 'Sedes', 30, 'Cada país anfitrión le da una identidad única al mundial. Las ciudades, los estadios y la organización reflejan la cultura local y crean un ambiente especial donde el fútbol se mezcla con la hospitalidad y las tradiciones de cada nación.', 1);
INSERT INTO `categories` VALUES(18, 'Cultura', 31, 'El mundial es mucho más que fútbol: es un fenómeno cultural. Representa un punto de encuentro donde la música, la danza, la gastronomía y las tradiciones locales se unen para mostrar al mundo la diversidad y riqueza cultural de cada país sede.', 0);

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
-- Estructura de tabla para la tabla `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `ID_Country_PK` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Flag` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` VALUES(1, 'Afganistán', 'https://flagcdn.com/w320/af.png');
INSERT INTO `countries` VALUES(2, 'Albania', 'https://flagcdn.com/w320/al.png');
INSERT INTO `countries` VALUES(3, 'Alemania', 'https://flagcdn.com/w320/de.png');
INSERT INTO `countries` VALUES(4, 'Andorra', 'https://flagcdn.com/w320/ad.png');
INSERT INTO `countries` VALUES(5, 'Angola', 'https://flagcdn.com/w320/ao.png');
INSERT INTO `countries` VALUES(6, 'Antigua y Barbuda', 'https://flagcdn.com/w320/ag.png');
INSERT INTO `countries` VALUES(7, 'Arabia Saudita', 'https://flagcdn.com/w320/sa.png');
INSERT INTO `countries` VALUES(8, 'Argelia', 'https://flagcdn.com/w320/dz.png');
INSERT INTO `countries` VALUES(9, 'Argentina', 'https://flagcdn.com/w320/ar.png');
INSERT INTO `countries` VALUES(10, 'Armenia', 'https://flagcdn.com/w320/am.png');
INSERT INTO `countries` VALUES(11, 'Australia', 'https://flagcdn.com/w320/au.png');
INSERT INTO `countries` VALUES(12, 'Austria', 'https://flagcdn.com/w320/at.png');
INSERT INTO `countries` VALUES(13, 'Azerbaiyán', 'https://flagcdn.com/w320/az.png');
INSERT INTO `countries` VALUES(14, 'Bahamas', 'https://flagcdn.com/w320/bs.png');
INSERT INTO `countries` VALUES(15, 'Bangladés', 'https://flagcdn.com/w320/bd.png');
INSERT INTO `countries` VALUES(16, 'Barbados', 'https://flagcdn.com/w320/bb.png');
INSERT INTO `countries` VALUES(17, 'Baréin', 'https://flagcdn.com/w320/bh.png');
INSERT INTO `countries` VALUES(18, 'Bélgica', 'https://flagcdn.com/w320/be.png');
INSERT INTO `countries` VALUES(19, 'Belice', 'https://flagcdn.com/w320/bz.png');
INSERT INTO `countries` VALUES(20, 'Benín', 'https://flagcdn.com/w320/bj.png');
INSERT INTO `countries` VALUES(21, 'Bielorrusia', 'https://flagcdn.com/w320/by.png');
INSERT INTO `countries` VALUES(22, 'Birmania', 'https://flagcdn.com/w320/mm.png');
INSERT INTO `countries` VALUES(23, 'Bolivia', 'https://flagcdn.com/w320/bo.png');
INSERT INTO `countries` VALUES(24, 'Bosnia y Herzegovina', 'https://flagcdn.com/w320/ba.png');
INSERT INTO `countries` VALUES(25, 'Botsuana', 'https://flagcdn.com/w320/bw.png');
INSERT INTO `countries` VALUES(26, 'Brasil', 'https://flagcdn.com/w320/br.png');
INSERT INTO `countries` VALUES(27, 'Brunéi', 'https://flagcdn.com/w320/bn.png');
INSERT INTO `countries` VALUES(28, 'Bulgaria', 'https://flagcdn.com/w320/bg.png');
INSERT INTO `countries` VALUES(29, 'Burkina Faso', 'https://flagcdn.com/w320/bf.png');
INSERT INTO `countries` VALUES(30, 'Burundi', 'https://flagcdn.com/w320/bi.png');
INSERT INTO `countries` VALUES(31, 'Bután', 'https://flagcdn.com/w320/bt.png');
INSERT INTO `countries` VALUES(32, 'Cabo Verde', 'https://flagcdn.com/w320/cv.png');
INSERT INTO `countries` VALUES(33, 'Camboya', 'https://flagcdn.com/w320/kh.png');
INSERT INTO `countries` VALUES(34, 'Camerún', 'https://flagcdn.com/w320/cm.png');
INSERT INTO `countries` VALUES(35, 'Canadá', 'https://flagcdn.com/w320/ca.png');
INSERT INTO `countries` VALUES(36, 'Catar', 'https://flagcdn.com/w320/qa.png');
INSERT INTO `countries` VALUES(37, 'Chad', 'https://flagcdn.com/w320/td.png');
INSERT INTO `countries` VALUES(38, 'Chile', 'https://flagcdn.com/w320/cl.png');
INSERT INTO `countries` VALUES(39, 'China', 'https://flagcdn.com/w320/cn.png');
INSERT INTO `countries` VALUES(40, 'Chipre', 'https://flagcdn.com/w320/cy.png');
INSERT INTO `countries` VALUES(41, 'Ciudad del Vaticano', 'https://flagcdn.com/w320/va.png');
INSERT INTO `countries` VALUES(42, 'Colombia', 'https://flagcdn.com/w320/co.png');
INSERT INTO `countries` VALUES(43, 'Comoras', 'https://flagcdn.com/w320/km.png');
INSERT INTO `countries` VALUES(44, 'Corea del Norte', 'https://flagcdn.com/w320/kp.png');
INSERT INTO `countries` VALUES(45, 'Corea del Sur', 'https://flagcdn.com/w320/kr.png');
INSERT INTO `countries` VALUES(46, 'Costa de Marfil', 'https://flagcdn.com/w320/ci.png');
INSERT INTO `countries` VALUES(47, 'Costa Rica', 'https://flagcdn.com/w320/cr.png');
INSERT INTO `countries` VALUES(48, 'Croacia', 'https://flagcdn.com/w320/hr.png');
INSERT INTO `countries` VALUES(49, 'Cuba', 'https://flagcdn.com/w320/cu.png');
INSERT INTO `countries` VALUES(50, 'Dinamarca', 'https://flagcdn.com/w320/dk.png');
INSERT INTO `countries` VALUES(51, 'Dominica', 'https://flagcdn.com/w320/dm.png');
INSERT INTO `countries` VALUES(52, 'Ecuador', 'https://flagcdn.com/w320/ec.png');
INSERT INTO `countries` VALUES(53, 'Egipto', 'https://flagcdn.com/w320/eg.png');
INSERT INTO `countries` VALUES(54, 'El Salvador', 'https://flagcdn.com/w320/sv.png');
INSERT INTO `countries` VALUES(55, 'Emiratos Árabes Unidos', 'https://flagcdn.com/w320/ae.png');
INSERT INTO `countries` VALUES(56, 'Eritrea', 'https://flagcdn.com/w320/er.png');
INSERT INTO `countries` VALUES(57, 'Eslovaquia', 'https://flagcdn.com/w320/sk.png');
INSERT INTO `countries` VALUES(58, 'Eslovenia', 'https://flagcdn.com/w320/si.png');
INSERT INTO `countries` VALUES(59, 'España', 'https://flagcdn.com/w320/es.png');
INSERT INTO `countries` VALUES(60, 'Estados Unidos', 'https://flagcdn.com/w320/us.png');
INSERT INTO `countries` VALUES(61, 'Estonia', 'https://flagcdn.com/w320/ee.png');
INSERT INTO `countries` VALUES(62, 'Etiopía', 'https://flagcdn.com/w320/et.png');
INSERT INTO `countries` VALUES(63, 'Filipinas', 'https://flagcdn.com/w320/ph.png');
INSERT INTO `countries` VALUES(64, 'Finlandia', 'https://flagcdn.com/w320/fi.png');
INSERT INTO `countries` VALUES(65, 'Fiyi', 'https://flagcdn.com/w320/fj.png');
INSERT INTO `countries` VALUES(66, 'Francia', 'https://flagcdn.com/w320/fr.png');
INSERT INTO `countries` VALUES(67, 'Gabón', 'https://flagcdn.com/w320/ga.png');
INSERT INTO `countries` VALUES(68, 'Gambia', 'https://flagcdn.com/w320/gm.png');
INSERT INTO `countries` VALUES(69, 'Georgia', 'https://flagcdn.com/w320/ge.png');
INSERT INTO `countries` VALUES(70, 'Ghana', 'https://flagcdn.com/w320/gh.png');
INSERT INTO `countries` VALUES(71, 'Granada', 'https://flagcdn.com/w320/gd.png');
INSERT INTO `countries` VALUES(72, 'Grecia', 'https://flagcdn.com/w320/gr.png');
INSERT INTO `countries` VALUES(73, 'Guatemala', 'https://flagcdn.com/w320/gt.png');
INSERT INTO `countries` VALUES(74, 'Guyana', 'https://flagcdn.com/w320/gy.png');
INSERT INTO `countries` VALUES(75, 'Guinea', 'https://flagcdn.com/w320/gn.png');
INSERT INTO `countries` VALUES(76, 'Guinea ecuatorial', 'https://flagcdn.com/w320/gq.png');
INSERT INTO `countries` VALUES(77, 'Guinea-Bisáu', 'https://flagcdn.com/w320/gw.png');
INSERT INTO `countries` VALUES(78, 'Haití', 'https://flagcdn.com/w320/ht.png');
INSERT INTO `countries` VALUES(79, 'Honduras', 'https://flagcdn.com/w320/hn.png');
INSERT INTO `countries` VALUES(80, 'Hungría', 'https://flagcdn.com/w320/hu.png');
INSERT INTO `countries` VALUES(81, 'India', 'https://flagcdn.com/w320/in.png');
INSERT INTO `countries` VALUES(82, 'Indonesia', 'https://flagcdn.com/w320/id.png');
INSERT INTO `countries` VALUES(83, 'Irak', 'https://flagcdn.com/w320/iq.png');
INSERT INTO `countries` VALUES(84, 'Irán', 'https://flagcdn.com/w320/ir.png');
INSERT INTO `countries` VALUES(85, 'Irlanda', 'https://flagcdn.com/w320/ie.png');
INSERT INTO `countries` VALUES(86, 'Islandia', 'https://flagcdn.com/w320/is.png');
INSERT INTO `countries` VALUES(87, 'Islas Marshall', 'https://flagcdn.com/w320/mh.png');
INSERT INTO `countries` VALUES(88, 'Islas Salomón', 'https://flagcdn.com/w320/sb.png');
INSERT INTO `countries` VALUES(89, 'Israel', 'https://flagcdn.com/w320/il.png');
INSERT INTO `countries` VALUES(90, 'Italia', 'https://flagcdn.com/w320/it.png');
INSERT INTO `countries` VALUES(91, 'Jamaica', 'https://flagcdn.com/w320/jm.png');
INSERT INTO `countries` VALUES(92, 'Japón', 'https://flagcdn.com/w320/jp.png');
INSERT INTO `countries` VALUES(93, 'Jordania', 'https://flagcdn.com/w320/jo.png');
INSERT INTO `countries` VALUES(94, 'Kazajistán', 'https://flagcdn.com/w320/kz.png');
INSERT INTO `countries` VALUES(95, 'Kenia', 'https://flagcdn.com/w320/ke.png');
INSERT INTO `countries` VALUES(96, 'Kirguistán', 'https://flagcdn.com/w320/kg.png');
INSERT INTO `countries` VALUES(97, 'Kiribati', 'https://flagcdn.com/w320/ki.png');
INSERT INTO `countries` VALUES(98, 'Kuwait', 'https://flagcdn.com/w320/kw.png');
INSERT INTO `countries` VALUES(99, 'Laos', 'https://flagcdn.com/w320/la.png');
INSERT INTO `countries` VALUES(100, 'Lesoto', 'https://flagcdn.com/w320/ls.png');
INSERT INTO `countries` VALUES(101, 'Letonia', 'https://flagcdn.com/w320/lv.png');
INSERT INTO `countries` VALUES(102, 'Líbano', 'https://flagcdn.com/w320/lb.png');
INSERT INTO `countries` VALUES(103, 'Liberia', 'https://flagcdn.com/w320/lr.png');
INSERT INTO `countries` VALUES(104, 'Libia', 'https://flagcdn.com/w320/ly.png');
INSERT INTO `countries` VALUES(105, 'Liechtenstein', 'https://flagcdn.com/w320/li.png');
INSERT INTO `countries` VALUES(106, 'Lituania', 'https://flagcdn.com/w320/lt.png');
INSERT INTO `countries` VALUES(107, 'Luxemburgo', 'https://flagcdn.com/w320/lu.png');
INSERT INTO `countries` VALUES(108, 'Macedonia del Norte', 'https://flagcdn.com/w320/mk.png');
INSERT INTO `countries` VALUES(109, 'Madagascar', 'https://flagcdn.com/w320/mg.png');
INSERT INTO `countries` VALUES(110, 'Malasia', 'https://flagcdn.com/w320/my.png');
INSERT INTO `countries` VALUES(111, 'Malaui', 'https://flagcdn.com/w320/mw.png');
INSERT INTO `countries` VALUES(112, 'Maldivas', 'https://flagcdn.com/w320/mv.png');
INSERT INTO `countries` VALUES(113, 'Malí', 'https://flagcdn.com/w320/ml.png');
INSERT INTO `countries` VALUES(114, 'Malta', 'https://flagcdn.com/w320/mt.png');
INSERT INTO `countries` VALUES(115, 'Marruecos', 'https://flagcdn.com/w320/ma.png');
INSERT INTO `countries` VALUES(116, 'Mauricio', 'https://flagcdn.com/w320/mu.png');
INSERT INTO `countries` VALUES(117, 'Mauritania', 'https://flagcdn.com/w320/mr.png');
INSERT INTO `countries` VALUES(118, 'México', 'https://flagcdn.com/w320/mx.png');
INSERT INTO `countries` VALUES(119, 'Micronesia', 'https://flagcdn.com/w320/fm.png');
INSERT INTO `countries` VALUES(120, 'Moldavia', 'https://flagcdn.com/w320/md.png');
INSERT INTO `countries` VALUES(121, 'Mónaco', 'https://flagcdn.com/w320/mc.png');
INSERT INTO `countries` VALUES(122, 'Mongolia', 'https://flagcdn.com/w320/mn.png');
INSERT INTO `countries` VALUES(123, 'Montenegro', 'https://flagcdn.com/w320/me.png');
INSERT INTO `countries` VALUES(124, 'Mozambique', 'https://flagcdn.com/w320/mz.png');
INSERT INTO `countries` VALUES(125, 'Namibia', 'https://flagcdn.com/w320/na.png');
INSERT INTO `countries` VALUES(126, 'Nauru', 'https://flagcdn.com/w320/nr.png');
INSERT INTO `countries` VALUES(127, 'Nepal', 'https://flagcdn.com/w320/np.png');
INSERT INTO `countries` VALUES(128, 'Nicaragua', 'https://flagcdn.com/w320/ni.png');
INSERT INTO `countries` VALUES(129, 'Níger', 'https://flagcdn.com/w320/ne.png');
INSERT INTO `countries` VALUES(130, 'Nigeria', 'https://flagcdn.com/w320/ng.png');
INSERT INTO `countries` VALUES(131, 'Noruega', 'https://flagcdn.com/w320/no.png');
INSERT INTO `countries` VALUES(132, 'Nueva Zelanda', 'https://flagcdn.com/w320/nz.png');
INSERT INTO `countries` VALUES(133, 'Omán', 'https://flagcdn.com/w320/om.png');
INSERT INTO `countries` VALUES(134, 'Países Bajos', 'https://flagcdn.com/w320/nl.png');
INSERT INTO `countries` VALUES(135, 'Pakistán', 'https://flagcdn.com/w320/pk.png');
INSERT INTO `countries` VALUES(136, 'Palaos', 'https://flagcdn.com/w320/pw.png');
INSERT INTO `countries` VALUES(137, 'Panamá', 'https://flagcdn.com/w320/pa.png');
INSERT INTO `countries` VALUES(138, 'Papúa Nueva Guinea', 'https://flagcdn.com/w320/pg.png');
INSERT INTO `countries` VALUES(139, 'Paraguay', 'https://flagcdn.com/w320/py.png');
INSERT INTO `countries` VALUES(140, 'Perú', 'https://flagcdn.com/w320/pe.png');
INSERT INTO `countries` VALUES(141, 'Polonia', 'https://flagcdn.com/w320/pl.png');
INSERT INTO `countries` VALUES(142, 'Portugal', 'https://flagcdn.com/w320/pt.png');
INSERT INTO `countries` VALUES(143, 'Reino Unido', 'https://flagcdn.com/w320/gb.png');
INSERT INTO `countries` VALUES(144, 'República Centroafricana', 'https://flagcdn.com/w320/cf.png');
INSERT INTO `countries` VALUES(145, 'República Checa', 'https://flagcdn.com/w320/cz.png');
INSERT INTO `countries` VALUES(146, 'República del Congo', 'https://flagcdn.com/w320/cg.png');
INSERT INTO `countries` VALUES(147, 'República Democrática del Congo', 'https://flagcdn.com/w320/cd.png');
INSERT INTO `countries` VALUES(148, 'República Dominicana', 'https://flagcdn.com/w320/do.png');
INSERT INTO `countries` VALUES(149, 'Ruanda', 'https://flagcdn.com/w320/rw.png');
INSERT INTO `countries` VALUES(150, 'Rumanía', 'https://flagcdn.com/w320/ro.png');
INSERT INTO `countries` VALUES(151, 'Rusia', 'https://flagcdn.com/w320/ru.png');
INSERT INTO `countries` VALUES(152, 'Samoa', 'https://flagcdn.com/w320/ws.png');
INSERT INTO `countries` VALUES(153, 'San Cristóbal y Nieves', 'https://flagcdn.com/w320/kn.png');
INSERT INTO `countries` VALUES(154, 'San Marino', 'https://flagcdn.com/w320/sm.png');
INSERT INTO `countries` VALUES(155, 'San Vicente y las Granadinas', 'https://flagcdn.com/w320/vc.png');
INSERT INTO `countries` VALUES(156, 'Santa Lucía', 'https://flagcdn.com/w320/lc.png');
INSERT INTO `countries` VALUES(157, 'Santo Tomé y Príncipe', 'https://flagcdn.com/w320/st.png');
INSERT INTO `countries` VALUES(158, 'Senegal', 'https://flagcdn.com/w320/sn.png');
INSERT INTO `countries` VALUES(159, 'Serbia', 'https://flagcdn.com/w320/rs.png');
INSERT INTO `countries` VALUES(160, 'Seychelles', 'https://flagcdn.com/w320/sc.png');
INSERT INTO `countries` VALUES(161, 'Sierra Leona', 'https://flagcdn.com/w320/sl.png');
INSERT INTO `countries` VALUES(162, 'Singapur', 'https://flagcdn.com/w320/sg.png');
INSERT INTO `countries` VALUES(163, 'Siria', 'https://flagcdn.com/w320/sy.png');
INSERT INTO `countries` VALUES(164, 'Somalia', 'https://flagcdn.com/w320/so.png');
INSERT INTO `countries` VALUES(165, 'Sri Lanka', 'https://flagcdn.com/w320/lk.png');
INSERT INTO `countries` VALUES(166, 'Suazilandia', 'https://flagcdn.com/w320/sz.png');
INSERT INTO `countries` VALUES(167, 'Sudáfrica', 'https://flagcdn.com/w320/za.png');
INSERT INTO `countries` VALUES(168, 'Sudán', 'https://flagcdn.com/w320/sd.png');
INSERT INTO `countries` VALUES(169, 'Sudán del Sur', 'https://flagcdn.com/w320/ss.png');
INSERT INTO `countries` VALUES(170, 'Suecia', 'https://flagcdn.com/w320/se.png');
INSERT INTO `countries` VALUES(171, 'Suiza', 'https://flagcdn.com/w320/ch.png');
INSERT INTO `countries` VALUES(172, 'Surinam', 'https://flagcdn.com/w320/sr.png');
INSERT INTO `countries` VALUES(173, 'Tailandia', 'https://flagcdn.com/w320/th.png');
INSERT INTO `countries` VALUES(174, 'Tanzania', 'https://flagcdn.com/w32_o/tz.png');
INSERT INTO `countries` VALUES(175, 'Tayikistán', 'https://flagcdn.com/w320/tj.png');
INSERT INTO `countries` VALUES(176, 'Timor Oriental', 'https://flagcdn.com/w320/tl.png');
INSERT INTO `countries` VALUES(177, 'Togo', 'https://flagcdn.com/w320/tg.png');
INSERT INTO `countries` VALUES(178, 'Tonga', 'https://flagcdn.com/w320/to.png');
INSERT INTO `countries` VALUES(179, 'Trinidad y Tobago', 'https://flagcdn.com/w320/tt.png');
INSERT INTO `countries` VALUES(180, 'Túnez', 'https://flagcdn.com/w320/tn.png');
INSERT INTO `countries` VALUES(181, 'Turkmenistán', 'https://flagcdn.com/w320/tm.png');
INSERT INTO `countries` VALUES(182, 'Turquía', 'https://flagcdn.com/w320/tr.png');
INSERT INTO `countries` VALUES(183, 'Tuvalu', 'https://flagcdn.com/w320/tv.png');
INSERT INTO `countries` VALUES(184, 'Ucrania', 'https://flagcdn.com/w320/ua.png');
INSERT INTO `countries` VALUES(185, 'Uganda', 'https://flagcdn.com/w320/ug.png');
INSERT INTO `countries` VALUES(186, 'Uruguay', 'https://flagcdn.com/w320/uy.png');
INSERT INTO `countries` VALUES(187, 'Uzbekistán', 'https://flagcdn.com/w320/uz.png');
INSERT INTO `countries` VALUES(188, 'Vanuatu', 'https://flagcdn.com/w320/vu.png');
INSERT INTO `countries` VALUES(189, 'Venezuela', 'https://flagcdn.com/w320/ve.png');
INSERT INTO `countries` VALUES(190, 'Vietnam', 'https://flagcdn.com/w320/vn.png');
INSERT INTO `countries` VALUES(191, 'Yemen', 'https://flagcdn.com/w320/ye.png');
INSERT INTO `countries` VALUES(192, 'Yibuti', 'https://flagcdn.com/w320/dj.png');
INSERT INTO `countries` VALUES(193, 'Zambia', 'https://flagcdn.com/w320/zm.png');
INSERT INTO `countries` VALUES(194, 'Zimbabue', 'https://flagcdn.com/w320/zw.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hashtags`
--

DROP TABLE IF EXISTS `hashtags`;
CREATE TABLE `hashtags` (
  `ID_Hashtag_PK` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `hashtags`
--

INSERT INTO `hashtags` VALUES(1, '#uruguay1930');
INSERT INTO `hashtags` VALUES(2, '#italy1934');
INSERT INTO `hashtags` VALUES(3, '#france1938');
INSERT INTO `hashtags` VALUES(4, '#brazil1950');
INSERT INTO `hashtags` VALUES(5, '#switzerland1954');
INSERT INTO `hashtags` VALUES(6, '#sweden1958');
INSERT INTO `hashtags` VALUES(7, '#chile1962');
INSERT INTO `hashtags` VALUES(8, '#england1966');
INSERT INTO `hashtags` VALUES(9, '#mexico1970');
INSERT INTO `hashtags` VALUES(10, '#germany1974');
INSERT INTO `hashtags` VALUES(11, '#argentina1978');
INSERT INTO `hashtags` VALUES(12, '#spain1982');
INSERT INTO `hashtags` VALUES(13, '#mexico1986');
INSERT INTO `hashtags` VALUES(14, '#italy1990');
INSERT INTO `hashtags` VALUES(15, '#usa1994');
INSERT INTO `hashtags` VALUES(16, '#france1998');
INSERT INTO `hashtags` VALUES(17, '#koreajapan2002');
INSERT INTO `hashtags` VALUES(18, '#germany2006');
INSERT INTO `hashtags` VALUES(19, '#southafrica2010');
INSERT INTO `hashtags` VALUES(20, '#brazil2014');
INSERT INTO `hashtags` VALUES(21, '#russia2018');
INSERT INTO `hashtags` VALUES(22, '#qatar2022');
INSERT INTO `hashtags` VALUES(23, '#jugadas');
INSERT INTO `hashtags` VALUES(24, '#entrevistas');
INSERT INTO `hashtags` VALUES(25, '#partidos');
INSERT INTO `hashtags` VALUES(26, '#estadisticas');
INSERT INTO `hashtags` VALUES(27, '#asistentes');
INSERT INTO `hashtags` VALUES(28, '#incidentes');
INSERT INTO `hashtags` VALUES(29, '#polemicas');
INSERT INTO `hashtags` VALUES(30, '#sedes');
INSERT INTO `hashtags` VALUES(31, '#cultura');

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

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` VALUES(1, 'Pero que ha pasao\'', 'no se esto es un test', NULL, '2025-10-15 05:21:36', NULL, NULL, 1930, 2, 1);
INSERT INTO `posts` VALUES(2, 'hola esto titulo', 'publicacion 2', NULL, '2025-10-15 05:43:47', NULL, NULL, 1930, 2, 1);
INSERT INTO `posts` VALUES(3, 'Hola soy la mujer mas hermosa del universo', 'Ya estoy apartada por @DrippKing', NULL, '2025-10-15 05:49:52', NULL, NULL, 1930, 3, 1);

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

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` VALUES(1, 'Administrador', 'Tiene control total sobre el sitio web, puede gestionar usuarios y contenido.');
INSERT INTO `roles` VALUES(2, 'Usuario', 'Puede crear publicaciones, comentar y calificar contenido.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `ID_User_PK` int(11) NOT NULL,
  `ID_Role_FK` int(11) NOT NULL,
  `Profile_Picture` varchar(100) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Birthdate` date NOT NULL,
  `Gender` int(11) NOT NULL,
  `ID_Country_FK` int(11) NOT NULL,
  `Phone_Number` int(11) NOT NULL,
  `Nametag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` VALUES(2, 2, '481390336_545781551177041_738940.jpg', 'Christian Eduardo', 'Salazar Fuentes', '2005-12-29', 0, 118, 2147483647, 'DrippKing', 'christiansalazar2005@gmail.com', 'Tigres5545');
INSERT INTO `users` VALUES(3, 2, 'Imagen de WhatsApp 2025-10-08 a las 23.50.46_39d3e0ed.jpg', 'Danna Yamileth', 'Hernández Soto', '2004-02-08', 0, 118, 2147483647, 'Dona', 'dannahernandezsoto4@gmail.com', '8180982293');

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
-- Volcado de datos para la tabla `worldcup_editions`
--

INSERT INTO `worldcup_editions` VALUES(1930, 'URUGUAY 1930', 1, 'Uruguay_1930_WC.jpg', 'Uruguay');
INSERT INTO `worldcup_editions` VALUES(1934, 'ITALY 1934', 2, 'Italy_1934_WC.jpg', 'Italia');
INSERT INTO `worldcup_editions` VALUES(1938, 'FRANCE 1938', 3, 'France_1938_WC.jpg', 'Italia');
INSERT INTO `worldcup_editions` VALUES(1950, 'BRAZIL 1950', 4, 'Brazil_1950_WC.jpg', 'Uruguay');
INSERT INTO `worldcup_editions` VALUES(1954, 'SWITZERLAND 1954', 5, 'Switzerland_1954_WC.jpg', 'Alemania Federal');
INSERT INTO `worldcup_editions` VALUES(1958, 'SWEDEN 1958', 6, 'Sweden_1958_WC.jpg', 'Brasil');
INSERT INTO `worldcup_editions` VALUES(1962, 'CHILE 1962', 7, 'Chile_1962_WC.jpg', 'Brasil');
INSERT INTO `worldcup_editions` VALUES(1966, 'ENGLAND 1966', 8, 'England_1966_WC.jpg', 'Inglaterra');
INSERT INTO `worldcup_editions` VALUES(1970, 'MEXICO 1970', 9, 'Mexico_1970_WC.jpg', 'Brasil');
INSERT INTO `worldcup_editions` VALUES(1974, 'GERMANY 1974', 10, 'Germany_1974_WC.jpg', 'Alemania Federal');
INSERT INTO `worldcup_editions` VALUES(1978, 'ARGENTINA 1978', 11, 'Argentina_1978_WC.jpg', 'Argentina');
INSERT INTO `worldcup_editions` VALUES(1982, 'SPAIN 1982', 12, 'Spain_1982_WC.jpg', 'Italia');
INSERT INTO `worldcup_editions` VALUES(1986, 'MEXICO 1986', 13, 'Mexico_1986_WC.jpg', 'Argentina');
INSERT INTO `worldcup_editions` VALUES(1990, 'ITALY 1990', 14, 'Italy_1990_WC.jpg', 'Alemania Federal');
INSERT INTO `worldcup_editions` VALUES(1994, 'USA 1994', 15, 'UnitedStatesOfAmerica_1994_WC.jpg', 'Brasil');
INSERT INTO `worldcup_editions` VALUES(1998, 'FRANCE 1998', 16, 'France_1998_WC.jpg', 'Francia');
INSERT INTO `worldcup_editions` VALUES(2002, 'KOREA/JAPAN 2002', 17, 'Japan_2002_WC.jpg', 'Brasil');
INSERT INTO `worldcup_editions` VALUES(2006, 'GERMANY 2006', 18, 'Germany_2006_WC.jpg', 'Italia');
INSERT INTO `worldcup_editions` VALUES(2010, 'SOUTH AFRICA 2010', 19, 'SouthAfrica_2010_WC.jpg', 'España');
INSERT INTO `worldcup_editions` VALUES(2014, 'BRAZIL 2014', 20, 'Brazil_2014_WC.jpg', 'Alemania');
INSERT INTO `worldcup_editions` VALUES(2018, 'RUSSIA 2018', 21, 'Russia_2018_WC.jpg', 'Francia');
INSERT INTO `worldcup_editions` VALUES(2022, 'QATAR 2022', 22, 'Qatar_2022_WC.jpg', 'Argentina');
INSERT INTO `worldcup_editions` VALUES(2026, 'MÉXICO 2026', 9, '2026_WC.jpg', '');

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
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`ID_Country_PK`);

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
  ADD KEY `FK_Users_Roles` (`ID_Role_FK`),
  ADD KEY `FK_Users_Countries` (`ID_Country_FK`);

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
  MODIFY `ID_Category_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `ID_Comment_PK` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `countries`
--
ALTER TABLE `countries`
  MODIFY `ID_Country_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT de la tabla `hashtags`
--
ALTER TABLE `hashtags`
  MODIFY `ID_Hashtag_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `ID_Post_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `ID_Role_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `ID_User_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `worldcup_editions`
--
ALTER TABLE `worldcup_editions`
  MODIFY `ID_WorldCup_Year_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2027;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK_categories_hashtags` FOREIGN KEY (`ID_Hashtag_FK`) REFERENCES `hashtags` (`ID_Hashtag_PK`);

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
  ADD CONSTRAINT `FK_Users_Countries` FOREIGN KEY (`ID_Country_FK`) REFERENCES `countries` (`ID_Country_PK`),
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
