-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 06-11-2025 a las 00:16:46
-- Versión del servidor: 5.7.23-23
-- Versión de PHP: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `drippkin_mt6_world_cup`
--
CREATE DATABASE IF NOT EXISTS `drippkin_mt6_world_cup` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `drippkin_mt6_world_cup`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories-posts`
--

CREATE TABLE `categories-posts` (
  `ID_Category_FK` int(11) NOT NULL,
  `ID_Post_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories-posts`
--

INSERT INTO `categories-posts` (`ID_Category_FK`, `ID_Post_FK`) VALUES
(10, 927),
(12, 928),
(12, 929),
(15, 930),
(15, 931),
(15, 932),
(17, 933),
(15, 934),
(15, 935),
(17, 936),
(17, 937),
(17, 938),
(10, 939),
(10, 940),
(15, 941),
(10, 942),
(15, 943),
(15, 944),
(15, 945),
(17, 946),
(15, 947),
(10, 948),
(12, 949),
(15, 950),
(12, 951),
(10, 952),
(15, 953),
(10, 954),
(15, 955),
(17, 956),
(17, 957),
(15, 958),
(12, 959),
(12, 960),
(10, 961),
(12, 962),
(15, 963),
(10, 964),
(17, 965),
(10, 966),
(15, 967),
(10, 968),
(12, 969),
(15, 970),
(17, 971),
(17, 972),
(15, 973),
(12, 974),
(15, 975),
(17, 976),
(17, 977),
(17, 978),
(17, 979),
(15, 980),
(17, 981),
(10, 982),
(12, 983),
(17, 984),
(10, 985),
(17, 986),
(17, 987),
(12, 988),
(17, 989),
(15, 990),
(10, 991),
(15, 992),
(15, 993),
(10, 994),
(15, 995),
(15, 996),
(17, 997),
(10, 998),
(17, 999),
(15, 1000),
(10, 1001),
(15, 1002),
(12, 1003),
(10, 1004),
(15, 1005),
(12, 1006),
(15, 1007),
(15, 1008),
(12, 1009),
(15, 1010),
(17, 1011),
(15, 1012),
(12, 1013),
(12, 1014),
(12, 1015),
(15, 1016),
(12, 1017),
(10, 1018),
(17, 1019),
(17, 1020),
(12, 1021),
(12, 1022),
(17, 1023),
(15, 1024),
(10, 1025),
(15, 1026),
(15, 1027),
(10, 1028),
(15, 1029),
(10, 1030),
(12, 1031),
(12, 1032),
(12, 1033),
(10, 1034),
(12, 1035),
(15, 1036),
(17, 1037),
(10, 1038),
(15, 1039),
(17, 1040),
(12, 1041),
(15, 1042),
(10, 1043),
(10, 1044),
(17, 1045),
(12, 1046),
(17, 1047),
(15, 1048),
(10, 1049),
(17, 1050),
(17, 1051),
(17, 1052),
(17, 1053),
(10, 1054),
(17, 1055),
(17, 1056),
(15, 1057),
(12, 1058),
(10, 1059),
(15, 1060),
(10, 1061),
(12, 1062),
(12, 1063),
(17, 1064),
(15, 1065),
(12, 1066),
(17, 1067),
(17, 1068),
(10, 1069),
(10, 1070),
(17, 1071),
(12, 1072),
(12, 1073),
(15, 1074),
(12, 1075),
(15, 1076),
(17, 1077),
(12, 1078),
(10, 1079),
(10, 1080),
(15, 1081),
(10, 1082),
(17, 1083),
(17, 1084),
(17, 1085),
(15, 1086),
(17, 1087),
(12, 1088),
(17, 1089),
(12, 1090),
(17, 1091),
(10, 1092),
(10, 1093),
(15, 1094),
(15, 1095),
(17, 1096),
(17, 1097),
(15, 1098),
(10, 1099),
(10, 1100),
(10, 1101),
(15, 1102),
(17, 1103),
(15, 1104),
(15, 1105),
(15, 1106),
(10, 1107),
(12, 1108),
(12, 1109),
(15, 1110),
(15, 1111),
(17, 1112),
(12, 1113),
(17, 1114),
(17, 1115),
(17, 1116),
(10, 1117),
(12, 1118),
(12, 1119),
(12, 1120),
(17, 1121),
(17, 1122),
(10, 1123),
(15, 1124),
(12, 1125),
(10, 1126),
(10, 1127),
(17, 1128),
(17, 1129),
(15, 1130),
(10, 1131),
(15, 1132),
(17, 1133),
(10, 1134),
(10, 1135),
(17, 1136),
(12, 1137),
(17, 1138),
(12, 1139),
(17, 1140),
(10, 1141),
(12, 1142),
(15, 1143),
(15, 1144),
(17, 1145),
(15, 1146),
(12, 1147),
(15, 1148),
(15, 1149),
(15, 1150),
(17, 1151),
(17, 1152),
(17, 1153),
(10, 1154),
(15, 1155),
(17, 1156),
(15, 1157),
(15, 1158),
(10, 1159),
(12, 1160),
(10, 1161),
(12, 1162),
(15, 1163),
(17, 1164),
(10, 1165),
(15, 1166),
(17, 1167),
(15, 1168),
(10, 1169),
(17, 1170),
(15, 1171),
(12, 1172),
(17, 1173),
(10, 1174),
(12, 1175),
(17, 1176),
(15, 1177),
(10, 1178),
(15, 1179),
(10, 1180),
(17, 1181),
(10, 1182),
(17, 1183),
(15, 1184),
(17, 1185),
(12, 1186),
(12, 1187),
(15, 1188),
(10, 1189),
(12, 1190),
(12, 1191),
(15, 1192),
(15, 1193),
(12, 1194),
(10, 1195),
(10, 1196),
(15, 1197),
(10, 1198),
(15, 1199),
(10, 1200),
(15, 1201),
(15, 1202),
(17, 1203),
(15, 1204),
(17, 1205),
(12, 1206),
(15, 1207),
(12, 1208),
(12, 1209),
(10, 1210),
(10, 1211),
(10, 1212),
(17, 1213),
(15, 1214),
(17, 1215),
(10, 1216),
(10, 1217),
(15, 1218),
(15, 1219),
(17, 1220),
(15, 1221),
(12, 1222),
(15, 1223),
(12, 1224),
(12, 1225),
(10, 1226),
(15, 1227),
(17, 1228),
(15, 1229),
(12, 1230),
(17, 1231),
(12, 1232),
(15, 1233),
(15, 1234),
(15, 1235),
(15, 1236),
(17, 1237),
(12, 1238),
(10, 1239),
(12, 1240),
(15, 1241),
(17, 1242),
(12, 1243),
(15, 1244),
(15, 1245),
(15, 1246),
(15, 1247),
(17, 1248),
(17, 1249),
(12, 1250),
(12, 1251),
(12, 1252),
(12, 1253),
(10, 1254),
(15, 1255),
(15, 1256),
(10, 1257),
(17, 1258),
(17, 1259),
(17, 1260),
(15, 1261),
(10, 1262),
(15, 1263),
(15, 1264),
(17, 1265),
(15, 1266),
(12, 1267),
(17, 1268),
(12, 1269),
(17, 1270),
(17, 1271),
(17, 1272),
(15, 1273),
(15, 1274),
(17, 1275),
(12, 1276),
(17, 1277),
(17, 1278),
(17, 1279),
(10, 1280),
(10, 1281),
(15, 1282),
(15, 1283),
(10, 1284),
(10, 1285),
(12, 1286),
(15, 1287),
(15, 1288),
(17, 1289),
(12, 1290),
(12, 1291),
(17, 1292),
(10, 1293),
(10, 1294),
(12, 1295),
(10, 1296),
(17, 1297),
(17, 1298),
(10, 1299),
(10, 1300),
(10, 1301),
(15, 1302),
(17, 1303),
(15, 1304),
(17, 1305),
(17, 1306),
(15, 1307),
(12, 1308),
(17, 1309),
(10, 1310),
(15, 1311),
(12, 1312),
(15, 1313),
(15, 1314),
(10, 1315),
(10, 1316),
(17, 1317),
(17, 1318),
(15, 1319),
(10, 1320),
(17, 1321),
(12, 1322),
(12, 1323),
(10, 1324),
(17, 1325),
(12, 1326),
(15, 1327),
(12, 1328),
(17, 1329),
(10, 1330),
(12, 1331),
(15, 1332),
(12, 1333),
(15, 1334),
(10, 1335),
(12, 1336),
(12, 1337),
(10, 1338),
(12, 1339),
(15, 1340),
(12, 1341),
(12, 1342),
(17, 1343),
(17, 1344),
(17, 1345),
(12, 1346),
(10, 1347),
(17, 1348),
(15, 1349),
(12, 1350),
(10, 1351),
(15, 1352),
(15, 1353),
(10, 1354),
(17, 1355),
(12, 1356),
(12, 1357),
(10, 1358),
(10, 1359),
(10, 1360),
(10, 1361),
(12, 1362),
(17, 1363),
(12, 1364),
(12, 1365),
(12, 1366),
(12, 1367),
(10, 1368),
(10, 1369),
(17, 1370),
(12, 1371),
(15, 1372),
(12, 1373),
(17, 1374),
(15, 1375),
(10, 1376),
(15, 1377),
(10, 1378),
(12, 1379),
(12, 1380),
(17, 1381),
(10, 1382),
(12, 1383),
(17, 1384),
(17, 1385),
(12, 1386),
(15, 1390),
(17, 1391),
(10, 1392),
(10, 1393),
(17, 1394),
(17, 1395),
(17, 1396),
(10, 1397);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `ID_Comment_PK` int(11) NOT NULL,
  `Body` varchar(256) NOT NULL,
  `ID_UserCreator_FK` int(11) NOT NULL,
  `ID_Post_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `ID_Country_PK` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Flag` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` (`ID_Country_PK`, `Name`, `Flag`) VALUES
(1, 'Afganistán', 'https://flagcdn.com/w320/af.png'),
(2, 'Albania', 'https://flagcdn.com/w320/al.png'),
(3, 'Alemania', 'https://flagcdn.com/w320/de.png'),
(4, 'Andorra', 'https://flagcdn.com/w320/ad.png'),
(5, 'Angola', 'https://flagcdn.com/w320/ao.png'),
(6, 'Antigua y Barbuda', 'https://flagcdn.com/w320/ag.png'),
(7, 'Arabia Saudita', 'https://flagcdn.com/w320/sa.png'),
(8, 'Argelia', 'https://flagcdn.com/w320/dz.png'),
(9, 'Argentina', 'https://flagcdn.com/w320/ar.png'),
(10, 'Armenia', 'https://flagcdn.com/w320/am.png'),
(11, 'Australia', 'https://flagcdn.com/w320/au.png'),
(12, 'Austria', 'https://flagcdn.com/w320/at.png'),
(13, 'Azerbaiyán', 'https://flagcdn.com/w320/az.png'),
(14, 'Bahamas', 'https://flagcdn.com/w320/bs.png'),
(15, 'Bangladés', 'https://flagcdn.com/w320/bd.png'),
(16, 'Barbados', 'https://flagcdn.com/w320/bb.png'),
(17, 'Baréin', 'https://flagcdn.com/w320/bh.png'),
(18, 'Bélgica', 'https://flagcdn.com/w320/be.png'),
(19, 'Belice', 'https://flagcdn.com/w320/bz.png'),
(20, 'Benín', 'https://flagcdn.com/w320/bj.png'),
(21, 'Bielorrusia', 'https://flagcdn.com/w320/by.png'),
(22, 'Birmania', 'https://flagcdn.com/w320/mm.png'),
(23, 'Bolivia', 'https://flagcdn.com/w320/bo.png'),
(24, 'Bosnia y Herzegovina', 'https://flagcdn.com/w320/ba.png'),
(25, 'Botsuana', 'https://flagcdn.com/w320/bw.png'),
(26, 'Brasil', 'https://flagcdn.com/w320/br.png'),
(27, 'Brunéi', 'https://flagcdn.com/w320/bn.png'),
(28, 'Bulgaria', 'https://flagcdn.com/w320/bg.png'),
(29, 'Burkina Faso', 'https://flagcdn.com/w320/bf.png'),
(30, 'Burundi', 'https://flagcdn.com/w320/bi.png'),
(31, 'Bután', 'https://flagcdn.com/w320/bt.png'),
(32, 'Cabo Verde', 'https://flagcdn.com/w320/cv.png'),
(33, 'Camboya', 'https://flagcdn.com/w320/kh.png'),
(34, 'Camerún', 'https://flagcdn.com/w320/cm.png'),
(35, 'Canadá', 'https://flagcdn.com/w320/ca.png'),
(36, 'Catar', 'https://flagcdn.com/w320/qa.png'),
(37, 'Chad', 'https://flagcdn.com/w320/td.png'),
(38, 'Chile', 'https://flagcdn.com/w320/cl.png'),
(39, 'China', 'https://flagcdn.com/w320/cn.png'),
(40, 'Chipre', 'https://flagcdn.com/w320/cy.png'),
(41, 'Ciudad del Vaticano', 'https://flagcdn.com/w320/va.png'),
(42, 'Colombia', 'https://flagcdn.com/w320/co.png'),
(43, 'Comoras', 'https://flagcdn.com/w320/km.png'),
(44, 'Corea del Norte', 'https://flagcdn.com/w320/kp.png'),
(45, 'Corea del Sur', 'https://flagcdn.com/w320/kr.png'),
(46, 'Costa de Marfil', 'https://flagcdn.com/w320/ci.png'),
(47, 'Costa Rica', 'https://flagcdn.com/w320/cr.png'),
(48, 'Croacia', 'https://flagcdn.com/w320/hr.png'),
(49, 'Cuba', 'https://flagcdn.com/w320/cu.png'),
(50, 'Dinamarca', 'https://flagcdn.com/w320/dk.png'),
(51, 'Dominica', 'https://flagcdn.com/w320/dm.png'),
(52, 'Ecuador', 'https://flagcdn.com/w320/ec.png'),
(53, 'Egipto', 'https://flagcdn.com/w320/eg.png'),
(54, 'El Salvador', 'https://flagcdn.com/w320/sv.png'),
(55, 'Emiratos Árabes Unidos', 'https://flagcdn.com/w320/ae.png'),
(56, 'Eritrea', 'https://flagcdn.com/w320/er.png'),
(57, 'Eslovaquia', 'https://flagcdn.com/w320/sk.png'),
(58, 'Eslovenia', 'https://flagcdn.com/w320/si.png'),
(59, 'España', 'https://flagcdn.com/w320/es.png'),
(60, 'Estados Unidos', 'https://flagcdn.com/w320/us.png'),
(61, 'Estonia', 'https://flagcdn.com/w320/ee.png'),
(62, 'Etiopía', 'https://flagcdn.com/w320/et.png'),
(63, 'Filipinas', 'https://flagcdn.com/w320/ph.png'),
(64, 'Finlandia', 'https://flagcdn.com/w320/fi.png'),
(65, 'Fiyi', 'https://flagcdn.com/w320/fj.png'),
(66, 'Francia', 'https://flagcdn.com/w320/fr.png'),
(67, 'Gabón', 'https://flagcdn.com/w320/ga.png'),
(68, 'Gambia', 'https://flagcdn.com/w320/gm.png'),
(69, 'Georgia', 'https://flagcdn.com/w320/ge.png'),
(70, 'Ghana', 'https://flagcdn.com/w320/gh.png'),
(71, 'Granada', 'https://flagcdn.com/w320/gd.png'),
(72, 'Grecia', 'https://flagcdn.com/w320/gr.png'),
(73, 'Guatemala', 'https://flagcdn.com/w320/gt.png'),
(74, 'Guyana', 'https://flagcdn.com/w320/gy.png'),
(75, 'Guinea', 'https://flagcdn.com/w320/gn.png'),
(76, 'Guinea ecuatorial', 'https://flagcdn.com/w320/gq.png'),
(77, 'Guinea-Bisáu', 'https://flagcdn.com/w320/gw.png'),
(78, 'Haití', 'https://flagcdn.com/w320/ht.png'),
(79, 'Honduras', 'https://flagcdn.com/w320/hn.png'),
(80, 'Hungría', 'https://flagcdn.com/w320/hu.png'),
(81, 'India', 'https://flagcdn.com/w320/in.png'),
(82, 'Indonesia', 'https://flagcdn.com/w320/id.png'),
(83, 'Irak', 'https://flagcdn.com/w320/iq.png'),
(84, 'Irán', 'https://flagcdn.com/w320/ir.png'),
(85, 'Irlanda', 'https://flagcdn.com/w320/ie.png'),
(86, 'Islandia', 'https://flagcdn.com/w320/is.png'),
(87, 'Islas Marshall', 'https://flagcdn.com/w320/mh.png'),
(88, 'Islas Salomón', 'https://flagcdn.com/w320/sb.png'),
(89, 'Israel', 'https://flagcdn.com/w320/il.png'),
(90, 'Italia', 'https://flagcdn.com/w320/it.png'),
(91, 'Jamaica', 'https://flagcdn.com/w320/jm.png'),
(92, 'Japón', 'https://flagcdn.com/w320/jp.png'),
(93, 'Jordania', 'https://flagcdn.com/w320/jo.png'),
(94, 'Kazajistán', 'https://flagcdn.com/w320/kz.png'),
(95, 'Kenia', 'https://flagcdn.com/w320/ke.png'),
(96, 'Kirguistán', 'https://flagcdn.com/w320/kg.png'),
(97, 'Kiribati', 'https://flagcdn.com/w320/ki.png'),
(98, 'Kuwait', 'https://flagcdn.com/w320/kw.png'),
(99, 'Laos', 'https://flagcdn.com/w320/la.png'),
(100, 'Lesoto', 'https://flagcdn.com/w320/ls.png'),
(101, 'Letonia', 'https://flagcdn.com/w320/lv.png'),
(102, 'Líbano', 'https://flagcdn.com/w320/lb.png'),
(103, 'Liberia', 'https://flagcdn.com/w320/lr.png'),
(104, 'Libia', 'https://flagcdn.com/w320/ly.png'),
(105, 'Liechtenstein', 'https://flagcdn.com/w320/li.png'),
(106, 'Lituania', 'https://flagcdn.com/w320/lt.png'),
(107, 'Luxemburgo', 'https://flagcdn.com/w320/lu.png'),
(108, 'Macedonia del Norte', 'https://flagcdn.com/w320/mk.png'),
(109, 'Madagascar', 'https://flagcdn.com/w320/mg.png'),
(110, 'Malasia', 'https://flagcdn.com/w320/my.png'),
(111, 'Malaui', 'https://flagcdn.com/w320/mw.png'),
(112, 'Maldivas', 'https://flagcdn.com/w320/mv.png'),
(113, 'Malí', 'https://flagcdn.com/w320/ml.png'),
(114, 'Malta', 'https://flagcdn.com/w320/mt.png'),
(115, 'Marruecos', 'https://flagcdn.com/w320/ma.png'),
(116, 'Mauricio', 'https://flagcdn.com/w320/mu.png'),
(117, 'Mauritania', 'https://flagcdn.com/w320/mr.png'),
(118, 'México', 'https://flagcdn.com/w320/mx.png'),
(119, 'Micronesia', 'https://flagcdn.com/w320/fm.png'),
(120, 'Moldavia', 'https://flagcdn.com/w320/md.png'),
(121, 'Mónaco', 'https://flagcdn.com/w320/mc.png'),
(122, 'Mongolia', 'https://flagcdn.com/w320/mn.png'),
(123, 'Montenegro', 'https://flagcdn.com/w320/me.png'),
(124, 'Mozambique', 'https://flagcdn.com/w320/mz.png'),
(125, 'Namibia', 'https://flagcdn.com/w320/na.png'),
(126, 'Nauru', 'https://flagcdn.com/w320/nr.png'),
(127, 'Nepal', 'https://flagcdn.com/w320/np.png'),
(128, 'Nicaragua', 'https://flagcdn.com/w320/ni.png'),
(129, 'Níger', 'https://flagcdn.com/w320/ne.png'),
(130, 'Nigeria', 'https://flagcdn.com/w320/ng.png'),
(131, 'Noruega', 'https://flagcdn.com/w320/no.png'),
(132, 'Nueva Zelanda', 'https://flagcdn.com/w320/nz.png'),
(133, 'Omán', 'https://flagcdn.com/w320/om.png'),
(134, 'Países Bajos', 'https://flagcdn.com/w320/nl.png'),
(135, 'Pakistán', 'https://flagcdn.com/w320/pk.png'),
(136, 'Palaos', 'https://flagcdn.com/w320/pw.png'),
(137, 'Panamá', 'https://flagcdn.com/w320/pa.png'),
(138, 'Papúa Nueva Guinea', 'https://flagcdn.com/w320/pg.png'),
(139, 'Paraguay', 'https://flagcdn.com/w320/py.png'),
(140, 'Perú', 'https://flagcdn.com/w320/pe.png'),
(141, 'Polonia', 'https://flagcdn.com/w320/pl.png'),
(142, 'Portugal', 'https://flagcdn.com/w320/pt.png'),
(143, 'Reino Unido', 'https://flagcdn.com/w320/gb.png'),
(144, 'República Centroafricana', 'https://flagcdn.com/w320/cf.png'),
(145, 'República Checa', 'https://flagcdn.com/w320/cz.png'),
(146, 'República del Congo', 'https://flagcdn.com/w320/cg.png'),
(147, 'República Democrática del Congo', 'https://flagcdn.com/w320/cd.png'),
(148, 'República Dominicana', 'https://flagcdn.com/w320/do.png'),
(149, 'Ruanda', 'https://flagcdn.com/w320/rw.png'),
(150, 'Rumanía', 'https://flagcdn.com/w320/ro.png'),
(151, 'Rusia', 'https://flagcdn.com/w320/ru.png'),
(152, 'Samoa', 'https://flagcdn.com/w320/ws.png'),
(153, 'San Cristóbal y Nieves', 'https://flagcdn.com/w320/kn.png'),
(154, 'San Marino', 'https://flagcdn.com/w320/sm.png'),
(155, 'San Vicente y las Granadinas', 'https://flagcdn.com/w320/vc.png'),
(156, 'Santa Lucía', 'https://flagcdn.com/w320/lc.png'),
(157, 'Santo Tomé y Príncipe', 'https://flagcdn.com/w320/st.png'),
(158, 'Senegal', 'https://flagcdn.com/w320/sn.png'),
(159, 'Serbia', 'https://flagcdn.com/w320/rs.png'),
(160, 'Seychelles', 'https://flagcdn.com/w320/sc.png'),
(161, 'Sierra Leona', 'https://flagcdn.com/w320/sl.png'),
(162, 'Singapur', 'https://flagcdn.com/w320/sg.png'),
(163, 'Siria', 'https://flagcdn.com/w320/sy.png'),
(164, 'Somalia', 'https://flagcdn.com/w320/so.png'),
(165, 'Sri Lanka', 'https://flagcdn.com/w320/lk.png'),
(166, 'Suazilandia', 'https://flagcdn.com/w320/sz.png'),
(167, 'Sudáfrica', 'https://flagcdn.com/w320/za.png'),
(168, 'Sudán', 'https://flagcdn.com/w320/sd.png'),
(169, 'Sudán del Sur', 'https://flagcdn.com/w320/ss.png'),
(170, 'Suecia', 'https://flagcdn.com/w320/se.png'),
(171, 'Suiza', 'https://flagcdn.com/w320/ch.png'),
(172, 'Surinam', 'https://flagcdn.com/w320/sr.png'),
(173, 'Tailandia', 'https://flagcdn.com/w320/th.png'),
(174, 'Tanzania', 'https://flagcdn.com/w32_o/tz.png'),
(175, 'Tayikistán', 'https://flagcdn.com/w320/tj.png'),
(176, 'Timor Oriental', 'https://flagcdn.com/w320/tl.png'),
(177, 'Togo', 'https://flagcdn.com/w320/tg.png'),
(178, 'Tonga', 'https://flagcdn.com/w320/to.png'),
(179, 'Trinidad y Tobago', 'https://flagcdn.com/w320/tt.png'),
(180, 'Túnez', 'https://flagcdn.com/w320/tn.png'),
(181, 'Turkmenistán', 'https://flagcdn.com/w320/tm.png'),
(182, 'Turquía', 'https://flagcdn.com/w320/tr.png'),
(183, 'Tuvalu', 'https://flagcdn.com/w320/tv.png'),
(184, 'Ucrania', 'https://flagcdn.com/w320/ua.png'),
(185, 'Uganda', 'https://flagcdn.com/w320/ug.png'),
(186, 'Uruguay', 'https://flagcdn.com/w320/uy.png'),
(187, 'Uzbekistán', 'https://flagcdn.com/w320/uz.png'),
(188, 'Vanuatu', 'https://flagcdn.com/w320/vu.png'),
(189, 'Venezuela', 'https://flagcdn.com/w320/ve.png'),
(190, 'Vietnam', 'https://flagcdn.com/w320/vn.png'),
(191, 'Yemen', 'https://flagcdn.com/w320/ye.png'),
(192, 'Yibuti', 'https://flagcdn.com/w320/dj.png'),
(193, 'Zambia', 'https://flagcdn.com/w320/zm.png'),
(194, 'Zimbabue', 'https://flagcdn.com/w320/zw.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hashtags`
--

CREATE TABLE `hashtags` (
  `ID_Hashtag_PK` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `hashtags`
--

INSERT INTO `hashtags` (`ID_Hashtag_PK`, `Name`) VALUES
(1, '#uruguay1930'),
(2, '#italy1934'),
(3, '#france1938'),
(4, '#brazil1950'),
(5, '#switzerland1954'),
(6, '#sweden1958'),
(7, '#chile1962'),
(8, '#england1966'),
(9, '#mexico1970'),
(10, '#germany1974'),
(11, '#argentina1978'),
(12, '#spain1982'),
(13, '#mexico1986'),
(14, '#italy1990'),
(15, '#usa1994'),
(16, '#france1998'),
(17, '#koreajapan2002'),
(18, '#germany2006'),
(19, '#southafrica2010'),
(20, '#brazil2014'),
(21, '#russia2018'),
(22, '#qatar2022'),
(23, '#jugadas'),
(24, '#entrevistas'),
(25, '#partidos'),
(26, '#estadisticas'),
(27, '#asistentes'),
(28, '#incidentes'),
(29, '#polemicas'),
(30, '#sedes'),
(31, '#cultura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hashtags-posts`
--

CREATE TABLE `hashtags-posts` (
  `ID_Hashtag_FK` int(11) NOT NULL,
  `ID_Post_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`ID_Post_PK`, `Content_Title`, `Content_Body`, `Content_Multimedia`, `Upload_Date`, `Modified_Date`, `Deleted_Date`, `ID_WorldCup_Year_FK`, `ID_User_FK`, `Visibility_State`) VALUES
(927, 'Vitae nihil beatae ratione iste', 'Et pariatur sint sit ipsa maxime quibusdam esse. Quod qui sed fuga eveniet. Non deserunt pariatur ipsum ullam quo et. Commodi molestias voluptate sed sed veniam ut. Debitis saepe est quasi qui repudiandae fugiat.', NULL, '2016-10-10 21:16:12', NULL, NULL, 1930, 45, 1),
(928, 'Impedit at est autem', 'Ipsa iste ipsum soluta non sunt quis. Velit ipsum id at et. Qui est quos eaque velit voluptatum. Qui ipsam magni laboriosam ea.', NULL, '2018-03-12 18:52:07', NULL, NULL, 1934, 45, 1),
(929, 'Qui nemo optio ut incidunt', 'Aut dolorum ut sint laudantium voluptas cumque qui nulla. Illo amet occaecati praesentium fuga culpa. Dolorem iure doloribus omnis. Esse eum velit vitae dolore laborum ducimus. Ut est repellendus aspernatur id ducimus.', NULL, '2021-04-20 06:04:53', NULL, NULL, 1938, 45, 1),
(930, 'In sunt officia temporibus illum', 'Hic cupiditate qui qui vero. Iusto corporis sit consequatur deserunt totam non eos. Nemo rem explicabo aut et aut in.', NULL, '2024-05-06 18:53:19', NULL, NULL, 1950, 45, 1),
(931, 'Enim nulla aliquid doloremque aperiam id', 'Repellendus qui consequatur voluptas earum. Magnam deleniti quia unde quis. Repudiandae autem exercitationem veritatis nostrum voluptatem facere voluptas.', NULL, '2024-04-03 06:01:18', NULL, NULL, 1954, 45, 1),
(932, 'Illum earum necessitatibus voluptatem ea', 'Debitis enim aspernatur et est. Laborum et ipsum ipsum repellendus officiis dolorem accusamus. Consequatur deserunt animi maxime eos. Qui aliquam corrupti molestiae autem neque.', NULL, '2021-07-17 22:54:46', NULL, NULL, 1958, 45, 1),
(933, 'Ab nemo dolores reiciendis', 'Dolor consequatur dolorem qui. Iste omnis aut cumque voluptas facere odio. At expedita ipsum architecto accusamus reprehenderit consequatur illum. Esse sint nemo quia.', NULL, '2021-11-21 03:14:06', NULL, NULL, 1962, 45, 1),
(934, 'Suscipit modi sit ut qui voluptatibus doloribus', 'Fugit non sed nostrum pariatur ut. Quidem et repudiandae incidunt quia voluptatem veniam. Et nihil maxime ut odit similique et. Facere alias necessitatibus minima eos dolorem molestias eos.', NULL, '2024-10-15 16:58:20', NULL, NULL, 1966, 45, 1),
(935, 'Ipsa et aut expedita', 'Quasi porro facere reprehenderit. Incidunt fugiat amet id dignissimos aliquid debitis atque excepturi. Ducimus velit et inventore quia.', NULL, '2016-08-11 19:38:03', NULL, NULL, 1970, 45, 1),
(936, 'Voluptates sit ut voluptatem', 'Debitis et quia non officiis et sint officia aut. Accusantium culpa sint ut dolorum quia nihil architecto. Consequatur eos cum aperiam et vel iste fuga.', NULL, '2024-01-03 16:49:52', NULL, NULL, 2026, 45, 1),
(937, 'Id reprehenderit sint ducimus tenetur', 'Ullam reiciendis dolorem quod vel ut optio. Ab enim omnis temporibus consequuntur voluptate quo. Sed vitae laboriosam quia blanditiis.', NULL, '2016-12-08 13:54:36', NULL, NULL, 1974, 45, 1),
(938, 'Vel distinctio ratione quo nulla alias tempora', 'Nisi ipsa provident autem. Qui explicabo accusamus iusto vel optio. Repellendus consequuntur maxime ab corrupti assumenda. Nisi voluptates quaerat ut unde libero quidem.', NULL, '2020-02-20 09:29:04', NULL, NULL, 1978, 45, 1),
(939, 'Est alias perspiciatis voluptatum itaque reprehend', 'Minima nihil nemo quas tempore qui. Qui dolorem similique voluptas similique inventore. Illo neque temporibus neque reiciendis pariatur voluptate. Maiores nesciunt consequatur recusandae iure omnis voluptas. Expedita earum optio distinctio rerum esse ut.', NULL, '2022-11-12 04:34:09', NULL, NULL, 1982, 45, 1),
(940, 'Unde qui sunt assumenda molestiae', 'Dolorem impedit corporis qui voluptatibus qui aperiam voluptate. Est corporis quia non est. Et magni optio nobis eius facilis officiis. Nesciunt iure porro doloremque quasi animi aperiam porro.', NULL, '2020-05-21 16:18:57', NULL, NULL, 1986, 45, 1),
(941, 'Voluptate est aut assumenda cum quis ullam', 'Debitis quis similique officia molestiae ut nihil. Quia dolores molestias consequatur voluptatem facilis ducimus. Fuga eligendi perspiciatis veritatis dignissimos quia aut recusandae asperiores.', NULL, '2019-04-08 01:02:29', NULL, NULL, 1990, 45, 1),
(942, 'Ea dolorem dignissimos rerum at', 'Ducimus sapiente eum ut omnis doloribus suscipit. Amet enim porro quibusdam ab. Sunt sunt illum consequatur iure nobis et. Dignissimos aut voluptate possimus fugiat nostrum voluptas.', NULL, '2016-04-04 07:37:17', NULL, NULL, 1994, 45, 1),
(943, 'Autem molestiae magnam ut libero sunt', 'Corporis ratione et dolore quidem soluta. Ad vel culpa quod qui corporis libero earum id. Omnis id impedit maiores iure.', NULL, '2016-04-28 22:59:02', NULL, NULL, 1998, 45, 1),
(944, 'Et dolorem voluptatem voluptas ullam quis', 'Cupiditate minus omnis est sint iusto animi deserunt. Ipsam animi optio perspiciatis debitis culpa quam doloremque et. Qui accusantium accusamus est omnis sit provident.', NULL, '2022-03-11 04:56:57', NULL, NULL, 2002, 45, 1),
(945, 'Minus ipsa dolores suscipit modi et', 'Nisi architecto reiciendis consequuntur est quas voluptatum. Quibusdam nemo sed nobis eveniet quo rerum reiciendis. Officia culpa nesciunt ut modi placeat enim porro. Velit excepturi quasi voluptatem laboriosam nisi.', NULL, '2025-01-20 11:29:30', NULL, NULL, 2006, 45, 1),
(946, 'Et nisi nesciunt reprehenderit accusantium quia au', 'Tempore voluptates quasi doloremque libero nihil. Dolores voluptas blanditiis nemo odio. Ipsam voluptatem asperiores quia. Molestias aut delectus non aliquid nihil recusandae officiis qui.', NULL, '2023-04-11 08:43:26', NULL, NULL, 2010, 45, 1),
(947, 'Alias repudiandae qui animi omnis', 'Ipsam odio et non eum voluptatem amet. Aliquid natus adipisci eum libero dolorum. Vel velit quam optio temporibus. Porro deserunt ut vitae.', NULL, '2016-08-17 12:42:32', NULL, NULL, 2014, 45, 1),
(948, 'Odio vero a earum et consequatur architecto', 'Magnam similique sit odio tenetur. Natus dignissimos quod aut facere. Non quam cupiditate ut qui dolor molestiae suscipit. Consequatur quia est rerum sit. Ipsum et atque sit laborum.', NULL, '2022-02-25 20:38:56', NULL, NULL, 2018, 45, 1),
(949, 'Rerum deserunt voluptas aut laboriosam autem quibu', 'Tenetur quo aut veniam ex ex. Quos aperiam eius hic inventore ut. Libero quia quaerat a laboriosam omnis.', NULL, '2024-10-29 13:39:41', NULL, NULL, 2022, 45, 1),
(950, 'Provident et quisquam delectus', 'Doloremque totam saepe velit iusto. Quo quae id possimus velit ducimus. Voluptas quisquam in beatae sed at vel.', NULL, '2025-10-18 14:38:39', NULL, NULL, 1930, 46, 1),
(951, 'Ut sint alias velit', 'Non non aut sapiente minus facilis. Ut eos molestiae temporibus magni eos ea doloremque tempora. Adipisci cumque officiis occaecati et autem sit inventore. Excepturi saepe et quis nulla mollitia natus soluta. Quam qui unde dolor odio in enim consequatur harum.', NULL, '2018-01-04 19:40:41', NULL, NULL, 1934, 46, 1),
(952, 'Sint et officia ullam corrupti', 'Cupiditate repellat explicabo omnis laboriosam quia at. In aliquam qui doloribus beatae. Sit quo et eaque sunt. Vel repudiandae occaecati mollitia laudantium saepe omnis qui.', NULL, '2022-09-26 05:31:05', NULL, NULL, 1938, 46, 1),
(953, 'Autem est illum eaque', 'Non libero autem aliquid. Quis ut non distinctio tenetur id odio non. Iusto fuga optio consequatur autem. Velit explicabo alias esse explicabo labore.', NULL, '2024-03-16 12:51:41', NULL, NULL, 1950, 46, 1),
(954, 'Molestias est repellat temporibus est dolorum', 'Eveniet adipisci ipsum ut deserunt et amet. Labore accusantium vel explicabo. Odio asperiores rerum est.', NULL, '2016-09-06 04:06:50', NULL, NULL, 1954, 46, 1),
(955, 'Blanditiis omnis molestiae itaque consequuntur dol', 'Quo recusandae est dolor suscipit necessitatibus. Consequuntur eum repudiandae et. Eveniet et quisquam ea voluptatibus officiis aliquam quod. Quibusdam repellendus quia et quae beatae accusantium. Nam libero facilis culpa voluptas et numquam ullam.', NULL, '2021-05-03 12:06:53', NULL, NULL, 1958, 46, 1),
(956, 'Et eius voluptatibus facilis eaque laboriosam', 'Cum atque voluptate iste doloremque aut numquam. Recusandae cupiditate itaque aut cumque impedit exercitationem dolorum autem. Eaque et et sit.', NULL, '2022-01-17 10:25:02', NULL, NULL, 1962, 46, 1),
(957, 'Sit iure excepturi perspiciatis nobis maxime', 'Distinctio non eos ipsum quos illum possimus est unde. Occaecati sunt eos molestiae id accusantium laboriosam magnam laboriosam. Enim error non omnis minima voluptatum quis eaque.', NULL, '2024-11-25 01:14:48', NULL, NULL, 1966, 46, 1),
(958, 'Delectus ut optio mollitia fugiat', 'Iusto ad numquam sapiente ipsa dolorum harum. Laudantium iste molestiae sequi voluptatum aut. Odio dolorum voluptatum quisquam.', NULL, '2019-03-16 18:33:23', NULL, NULL, 1970, 46, 1),
(959, 'Enim tenetur ea soluta accusamus voluptatem', 'Sit autem quas culpa ut. Et voluptatem et voluptas adipisci debitis. Ipsa dolorum quasi nam aut repellat. Voluptate ut facere veniam id enim nihil.', NULL, '2023-10-19 10:33:35', NULL, NULL, 2026, 46, 1),
(960, 'Nobis voluptatem quasi cupiditate ratione et autem', 'Ipsam ipsa adipisci necessitatibus voluptas. Pariatur qui ex accusamus rem est magni ipsa. Aut in quam dolorem dolor provident. Neque voluptatibus voluptatibus odit veritatis. Sit numquam omnis molestiae.', NULL, '2020-12-21 14:28:39', NULL, NULL, 1974, 46, 1),
(961, 'Eos dolorum error molestiae iste rem quisquam', 'Nobis neque placeat corrupti placeat ex voluptas. Labore et aliquid earum voluptatem sint. Blanditiis deleniti nobis dolorem eum beatae qui. Voluptatem vel magni quo nobis.', NULL, '2019-09-17 14:12:28', NULL, NULL, 1978, 46, 1),
(962, 'Sed occaecati dolore illum', 'Magni qui et omnis occaecati nulla alias rerum eius. Nobis officiis qui aut. Consequatur molestias odit sint consequuntur. Aspernatur velit sapiente quasi et.', NULL, '2021-08-09 07:04:59', NULL, NULL, 1982, 46, 1),
(963, 'Eos autem et rem', 'Architecto nostrum sed quia suscipit. Ad cupiditate similique velit provident expedita. Tempora laborum qui laboriosam aliquid. Placeat est pariatur et et sit dolor ex.', NULL, '2017-11-30 10:25:45', NULL, NULL, 1986, 46, 1),
(964, 'Officia voluptatem autem sint non', 'Ullam tenetur occaecati rem voluptas quia rerum. Necessitatibus ad qui aut repellat eaque quidem iusto nobis.', NULL, '2016-10-14 22:22:34', NULL, NULL, 1990, 46, 1),
(965, 'Tenetur aut debitis animi nihil occaecati blanditi', 'Minus incidunt unde eos alias non autem. Consequatur ea inventore minima modi a illum repudiandae. Occaecati temporibus quam at laborum voluptatem. Nostrum et laudantium quia adipisci numquam.', NULL, '2025-02-14 03:18:18', NULL, NULL, 1994, 46, 1),
(966, 'Voluptas aut tempore eligendi', 'Esse repellendus blanditiis omnis voluptatibus debitis. Velit aut alias accusamus sapiente molestias quisquam iusto. Placeat quia iusto tempora commodi. Soluta ut consequuntur dolore error.', NULL, '2025-09-09 02:53:49', NULL, NULL, 1998, 46, 1),
(967, 'Aut quia voluptatibus ut dolores tempore', 'Explicabo corporis ut ea illo. Est culpa fuga veniam possimus. Aperiam quasi debitis non quam aut molestiae quae.', NULL, '2020-07-19 09:36:44', NULL, NULL, 2002, 46, 1),
(968, 'Voluptatem facere odit ut error omnis', 'Totam corrupti rerum beatae ad. Quam blanditiis ducimus inventore autem. Expedita minima voluptatem incidunt aspernatur ab repudiandae.', NULL, '2024-04-19 01:23:54', NULL, NULL, 2006, 46, 1),
(969, 'Beatae incidunt at libero perferendis', 'Explicabo consequuntur dolor a. Repudiandae perferendis reiciendis eum accusantium dolores. Consectetur enim sint officia explicabo. Aut id illo aut.', NULL, '2020-07-30 08:35:36', NULL, NULL, 2010, 46, 1),
(970, 'Quo nobis voluptatum et', 'Aut quod sed excepturi. Minima qui occaecati dicta et tempora. Blanditiis veritatis quaerat ex sapiente doloribus at laudantium possimus. Natus aspernatur ratione amet dolore hic et similique.', NULL, '2024-07-12 01:18:14', NULL, NULL, 2014, 46, 1),
(971, 'Ut quia eligendi aliquid id', 'Quis accusantium et voluptatem quaerat provident. Molestiae pariatur velit deleniti impedit. Est ut saepe est asperiores at a.', NULL, '2025-03-31 20:07:03', NULL, NULL, 2018, 46, 1),
(972, 'Asperiores laboriosam repellat molestiae ut neque ', 'Nemo a animi voluptas ratione eos. Ullam eos et vel dolorum.', NULL, '2021-04-17 06:05:12', NULL, NULL, 2022, 46, 1),
(973, 'Molestiae ex amet quia rem quisquam inventore', 'Et perspiciatis quia omnis nihil sunt. Dolorem corrupti quae vel aut veniam ut. Totam vero ea excepturi non eos. Hic ut harum quo et velit.', NULL, '2018-08-20 15:50:43', NULL, NULL, 1930, 47, 1),
(974, 'Consequatur quas et voluptatibus molestias', 'Qui temporibus saepe consectetur quo dolores facere. Quisquam veritatis qui ratione aliquam qui asperiores. Iusto explicabo ad tempora omnis id occaecati.', NULL, '2024-11-28 16:26:26', NULL, NULL, 1934, 47, 1),
(975, 'Blanditiis sint ut sunt', 'Ea consequuntur laboriosam nihil id quibusdam in ut. Et ut et voluptate nemo fugiat beatae. Praesentium ipsa aut totam excepturi et. Iste qui consequatur culpa consequatur voluptatem inventore.', NULL, '2021-11-30 15:03:13', NULL, NULL, 1938, 47, 1),
(976, 'Voluptas est beatae modi asperiores praesentium re', 'Nisi vero id molestiae sequi. Facilis doloremque unde fuga voluptatem voluptas. Repellendus necessitatibus non doloremque aut quis hic.', NULL, '2022-05-13 02:34:05', NULL, NULL, 1950, 47, 1),
(977, 'Ullam consequuntur ullam inventore ab', 'Maxime exercitationem sequi rem voluptas. Et neque id non perspiciatis sit. Provident beatae facilis aliquam quis odio. Eveniet dolorem iure laudantium quam numquam ab autem.', NULL, '2024-06-19 23:39:28', NULL, NULL, 1954, 47, 1),
(978, 'Consequatur quod aut sequi officia officia cupidit', 'Sed ab et quis minima sed odit voluptatem. Nulla saepe voluptas modi qui qui ut officiis. Accusantium suscipit aperiam veniam ea neque mollitia.', NULL, '2021-07-30 04:29:32', NULL, NULL, 1958, 47, 1),
(979, 'Ut occaecati sequi quo adipisci', 'Consequatur animi eaque tempora optio et inventore. Delectus repudiandae explicabo vero est et. Consequuntur recusandae fuga sit alias est.', NULL, '2025-05-14 23:14:43', NULL, NULL, 1962, 47, 1),
(980, 'Molestiae quia rerum et', 'Perferendis aperiam cumque est consectetur aut quis aut totam. Culpa rerum doloribus atque. Aperiam doloribus rerum cupiditate sit.', NULL, '2020-08-07 09:24:36', NULL, NULL, 1966, 47, 1),
(981, 'Corporis inventore nulla hic ut', 'Fuga laborum delectus quia. Doloremque ex quia molestias esse qui.', NULL, '2021-06-11 21:47:11', NULL, NULL, 1970, 47, 1),
(982, 'Tenetur sed sit magni necessitatibus', 'Eligendi dolor reprehenderit ab illo ducimus eos id libero. Aliquid provident non esse suscipit voluptatibus. Quos qui nisi aliquid quae aperiam. Quod eligendi aut consequatur minima voluptatum dignissimos soluta.', NULL, '2019-02-16 22:37:37', NULL, NULL, 2026, 47, 1),
(983, 'Officia nesciunt numquam dolorum dolorem', 'Molestiae iusto et quia magni sint. At ipsam perferendis atque veniam ut id. Distinctio tempore et recusandae et molestias. Aspernatur rem praesentium alias.', NULL, '2025-08-31 13:01:47', NULL, NULL, 1974, 47, 1),
(984, 'Et atque eum non', 'Quia consequatur quia assumenda assumenda commodi. Error minus facilis quia tempora sapiente distinctio cum sit. Vel amet expedita est officiis. Et et quaerat velit quisquam.', NULL, '2016-05-23 04:09:35', NULL, NULL, 1978, 47, 1),
(985, 'Voluptatibus debitis rerum nesciunt', 'Odio quod enim incidunt. Suscipit et eveniet quam placeat sit.', NULL, '2020-12-20 06:55:08', NULL, NULL, 1982, 47, 1),
(986, 'Beatae quo consequatur ea quaerat qui', 'Qui et perferendis aperiam. Aspernatur reprehenderit iste magni dolore cupiditate magnam. Consequatur error accusantium architecto consectetur quisquam rerum ut tenetur. Id dolor nobis aut impedit perferendis necessitatibus.', NULL, '2021-11-20 23:06:05', NULL, NULL, 1986, 47, 1),
(987, 'Vitae architecto quisquam autem', 'Molestiae magnam sint in necessitatibus odit sint ut. In vel fugiat vel doloribus. Qui impedit dicta voluptas voluptas. Laudantium minima accusamus occaecati iusto et omnis.', NULL, '2020-08-17 09:31:54', NULL, NULL, 1990, 47, 1),
(988, 'Quasi neque repellat quae consequuntur ex perspici', 'Aut libero rerum autem in. In maiores quo officiis omnis. Praesentium esse non qui accusantium sed explicabo deserunt porro. Sint ab non asperiores sit aliquam ad officia aut. Illo perspiciatis quia temporibus temporibus voluptates.', NULL, '2020-03-20 12:32:18', NULL, NULL, 1994, 47, 1),
(989, 'Sint enim neque molestiae facilis eius neque', 'Aut incidunt dolore perspiciatis dolor voluptas magnam. Cupiditate non dolor rerum sit. Occaecati cum iure consequuntur voluptas.', NULL, '2017-07-31 14:09:52', NULL, NULL, 1998, 47, 1),
(990, 'Esse quas excepturi et', 'In est iusto voluptas quis eaque corporis. Autem et animi autem aut. Excepturi non omnis qui odio. Placeat dolore similique harum temporibus.', NULL, '2017-06-18 08:04:50', NULL, NULL, 2002, 47, 1),
(991, 'Fugiat ipsam voluptas aliquid', 'Non dolores voluptatum tempore voluptatem. Debitis quos consequatur earum nisi quidem hic nihil. Sit nemo omnis vero et nobis magni. Laudantium vel et eveniet.', NULL, '2023-05-03 08:13:15', NULL, NULL, 2006, 47, 1),
(992, 'Voluptas dolorem qui aperiam architecto aut ut', 'Dolorem dolorem aperiam et omnis. Voluptas quidem dolorem voluptatem ut provident magnam. Debitis asperiores impedit ea illum.', NULL, '2017-11-02 05:27:19', NULL, NULL, 2010, 47, 1),
(993, 'Aut rerum itaque non ex harum ab sed', 'Saepe eos tenetur aut incidunt. Esse aut nihil et omnis. Voluptatem aspernatur eius quidem rem vel ut deserunt. Fuga et sit vel quia culpa.', NULL, '2024-11-24 17:23:27', NULL, NULL, 2014, 47, 1),
(994, 'Quo aliquam ut ipsum odio', 'Dolores pariatur placeat eveniet quo consectetur praesentium non. Molestiae qui in omnis porro. Aut est doloribus eos ad quos voluptatem culpa. Facilis nulla nisi quia odio.', NULL, '2015-12-21 06:03:56', NULL, NULL, 2018, 47, 1),
(995, 'Eos unde ut eligendi odio ipsum ab', 'Veritatis quia quos dolores quos eveniet voluptatum. Ipsa sit quasi et et veritatis voluptas. Excepturi corporis esse ut et quam. Optio neque est occaecati illo non sint ipsam.', NULL, '2017-07-17 05:49:11', NULL, NULL, 2022, 47, 1),
(996, 'Corrupti eos nihil quaerat id et hic', 'Aut et magnam soluta praesentium. Aut quo dolor unde veniam sint. Nemo corrupti repellat occaecati. Non enim reprehenderit velit tempora reprehenderit sint. Quos et in totam ut debitis esse id.', NULL, '2024-10-26 00:02:26', NULL, NULL, 1930, 48, 1),
(997, 'Perferendis eos aut quis voluptatem animi et', 'Nobis corporis fugit laborum voluptas sint molestiae. Illo adipisci repellendus autem voluptatum. Modi blanditiis ducimus quis quasi cum.', NULL, '2021-07-04 11:48:58', NULL, NULL, 1934, 48, 1),
(998, 'Aut sit est molestiae quidem reiciendis et', 'Aperiam corrupti omnis odio molestiae aut deserunt. Eos itaque commodi quas sed voluptatibus optio. Quia consequatur iusto qui excepturi. Et natus rerum molestiae aliquid at.', NULL, '2021-05-30 06:58:04', NULL, NULL, 1938, 48, 1),
(999, 'Animi delectus ut voluptatibus esse nihil dicta', 'Est placeat qui non explicabo. Quasi aut hic quia recusandae soluta dolorem.', NULL, '2019-01-09 16:41:40', NULL, NULL, 1950, 48, 1),
(1000, 'Ut deserunt architecto quasi aut doloribus', 'Non reiciendis quidem voluptatem. Voluptatem reprehenderit est ut mollitia sint ipsam explicabo ducimus. Veritatis aperiam ea qui repellendus est omnis.', NULL, '2017-10-17 10:48:26', NULL, NULL, 1954, 48, 1),
(1001, 'Id autem qui ullam tenetur molestias', 'Et illum atque nobis fugiat tempore maxime. Qui eos quasi dolore similique. Cupiditate sit nesciunt magni dicta.', NULL, '2016-12-16 21:38:56', NULL, NULL, 1958, 48, 1),
(1002, 'Rem dolores rem temporibus', 'Consequuntur vel odit natus minus laudantium ut placeat. Quasi enim eos voluptate. Quos nisi et atque repellat illo. Sunt numquam culpa est et rerum aliquid ut totam.', NULL, '2023-04-24 22:57:43', NULL, NULL, 1962, 48, 1),
(1003, 'Nihil quae et a', 'Error soluta est necessitatibus. Autem nemo nam animi libero quam ipsam. Vero molestiae nisi et sit totam.', NULL, '2021-03-13 11:06:45', NULL, NULL, 1966, 48, 1),
(1004, 'Sunt sit nam deserunt alias', 'Quo et voluptatum amet natus dicta dolorem. Assumenda impedit repudiandae fuga et quia. Dignissimos est odit rem eum accusantium eius labore.', NULL, '2018-08-02 09:23:29', NULL, NULL, 1970, 48, 1),
(1005, 'Quas non sit temporibus', 'Ipsa corporis molestiae et nihil doloribus ea odio. Deserunt ut sed quos maiores. Voluptatum aut aperiam earum ea.', NULL, '2019-10-28 13:05:14', NULL, NULL, 2026, 48, 1),
(1006, 'Ad molestias quis est consequatur sit repellat', 'Autem harum et accusantium aliquam repudiandae. Sunt sed autem et et laborum est. Facere consequuntur nihil soluta culpa sequi repellat consequatur tenetur. Consectetur voluptas dignissimos at ullam similique facilis veniam.', NULL, '2024-01-28 14:20:33', NULL, NULL, 1974, 48, 1),
(1007, 'Quas error totam deserunt quis fugit', 'Ipsam deleniti quaerat voluptatem nam qui sit omnis. Iusto nam sunt aut dolore. Sed et perferendis quia ipsum nobis debitis. Sit qui fugiat officiis molestiae fugit.', NULL, '2021-10-05 16:50:13', NULL, NULL, 1978, 48, 1),
(1008, 'Pariatur et dolor excepturi quisquam sit', 'Fuga aut magni ut delectus quis harum. Et illo consequuntur et suscipit aliquid nemo ea. Consectetur veritatis temporibus et eos nam ipsum modi veritatis. Neque earum quia autem nihil.', NULL, '2022-07-27 20:37:02', NULL, NULL, 1982, 48, 1),
(1009, 'Quia in minus est incidunt omnis', 'Sed iusto placeat quasi voluptatem ea. Odit quasi eum doloribus in et itaque. Aliquam quo hic facilis accusantium dolor cum aperiam optio.', NULL, '2020-08-01 04:51:12', NULL, NULL, 1986, 48, 1),
(1010, 'Qui debitis repellendus ipsum est voluptas', 'Hic quis tempora aliquam. Quo velit dolores corporis. Pariatur sit nisi et porro enim sint hic.', NULL, '2016-09-11 17:14:33', NULL, NULL, 1990, 48, 1),
(1011, 'Nisi reiciendis corrupti ut quia laboriosam non', 'Quis ut sit ut cupiditate. Distinctio consectetur officia deserunt omnis. Quaerat saepe a iure sit fuga et dolor. Consequatur tempora illum sit enim quia reprehenderit et quo.', NULL, '2022-08-04 14:45:41', NULL, NULL, 1994, 48, 1),
(1012, 'Non in omnis consequatur', 'Tempora voluptatem pariatur dolores qui eius. Natus consequatur et voluptas placeat tenetur. Optio amet amet veritatis optio cupiditate. Maiores exercitationem ut beatae voluptas saepe.', NULL, '2024-12-01 01:19:25', NULL, NULL, 1998, 48, 1),
(1013, 'Illum et harum aliquid reprehenderit quae', 'Iusto voluptatem dolorem omnis dolorum excepturi. Quibusdam qui ipsa pariatur sit quis maxime. Dolores inventore earum quia sit et. Saepe distinctio dolorem iusto hic libero sit maiores.', NULL, '2022-02-19 04:03:51', NULL, NULL, 2002, 48, 1),
(1014, 'Et et voluptas dolor quae', 'Animi ipsum dolores consequatur voluptas. Voluptatibus ad et autem ut iste nihil. Maxime cumque id iusto id.', NULL, '2018-05-27 00:34:49', NULL, NULL, 2006, 48, 1),
(1015, 'Nemo rem ut voluptatem est magni voluptatem', 'Expedita excepturi iure placeat. Eos accusamus unde sunt. Amet adipisci laboriosam ducimus quo. Quaerat deleniti repudiandae qui et illum temporibus sint dolorum.', NULL, '2019-09-09 00:12:04', NULL, NULL, 2010, 48, 1),
(1016, 'Iure eveniet illo libero accusamus', 'Vitae non tenetur sit beatae. Sed officiis veniam dolorem non qui aliquam et. Modi quos eum enim repudiandae odio in laudantium.', NULL, '2018-12-10 01:24:44', NULL, NULL, 2014, 48, 1),
(1017, 'Repellendus sint tempora id et velit', 'Aperiam quas quo qui eaque. In asperiores veritatis itaque incidunt repudiandae quia praesentium. Dolores quae sunt quo nobis. Et ullam repellat ut.', NULL, '2021-04-20 06:13:05', NULL, NULL, 2018, 48, 1),
(1018, 'Omnis iure nobis ut', 'Doloribus et nobis in adipisci. Dicta voluptatem autem quia in explicabo omnis similique. Molestias deserunt quo id culpa. Esse accusamus suscipit vel laudantium ducimus.', NULL, '2017-01-07 23:58:11', NULL, NULL, 2022, 48, 1),
(1019, 'Sint fuga modi vel', 'Veritatis in eum aut sit voluptatem assumenda deserunt. Tempore odit et libero cupiditate animi voluptatem animi. Totam architecto ea ab rem sint veritatis maxime.', NULL, '2020-06-17 05:33:29', NULL, NULL, 1930, 49, 1),
(1020, 'Laborum ea aliquid beatae sit', 'Dolore dolorem possimus nemo velit voluptate accusamus qui. Voluptatem nesciunt repellendus fuga non similique consequatur qui. Voluptatem numquam cupiditate saepe ut. Et recusandae cum fugiat quia ut unde.', NULL, '2022-07-28 07:53:18', NULL, NULL, 1934, 49, 1),
(1021, 'Vel earum praesentium omnis a dolorem dolore', 'Quo odio minima assumenda provident quod cupiditate. A ducimus ratione esse dignissimos autem quidem. Aliquid nulla earum ipsam magnam.', NULL, '2022-01-23 05:07:13', NULL, NULL, 1938, 49, 1),
(1022, 'Quia repellendus nostrum culpa autem expedita dolo', 'Voluptatum fuga soluta voluptatem reiciendis expedita. Adipisci omnis in autem ullam aut. Exercitationem unde repellat sequi nostrum at. Placeat cumque maiores nihil quibusdam voluptatem eaque possimus deleniti.', NULL, '2020-11-30 03:44:30', NULL, NULL, 1950, 49, 1),
(1023, 'Asperiores vel et ad', 'Quasi ducimus natus deserunt natus sapiente sed. Et numquam repudiandae omnis esse est. Velit quia rerum placeat dolorum voluptatum. Qui quibusdam qui dolor beatae repellat incidunt.', NULL, '2017-02-05 03:42:57', NULL, NULL, 1954, 49, 1),
(1024, 'Autem et a quaerat praesentium reiciendis', 'Exercitationem tempore quaerat facilis et dolorem porro. Provident exercitationem impedit voluptate. Non fuga voluptate sunt dolorem delectus a. Atque rem recusandae dolor sequi.', NULL, '2017-04-17 22:01:15', NULL, NULL, 1958, 49, 1),
(1025, 'Ut beatae aliquid laborum', 'Quis sapiente quidem impedit et earum qui. At placeat ad libero nostrum qui nesciunt a. Vitae quis voluptatem maxime voluptas aut officia dolores.', NULL, '2023-02-16 15:13:39', NULL, NULL, 1962, 49, 1),
(1026, 'Quia et exercitationem quod consequatur', 'Qui dolorem sit consequatur incidunt. Itaque quia veritatis nemo saepe incidunt. Iusto quia voluptatum adipisci placeat aliquam voluptas. Odio perferendis eius velit sit modi est.', NULL, '2021-11-08 23:14:38', NULL, NULL, 1966, 49, 1),
(1027, 'Ducimus voluptate odit id omnis itaque accusantium', 'Et laboriosam adipisci modi. Voluptatem et nihil magnam omnis nisi nihil. Enim praesentium veritatis laudantium vel et.', NULL, '2017-07-17 13:23:33', NULL, NULL, 1970, 49, 1),
(1028, 'Ratione modi voluptas ut necessitatibus', 'Quo deleniti in ut error dolore dolorum nemo. Neque corrupti unde aut distinctio impedit nisi et. Voluptatum aperiam reiciendis vel culpa iste aut.', NULL, '2016-04-11 19:41:40', NULL, NULL, 2026, 49, 1),
(1029, 'Ex inventore temporibus excepturi non assumenda', 'Debitis itaque impedit repellendus autem mollitia fugit est sed. Autem mollitia repellendus nam. Error voluptate culpa provident dicta alias impedit corrupti. Ipsum ipsa voluptas est ut laborum eos. Earum repellat ut natus et.', NULL, '2020-09-19 20:53:18', NULL, NULL, 1974, 49, 1),
(1030, 'Laborum eligendi perferendis reprehenderit ducimus', 'Beatae dolorem aut provident magni nemo. Quibusdam inventore necessitatibus dolore non. A non aliquam harum dolores fugit distinctio. Iure recusandae dolor molestias laboriosam voluptatem magni ducimus.', NULL, '2016-06-14 08:22:09', NULL, NULL, 1978, 49, 1),
(1031, 'Aliquid tenetur dicta esse', 'Quasi aperiam velit quia quaerat nulla. Illo est in sint natus. Dolorem ducimus eum omnis. Expedita eveniet sint earum molestiae in.', NULL, '2023-11-30 22:44:06', NULL, NULL, 1982, 49, 1),
(1032, 'Ex qui unde excepturi', 'Ullam est inventore dicta atque. Harum ut officia error tenetur facere aut. Voluptates voluptatibus dolor dolores neque sapiente blanditiis a rem. Deleniti consequatur facilis ipsam adipisci illo reprehenderit. Beatae id qui et cupiditate culpa.', NULL, '2023-07-13 23:04:56', NULL, NULL, 1986, 49, 1),
(1033, 'Dignissimos sit illo atque', 'Nam non dolor ut quos. Autem quaerat aperiam sed dolore quasi magnam nam.', NULL, '2023-01-14 20:14:34', NULL, NULL, 1990, 49, 1),
(1034, 'In quaerat amet maxime rem', 'Quas ullam deleniti voluptas perferendis facere et. At molestiae nemo voluptatem et sequi ratione possimus. Fuga et veniam tempore maiores illum.', NULL, '2020-10-04 03:01:21', NULL, NULL, 1994, 49, 1),
(1035, 'Nobis quas adipisci illo explicabo temporibus et', 'Ducimus magnam adipisci repellat et. Ab sunt animi aut eaque fugiat esse.', NULL, '2023-02-12 20:07:03', NULL, NULL, 1998, 49, 1),
(1036, 'Culpa inventore consequatur architecto dolore et', 'Tempora sint incidunt voluptatibus consequatur aut. Autem molestias qui consequuntur omnis possimus.', NULL, '2025-08-13 06:56:15', NULL, NULL, 2002, 49, 1),
(1037, 'Expedita quo ratione quia', 'Aperiam vero debitis consequuntur sunt. Quo officiis ea vel qui. Alias ea voluptates est. Et eaque aut quo quia.', NULL, '2025-06-20 19:45:51', NULL, NULL, 2006, 49, 1),
(1038, 'Quis occaecati aut sapiente', 'Qui expedita quia rerum recusandae rerum placeat earum. Ipsa ab magnam minus nulla fuga. Ex est quo minus fuga.', NULL, '2022-09-24 20:08:32', NULL, NULL, 2010, 49, 1),
(1039, 'Dolorem soluta qui adipisci', 'Sapiente qui exercitationem eos magnam repellendus. Ducimus culpa numquam dignissimos voluptas velit. Aut pariatur omnis veniam.', NULL, '2024-07-05 04:59:49', NULL, NULL, 2014, 49, 1),
(1040, 'Quisquam nisi impedit exercitationem aut', 'Dignissimos vero impedit iure dolores. Quos molestias et dolorem dolores.', NULL, '2016-12-30 15:43:44', NULL, NULL, 2018, 49, 1),
(1041, 'Libero qui doloremque provident voluptas laborum v', 'Aut aut voluptas dignissimos sunt unde maxime animi et. Neque exercitationem maiores dolore perferendis. Corrupti molestiae odit suscipit magni non aspernatur natus. In et quae explicabo quia unde nemo.', NULL, '2020-09-15 09:27:45', NULL, NULL, 2022, 49, 1),
(1042, 'Magnam enim tempora dolorem labore dolor aut', 'Optio est modi odit sunt libero vitae dolor. Eveniet assumenda unde rerum corporis. Omnis aut blanditiis asperiores quisquam qui.', NULL, '2016-01-27 23:01:38', NULL, NULL, 1930, 50, 1),
(1043, 'Eos quam qui unde consequatur omnis nihil', 'Accusamus minima voluptatem aut. Mollitia odit provident tenetur temporibus ea eligendi qui. Excepturi saepe omnis iure temporibus quibusdam alias eius aut. Facilis animi soluta reprehenderit vel rem architecto repudiandae.', NULL, '2022-05-06 05:43:53', NULL, NULL, 1934, 50, 1),
(1044, 'Itaque doloremque distinctio ut unde sed', 'Dolorem ut dolorem dolor veniam repellat sequi. Est atque unde hic et eaque voluptas qui. Eum enim odit id reprehenderit perferendis. Consectetur repellendus modi est dolorem beatae adipisci quibusdam aut.', NULL, '2024-06-02 04:50:08', NULL, NULL, 1938, 50, 1),
(1045, 'Omnis sit dolor vel sint tempore debitis', 'Qui recusandae autem fuga sit. Corporis repellat cum eos. Quisquam placeat necessitatibus voluptatem voluptatem minima qui ipsum.', NULL, '2017-07-27 11:17:57', NULL, NULL, 1950, 50, 1),
(1046, 'Unde est error modi', 'Et hic nihil repellat autem in. Sunt ullam non perspiciatis corporis excepturi.', NULL, '2021-09-18 22:15:20', NULL, NULL, 1954, 50, 1),
(1047, 'Voluptate ab pariatur expedita nemo omnis accusamu', 'Quia autem quam pariatur rerum omnis voluptatem provident. Qui fugit et totam deserunt quas dolores.', NULL, '2025-03-31 18:15:58', NULL, NULL, 1958, 50, 1),
(1048, 'Vel ut omnis modi qui aut libero', 'Qui praesentium esse rem autem ipsa rerum doloribus dolor. Non blanditiis accusantium et reprehenderit.', NULL, '2020-12-09 13:41:40', NULL, NULL, 1962, 50, 1),
(1049, 'Dignissimos modi labore assumenda', 'Itaque minus excepturi a repellendus. Sed voluptas id aut aspernatur fugiat id nemo.', NULL, '2020-10-23 14:03:48', NULL, NULL, 1966, 50, 1),
(1050, 'Similique vel neque cum tempora', 'Aut consequatur optio minus architecto maxime. Et provident perferendis et maxime omnis expedita. Enim dolor aut totam.', NULL, '2017-01-19 22:46:58', NULL, NULL, 1970, 50, 1),
(1051, 'Tempora tempore aut nemo dicta nihil nisi', 'Voluptatem asperiores officiis nemo architecto eius quo. Architecto vero qui et cupiditate omnis. Sit illum ratione quia rem. Sunt magnam possimus et repellendus esse.', NULL, '2017-05-27 12:29:52', NULL, NULL, 2026, 50, 1),
(1052, 'Autem deserunt nostrum minus', 'Velit corporis et fuga quia et mollitia nemo molestiae. Voluptas dolorem itaque occaecati. Consectetur dolor et maiores quasi fugiat enim ut. Sunt est nulla provident.', NULL, '2017-03-07 08:12:18', NULL, NULL, 1974, 50, 1),
(1053, 'Velit et non ut', 'Consequatur quaerat quod aut consectetur vel placeat omnis. In ratione ratione tempore a perspiciatis sint nesciunt. In repudiandae aut rerum qui eius et officia. Consequatur fuga velit amet voluptas quisquam nesciunt est. Quisquam voluptatem porro maiores facere aut perspiciatis tempora.', NULL, '2021-11-04 17:02:30', NULL, NULL, 1978, 50, 1),
(1054, 'Ut nihil voluptas incidunt qui nemo', 'Animi aut velit sit architecto facere quo. Dolores facilis doloribus voluptatum consequuntur. Et odio dolor quis officiis mollitia autem ab. Nihil qui quisquam mollitia deserunt blanditiis eos quasi.', NULL, '2016-03-18 15:56:55', NULL, NULL, 1982, 50, 1),
(1055, 'Magni nisi molestias et quam quas', 'Rerum repellendus aspernatur distinctio ipsa sint consectetur. Ad est hic iusto sed ab voluptatem. Sit dicta vitae dolore voluptate.', NULL, '2017-07-24 00:13:04', NULL, NULL, 1986, 50, 1),
(1056, 'Veritatis voluptatem eveniet praesentium sed facil', 'Expedita ut nihil dignissimos velit. Consectetur ratione consectetur ea quasi ipsam corrupti sint. Amet minus est tempora praesentium incidunt sed vero et. Officia id ratione ea rerum vero ullam omnis.', NULL, '2015-11-19 15:33:17', NULL, NULL, 1990, 50, 1),
(1057, 'Enim veniam nihil quia', 'Saepe ipsa ad repudiandae voluptatem ab optio temporibus. Ut nulla sapiente autem a consequatur. Ab ab consequatur et eum quis. Architecto qui ea et omnis at occaecati ut. Magnam debitis sit nostrum delectus vero quia.', NULL, '2016-01-09 22:14:48', NULL, NULL, 1994, 50, 1),
(1058, 'Adipisci nisi recusandae cum sunt dolorem a', 'Sunt optio delectus perspiciatis fuga quibusdam. Voluptatem porro sequi eum. Iste veniam facilis ut quo assumenda veniam.', NULL, '2019-01-14 15:39:04', NULL, NULL, 1998, 50, 1),
(1059, 'Et enim voluptas laborum', 'Odit doloremque facere aperiam quibusdam incidunt culpa iste. Voluptas inventore ut placeat ut. Eos vero nam facere qui ad. Amet numquam dolores illo.', NULL, '2025-09-03 00:07:17', NULL, NULL, 2002, 50, 1),
(1060, 'Sequi eos molestias velit et omnis', 'Autem voluptatem quis eum perspiciatis ipsa. Dolorem impedit sed est nihil qui nulla. Porro in deleniti mollitia veniam iusto maiores. Nemo consectetur id temporibus maiores ea.', NULL, '2019-05-17 09:27:34', NULL, NULL, 2006, 50, 1),
(1061, 'Amet sit quod fugit delectus accusantium et', 'Eligendi et atque quia nobis perferendis placeat fugit voluptates. Est alias qui neque. Aut ut autem occaecati officiis officia. Ducimus qui expedita enim vel dolore.', NULL, '2024-10-28 14:59:41', NULL, NULL, 2010, 50, 1),
(1062, 'Quia vero omnis aut minus', 'Velit nam mollitia et nesciunt beatae eius quia. Qui sequi occaecati dolorem minima sit. Quibusdam enim id temporibus harum architecto sit.', NULL, '2017-11-03 14:27:21', NULL, NULL, 2014, 50, 1),
(1063, 'Magnam corporis soluta quibusdam', 'Et suscipit architecto non ducimus quae est. Et non excepturi nobis asperiores non. Excepturi ut laudantium ratione debitis sed ratione explicabo. Voluptatem qui cumque necessitatibus et enim sunt velit qui. Qui a et eligendi est est laudantium.', NULL, '2017-10-31 14:02:08', NULL, NULL, 2018, 50, 1),
(1064, 'Laborum fugiat eveniet aut quia debitis repellat', 'Ullam voluptas sed ad sit iusto. Autem id repudiandae sed quia. Est iste labore dolorem eum. Rem at nostrum et optio non. Repellat numquam quo libero magni dolor sit molestiae.', NULL, '2018-12-16 09:50:52', NULL, NULL, 2022, 50, 1),
(1065, 'Quas cupiditate vel doloremque', 'Ut excepturi beatae vitae magnam dolorem. Consequatur corporis omnis saepe sit blanditiis commodi dolores consectetur. Et alias voluptatem ut.', NULL, '2025-05-11 15:16:42', NULL, NULL, 1930, 51, 1),
(1066, 'Et officiis voluptate doloribus voluptas', 'Consequatur vel aut inventore quibusdam. Aut voluptatem quia nemo error. Earum qui dignissimos rerum facilis. Aperiam dignissimos est sit.', NULL, '2020-04-16 14:15:55', NULL, NULL, 1934, 51, 1),
(1067, 'Rerum excepturi possimus iusto qui dignissimos', 'Consectetur qui aut unde fugit voluptatibus amet eaque. Quis maiores impedit velit et eveniet velit. Modi est adipisci consequatur consequuntur. Doloremque harum voluptatem aut. Debitis maxime nihil labore tempora dolores similique.', NULL, '2019-10-25 02:29:37', NULL, NULL, 1938, 51, 1),
(1068, 'Voluptatibus est voluptatem quo sunt sequi nisi', 'Nobis officia a voluptatibus nostrum. Explicabo dolores explicabo cum consectetur debitis maxime quasi. Dicta porro nemo ex voluptatem. Modi aut sequi quasi fugiat non quis.', NULL, '2024-08-25 02:18:56', NULL, NULL, 1950, 51, 1),
(1069, 'Inventore facere exercitationem cum', 'Modi cumque aut accusantium repellat. Ut quisquam numquam eum. Laboriosam nemo ipsa et sequi ea et. Enim quibusdam sunt facilis aperiam voluptas perspiciatis dolore.', NULL, '2020-04-21 09:39:50', NULL, NULL, 1954, 51, 1),
(1070, 'Mollitia doloribus quae eos occaecati iure eum', 'Eos et explicabo beatae porro et fuga assumenda. Ut mollitia iusto ea dicta molestiae quam. Omnis qui aut qui consequuntur cumque et omnis. Et et itaque veniam.', NULL, '2016-09-29 03:21:03', NULL, NULL, 1958, 51, 1),
(1071, 'Similique ipsum voluptas omnis', 'Adipisci inventore nostrum similique vitae numquam quos. Excepturi maxime beatae blanditiis officiis officia. Quidem consectetur sed consectetur autem ut aut unde natus.', NULL, '2023-11-29 05:44:13', NULL, NULL, 1962, 51, 1),
(1072, 'Enim ut voluptate rerum', 'Voluptates amet rem nemo ea sapiente fugit. Illum nam consequatur ducimus velit aspernatur voluptatum. Quibusdam consequatur ab et deserunt. Incidunt aperiam et odit.', NULL, '2019-12-03 11:14:33', NULL, NULL, 1966, 51, 1),
(1073, 'Ut laudantium possimus ut non eos perspiciatis', 'Asperiores deserunt esse nobis suscipit est. Dicta suscipit dolorum et.', NULL, '2020-07-06 23:58:50', NULL, NULL, 1970, 51, 1),
(1074, 'Asperiores molestias laudantium reprehenderit', 'Enim corrupti maiores cumque unde velit molestiae. Fugiat veritatis magni omnis qui earum facere ut exercitationem. Fugit ad maxime autem hic tempore ducimus sapiente.', NULL, '2024-09-16 15:09:19', NULL, NULL, 2026, 51, 1),
(1075, 'Sunt quas blanditiis repudiandae quis recusandae', 'Quos et rerum vel eum ut. Aut et nulla dolorem deserunt vero omnis. Aliquid doloribus sed autem.', NULL, '2020-10-17 09:53:11', NULL, NULL, 1974, 51, 1),
(1076, 'Qui fugiat nihil rerum iste enim et', 'Consequatur perspiciatis doloribus ullam placeat. Dolores sunt dolore ea fuga velit. Maiores maiores voluptatum ducimus temporibus vitae. Ducimus ipsum fugiat vel et.', NULL, '2017-05-30 12:30:10', NULL, NULL, 1978, 51, 1),
(1077, 'Qui ut sed quia', 'Deleniti nam non at unde et similique quaerat. Eligendi autem iure ipsum. Quibusdam aut voluptatem at quae sint. Sit sed eligendi sunt neque libero.', NULL, '2024-02-05 13:52:27', NULL, NULL, 1982, 51, 1),
(1078, 'Saepe vitae reiciendis quisquam ut consequuntur', 'Minus rerum recusandae quas qui cumque. Debitis qui dolorem architecto sed. Molestiae ut fugit et sint quis. Qui est pariatur libero.', NULL, '2022-07-16 10:27:24', NULL, NULL, 1986, 51, 1),
(1079, 'Dolores debitis veniam ratione placeat repudiandae', 'Hic quia hic fugiat ea. Enim doloribus quia blanditiis aut non ducimus. Aut odit fuga asperiores natus aut dolorem.', NULL, '2021-04-15 14:04:11', NULL, NULL, 1990, 51, 1),
(1080, 'Ut temporibus rerum et', 'Neque ratione dignissimos unde rerum. Doloribus fuga beatae assumenda hic quaerat sit minus. Dicta qui ut quaerat assumenda voluptatem impedit.', NULL, '2024-11-20 05:47:46', NULL, NULL, 1994, 51, 1),
(1081, 'Et quos omnis quia similique quis', 'Sit animi et sit consequatur. Corrupti omnis nihil quis nisi. Eos impedit pariatur eligendi aut.', NULL, '2019-06-19 00:48:44', NULL, NULL, 1998, 51, 1),
(1082, 'Temporibus ipsa et voluptas quia quam est', 'Sequi id nulla maiores quas. Consequatur necessitatibus dolor a modi doloribus vitae enim rerum. Ad velit iure architecto eos ab nemo aperiam. Reiciendis est perspiciatis aut.', NULL, '2023-02-08 09:09:44', NULL, NULL, 2002, 51, 1),
(1083, 'Dolores voluptatibus praesentium enim nisi', 'Aut ducimus facilis sit. Nisi illum voluptas maiores placeat. Veritatis voluptatem adipisci eveniet qui ut est quia.', NULL, '2018-03-02 14:20:38', NULL, NULL, 2006, 51, 1),
(1084, 'Et dicta neque quo quaerat', 'Itaque maxime earum eos officia maiores. Quaerat delectus dicta fuga sit. Eius expedita quibusdam quia at veniam.', NULL, '2019-05-28 00:16:33', NULL, NULL, 2010, 51, 1),
(1085, 'Iusto aut deserunt rerum est adipisci sit', 'Officia voluptas debitis placeat laudantium. Rerum laudantium et quia praesentium dolorem non. Optio consequatur voluptas consequatur quas quia at saepe.', NULL, '2020-11-05 00:43:44', NULL, NULL, 2014, 51, 1),
(1086, 'Ullam ducimus ad tempora', 'Vel omnis eos maiores consequuntur adipisci. Doloremque magni libero sequi non sed repellat. Accusamus aut sit maxime magnam ut.', NULL, '2020-03-20 15:36:40', NULL, NULL, 2018, 51, 1),
(1087, 'Magni et asperiores iure consequatur maxime', 'Non quo assumenda sit. Dolores odio debitis a doloremque ab.', NULL, '2017-11-20 06:21:03', NULL, NULL, 2022, 51, 1),
(1088, 'Quas ducimus consequatur ut', 'Et et et sit id et unde voluptatum. Incidunt est id veritatis nesciunt eum nobis. Dolorem quo temporibus repellat voluptas quos enim occaecati. Accusamus neque aliquid molestias.', NULL, '2017-10-25 19:02:05', NULL, NULL, 1930, 52, 1),
(1089, 'Modi nulla dicta repellat blanditiis architecto', 'Sunt animi sequi enim quo quo aut. Natus unde illum blanditiis non rerum. Aperiam nihil nobis quam ad natus aspernatur. Id laudantium quidem deserunt similique.', NULL, '2024-08-02 14:34:35', NULL, NULL, 1934, 52, 1),
(1090, 'Quasi vel voluptas nemo', 'Et repudiandae magni inventore consequatur. Incidunt qui nobis ipsam nostrum non aspernatur dignissimos ut. Autem assumenda maxime est in sed excepturi. Officiis blanditiis id qui non consectetur repellat aperiam ullam.', NULL, '2018-07-28 21:08:16', NULL, NULL, 1938, 52, 1),
(1091, 'Beatae aliquam consequuntur praesentium dolores nu', 'Veniam est recusandae at nulla quo. Unde deserunt aspernatur qui et consequatur. Impedit et sint iste assumenda blanditiis soluta.', NULL, '2021-10-09 12:25:19', NULL, NULL, 1950, 52, 1),
(1092, 'Ratione perferendis illo aut magni', 'Quam harum assumenda eum eveniet ut sit. Tenetur accusantium amet quasi qui sed illo. Voluptatem nemo est et.', NULL, '2018-10-22 06:33:04', NULL, NULL, 1954, 52, 1),
(1093, 'Laboriosam ut qui pariatur', 'Omnis autem neque fuga expedita nulla. Distinctio aut repellat dolorum. Sint nisi pariatur doloremque sunt aperiam eos sit. Ullam quia est itaque est quis sequi laudantium aperiam. Optio ipsam voluptates maxime enim voluptatem in.', NULL, '2025-06-07 11:10:14', NULL, NULL, 1958, 52, 1),
(1094, 'Temporibus labore omnis rerum distinctio ad', 'Officia unde labore commodi sit ut. Repellendus odio similique vel maxime a. Et quo quos ab qui sit magnam quia.', NULL, '2018-05-10 23:06:16', NULL, NULL, 1962, 52, 1),
(1095, 'Magnam sapiente blanditiis voluptate quas ipsa', 'Magni sed et expedita magni. Expedita eos consectetur rerum sed et non dolorem. Cum qui modi distinctio eum nam. Reiciendis qui autem ut dignissimos nihil earum.', NULL, '2017-04-02 10:02:06', NULL, NULL, 1966, 52, 1),
(1096, 'Dolorum totam sit odit', 'Quas voluptatum numquam facilis quia non rem libero. Officiis ipsam optio laudantium quis quae.', NULL, '2022-06-13 23:02:04', NULL, NULL, 1970, 52, 1),
(1097, 'Quia voluptatem modi possimus id', 'Dolorem eligendi sed ut beatae rerum sunt. Consequuntur modi mollitia dignissimos blanditiis qui dignissimos ut. Consequatur repudiandae dicta ut et molestiae. Architecto deserunt molestiae aut et.', NULL, '2021-07-12 17:58:46', NULL, NULL, 2026, 52, 1),
(1098, 'Eos similique assumenda assumenda ut culpa', 'Facere nam omnis eos maiores alias facilis. Dolores id explicabo quos doloribus. Deleniti deleniti quos natus.', NULL, '2017-10-23 15:09:32', NULL, NULL, 1974, 52, 1),
(1099, 'Ea similique repudiandae aut totam tenetur volupta', 'Impedit ullam magnam itaque suscipit cupiditate. Et non distinctio est nihil mollitia soluta. Ut cupiditate dicta distinctio accusantium impedit sed.', NULL, '2024-11-27 23:38:43', NULL, NULL, 1978, 52, 1),
(1100, 'Sunt debitis autem aut consequatur impedit', 'Ex deserunt animi doloribus enim sunt. Corporis in impedit modi qui accusantium blanditiis impedit enim. Ut sit consequatur rerum. Atque voluptatum et non sapiente asperiores.', NULL, '2022-02-18 21:42:51', NULL, NULL, 1982, 52, 1),
(1101, 'Quaerat voluptas temporibus neque esse impedit fug', 'Explicabo molestiae consequatur quia. Qui magni ipsa nesciunt occaecati sit iusto. Voluptas rerum possimus ipsam minima. Iure non dolores dignissimos quae.', NULL, '2020-02-12 10:19:33', NULL, NULL, 1986, 52, 1),
(1102, 'Similique harum repellat laudantium', 'Necessitatibus ea omnis fugit labore. Ratione ex est omnis facilis illum corrupti aut. Alias assumenda enim in aut et sint veniam. Similique molestiae enim quia.', NULL, '2021-07-19 15:41:20', NULL, NULL, 1990, 52, 1),
(1103, 'Impedit deleniti eveniet distinctio totam ut omnis', 'Dolores exercitationem id magni dolores quisquam sed. Facilis molestiae corrupti nulla dolorum. Sed molestiae enim corrupti est suscipit nulla.', NULL, '2017-08-18 18:22:26', NULL, NULL, 1994, 52, 1),
(1104, 'Cupiditate ut quia animi', 'Perspiciatis rerum ut eum sit temporibus. Eum atque deserunt exercitationem aut nostrum corrupti qui. Quia et est sit nobis labore excepturi officiis.', NULL, '2025-10-06 10:23:01', NULL, NULL, 1998, 52, 1),
(1105, 'Sunt adipisci eligendi ipsum officia sapiente', 'Similique id sunt commodi ipsum. Delectus dolor qui quae non voluptatem id.', NULL, '2018-12-12 11:57:50', NULL, NULL, 2002, 52, 1),
(1106, 'Eligendi fugit ut vel', 'Architecto voluptate totam eos nemo nihil quos. Unde ex exercitationem voluptates maxime itaque sequi quos. Et fuga ut sit aut cumque corrupti.', NULL, '2019-07-16 15:16:45', NULL, NULL, 2006, 52, 1),
(1107, 'Quia optio sed voluptas autem officiis', 'Est cupiditate ea voluptas odit quaerat sed occaecati sed. Sint a enim error fugit consectetur harum. Ut quia id rerum. Atque voluptatem temporibus dolorem voluptas voluptatem libero occaecati qui.', NULL, '2017-05-28 15:05:08', NULL, NULL, 2010, 52, 1),
(1108, 'Ratione inventore a aut facere', 'Rerum autem corrupti dolores sint. Facilis similique molestiae est enim quis debitis ut. Et a ut quibusdam id quaerat ipsam odio ad. Laboriosam voluptate consequatur quos porro sit.', NULL, '2016-10-01 01:46:13', NULL, NULL, 2014, 52, 1),
(1109, 'Debitis ipsum veritatis beatae', 'Velit non voluptatum ratione praesentium enim. Pariatur et delectus ducimus natus deleniti maiores totam. Autem culpa omnis fugit corrupti ut aut quo. Repellat nam nemo a et repellendus.', NULL, '2024-01-18 22:53:17', NULL, NULL, 2018, 52, 1),
(1110, 'Fuga debitis est ipsa quo dolores voluptas', 'Quis laboriosam est quia quia. Ut et aut possimus est.', NULL, '2017-08-31 18:45:52', NULL, NULL, 2022, 52, 1),
(1111, 'Eligendi in incidunt facilis enim aut', 'Quaerat rerum blanditiis reiciendis libero praesentium perferendis. Pariatur soluta doloribus molestiae eum necessitatibus est autem. Nihil unde minus soluta animi explicabo.', NULL, '2021-05-08 06:58:49', NULL, NULL, 1930, 53, 1),
(1112, 'Rerum veritatis natus et totam deserunt', 'Non sapiente ipsam ad dicta fuga non repellendus. Nihil illum qui exercitationem quidem iste ipsum qui. Consequuntur maiores iste aut voluptatem sed.', NULL, '2020-07-03 07:38:00', NULL, NULL, 1934, 53, 1),
(1113, 'Quo saepe necessitatibus vel ducimus', 'Neque earum numquam doloribus facere laboriosam dolores cumque. Quia alias error in praesentium. Delectus enim est consequatur sit natus iste voluptas. Consequuntur inventore nisi qui voluptas quis harum.', NULL, '2024-06-26 09:39:07', NULL, NULL, 1938, 53, 1),
(1114, 'Minus illo aut maiores dolorem accusamus ullam', 'Aut nulla sint quis ut quia magni. Esse in quia repellat hic. Libero sint et molestiae quod ratione.', NULL, '2023-01-29 03:00:50', NULL, NULL, 1950, 53, 1),
(1115, 'Nulla consequatur illum excepturi consequuntur', 'Omnis itaque voluptatibus illum itaque enim dolor repellat. Sit cum non ea adipisci ex repellendus sed.', NULL, '2022-11-18 03:16:02', NULL, NULL, 1954, 53, 1),
(1116, 'Omnis fuga assumenda quis aut', 'Est odio molestiae eius et. Itaque iste aspernatur quasi tenetur necessitatibus cupiditate. Voluptatem assumenda sit deserunt eligendi. Possimus accusamus eaque placeat. Qui laboriosam perferendis qui rem atque.', NULL, '2018-12-05 10:52:08', NULL, NULL, 1958, 53, 1),
(1117, 'Consequatur tenetur aut natus sed', 'Quaerat dolorem tenetur sint numquam corrupti repudiandae. Est qui occaecati velit dolorem. Nobis aspernatur delectus fugiat id dolorem ducimus similique excepturi.', NULL, '2025-08-05 22:46:02', NULL, NULL, 1962, 53, 1),
(1118, 'Est hic ratione labore ad tempore', 'Quia unde asperiores provident et optio. Enim dignissimos sint eum. Sint atque ipsa neque et facere ducimus architecto. Ut omnis pariatur tempora reprehenderit tempore.', NULL, '2025-02-09 19:55:55', NULL, NULL, 1966, 53, 1),
(1119, 'Error officia nihil blanditiis qui', 'Facere sed velit qui quam quod repellendus. Nulla beatae sint quisquam.', NULL, '2024-12-25 08:40:10', NULL, NULL, 1970, 53, 1);
INSERT INTO `posts` (`ID_Post_PK`, `Content_Title`, `Content_Body`, `Content_Multimedia`, `Upload_Date`, `Modified_Date`, `Deleted_Date`, `ID_WorldCup_Year_FK`, `ID_User_FK`, `Visibility_State`) VALUES
(1120, 'Provident ut quaerat nihil possimus ut laudantium', 'Est ipsa quasi voluptates dolorum sed quos veritatis voluptatum. Commodi totam sed qui. Facere nihil omnis ad similique qui.', NULL, '2018-03-11 16:22:39', NULL, NULL, 2026, 53, 1),
(1121, 'Veniam magnam doloremque sed', 'Dignissimos delectus non ipsa ut nemo qui. Consectetur assumenda sint illo repudiandae vel. Quidem doloribus ex sed.', NULL, '2022-08-31 19:32:45', NULL, NULL, 1974, 53, 1),
(1122, 'Veniam odit quaerat dolores voluptatum rerum ex', 'Qui necessitatibus inventore totam totam velit praesentium. Sint aut voluptatum accusamus debitis quos. Iusto omnis et sint corrupti.', NULL, '2017-11-06 14:45:40', NULL, NULL, 1978, 53, 1),
(1123, 'Animi molestiae placeat quaerat laudantium', 'Fugiat dolor eos aut ut fugit laboriosam. Ipsam reiciendis blanditiis consequatur placeat et enim at. Non neque aut officia cupiditate.', NULL, '2016-02-07 18:22:36', NULL, NULL, 1982, 53, 1),
(1124, 'Consequatur ut aut porro dolores eaque sed', 'Et quod nemo sit temporibus aut. Et et quisquam voluptatum sint quibusdam corrupti. Eius ea ipsum odit rerum ipsam voluptate necessitatibus quia. Pariatur corporis beatae asperiores minus nobis minima.', NULL, '2022-03-20 00:07:50', NULL, NULL, 1986, 53, 1),
(1125, 'Asperiores aut molestias voluptatem', 'Saepe est nulla libero sit cumque. Voluptatibus quod et expedita non. Dolor cum aut eos est. Optio recusandae quasi non quibusdam est sunt.', NULL, '2022-05-09 09:18:51', NULL, NULL, 1990, 53, 1),
(1126, 'Dolor numquam quo et qui', 'Asperiores quos facilis eius aut explicabo. Aspernatur atque non voluptatum est voluptatibus. Id rem aut eligendi quas minima dolorem sed et. Sit et recusandae et quidem cumque.', NULL, '2017-12-12 03:44:10', NULL, NULL, 1994, 53, 1),
(1127, 'Eius illo occaecati quos dolore', 'Qui distinctio qui et sed reprehenderit dolorum. Voluptas rerum voluptatem accusamus autem. Cumque deleniti et quo quas a culpa.', NULL, '2022-01-02 18:22:18', NULL, NULL, 1998, 53, 1),
(1128, 'Explicabo quaerat corrupti fuga ab mollitia', 'Est distinctio qui autem incidunt. Deleniti ratione magni est. Fugit voluptates qui dicta velit neque inventore distinctio. Fuga maiores tempore quibusdam optio assumenda voluptatem vitae.', NULL, '2020-09-28 19:34:51', NULL, NULL, 2002, 53, 1),
(1129, 'Debitis quia ut deserunt optio eum accusamus', 'Omnis sit ad natus aperiam sit accusamus accusantium. Debitis ipsam et ut nobis omnis molestiae vitae. Voluptatem sed itaque qui ratione consequuntur distinctio adipisci. Quisquam aut et neque.', NULL, '2022-07-09 18:24:21', NULL, NULL, 2006, 53, 1),
(1130, 'Eum magnam aut dignissimos et', 'At voluptatum perspiciatis illum adipisci inventore. Harum distinctio et quaerat doloribus repellat ut. Veniam commodi aperiam illo sit tempore.', NULL, '2018-10-19 07:24:02', NULL, NULL, 2010, 53, 1),
(1131, 'Explicabo aspernatur ut et ut', 'Perspiciatis et molestiae vero. Dolores eaque reiciendis maxime. Dolores incidunt ut voluptatem eum consequatur est. Quibusdam rerum libero incidunt enim.', NULL, '2019-10-07 01:03:37', NULL, NULL, 2014, 53, 1),
(1132, 'Dolor dolorem sed maxime inventore minima', 'Vero aut ea blanditiis itaque ut eveniet ipsum. Ea atque magni provident labore et amet. Similique autem impedit nobis est. Nihil fugit voluptatum hic.', NULL, '2018-10-15 11:32:04', NULL, NULL, 2018, 53, 1),
(1133, 'Quia sit rerum totam quia voluptas', 'Totam id earum eligendi esse voluptate id et perferendis. Consectetur eos tempore quos aut quos ut veniam. Laboriosam illo voluptatibus assumenda aut.', NULL, '2020-04-21 14:58:57', NULL, NULL, 2022, 53, 1),
(1134, 'Quae in praesentium ipsum occaecati', 'Vel adipisci aut assumenda nulla assumenda suscipit ipsa est. Officiis incidunt consequatur ad qui ducimus vero ut. Sapiente est ipsa eum dolor reprehenderit enim. In rem cupiditate molestias deserunt quibusdam.', NULL, '2021-05-19 07:37:59', NULL, NULL, 1930, 54, 1),
(1135, 'Ratione neque incidunt non', 'Quis est quo atque dicta. Ea atque quis quae corporis. Non animi et quo tempora minus necessitatibus sed. Error quia suscipit autem. At ducimus sed et vero et esse.', NULL, '2016-10-11 07:29:13', NULL, NULL, 1934, 54, 1),
(1136, 'Repudiandae nostrum exercitationem id id sapiente', 'Cupiditate reprehenderit animi ut perspiciatis. Illum ipsum quis quia ipsa aliquam iure quidem. Quae dolor nostrum officia.', NULL, '2020-12-22 19:36:19', NULL, NULL, 1938, 54, 1),
(1137, 'Quis et pariatur quod', 'Consequatur qui voluptatem et maiores rerum. Voluptatem ut aperiam alias. Sit harum est et quidem vero. Ut aut sit placeat rerum fugit deserunt cupiditate molestiae.', NULL, '2025-05-01 14:25:40', NULL, NULL, 1950, 54, 1),
(1138, 'Eos et autem repudiandae', 'Ut sed sit tempore reiciendis. Consequatur enim eos et quo aperiam. Labore voluptate eveniet qui cumque mollitia. Hic inventore voluptas quam.', NULL, '2024-02-09 11:47:33', NULL, NULL, 1954, 54, 1),
(1139, 'Sit ducimus laboriosam exercitationem', 'Et consequatur veniam rerum quo quibusdam vero consequuntur. Autem quos magni aut omnis minima numquam. Dolorem facere a voluptas hic eum debitis alias.', NULL, '2025-04-09 20:13:21', NULL, NULL, 1958, 54, 1),
(1140, 'Et pariatur vitae enim quia', 'Illo cupiditate temporibus quaerat eius. Velit ut ipsa nihil rerum et dolor eum. Quaerat adipisci ea et. Veniam ab dolor nemo fugit dolores aspernatur culpa.', NULL, '2022-07-16 09:21:00', NULL, NULL, 1962, 54, 1),
(1141, 'Dolores quis eum saepe', 'Aut cumque voluptatem asperiores sunt aut possimus quo. Eum occaecati dolores harum facere autem omnis pariatur. Ullam dignissimos atque ducimus non nihil quo nesciunt. Beatae est harum dolorem consequatur nihil.', NULL, '2022-05-24 04:04:38', NULL, NULL, 1966, 54, 1),
(1142, 'Et ut id explicabo sint', 'Voluptatem ipsum reprehenderit commodi labore itaque. Ex omnis rerum facere atque non in debitis nam. Eligendi ut delectus ex molestiae a laborum.', NULL, '2019-10-20 19:33:00', NULL, NULL, 1970, 54, 1),
(1143, 'Cupiditate molestias animi accusamus minima', 'Nisi fugiat nisi dolores ipsam. Nihil labore iste rerum sint velit. Sunt dolor ullam expedita. Quisquam aspernatur accusamus cumque est blanditiis ullam dolores.', NULL, '2019-01-18 13:18:06', NULL, NULL, 2026, 54, 1),
(1144, 'Reprehenderit magnam neque corporis laborum magnam', 'Itaque sunt nostrum expedita nemo debitis voluptatum. Qui rerum eligendi ab quis qui voluptatem consequatur. Cum ex sed libero iure ipsum non.', NULL, '2022-11-13 03:56:20', NULL, NULL, 1974, 54, 1),
(1145, 'Nostrum ut harum nostrum fugit itaque vero', 'Voluptas odit dolores molestiae harum. Dolor occaecati fuga ea omnis alias. At eum et beatae consequatur atque voluptas.', NULL, '2016-10-01 08:08:41', NULL, NULL, 1978, 54, 1),
(1146, 'Ea quas velit ut nulla', 'Sint natus voluptatem nisi. Voluptas nostrum occaecati voluptatem sit tempore. Voluptatem ratione cumque aspernatur magni magnam dolor sit.', NULL, '2020-12-30 13:37:51', NULL, NULL, 1982, 54, 1),
(1147, 'Ea eos et veniam omnis necessitatibus quod', 'Possimus cum repudiandae unde molestiae modi voluptas dignissimos odio. Enim id et maiores laboriosam modi. Autem voluptatem minima dolorem. Excepturi qui est aut voluptatem ea ipsum.', NULL, '2024-06-16 06:09:57', NULL, NULL, 1986, 54, 1),
(1148, 'Ut aliquam vel consectetur expedita nemo sed', 'Quae minus aliquam iste. Eos similique repellendus iure odit est praesentium. Optio nobis soluta cumque. Modi cumque repellendus laudantium est.', NULL, '2018-11-14 01:11:56', NULL, NULL, 1990, 54, 1),
(1149, 'Et qui ipsa in quas consectetur ipsam', 'Sunt sit facilis inventore ab vero quaerat corrupti error. Commodi molestias rem voluptatem laborum. Iure cum voluptas ab fugit ut.', NULL, '2023-12-13 22:01:37', NULL, NULL, 1994, 54, 1),
(1150, 'Officiis nulla odit exercitationem consectetur omn', 'Quo deleniti sequi debitis qui. Maiores officia cumque repudiandae est. Voluptas neque qui aliquam odit porro unde.', NULL, '2020-04-02 18:06:12', NULL, NULL, 1998, 54, 1),
(1151, 'Quisquam quo pariatur et odio', 'Voluptatem quia blanditiis non quo. Eveniet eos aut esse velit impedit. Voluptatem doloremque eaque occaecati libero qui. Quos dolorem reprehenderit autem qui qui.', NULL, '2020-09-12 16:51:09', NULL, NULL, 2002, 54, 1),
(1152, 'Qui quos expedita velit aut', 'Quo culpa non autem repellendus. Veniam architecto commodi ipsum porro sapiente odit iusto. Voluptatem possimus natus sed.', NULL, '2021-06-12 16:12:19', NULL, NULL, 2006, 54, 1),
(1153, 'Est velit est consequuntur', 'Sit ipsam et veritatis. Iusto est recusandae omnis ea. Ullam quo quo necessitatibus enim omnis omnis vel.', NULL, '2020-07-08 09:56:21', NULL, NULL, 2010, 54, 1),
(1154, 'Unde quisquam impedit officia', 'Consequuntur sit autem expedita molestiae fugit. Hic temporibus soluta rerum. Quaerat sequi ex quisquam recusandae officiis doloribus.', NULL, '2020-06-08 03:55:36', NULL, NULL, 2014, 54, 1),
(1155, 'Dolor est praesentium occaecati ut qui eos', 'Quia omnis quo eum excepturi reiciendis. Velit molestiae sint cum earum veritatis expedita. Vitae voluptatem hic mollitia est adipisci velit. Repellat et unde cum est eveniet blanditiis. Excepturi quo aut facere consequatur ea animi ut.', NULL, '2022-12-12 02:15:17', NULL, NULL, 2018, 54, 1),
(1156, 'Assumenda distinctio esse ex inventore', 'Officiis velit soluta qui cumque odio et voluptatem. Dolorum id aut nihil quibusdam unde esse. Minus id velit animi qui culpa adipisci quisquam. Beatae est ullam ducimus labore. Sed qui possimus facilis sit sunt iste.', NULL, '2016-11-09 08:29:27', NULL, NULL, 2022, 54, 1),
(1157, 'Illo enim enim in aut', 'Minima culpa totam voluptatem cupiditate at est. Possimus eum officia fugiat aut inventore et maxime. Eos nisi sed temporibus velit. Quia facilis excepturi sed assumenda.', NULL, '2018-10-03 04:59:20', NULL, NULL, 1930, 55, 1),
(1158, 'Rerum eum hic mollitia ut', 'Illo voluptas et tempore. Quod quis laudantium aut similique. Quaerat beatae iure et. Quia vero est quaerat facilis.', NULL, '2018-07-04 23:52:26', NULL, NULL, 1934, 55, 1),
(1159, 'Repudiandae sit nulla quo', 'Non numquam natus eos sed nisi et. Ut illo earum ut illo voluptatem rem tenetur explicabo.', NULL, '2016-02-03 16:26:48', NULL, NULL, 1938, 55, 1),
(1160, 'Expedita repellat ut esse odit consequatur adipisc', 'Voluptas similique facere aspernatur iste. Assumenda quia repellendus ipsum aut dolore sed et. Et voluptate odit cum ex harum.', NULL, '2023-12-20 09:03:19', NULL, NULL, 1950, 55, 1),
(1161, 'Omnis commodi rerum rerum asperiores ex modi', 'Assumenda temporibus quia deserunt exercitationem in quidem. Error quisquam quis non. Aliquid dolorem debitis eveniet magnam ab vitae voluptate. Nisi reiciendis fugiat quaerat.', NULL, '2023-02-17 18:41:33', NULL, NULL, 1954, 55, 1),
(1162, 'Dolor sunt tempore quia', 'Ipsam eaque eaque dolores eum consequuntur. Nesciunt ipsum occaecati voluptatem. Temporibus necessitatibus accusantium et.', NULL, '2021-03-06 18:35:05', NULL, NULL, 1958, 55, 1),
(1163, 'Illo iusto sapiente enim', 'Libero illum molestiae saepe esse qui. Voluptatem et animi labore earum nobis. Velit aut quo ut nihil quod beatae.', NULL, '2022-01-29 01:51:38', NULL, NULL, 1962, 55, 1),
(1164, 'Voluptatum et adipisci velit', 'Magni quas et magni ut porro reiciendis perferendis. Doloremque eligendi animi quia quidem. Et eligendi expedita ipsa id.', NULL, '2021-08-05 15:50:35', NULL, NULL, 1966, 55, 1),
(1165, 'Odio voluptatem deleniti distinctio ea', 'Et ut reiciendis voluptatem voluptatem. Consequatur nisi quidem expedita ab dolor. Ea aspernatur accusantium rerum nam porro.', NULL, '2019-05-05 20:54:29', NULL, NULL, 1970, 55, 1),
(1166, 'Et error culpa minus eum', 'Rerum culpa repudiandae exercitationem magni eveniet. In non id nesciunt eaque et. Tempore est consequatur velit dolorem pariatur fuga veritatis.', NULL, '2015-10-25 12:55:41', NULL, NULL, 2026, 55, 1),
(1167, 'Quia necessitatibus neque et', 'Ut reiciendis qui eaque sit. Harum veritatis soluta impedit repudiandae vel. Autem exercitationem consequatur voluptatem et sint repellendus eligendi. Quas ut ut sint vitae. Omnis ut dolorum consectetur sint aspernatur et.', NULL, '2019-11-12 01:21:19', NULL, NULL, 1974, 55, 1),
(1168, 'Facere itaque assumenda quis voluptatum ipsa solut', 'Et nesciunt inventore quia impedit sit. Sed sunt ipsa sit. Autem amet est quae at qui veniam ad.', NULL, '2023-08-14 17:02:50', NULL, NULL, 1978, 55, 1),
(1169, 'Dolores culpa aliquid maiores', 'Vero deleniti aut aut omnis voluptatem. Asperiores eligendi maiores aut quas voluptatibus. Facere maxime sed odit. Sunt et provident nisi velit pariatur dolores nemo.', NULL, '2015-11-28 22:19:36', NULL, NULL, 1982, 55, 1),
(1170, 'In error incidunt reprehenderit culpa', 'Soluta in itaque ex. Qui eaque minima animi a. Voluptas id vitae eos vel corporis ut.', NULL, '2016-03-11 16:51:44', NULL, NULL, 1986, 55, 1),
(1171, 'Deleniti odit impedit consequuntur', 'Eos aliquam debitis voluptatem est provident. Consequatur unde nesciunt sunt et saepe quasi repudiandae.', NULL, '2017-01-14 12:04:51', NULL, NULL, 1990, 55, 1),
(1172, 'Ea harum velit eaque', 'Ad provident odio ducimus suscipit aut. Itaque quod id dolor voluptatum consequatur. Eum assumenda ducimus et vel sunt numquam.', NULL, '2023-02-09 11:14:33', NULL, NULL, 1994, 55, 1),
(1173, 'Sint sit et debitis quam voluptates', 'Ipsa aut ut et enim iste. Qui tempora et voluptatum maxime hic. Consectetur dicta nam eligendi esse. Voluptatem omnis cumque delectus incidunt quia ut consequatur.', NULL, '2017-05-23 19:06:42', NULL, NULL, 1998, 55, 1),
(1174, 'Eum voluptates omnis ut tempore', 'Aut doloribus commodi quisquam. Qui dolorum aliquid natus illum aut expedita facilis. Qui ipsam quaerat quisquam ipsam fugit laborum a.', NULL, '2025-02-05 22:48:06', NULL, NULL, 2002, 55, 1),
(1175, 'Consequatur et quod non', 'Molestiae laboriosam qui maxime sed quis impedit voluptas id. Eos quas incidunt nihil sed sit quos. Dolore sit aliquam ipsam pariatur ipsam. Eaque ad at magni est vel. Qui vel animi et tempore non cumque dignissimos ut.', NULL, '2016-09-07 20:21:17', NULL, NULL, 2006, 55, 1),
(1176, 'Id quos veritatis vitae', 'Autem velit ab esse ipsum. Consequatur corporis ut eaque rem magnam. Voluptates facere quia aut minus et natus tempore.', NULL, '2018-09-10 09:10:44', NULL, NULL, 2010, 55, 1),
(1177, 'Vel consequatur quia consequatur eum', 'Est nihil dolor non. Rerum quia vitae aut nam. Molestiae sed nulla maiores dolorem. Fuga illo illo est rerum beatae.', NULL, '2023-03-31 11:21:35', NULL, NULL, 2014, 55, 1),
(1178, 'Sapiente sapiente et nulla quis minus', 'Doloremque ea magnam aut praesentium occaecati a in. Illum error dolore qui non aut et enim. Culpa sit est non hic. Aliquam aut debitis dolorem saepe nihil iste.', NULL, '2023-05-05 09:24:42', NULL, NULL, 2018, 55, 1),
(1179, 'Nesciunt quibusdam facilis cupiditate est', 'Voluptas rerum vero vel velit. Ducimus consectetur ut est iusto quia iure nihil. Aspernatur sit ea reprehenderit harum eos expedita corrupti eum.', NULL, '2025-02-16 19:56:29', NULL, NULL, 2022, 55, 1),
(1180, 'Et debitis maxime iusto distinctio', 'Ea non deserunt ad eos eum laudantium. Hic aut excepturi ea blanditiis unde quis. Qui sit consequatur hic nostrum. Corrupti voluptatibus expedita non eius veniam et vitae.', NULL, '2022-01-23 04:02:05', NULL, NULL, 1930, 56, 1),
(1181, 'Est non impedit rem id enim', 'Vel in unde aspernatur sed. Rerum commodi dolorem sed. Neque doloribus magnam doloremque. Aut dolorem eveniet perspiciatis laudantium. Suscipit consequatur ipsa eos asperiores sit velit nihil.', NULL, '2018-03-10 05:04:09', NULL, NULL, 1934, 56, 1),
(1182, 'Provident eum veritatis eos labore beatae', 'Mollitia consequatur sed est provident qui voluptas non. Quas veniam explicabo aspernatur minima ex. Repellat voluptatum et dolore debitis. Quis mollitia sed blanditiis occaecati quis. Mollitia et earum adipisci earum enim.', NULL, '2021-06-08 19:15:23', NULL, NULL, 1938, 56, 1),
(1183, 'A eligendi magnam velit id', 'Placeat porro eveniet beatae architecto et. Esse eveniet quas qui qui modi explicabo voluptas. Repudiandae illo consectetur unde a autem incidunt ratione. Repellat autem ab voluptates necessitatibus et.', NULL, '2025-05-25 06:42:17', NULL, NULL, 1950, 56, 1),
(1184, 'Perferendis enim vel quia neque', 'Et provident pariatur rerum voluptatem dolores earum laboriosam similique. Qui ea at eveniet autem officia. Eos quia aut eos necessitatibus necessitatibus perferendis. Mollitia in impedit omnis. Illum et sed quos iusto consequuntur ea.', NULL, '2018-11-19 01:31:01', NULL, NULL, 1954, 56, 1),
(1185, 'Sapiente voluptates qui sit quod', 'Facere dolor iste reiciendis tenetur. Adipisci dolor consequatur aut voluptatem labore autem animi. Voluptatibus vitae repudiandae reiciendis.', NULL, '2016-10-03 16:31:04', NULL, NULL, 1958, 56, 1),
(1186, 'Illum hic dicta doloribus placeat ad sunt', 'Distinctio soluta nesciunt eius fugiat pariatur. Mollitia voluptatem deleniti corporis consequatur enim. Earum nisi quia dolorum aperiam. Occaecati sint sit quia distinctio sapiente aut ipsa.', NULL, '2022-09-22 05:33:11', NULL, NULL, 1962, 56, 1),
(1187, 'Est eos est officiis', 'Nemo numquam qui sunt harum sit quidem vitae. Voluptatibus sed qui expedita delectus vel. Omnis ut et voluptatibus explicabo ipsum laborum. Velit ad quam rerum est magnam fugiat nihil.', NULL, '2019-07-19 06:31:55', NULL, NULL, 1966, 56, 1),
(1188, 'Soluta asperiores quia deleniti veritatis quam ear', 'Facilis mollitia et quam magni aut dignissimos. Nulla aliquam et sint sint impedit sed velit voluptas. Ducimus numquam veritatis veniam qui quas quo quasi. Numquam veniam sed fuga nisi.', NULL, '2019-10-25 20:48:45', NULL, NULL, 1970, 56, 1),
(1189, 'Atque ut tempora asperiores', 'Modi aut veniam omnis ullam sed vel quia quia. Doloribus rerum tempora assumenda totam mollitia. Incidunt amet molestiae rem qui rem. Aliquam reiciendis eius maiores dicta sit dolorem.', NULL, '2023-05-22 06:36:10', NULL, NULL, 2026, 56, 1),
(1190, 'Labore nihil quo sit nostrum occaecati', 'Nisi assumenda non ipsam voluptas magnam cupiditate molestias. Velit excepturi aliquid ducimus velit. Fugit iste occaecati odit illum doloribus quasi.', NULL, '2019-10-12 12:18:22', NULL, NULL, 1974, 56, 1),
(1191, 'Sequi illo vel error possimus', 'Quod necessitatibus ea rem et consequuntur modi. Error sunt labore nihil iure nulla. Ut odit quis eos itaque quo.', NULL, '2021-08-23 18:13:04', NULL, NULL, 1978, 56, 1),
(1192, 'Mollitia et asperiores itaque', 'Sunt totam et ut ullam cupiditate quisquam sit. Cum blanditiis ut consequatur nihil. Enim repellendus et cupiditate incidunt repellat aut. Quasi molestiae et est magni ipsa.', NULL, '2019-01-13 00:03:27', NULL, NULL, 1982, 56, 1),
(1193, 'Reiciendis vitae rerum aut ullam veritatis eos', 'Architecto voluptates aut odio rerum. Eaque id et aliquid commodi ut optio. Quaerat assumenda voluptates doloremque porro voluptatum recusandae odio.', NULL, '2024-05-28 17:39:46', NULL, NULL, 1986, 56, 1),
(1194, 'Cum asperiores repellat voluptate', 'Reprehenderit voluptatem voluptatum alias. Dignissimos praesentium eaque doloremque quam consequuntur id. Architecto sequi nobis deserunt eveniet.', NULL, '2017-02-21 20:28:40', NULL, NULL, 1990, 56, 1),
(1195, 'Voluptatem animi est ut reiciendis', 'Quidem aut ex est maxime velit. Et non exercitationem et consequatur laboriosam et. Ipsam quo esse modi enim aliquam blanditiis. Et optio corporis velit.', NULL, '2024-06-16 00:17:04', NULL, NULL, 1994, 56, 1),
(1196, 'Qui necessitatibus omnis qui', 'Et et esse id earum omnis. Delectus eaque cum culpa iusto officiis. Eos impedit sint reprehenderit aut. Et quo fugiat corporis ipsam eligendi praesentium vero consequatur.', NULL, '2024-06-10 19:30:05', NULL, NULL, 1998, 56, 1),
(1197, 'Aut quaerat nesciunt ex est nostrum mollitia', 'Expedita autem qui explicabo. Dolores consequatur consequatur quam similique aut corrupti. Labore et iusto minima omnis fuga iusto. Sed sed rerum ut explicabo sint. Eos consequatur atque in labore sed quae et.', NULL, '2021-09-25 21:59:26', NULL, NULL, 2002, 56, 1),
(1198, 'Dolor non ducimus non amet enim', 'Impedit iusto asperiores aperiam eaque porro. Numquam enim et dolores dolores ipsa et autem accusantium. Ut ut molestiae iure velit cum aut. Reprehenderit magni expedita iusto inventore sunt voluptatibus beatae eum.', NULL, '2022-05-21 01:52:28', NULL, NULL, 2006, 56, 1),
(1199, 'Ut assumenda fugit et occaecati consequatur dolore', 'Quis quia eum tempora vel impedit recusandae officia. Et et animi quisquam quis vero tempora. Aut dolor doloremque tempore est qui molestiae. Voluptas nostrum in in laboriosam ullam iusto voluptas est.', NULL, '2019-07-06 14:45:06', NULL, NULL, 2010, 56, 1),
(1200, 'Qui dicta omnis similique ut qui', 'Quia provident beatae sequi quo. Beatae consequatur amet aut officia tempore. Nihil fugit at dolores quam commodi eveniet enim. Enim assumenda dolor impedit.', NULL, '2024-06-04 04:31:37', NULL, NULL, 2014, 56, 1),
(1201, 'Molestias doloribus sequi est quod', 'Pariatur adipisci ut voluptatem consequatur beatae. Quibusdam vitae omnis et unde. Dolor sit beatae autem totam dolorem distinctio voluptates ipsam.', NULL, '2023-02-20 13:41:38', NULL, NULL, 2018, 56, 1),
(1202, 'Consequuntur quis aut ipsam sequi', 'Deserunt perferendis voluptatem aperiam architecto. Omnis ut perspiciatis possimus iusto corporis. Minima numquam architecto molestiae odit aut.', NULL, '2020-08-27 05:22:28', NULL, NULL, 2022, 56, 1),
(1203, 'Voluptates omnis a et nemo', 'Rem voluptatem sed error dolor dignissimos officiis. Necessitatibus vero nihil quia vitae dolores reiciendis labore. Beatae atque tenetur sit doloremque.', NULL, '2024-09-09 03:25:21', NULL, NULL, 1930, 57, 1),
(1204, 'Asperiores quo delectus aperiam est commodi aperia', 'Veritatis possimus esse quia. Vero ullam sequi quod dolorem aliquam. Quas libero aliquid qui vel ratione eum impedit.', NULL, '2020-02-15 23:44:21', NULL, NULL, 1934, 57, 1),
(1205, 'Earum dolorem temporibus est optio', 'Consequatur maiores non reprehenderit modi doloremque. Tempora quibusdam eaque debitis nulla. Quia ut porro sint. Enim aut amet blanditiis aperiam laboriosam.', NULL, '2022-08-07 13:24:45', NULL, NULL, 1938, 57, 1),
(1206, 'Suscipit est maxime incidunt recusandae quos', 'Tempora incidunt ut dolor aliquid eum soluta. Cupiditate voluptates doloremque ullam quisquam ipsum rerum aut debitis. Et commodi voluptas aut aut in quae. Culpa cupiditate fugiat ipsa id.', NULL, '2017-04-26 19:22:03', NULL, NULL, 1950, 57, 1),
(1207, 'Aperiam soluta iure et quis sit', 'Ex ratione enim vero aut vel labore sint. Qui quis iste quibusdam nulla. Qui facere reprehenderit et. Consectetur aut eaque voluptas perspiciatis corrupti iure. In quas eveniet non illum.', NULL, '2023-12-09 23:57:48', NULL, NULL, 1954, 57, 1),
(1208, 'Iure autem voluptatem voluptatem molestias delenit', 'Alias doloremque ipsam id tenetur dicta blanditiis dolores sapiente. Ipsa ut sapiente officia molestias quam. Illum itaque neque itaque id. Qui unde expedita omnis suscipit quo autem sit.', NULL, '2023-11-07 11:40:26', NULL, NULL, 1958, 57, 1),
(1209, 'Rem et tempore fuga', 'Voluptas sit labore incidunt quia sapiente libero. Expedita nisi quas quidem reprehenderit eius ipsa labore. Odio dolor culpa illo praesentium. Rerum incidunt quia magnam quisquam blanditiis.', NULL, '2020-04-12 12:51:25', NULL, NULL, 1962, 57, 1),
(1210, 'Quia molestiae qui aliquid fugit ut', 'Voluptatibus molestiae ipsum quo dolor impedit voluptatem. Et illum doloribus ea quisquam. Error ratione velit aut non et repudiandae. Eum repellendus est excepturi occaecati praesentium nisi. Mollitia sunt sunt quo culpa veritatis eos.', NULL, '2020-07-29 01:14:25', NULL, NULL, 1966, 57, 1),
(1211, 'Nemo quaerat error aliquam odit quidem', 'Autem inventore quis ipsam nam a. Eum est omnis libero rerum quasi odio. Earum non totam sed ut libero et. Ut quam animi similique porro dicta sint.', NULL, '2025-03-29 05:22:29', NULL, NULL, 1970, 57, 1),
(1212, 'Suscipit quia veritatis consectetur at enim', 'Et necessitatibus sint vitae aut reiciendis nesciunt. Voluptas aut nihil a nulla quibusdam id aut. Velit earum nobis eum. Consequatur dolor ut nam magni.', NULL, '2025-04-14 14:06:05', NULL, NULL, 2026, 57, 1),
(1213, 'Non non asperiores sunt', 'Quaerat nisi et libero ipsa tempora dolorem. Ut dignissimos ea doloribus porro impedit distinctio. Aut voluptatem voluptas minus et error et.', NULL, '2019-10-18 18:45:15', NULL, NULL, 1974, 57, 1),
(1214, 'Necessitatibus sequi dolor voluptatum perferendis ', 'Dolores similique minus explicabo porro. Cumque ex non sunt odio vel praesentium. Consequuntur numquam omnis illum quis.', NULL, '2019-12-09 17:10:30', NULL, NULL, 1978, 57, 1),
(1215, 'Fugiat dolorem iste molestiae quia a sunt', 'Dolor ea culpa velit quo architecto ratione accusamus. Dolorem dolores distinctio consectetur corrupti velit. Illum repellat quo neque dolore id mollitia fuga.', NULL, '2023-04-11 18:55:16', NULL, NULL, 1982, 57, 1),
(1216, 'Facilis autem sint et', 'Numquam qui ut quaerat accusantium dolorem rem nulla. Eos eos voluptatum ipsa voluptatem. Error ad vero ut iure id deserunt voluptas velit.', NULL, '2016-01-27 14:40:06', NULL, NULL, 1986, 57, 1),
(1217, 'Ipsam exercitationem laudantium suscipit odio erro', 'Quas qui amet consectetur velit recusandae voluptatem non quaerat. Error consequuntur assumenda officia illum. Dolore iusto eius dolorum veniam ullam facilis non. Qui voluptas recusandae sit sit fugiat et id pariatur.', NULL, '2017-03-31 23:18:51', NULL, NULL, 1990, 57, 1),
(1218, 'Quae consectetur qui porro voluptates dolores', 'Tempore eius minus laboriosam molestias. Quasi quasi natus dolorem nemo provident atque tempora. Et doloribus possimus pariatur doloremque.', NULL, '2025-06-17 23:21:21', NULL, NULL, 1994, 57, 1),
(1219, 'Aliquam eum nemo velit aliquid', 'Nisi beatae cum accusantium iusto. Laboriosam id modi nobis officiis laudantium saepe sit. Magnam esse commodi sunt quisquam dolorem nemo. Neque repudiandae non vero autem accusantium ea alias hic.', NULL, '2018-10-29 23:30:41', NULL, NULL, 1998, 57, 1),
(1220, 'Libero in vitae repellat', 'Similique aut labore aut. Qui voluptas laboriosam et dolor ducimus consequatur et. Atque odio libero incidunt.', NULL, '2022-05-22 01:51:17', NULL, NULL, 2002, 57, 1),
(1221, 'Ducimus tenetur reiciendis excepturi', 'Cum consequuntur aut debitis accusamus perferendis et atque. Consequuntur expedita possimus rerum assumenda. Aut ipsam voluptas et sint est et eos minima.', NULL, '2019-05-16 06:28:34', NULL, NULL, 2006, 57, 1),
(1222, 'Nobis et tenetur ut velit quibusdam', 'Consequuntur occaecati qui ut repellat non maiores veniam qui. Expedita itaque nostrum voluptatem quam eligendi quia. Quibusdam illo deleniti ipsum et sapiente tenetur.', NULL, '2023-10-17 04:40:29', NULL, NULL, 2010, 57, 1),
(1223, 'Quia distinctio rerum voluptatem consequatur asper', 'Assumenda ea illo harum aut porro dolorum dicta. Aut expedita dolorem iure ad.', NULL, '2016-05-19 00:22:26', NULL, NULL, 2014, 57, 1),
(1224, 'Temporibus sint ipsam consectetur excepturi', 'Similique tenetur ut esse et dolorum molestiae delectus. Similique quae nemo molestiae et. Harum quos sit ea eaque impedit rerum dolor.', NULL, '2022-01-26 20:15:21', NULL, NULL, 2018, 57, 1),
(1225, 'Dolor placeat at inventore quia', 'Odio consequatur tempora ullam. Quo asperiores sed beatae ea vel. Ullam aut corrupti ad. Neque et suscipit rerum voluptatem.', NULL, '2020-04-28 06:07:43', NULL, NULL, 2022, 57, 1),
(1226, 'Delectus nihil sint veniam', 'Praesentium quo similique rerum quam. Et laudantium et voluptas perspiciatis autem.', NULL, '2019-05-03 15:45:29', NULL, NULL, 1930, 58, 1),
(1227, 'Sint omnis ea expedita est blanditiis', 'Inventore aut tenetur sequi quasi sed nesciunt. Et voluptatibus est non error at. Sint in ut ea qui nulla consequuntur explicabo error. Sed ducimus inventore sit.', NULL, '2016-09-07 00:33:05', NULL, NULL, 1934, 58, 1),
(1228, 'Ipsa aliquam quae est', 'Voluptatibus et nihil animi eum reiciendis qui eius. Neque et officiis et iusto eum. Possimus et qui corporis sunt eum minima labore mollitia. Aperiam sapiente autem minus ratione.', NULL, '2017-04-29 04:25:38', NULL, NULL, 1938, 58, 1),
(1229, 'Et voluptates illum quia quaerat', 'Itaque et atque occaecati possimus et assumenda quae. Atque minima in provident labore voluptate accusamus dignissimos. Cupiditate unde dolorum fugiat quia.', NULL, '2017-09-08 12:16:36', NULL, NULL, 1950, 58, 1),
(1230, 'Ducimus quam alias quo magni quidem', 'Voluptatem voluptates deserunt sint est dolorem eum facilis. Nihil voluptatem ipsam vero qui. Minus dicta explicabo recusandae deleniti. Odio ipsam asperiores quam. Ipsa alias voluptatem sint repellendus.', NULL, '2016-09-24 07:21:16', NULL, NULL, 1954, 58, 1),
(1231, 'Laudantium quas et non et ipsum dolore', 'Autem deserunt sint asperiores quasi voluptatem et. Illum delectus eos architecto illo. Asperiores libero esse rerum eum incidunt similique dolores.', NULL, '2018-08-30 05:35:40', NULL, NULL, 1958, 58, 1),
(1232, 'Ut eaque nostrum debitis facere temporibus', 'Enim dolores veritatis dolorem aut nihil voluptas eos. Amet magnam et delectus animi esse animi consectetur qui. Et eum quia libero corrupti repellat dolores magni temporibus. Eum harum voluptas amet id corporis.', NULL, '2023-07-03 00:55:44', NULL, NULL, 1962, 58, 1),
(1233, 'Molestiae velit ipsum ea aliquam eum est', 'Neque quia eum non minus. Omnis ratione consectetur voluptas voluptatum. Voluptatibus ipsam odit molestiae sit.', NULL, '2023-05-19 04:32:08', NULL, NULL, 1966, 58, 1),
(1234, 'Nesciunt neque eaque et', 'Accusamus debitis sequi tenetur omnis et enim dolorem. Dignissimos rerum explicabo blanditiis quasi ut dolorem saepe. Quod dolores id quia incidunt incidunt recusandae animi.', NULL, '2021-10-14 21:40:56', NULL, NULL, 1970, 58, 1),
(1235, 'Corporis in minima et nisi fugiat', 'Dolor pariatur et maxime non et consectetur ratione. Cupiditate voluptatem omnis non. Repellendus et consequuntur aut magnam repellat. Sit asperiores incidunt quo asperiores est hic.', NULL, '2025-09-22 12:56:50', NULL, NULL, 2026, 58, 1),
(1236, 'Ut aut dolorem odio veritatis eveniet est', 'Aut repellendus architecto molestiae est enim. Sunt nemo ut aut voluptate. Sit facere eum quidem porro a. Aut molestias amet ut temporibus quo consequatur. Et beatae incidunt necessitatibus soluta.', NULL, '2020-07-15 18:34:17', NULL, NULL, 1974, 58, 1),
(1237, 'Harum iste illum dolores consequatur dicta', 'Magnam ea molestias pariatur minus et dolorum aut et. Totam suscipit quaerat cumque sed non dolor. Atque aliquid sed dicta porro dolores quas aut libero. Culpa qui molestiae iure quod dolores est fuga. Commodi rerum omnis nam neque.', NULL, '2019-05-24 03:07:22', NULL, NULL, 1978, 58, 1),
(1238, 'Quas dolore voluptatibus sed placeat', 'Possimus eum asperiores officiis recusandae dolor eum cumque. Deleniti necessitatibus inventore est necessitatibus quia. Eaque itaque tempora alias quasi.', NULL, '2020-03-29 15:33:29', NULL, NULL, 1982, 58, 1),
(1239, 'Beatae architecto optio accusantium', 'Aut sit ducimus quidem ut. Molestiae similique a natus sint. Blanditiis est officiis doloribus dolorum. Impedit pariatur quibusdam consequatur est facere.', NULL, '2021-07-14 02:22:50', NULL, NULL, 1986, 58, 1),
(1240, 'Aut eveniet vel natus aut', 'Amet libero molestiae nisi eveniet quis consequatur quia. Ipsa voluptas dignissimos libero iusto voluptatem eum. Facere consequatur dolorem id alias. Sit sint aliquid et in. Id voluptatem qui laboriosam.', NULL, '2015-11-16 11:00:59', NULL, NULL, 1990, 58, 1),
(1241, 'Iure eaque facilis pariatur rem', 'Aliquid saepe voluptas occaecati consequatur. Est doloribus possimus molestiae et.', NULL, '2020-10-07 22:08:56', NULL, NULL, 1994, 58, 1),
(1242, 'Modi ullam eius molestiae sint aut rerum', 'Esse non in aut quibusdam. Omnis quia et optio in culpa. Tempora a voluptatibus molestiae maiores nisi sint labore ab. Nemo consectetur nobis atque quod.', NULL, '2023-03-03 22:54:31', NULL, NULL, 1998, 58, 1),
(1243, 'Illo ullam maiores vero vel ullam', 'Debitis laboriosam consequuntur autem aliquam ut nam esse non. Doloribus ex enim exercitationem et ipsa repellendus. Perferendis officiis aliquam nemo doloremque ea et aut. Repellat in voluptatem illo ut quidem qui reiciendis.', NULL, '2020-05-15 18:37:23', NULL, NULL, 2002, 58, 1),
(1244, 'Alias officia deserunt voluptatem', 'Nesciunt quod aperiam et quis possimus dolor et. Recusandae hic nesciunt alias dolor. Reiciendis et error eum neque. Neque nesciunt quia dolorum et ipsum.', NULL, '2019-06-08 06:48:28', NULL, NULL, 2006, 58, 1),
(1245, 'Optio eius illo voluptas', 'Aut eaque quasi maxime quia facilis. Voluptas magni explicabo facere natus cupiditate qui natus. Voluptate et minima aspernatur qui et ut. Nisi est laborum molestias omnis iure iste.', NULL, '2023-06-22 00:06:26', NULL, NULL, 2010, 58, 1),
(1246, 'Sit earum unde qui ipsa quae quis', 'Et quis repellat atque. Et fugit vitae sapiente voluptatem magnam. Hic illo nihil totam ipsum sint. Natus iste consectetur eum expedita. Autem rerum quia deleniti est eaque illo.', NULL, '2020-09-03 22:21:56', NULL, NULL, 2014, 58, 1),
(1247, 'Et corrupti eos quia sit', 'Tempora earum omnis dicta omnis. Quae sequi cupiditate nostrum voluptatem rem ad. Ut nostrum dolorem amet porro nostrum.', NULL, '2022-10-13 21:08:23', NULL, NULL, 2018, 58, 1),
(1248, 'Est quisquam aut aperiam', 'Ab libero dolorum aut esse sit. In est aspernatur incidunt voluptas quia nemo optio. Ut pariatur rerum consectetur non.', NULL, '2025-01-15 22:53:03', NULL, NULL, 2022, 58, 1),
(1249, 'Nulla ad et ratione', 'Sint autem maxime magni dolor eius consequatur. Voluptatem officiis ut asperiores. Non porro minima ipsam ipsum et non. Quia aliquam eum quis expedita.', NULL, '2022-02-02 05:08:07', NULL, NULL, 1930, 59, 1),
(1250, 'Tempora numquam voluptas fugiat', 'Et quos accusantium voluptatem totam quia qui. Consequuntur fugit similique et et esse officia asperiores. Porro exercitationem rerum laborum iure. Ea nam enim ut sunt eveniet.', NULL, '2016-02-10 19:46:43', NULL, NULL, 1934, 59, 1),
(1251, 'Nulla et officiis sunt similique dolore modi', 'Harum perspiciatis totam nesciunt expedita quibusdam perspiciatis deserunt. Aut omnis aut ut est. Alias sed aut hic. Optio neque qui eius tempora.', NULL, '2016-12-02 19:43:45', NULL, NULL, 1938, 59, 1),
(1252, 'Consequatur dolorem fugit ullam corporis qui', 'Quia aut nihil aut repudiandae cumque fuga. Autem quis dicta eum dolores omnis voluptas. Aut nihil facere ut tempore omnis dolorum suscipit.', NULL, '2022-04-06 01:49:01', NULL, NULL, 1950, 59, 1),
(1253, 'Voluptas sequi doloribus non', 'Accusantium voluptatem ex dolore sunt molestiae quia quo. Quo vel dolorem aut recusandae aut sunt delectus. Est odio reprehenderit dolorem est. Facilis consequatur vitae laborum alias sint quidem.', NULL, '2017-08-27 01:35:02', NULL, NULL, 1954, 59, 1),
(1254, 'Rerum delectus et amet assumenda', 'Id omnis explicabo qui sit dolore. Qui dolorem at saepe modi sint aut est. Qui totam consequuntur alias provident cum.', NULL, '2019-01-24 23:41:40', NULL, NULL, 1958, 59, 1),
(1255, 'Nobis aut distinctio ut magni', 'Molestiae velit ex quo commodi recusandae quia. Tempora modi quidem quia recusandae. Reprehenderit voluptas expedita maiores libero earum pariatur nam nobis. Dicta quo et minima voluptatibus. Neque quia non fugiat nisi.', NULL, '2022-07-19 12:50:14', NULL, NULL, 1962, 59, 1),
(1256, 'Architecto exercitationem eum quas ratione', 'Quaerat rerum aperiam rerum quia. Earum non explicabo beatae deserunt. Deserunt cum dolor est soluta dolor atque.', NULL, '2020-07-25 06:54:38', NULL, NULL, 1966, 59, 1),
(1257, 'Assumenda quia laboriosam quia molestias mollitia', 'Aut ullam accusantium vitae porro. Vel omnis est et beatae et aut. Dolor temporibus dolores placeat.', NULL, '2020-04-17 09:15:09', NULL, NULL, 1970, 59, 1),
(1258, 'Debitis ratione dignissimos est maxime est eum', 'Aperiam quia est laudantium tempore dignissimos molestiae aut. Similique deserunt voluptas dolore et qui. Enim voluptatem rerum iusto perspiciatis ut. Iure iure explicabo ad.', NULL, '2016-09-12 10:32:34', NULL, NULL, 2026, 59, 1),
(1259, 'Perspiciatis doloremque est non velit mollitia', 'Ipsa autem autem est. Incidunt quo laudantium consequatur ex quas perspiciatis vero. Magnam quae voluptatum explicabo temporibus et qui expedita. Dolores vel dolorem reiciendis sit in iste sapiente.', NULL, '2017-02-03 07:03:07', NULL, NULL, 1974, 59, 1),
(1260, 'Aut dolor aliquid qui laboriosam nulla', 'Nihil libero laborum ab deleniti quibusdam asperiores. Necessitatibus officia ut consectetur quaerat consequatur inventore. Saepe illum nobis nisi sunt excepturi nihil.', NULL, '2023-01-20 12:44:14', NULL, NULL, 1978, 59, 1),
(1261, 'Molestias est ea quia quam sed hic', 'Eos ut illum dolor quibusdam distinctio. Quia vero dolorum ut amet voluptas. Magnam quibusdam commodi consequuntur libero qui.', NULL, '2021-07-01 03:26:27', NULL, NULL, 1982, 59, 1),
(1262, 'Fuga veritatis ab tempora voluptatem', 'Eum accusamus earum perferendis quaerat iusto. Consequatur rerum provident ullam quisquam blanditiis et nulla. Libero saepe vel dignissimos in vero nihil.', NULL, '2024-06-24 19:19:51', NULL, NULL, 1986, 59, 1),
(1263, 'Aut excepturi occaecati sunt eius quo', 'Dolor facere sed qui non est. Ex officiis molestias molestiae magnam eaque. Aut eum rem aut dolorem. Maiores quia fugit molestias libero.', NULL, '2021-05-21 09:23:15', NULL, NULL, 1990, 59, 1),
(1264, 'Voluptatem totam itaque consequatur', 'Sit commodi impedit exercitationem eum accusamus. Modi atque aut repudiandae esse ut debitis rerum et. Eaque pariatur ratione quas fugiat aut. Id rerum labore omnis inventore eaque.', NULL, '2023-11-09 16:12:01', NULL, NULL, 1994, 59, 1),
(1265, 'Aliquam sit aut omnis est nihil ratione', 'In deleniti voluptatem magni pariatur ullam. Enim exercitationem fuga qui. Dolores et voluptate laborum aliquid.', NULL, '2025-07-21 06:01:22', NULL, NULL, 1998, 59, 1),
(1266, 'Rerum unde cum deleniti aut nobis', 'Eius rerum mollitia voluptas ratione nihil est sed. Ad quia pariatur et officiis. Vel neque alias laudantium nemo. Eum et dolorem voluptatem facere non dolorum aliquid quibusdam.', NULL, '2024-05-19 01:37:19', NULL, NULL, 2002, 59, 1),
(1267, 'Repellat necessitatibus ut quia quasi sit', 'Animi sit similique et cumque. Aut architecto tempora cumque dolore tempore unde. Ut ipsam animi ut quia. Velit quia ut recusandae qui dolorem sed.', NULL, '2016-01-07 10:43:21', NULL, NULL, 2006, 59, 1),
(1268, 'Neque animi laboriosam nam dicta assumenda', 'Quis quam placeat fugit cum assumenda. Sunt consequatur quod quia nisi. Expedita odit ut aut cum ut. Dolorem repudiandae est laudantium minima et voluptatem.', NULL, '2023-05-12 06:14:59', NULL, NULL, 2010, 59, 1),
(1269, 'Est eligendi et velit', 'Id rem quos quos harum atque. Et dolores sint nisi cupiditate voluptatem non sunt labore.', NULL, '2020-09-27 22:24:50', NULL, NULL, 2014, 59, 1),
(1270, 'Molestiae sed asperiores enim quibusdam ad', 'Molestias saepe qui id est aut veritatis. Doloribus facilis debitis cumque perferendis. Et est praesentium temporibus voluptatibus animi. Et velit sit sapiente dolorem est.', NULL, '2017-04-15 03:28:49', NULL, NULL, 2018, 59, 1),
(1271, 'Omnis eligendi voluptatum non doloremque', 'Fugit reprehenderit quo totam et autem similique optio qui. Eos neque facilis enim ducimus eum autem omnis soluta. Nam hic consequatur dolorem. Tempore veniam et accusamus totam laboriosam quod velit.', NULL, '2018-02-01 04:24:10', NULL, NULL, 2022, 59, 1),
(1272, 'Culpa quasi nulla vero', 'Beatae rem atque consequatur repellendus earum dolorem aliquid. Doloribus praesentium ratione dicta. Necessitatibus officiis impedit beatae nihil nemo nisi.', NULL, '2021-04-20 12:05:49', NULL, NULL, 1930, 60, 1),
(1273, 'Dolor qui sint est', 'Molestiae voluptate debitis distinctio rem dolorem occaecati repellat. Tenetur modi alias voluptas voluptas. Sit vel voluptates praesentium reprehenderit error doloribus dicta.', NULL, '2018-03-15 02:04:52', NULL, NULL, 1934, 60, 1),
(1274, 'In nisi eum et ut delectus natus', 'Nobis et aliquam eaque nemo quia saepe natus. Qui iste quia sed. Aspernatur voluptatem in aspernatur ipsa similique aut libero.', NULL, '2024-07-02 04:28:14', NULL, NULL, 1938, 60, 1),
(1275, 'Sint maxime sit tenetur quibusdam', 'Aspernatur aperiam nulla quia harum veritatis eligendi. Magni sit ut in. Repellendus rem voluptas assumenda exercitationem facilis nisi modi.', NULL, '2016-11-19 15:50:05', NULL, NULL, 1950, 60, 1),
(1276, 'Dolore est tempore laborum', 'Et id nam totam facilis illum quam accusantium. Quis modi qui veniam ex error ea doloremque. Libero molestiae voluptatem quisquam vitae iste corporis. Dolores sed quia ullam eius.', NULL, '2023-08-07 02:42:33', NULL, NULL, 1954, 60, 1),
(1277, 'Minima qui vero asperiores laudantium', 'Provident facilis rerum ipsum occaecati. In minima rerum inventore qui recusandae culpa. Voluptas adipisci ut aut natus. Asperiores quis tempora architecto animi nobis impedit.', NULL, '2018-06-27 11:32:24', NULL, NULL, 1958, 60, 1),
(1278, 'Et nemo et quis', 'Ut consequatur et illo perspiciatis ratione sed. Corrupti a unde laboriosam voluptatibus eos voluptatem quia. Aliquid atque inventore consectetur excepturi non odio voluptates.', NULL, '2018-08-12 03:25:12', NULL, NULL, 1962, 60, 1),
(1279, 'Voluptas culpa sunt repudiandae', 'Aliquam et tenetur est autem explicabo. Consequatur dolores beatae soluta fuga atque. Vel ipsum nostrum odit ut aut delectus qui.', NULL, '2017-03-08 12:35:42', NULL, NULL, 1966, 60, 1),
(1280, 'Nobis est reiciendis iure', 'Facilis quo est ipsam aperiam. Rem qui aspernatur doloribus numquam aperiam asperiores. Aut amet eum qui rem natus.', NULL, '2020-05-13 05:54:32', NULL, NULL, 1970, 60, 1),
(1281, 'Ut unde et architecto rerum quia ratione', 'Magni eaque illo error architecto. Voluptas fuga ut sapiente mollitia aut ea dolor vitae. Id sint quod dolores aut ut quasi ducimus dolores. Fuga eligendi perspiciatis debitis.', NULL, '2016-04-07 14:50:55', NULL, NULL, 2026, 60, 1),
(1282, 'Eos inventore iure velit et eos blanditiis', 'Et eum nihil est possimus reprehenderit beatae et. Consequatur autem corrupti quis eum cum veritatis. Pariatur consequuntur dolor eaque.', NULL, '2024-04-16 13:09:09', NULL, NULL, 1974, 60, 1),
(1283, 'Dolores tenetur quaerat et rem repellendus', 'Iusto quia nisi quae repudiandae asperiores voluptas magnam impedit. Velit ut architecto exercitationem minima. Eum omnis illo eum aliquam omnis rerum natus.', NULL, '2024-12-03 13:14:29', NULL, NULL, 1978, 60, 1),
(1284, 'Consequatur qui ipsa itaque', 'Qui ut dolorem corrupti cumque ad. In itaque et architecto voluptates et rerum sint. Ut impedit sed molestias qui et minus. Perspiciatis similique qui ullam hic perspiciatis odio.', NULL, '2025-03-10 21:14:22', NULL, NULL, 1982, 60, 1),
(1285, 'Aut optio et sed doloribus molestiae et', 'Rerum ut aut inventore voluptatibus est itaque. Unde ducimus culpa facilis doloribus rerum. Unde sit occaecati quae corrupti soluta. Omnis dolores voluptatibus consequuntur ut et.', NULL, '2022-01-14 17:51:45', NULL, NULL, 1986, 60, 1),
(1286, 'Eum et dolor laudantium dolore', 'Dicta sed neque aut repellat nam minima dolores. Recusandae modi qui quisquam sint eligendi animi quisquam. Aliquid consequatur est veniam distinctio ipsam voluptatibus. Labore facere exercitationem consequatur laudantium sit eum.', NULL, '2016-01-25 06:30:05', NULL, NULL, 1990, 60, 1),
(1287, 'Corporis quaerat vel sit laboriosam nostrum laudan', 'Mollitia enim consequatur vitae autem optio consequuntur. Quam labore eos fugit quia vel. Ipsum illo occaecati molestiae maiores possimus et.', NULL, '2024-12-18 13:55:17', NULL, NULL, 1994, 60, 1),
(1288, 'Molestiae non excepturi in voluptatum', 'Ullam officiis debitis qui nam eum facilis. Sit cumque harum fugit ducimus. Recusandae ut veritatis corrupti dolore molestias.', NULL, '2017-05-30 18:42:11', NULL, NULL, 1998, 60, 1),
(1289, 'Laudantium quis voluptatum aut laborum illum cupid', 'Natus aut deserunt consequatur quo eum. Quo est nisi suscipit et amet voluptate. Enim dolorum sint accusantium nisi aliquid dignissimos voluptate.', NULL, '2025-04-23 22:22:50', NULL, NULL, 2002, 60, 1),
(1290, 'Consequatur quasi dignissimos nemo quo', 'Exercitationem aut ipsum dolores explicabo. Officia et sint iste.', NULL, '2021-01-12 21:54:33', NULL, NULL, 2006, 60, 1),
(1291, 'Voluptas recusandae nulla tempora', 'Praesentium non culpa est ipsum sint qui. Sed rerum perferendis quaerat magni. Est totam magnam ratione temporibus.', NULL, '2025-06-17 22:43:48', NULL, NULL, 2010, 60, 1),
(1292, 'Illum voluptatum aut voluptas consectetur', 'Omnis voluptas inventore officia corrupti impedit quisquam. Aut laudantium et sed provident eum aut. Reprehenderit dolorum fugit non ullam odio. Consequatur quam dolorem a excepturi voluptas.', NULL, '2021-03-03 03:17:18', NULL, NULL, 2014, 60, 1),
(1293, 'Non quisquam velit temporibus', 'Dicta praesentium quas incidunt consequatur voluptas ab omnis. Impedit sequi laudantium qui ratione et. Eum alias aspernatur reprehenderit aut id impedit. Deserunt similique expedita earum qui.', NULL, '2024-04-20 16:13:51', NULL, NULL, 2018, 60, 1),
(1294, 'Dolorem in architecto omnis', 'Est quo numquam nihil autem omnis. Veritatis nihil mollitia laborum maxime magnam. Quia minus quibusdam iusto ex. Et consequuntur sunt vel maiores eos.', NULL, '2017-07-02 19:20:26', NULL, NULL, 2022, 60, 1),
(1295, 'Ad et consequatur officia', 'Sed veritatis magni voluptas cum et omnis tempora. Sint rerum qui officia nihil est.', NULL, '2025-09-22 13:28:34', NULL, NULL, 1930, 61, 1),
(1296, 'Rerum nostrum quia cum amet', 'Enim unde numquam quidem sed quae sunt ipsa. Cumque nihil dolorem cumque. Nostrum corrupti aliquam nihil sint. Iste veritatis nemo ea similique eos quis.', NULL, '2017-05-24 17:55:28', NULL, NULL, 1934, 61, 1),
(1297, 'Recusandae rerum aliquid aut qui', 'Aliquid praesentium natus aut cupiditate et dolor repudiandae. Sint porro id totam rerum omnis quae voluptatem. At voluptas perferendis optio error est. Et quia dolores ipsam at.', NULL, '2016-08-08 23:36:45', NULL, NULL, 1938, 61, 1),
(1298, 'Soluta voluptatibus eum sit eum', 'Perferendis aut esse autem odit ut veritatis voluptas. Ut aliquam explicabo inventore nobis ut. Omnis consectetur sint quas eius et enim. Ut qui illum nisi vel repudiandae quia.', NULL, '2020-12-08 01:32:00', NULL, NULL, 1950, 61, 1),
(1299, 'Et autem eos id vitae amet', 'Voluptate eius quo eveniet quam. Atque et exercitationem ut minus impedit facilis et ullam. Autem quo esse odio quo et quia non harum.', NULL, '2022-06-11 15:27:33', NULL, NULL, 1954, 61, 1),
(1300, 'Nemo molestiae perferendis sit', 'Sint dolorem nemo nihil quisquam officiis. Excepturi saepe iste omnis dignissimos earum aliquid architecto sunt. Fugit facilis est repellendus quas enim.', NULL, '2025-04-27 15:35:19', NULL, NULL, 1958, 61, 1),
(1301, 'Neque saepe consequatur quo est delectus', 'Iure molestiae voluptatem autem quod. Culpa velit recusandae sed voluptatem tempore consequuntur quidem. Voluptas at iusto deserunt optio iure. Occaecati pariatur totam ut.', NULL, '2023-12-12 00:44:34', NULL, NULL, 1962, 61, 1),
(1302, 'In et consequatur nam rerum dolorum', 'Fuga itaque molestiae at vel nihil similique iste pariatur. Voluptatum velit labore eius qui quia laboriosam hic. Corrupti corporis voluptate neque sapiente dicta non in. Nihil qui reiciendis repellendus et eligendi occaecati commodi.', NULL, '2024-03-26 19:44:27', NULL, NULL, 1966, 61, 1),
(1303, 'Voluptas ex cum esse voluptatibus provident repell', 'Ex non velit et voluptatem ad alias. Illo similique incidunt atque ullam accusamus exercitationem ut. Voluptatibus ipsa et et iure et omnis voluptas.', NULL, '2022-05-26 08:56:01', NULL, NULL, 1970, 61, 1),
(1304, 'Alias commodi veniam aut numquam aut', 'Est placeat quo voluptas perferendis et laborum. Ad neque aspernatur ullam minima sunt.', NULL, '2019-09-17 02:55:50', NULL, NULL, 2026, 61, 1),
(1305, 'Enim ut deserunt libero quas aut', 'Est ea illum fuga harum aperiam. Ipsum libero dicta debitis dolor delectus. Impedit nesciunt ea doloribus non minima.', NULL, '2021-10-04 04:28:25', NULL, NULL, 1974, 61, 1),
(1306, 'Voluptate maxime rerum rerum delectus eum sunt', 'Et repudiandae corporis cum expedita. Dolorem sint aut atque quaerat fugiat. Exercitationem iste eaque error sunt corporis.', NULL, '2023-10-23 13:14:26', NULL, NULL, 1978, 61, 1),
(1307, 'Est tempore quo velit', 'Nobis modi tempore aut non pariatur deleniti consequatur dolor. Rerum tempore et quibusdam eos maiores delectus veniam. Impedit et maiores consequatur omnis consectetur. Eveniet praesentium facere ut aliquam aut beatae praesentium.', NULL, '2023-11-29 13:17:24', NULL, NULL, 1982, 61, 1),
(1308, 'Dolore dolore non fuga natus dolor dolorem', 'Enim aut voluptatem ducimus dolorem commodi commodi ut. Accusantium est voluptatem rem aut harum. Natus quasi deleniti dolor laboriosam.', NULL, '2019-10-03 03:13:32', NULL, NULL, 1986, 61, 1),
(1309, 'Voluptatem corrupti consectetur quidem quia sunt', 'Et assumenda eius repellat sed aperiam. Quis et rem consequatur ut. Numquam qui reiciendis ea aut praesentium.', NULL, '2025-05-29 05:03:04', NULL, NULL, 1990, 61, 1),
(1310, 'Deleniti quia sed reprehenderit itaque', 'Rerum velit harum perferendis id. Sunt aut et sed sapiente.', NULL, '2016-11-10 09:40:21', NULL, NULL, 1994, 61, 1),
(1311, 'Dignissimos quisquam et qui voluptatibus ut', 'Nam mollitia saepe vel quia deleniti et. Pariatur asperiores mollitia quod. Distinctio eum voluptas nesciunt dolor perferendis dignissimos repudiandae aspernatur.', NULL, '2016-07-15 19:09:39', NULL, NULL, 1998, 61, 1);
INSERT INTO `posts` (`ID_Post_PK`, `Content_Title`, `Content_Body`, `Content_Multimedia`, `Upload_Date`, `Modified_Date`, `Deleted_Date`, `ID_WorldCup_Year_FK`, `ID_User_FK`, `Visibility_State`) VALUES
(1312, 'Ex vel maiores consequatur molestiae', 'Autem voluptatem ut dolores. Aut autem consectetur quia autem eos suscipit numquam. A beatae et enim voluptatibus eveniet vitae. Sequi consequatur corporis labore voluptas.', NULL, '2024-08-10 15:03:39', NULL, NULL, 2002, 61, 1),
(1313, 'Repudiandae ullam perspiciatis accusantium', 'Saepe ad aspernatur nam ut. Sunt qui mollitia ab quia quidem sint. Et non cupiditate quidem ipsam cumque voluptatibus dolorum.', NULL, '2024-03-08 14:06:44', NULL, NULL, 2006, 61, 1),
(1314, 'Fuga minus tenetur eligendi consectetur voluptas', 'Aut nihil exercitationem ducimus debitis temporibus iste eius. Et nulla iusto debitis facilis officiis architecto. Facere aliquid quaerat qui. Tenetur eum inventore voluptatibus qui animi ipsam.', NULL, '2016-11-01 19:36:04', NULL, NULL, 2010, 61, 1),
(1315, 'Eos delectus deserunt porro officia', 'Numquam consequatur alias labore eos. Nulla consequatur ut enim id qui id voluptas. Non nobis minus in ab necessitatibus a. Inventore qui quis qui reiciendis rerum quae dignissimos.', NULL, '2020-07-20 18:21:23', NULL, NULL, 2014, 61, 1),
(1316, 'Officia sit quia sit qui', 'Totam quia quos hic voluptatem eligendi ut sunt. Repudiandae in ut nihil omnis voluptate quae. Totam nam eligendi modi qui. Eum sit consequatur molestiae dolores harum.', NULL, '2024-01-13 17:56:41', NULL, NULL, 2018, 61, 1),
(1317, 'Occaecati laboriosam sunt omnis', 'Fuga dolores dolores eveniet dolor rerum aut. Repellendus libero expedita aut ratione quia rerum at eius. Et laboriosam assumenda est sint aperiam consequatur soluta.', NULL, '2025-05-06 08:57:07', NULL, NULL, 2022, 61, 1),
(1318, 'Quo omnis accusantium ipsam non', 'Quibusdam a exercitationem aut illum deleniti. Numquam impedit error est excepturi et repudiandae. Sed et corrupti exercitationem sed aspernatur quia sed saepe. Suscipit cupiditate voluptate iure nam laudantium.', NULL, '2016-05-04 00:24:22', NULL, NULL, 1930, 62, 1),
(1319, 'Rerum porro nobis consequatur voluptatem cupiditat', 'Tempora iste consequatur eaque aut sequi eveniet alias. Ratione inventore quo sunt a explicabo. Maiores ipsum modi eveniet illum eius et fugit.', NULL, '2025-03-31 14:26:39', NULL, NULL, 1934, 62, 1),
(1320, 'Amet eligendi nulla repellat eligendi molestias en', 'Suscipit ratione illum tempore ut debitis cumque. Quibusdam earum sunt minus placeat voluptas quis. Cupiditate ut amet quaerat veritatis molestias et et. Excepturi sit quia rerum nobis omnis aut.', NULL, '2016-04-02 15:42:09', NULL, NULL, 1938, 62, 1),
(1321, 'Possimus voluptatem est quod', 'Eius voluptate accusamus nostrum excepturi. Minima unde itaque rerum. Aut maiores tempora expedita eaque repellendus.', NULL, '2020-09-16 04:58:27', NULL, NULL, 1950, 62, 1),
(1322, 'Quam necessitatibus quis et aut', 'Neque ipsa minima adipisci nam. Voluptate minima mollitia est corrupti quasi animi molestias. Est molestiae odit alias cum repellendus qui. Ea iure eaque veritatis voluptates reiciendis minus doloremque.', NULL, '2016-09-04 09:27:04', NULL, NULL, 1954, 62, 1),
(1323, 'Distinctio dolor nesciunt ut quasi laudantium sequ', 'Impedit quos corporis repellendus. Reprehenderit necessitatibus ducimus ut ipsa debitis maiores. Mollitia officiis perspiciatis sint et est. Quas ut aliquam aspernatur odio. Quos et amet quis.', NULL, '2024-06-08 09:01:49', NULL, NULL, 1958, 62, 1),
(1324, 'Optio molestiae totam fugit tempora consequuntur a', 'Id quis consequatur et nihil vero. Eveniet et quidem quia dolorem praesentium dolor. Debitis necessitatibus asperiores aut est quaerat aspernatur. Rem adipisci sed est cupiditate ex amet.', NULL, '2017-07-29 02:12:48', NULL, NULL, 1962, 62, 1),
(1325, 'Quis quos aliquid ex culpa in sit', 'Ab quod culpa consequatur dolorem inventore et cum. Consequuntur ab numquam necessitatibus nesciunt est temporibus. Laudantium cum soluta ut et non. Et est ratione impedit molestiae esse vel dolorem.', NULL, '2022-08-14 11:16:14', NULL, NULL, 1966, 62, 1),
(1326, 'Est quis reiciendis fugiat', 'Sunt explicabo alias quis ullam molestiae consequatur. Minus quia consequatur ipsam asperiores consequatur. Cupiditate dolore animi cum dignissimos tempora dolore adipisci.', NULL, '2022-03-24 18:53:42', NULL, NULL, 1970, 62, 1),
(1327, 'Non voluptatem voluptas impedit illum nemo dolor', 'Doloremque nesciunt saepe ut ut et rerum et iusto. Rem harum assumenda et dicta et laudantium eveniet. Ducimus nihil et vel eos sint nobis nesciunt possimus. Repellendus rerum eius aut et velit.', NULL, '2025-01-26 15:11:57', NULL, NULL, 2026, 62, 1),
(1328, 'Consequatur ipsam suscipit id dicta', 'Pariatur fugiat magni voluptates magnam. Sunt modi maiores repudiandae ratione. Voluptas esse voluptatum atque vitae voluptatem occaecati.', NULL, '2023-05-17 15:01:22', NULL, NULL, 1974, 62, 1),
(1329, 'Ut omnis saepe rerum', 'Reiciendis modi quidem assumenda eum id provident id nostrum. Tenetur minus aperiam sequi a sit. Omnis est ipsa natus optio optio expedita. Sint molestias iste impedit enim porro.', NULL, '2017-03-10 12:19:54', NULL, NULL, 1978, 62, 1),
(1330, 'Alias non hic illum', 'Eligendi alias dolorum tempore velit. Eaque dolor quia perferendis ut et maiores dolore. Debitis aut quos asperiores ea.', NULL, '2019-10-16 15:27:30', NULL, NULL, 1982, 62, 1),
(1331, 'Ab omnis sequi corrupti sed sit', 'Ex enim deleniti ullam eos excepturi non. Culpa cupiditate et doloremque placeat cum maiores. Molestias ut ut dolorem. Reiciendis impedit officia inventore beatae.', NULL, '2024-08-30 20:21:06', NULL, NULL, 1986, 62, 1),
(1332, 'Est temporibus autem dolor dolorem', 'Quae dolores sunt sunt explicabo vitae. Et quia quia ea ut. Inventore repellat sed rerum illo magni.', NULL, '2019-05-19 04:21:06', NULL, NULL, 1990, 62, 1),
(1333, 'Cupiditate ipsum veritatis rem quia qui doloribus', 'Consectetur in mollitia blanditiis sed. Distinctio ut aut tempore et modi quas esse. Occaecati ad nisi quas et explicabo. Qui explicabo maxime corrupti nemo.', NULL, '2024-01-21 15:37:15', NULL, NULL, 1994, 62, 1),
(1334, 'Ut aut reiciendis id odio', 'Exercitationem vero in et aut maxime aperiam praesentium. Magnam est corrupti corrupti officiis. Accusantium vero laborum possimus ratione. Eos aut deleniti reprehenderit unde qui facere omnis qui. Nostrum architecto sunt repellat similique voluptas recusandae aut.', NULL, '2021-07-31 08:15:35', NULL, NULL, 1998, 62, 1),
(1335, 'Earum eaque facere eos', 'Voluptatem id culpa dignissimos voluptatem vitae et. Qui optio totam inventore quasi ea architecto. Quia tempore eligendi et. Quis reprehenderit reprehenderit id. Accusantium et et quo et.', NULL, '2017-07-25 11:49:08', NULL, NULL, 2002, 62, 1),
(1336, 'Molestiae itaque eligendi molestias voluptates', 'Dolores quisquam corporis quia a. Nemo et laudantium quam ut asperiores eligendi ut quae. Mollitia voluptatem ea iure et atque magnam dolorem.', NULL, '2017-07-02 05:25:19', NULL, NULL, 2006, 62, 1),
(1337, 'Earum veritatis hic cum sunt', 'Inventore ut qui enim aut sed asperiores et ut. Omnis tenetur ipsa repellat illum. Rem qui ut cupiditate dolor quia. Quo illum odio quae alias alias.', NULL, '2021-12-28 06:53:22', NULL, NULL, 2010, 62, 1),
(1338, 'Consectetur numquam quia autem', 'Et voluptatem consequatur voluptatem quis. Inventore inventore est ex veritatis. Asperiores nihil ducimus mollitia vel ut aperiam eum dolorum. Corporis exercitationem tenetur nam vero incidunt architecto.', NULL, '2024-09-26 21:46:38', NULL, NULL, 2014, 62, 1),
(1339, 'Corrupti quia quia et vitae', 'Doloremque velit voluptatem nobis temporibus. Sint quidem incidunt qui eum nostrum. Non aspernatur ea veniam quibusdam quia est. Quasi ut quos rerum quam.', NULL, '2025-09-03 18:07:24', NULL, NULL, 2018, 62, 1),
(1340, 'Consequatur amet expedita consequatur ut optio dol', 'Qui accusantium non ut et labore consequatur suscipit. Unde sunt aspernatur reiciendis beatae qui. Alias voluptatem eveniet est est.', NULL, '2020-09-11 05:32:00', NULL, NULL, 2022, 62, 1),
(1341, 'Totam quae quisquam quod aut consequatur', 'Porro est voluptas voluptatem est veniam aut sit. Veniam nihil consectetur amet maiores. Maiores molestiae voluptas facere occaecati dolores.', NULL, '2025-06-21 02:16:04', NULL, NULL, 1930, 63, 1),
(1342, 'Unde distinctio perferendis accusantium at at', 'Eos aliquid est nihil qui voluptatem rerum necessitatibus maiores. Eligendi necessitatibus vel aut doloremque recusandae et temporibus distinctio. Laudantium corrupti enim nihil enim et culpa.', NULL, '2019-02-26 11:07:31', NULL, NULL, 1934, 63, 1),
(1343, 'Et atque ex dolorem mollitia molestias perspiciati', 'Quo natus minus recusandae asperiores molestiae. Ratione mollitia velit non et ab. Dolorem cupiditate ab ut dicta modi deleniti.', NULL, '2015-11-26 12:59:36', NULL, NULL, 1938, 63, 1),
(1344, 'Cumque eos sint occaecati', 'Reiciendis ratione hic nihil expedita repudiandae natus ea. Non minus in itaque libero magnam quibusdam ipsam. Dolorem repellat ut quia quia et. Aliquid reiciendis aperiam exercitationem veritatis reiciendis consectetur.', NULL, '2017-09-26 23:04:05', NULL, NULL, 1950, 63, 1),
(1345, 'In id sed praesentium', 'Est voluptas inventore quos vel eum voluptatem. Non beatae nesciunt perspiciatis et odio voluptas ipsam officiis. Praesentium ex asperiores a possimus excepturi nihil ipsa. Ut totam magni et quos sunt pariatur repellendus labore. Molestias perferendis aut placeat voluptas et qui.', NULL, '2021-12-07 14:49:22', NULL, NULL, 1954, 63, 1),
(1346, 'Aliquid dolore est sunt repudiandae est alias', 'Aut aspernatur molestiae enim aperiam. Eum unde quas odit aut veniam adipisci facere facere. Molestiae et eum reprehenderit voluptas consequuntur molestias quo nesciunt.', NULL, '2016-07-04 04:51:12', NULL, NULL, 1958, 63, 1),
(1347, 'Voluptas rem molestias qui sapiente aut sint', 'Et quis atque commodi possimus dolore dolores accusamus et. Corrupti exercitationem temporibus magni ut pariatur temporibus totam quo. Non rerum a alias.', NULL, '2019-01-22 11:49:59', NULL, NULL, 1962, 63, 1),
(1348, 'Tenetur quo expedita omnis velit', 'Harum assumenda incidunt dolores sequi quam ab at. Asperiores perferendis nisi velit earum minus mollitia perspiciatis eos.', NULL, '2020-02-20 12:54:46', NULL, NULL, 1966, 63, 1),
(1349, 'Aspernatur dolor et ipsa officia omnis', 'Non et possimus omnis et ipsa nemo et. Voluptate modi reiciendis quia sed quibusdam quam. Quos qui accusamus in doloribus enim.', NULL, '2020-06-18 03:02:40', NULL, NULL, 1970, 63, 1),
(1350, 'Iste explicabo quia veniam praesentium est', 'Voluptas aliquam aspernatur in et culpa repellat. Odio quisquam aut aperiam quas. Culpa consectetur fuga rerum reiciendis quo quo consequatur.', NULL, '2019-01-12 18:31:58', NULL, NULL, 2026, 63, 1),
(1351, 'Cupiditate qui nam qui numquam', 'Molestias enim accusantium et vel. In ea beatae earum nihil vitae. Vel hic animi occaecati inventore. Doloribus quisquam quo sunt error quas voluptas ut. Hic et qui nemo voluptatem.', NULL, '2020-11-21 20:47:51', NULL, NULL, 1974, 63, 1),
(1352, 'Veniam facilis perferendis alias voluptatem esse f', 'Modi laborum quis nulla qui. Ut consequatur in hic sequi. Dolorum sunt ut animi consequuntur cum voluptatem. Sint autem est dolore voluptas voluptate. Ipsa non doloremque possimus modi dicta ullam sed.', NULL, '2023-03-02 04:21:22', NULL, NULL, 1978, 63, 1),
(1353, 'Culpa sed libero quo ducimus', 'Atque possimus suscipit reiciendis. Quidem quae nemo rerum facilis debitis. Aut fugit at sint voluptatum sint omnis. Praesentium voluptas illum voluptatem consequuntur hic.', NULL, '2022-04-27 17:27:41', NULL, NULL, 1982, 63, 1),
(1354, 'Quis excepturi velit libero aperiam eos', 'Autem laudantium reiciendis debitis sint voluptas. Sit consequuntur eaque sint facilis. Voluptas at similique molestiae sed nulla. Vel sed non praesentium alias.', NULL, '2024-05-08 22:27:32', NULL, NULL, 1986, 63, 1),
(1355, 'Optio libero nesciunt delectus magnam sed', 'Qui aut rerum dolore fugiat officiis eos. Cum quasi voluptas et quas qui praesentium deleniti consequatur. Fugiat ratione aspernatur quidem et quia.', NULL, '2016-10-30 19:04:40', NULL, NULL, 1990, 63, 1),
(1356, 'Sint excepturi occaecati architecto id', 'Non modi et est. Modi exercitationem laboriosam voluptatem corporis nemo natus. Rerum voluptate unde officia laudantium. Sit et iusto nihil et et.', NULL, '2023-04-04 06:13:48', NULL, NULL, 1994, 63, 1),
(1357, 'Et quaerat dolorem dolor corporis odit', 'Illo aspernatur id deserunt sint omnis aspernatur. Quia deleniti corrupti delectus aut. Minima veritatis laborum dolorem beatae est laborum. Rem cumque ut quia iure id praesentium voluptate.', NULL, '2018-06-11 14:50:27', NULL, NULL, 1998, 63, 1),
(1358, 'Nisi qui vel sint', 'Eius eius sunt voluptatem itaque totam et. Est ipsa facere esse ea. Repudiandae odio est occaecati corrupti. Ut facilis velit quod necessitatibus ipsam et. Voluptas dolores ipsum libero blanditiis.', NULL, '2020-11-06 15:55:28', NULL, NULL, 2002, 63, 1),
(1359, 'Et at in fugit maiores', 'Iure ut ducimus id est quas voluptatem exercitationem. Nesciunt blanditiis expedita rerum suscipit. Facere dignissimos ut maxime. Dolorum nostrum quam voluptatem quas dolor ratione et.', NULL, '2024-10-07 11:13:15', NULL, NULL, 2006, 63, 1),
(1360, 'Incidunt nam porro est soluta eaque assumenda', 'Molestias molestiae voluptas numquam earum nemo. Minus asperiores vero assumenda corporis ut soluta. Sit nostrum cumque rerum fugiat.', NULL, '2015-12-15 10:56:07', NULL, NULL, 2010, 63, 1),
(1361, 'Optio dolorem totam iure debitis dolorem', 'Laboriosam perferendis molestiae repellendus eveniet accusantium perferendis. Laboriosam ipsum ut quae temporibus sapiente laborum esse expedita. Hic quidem nesciunt aut tempora eveniet. Sed et veniam ut cupiditate.', NULL, '2022-12-13 01:09:55', NULL, NULL, 2014, 63, 1),
(1362, 'Et optio vero molestias culpa', 'Neque et aut tenetur sit quos quaerat ipsum. Nihil tempore nesciunt nulla accusantium doloremque voluptate et. Eligendi provident et similique eum recusandae tempore et. Aperiam et ex dolorem.', NULL, '2025-05-21 11:38:48', NULL, NULL, 2018, 63, 1),
(1363, 'Praesentium commodi consequatur ea repellat modi', 'Excepturi asperiores nostrum voluptas dolores perferendis aut omnis asperiores. Sint numquam quasi ea quod modi voluptate nihil. Sunt culpa dolor enim neque hic ab. Qui ut non temporibus tempora quod dolores.', NULL, '2025-03-13 01:45:07', NULL, NULL, 2022, 63, 1),
(1364, 'Suscipit labore quaerat autem', 'Qui nemo necessitatibus aut ipsa. Reiciendis quis pariatur ab eos laudantium. Provident qui vero odit praesentium dignissimos qui magni.', NULL, '2016-10-23 10:14:35', NULL, NULL, 1930, 64, 1),
(1365, 'Nesciunt eum laboriosam et ea aut', 'Autem deleniti sed dolore facere perferendis in. Consequatur fuga ipsa cumque neque. Et amet eum quia iusto commodi qui.', NULL, '2022-11-24 08:46:44', NULL, NULL, 1934, 64, 1),
(1366, 'Architecto explicabo expedita illum nemo aut', 'Quod nobis dolorum sit repudiandae quasi porro. Eos alias animi qui suscipit. Culpa voluptates consectetur fuga saepe aut laborum ipsa laboriosam. Reprehenderit ea vero earum ex odit est.', NULL, '2023-05-17 14:40:07', NULL, NULL, 1938, 64, 1),
(1367, 'Dignissimos quam voluptatum aperiam sit id', 'Rem atque est aspernatur distinctio officia sunt. Eum incidunt veniam inventore quaerat sint aut et. Eligendi necessitatibus dignissimos rerum maxime dolorem voluptas.', NULL, '2020-06-03 21:33:07', NULL, NULL, 1950, 64, 1),
(1368, 'Et amet quasi voluptatem at ut', 'Rem iusto nulla praesentium autem quam quo. Possimus mollitia in veritatis nobis distinctio. Non dolor nihil odit qui. Ut doloremque eum qui libero eos illo. Perspiciatis facilis illum tempora odio.', NULL, '2022-11-10 03:49:09', NULL, NULL, 1954, 64, 1),
(1369, 'Autem architecto iusto aut et amet ipsa', 'Esse sit inventore qui dolorem. Dignissimos impedit pariatur illum distinctio ducimus quas culpa. Eos dolores nesciunt asperiores adipisci vel. Aut repellat ullam ab sint voluptas. Ducimus placeat perspiciatis illum blanditiis delectus.', NULL, '2016-02-21 05:18:47', NULL, NULL, 1958, 64, 1),
(1370, 'Officiis tempore sint amet vitae tempore', 'Atque rerum impedit molestiae quia aliquam quod. Dolores molestias numquam quasi iusto et. Qui non doloremque mollitia suscipit et illo.', NULL, '2025-03-04 04:39:25', NULL, NULL, 1962, 64, 1),
(1371, 'Quaerat ut sint voluptatem', 'Distinctio sapiente quisquam et laudantium voluptatibus dolores. Repudiandae omnis sed neque dolorum.', NULL, '2020-07-17 20:05:30', NULL, NULL, 1966, 64, 1),
(1372, 'Quisquam consequatur voluptatibus voluptatem delec', 'Impedit voluptatum mollitia qui accusamus consequuntur. Inventore iure reiciendis minus qui.', NULL, '2022-08-25 11:39:55', NULL, NULL, 1970, 64, 1),
(1373, 'Ipsam maxime saepe dolores nemo ex', 'Consequatur eum consequatur et. Sunt id tempore placeat vero id voluptatum. Architecto dolores quis sequi.', NULL, '2019-05-14 21:03:06', NULL, NULL, 2026, 64, 1),
(1374, 'Et cumque dolorum totam aperiam', 'Placeat nihil minima non repellat aut. Rerum quia recusandae labore dolorem. Iure et laboriosam rerum et dignissimos ipsam minus. Quo delectus tempora aut accusantium voluptate suscipit aspernatur officiis.', NULL, '2024-01-15 09:03:37', NULL, NULL, 1974, 64, 1),
(1375, 'Ipsum eum blanditiis corporis', 'Corrupti necessitatibus deserunt aut velit vel voluptatibus dolor quisquam. Sapiente odio nisi cum natus deserunt. Eos nisi dicta eum.', NULL, '2018-12-02 18:40:33', NULL, NULL, 1978, 64, 1),
(1376, 'Possimus quo voluptate et', 'Iste distinctio omnis non et fuga voluptate. Ab autem corrupti quos porro natus veritatis voluptatem aperiam. Soluta rerum earum dolorum voluptas nisi quia est. Laudantium et libero facere impedit.', NULL, '2021-08-02 10:05:47', NULL, NULL, 1982, 64, 1),
(1377, 'Eius voluptas pariatur veniam ipsa quisquam magnam', 'Corrupti sint eos laudantium ullam quisquam sit. Laudantium unde eligendi et id rerum facere iusto. Quisquam non impedit sit ea. Vitae qui ipsa accusamus nostrum reiciendis. Iure voluptas dolor accusantium aut.', NULL, '2019-03-15 07:23:09', NULL, NULL, 1986, 64, 1),
(1378, 'Eaque et ex corrupti', 'Voluptatum magni illum dolorum aut consectetur quasi. Est dolore voluptatibus dolores a. Exercitationem molestiae eaque minima nulla repudiandae expedita autem reiciendis.', NULL, '2020-06-30 12:31:18', NULL, NULL, 1990, 64, 1),
(1379, 'Eligendi ratione qui fuga numquam suscipit quia', 'Repellat dicta debitis quibusdam veniam. Sed repellat rerum repellendus. Tempore est eos ut consequatur tempore et. Eum suscipit quae sit recusandae ut dolores consequatur.', NULL, '2017-10-18 15:24:19', NULL, NULL, 1994, 64, 1),
(1380, 'Delectus tempore eos libero dolores exercitationem', 'Saepe cupiditate a officia beatae. Veritatis sapiente officiis accusantium dolorem deserunt cumque est.', NULL, '2018-10-09 12:15:57', NULL, NULL, 1998, 64, 1),
(1381, 'Et dolores cum laborum in vero expedita', 'Voluptatem perspiciatis sint neque sint quam. Perspiciatis et vitae molestiae rerum. Incidunt nesciunt perspiciatis et voluptatem.', NULL, '2016-10-08 08:26:22', NULL, NULL, 2002, 64, 1),
(1382, 'Voluptatum nisi alias nihil ea corrupti fugiat', 'Occaecati sunt est non aliquam aut perspiciatis. Et suscipit facilis veritatis ducimus repellendus fuga autem. Quis vitae maiores nisi quibusdam labore sint. Sed voluptas quo ipsum iste ex. Ab nisi molestias consequatur reprehenderit.', NULL, '2019-09-19 05:47:26', NULL, NULL, 2006, 64, 1),
(1383, 'Numquam hic cupiditate dicta voluptatem', 'Illum explicabo reprehenderit ea sint ut fugiat a culpa. Autem doloremque porro blanditiis voluptas ipsa non libero. Vel dicta enim voluptatem saepe rem deserunt ut.', NULL, '2021-03-26 19:20:01', NULL, NULL, 2010, 64, 1),
(1384, 'Necessitatibus asperiores accusantium enim', 'Nulla et expedita minima quas aliquid explicabo. Asperiores exercitationem dolor vel sunt quisquam quia. Soluta architecto voluptas placeat non qui doloribus temporibus necessitatibus.', NULL, '2021-02-14 09:35:03', NULL, NULL, 2014, 64, 1),
(1385, 'Dignissimos temporibus sed quia sint deleniti', 'Qui ea qui pariatur est voluptate quod. Et sint harum voluptas molestiae aut omnis aut voluptates. Voluptatem distinctio officiis non voluptas quod sit.', NULL, '2022-02-13 13:46:57', NULL, NULL, 2018, 64, 1),
(1386, 'Culpa est dolore consectetur vitae quasi voluptate', 'Vitae soluta id dolor architecto eum. Facilis numquam est alias.', NULL, '2023-01-13 01:09:55', NULL, NULL, 2022, 64, 1),
(1389, 'Programacion de Capa Intermedia', 'Hoy es la revision del 2do Avance', NULL, '2025-10-24 23:46:59', NULL, NULL, 1930, 3, 1),
(1390, 'Nimodo', 'Se pospone la revision del segundo avance chat', NULL, '2025-10-24 23:58:09', NULL, NULL, 1930, 2, 1),
(1391, 'Revision BDM', '1234', NULL, '2025-10-29 04:03:02', NULL, NULL, 1930, 2, 1),
(1392, 'madrugada', 'dd', NULL, '2025-11-05 22:37:45', NULL, NULL, 1930, 3, 1),
(1393, 'miercoles', 'son las 5:31', NULL, '2025-11-06 00:31:13', NULL, NULL, 1930, 3, 1),
(1394, '5:36', 'a', NULL, '2025-11-05 23:35:18', NULL, NULL, 1930, 3, 1),
(1395, '5:40', 'sasa', NULL, '2025-11-06 00:40:50', NULL, NULL, 1930, 3, 1),
(1396, 'holi', 'nada', NULL, '2025-11-06 01:21:53', NULL, NULL, 1930, 65, 1),
(1397, '3:22', 'partido', NULL, '2025-11-06 01:22:23', NULL, NULL, 1930, 65, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `ID_Role_PK` int(11) NOT NULL,
  `Rol_Name` varchar(30) NOT NULL,
  `Description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`ID_Role_PK`, `Rol_Name`, `Description`) VALUES
(1, 'Administrador', 'Tiene control total sobre el sitio web, puede gestionar usuarios y contenido.'),
(2, 'Usuario', 'Puede crear publicaciones, comentar y calificar contenido.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`ID_User_PK`, `ID_Role_FK`, `Profile_Picture`, `First_Name`, `Last_Name`, `Birthdate`, `Gender`, `ID_Country_FK`, `Phone_Number`, `Nametag`, `Email`, `Password`) VALUES
(2, 2, '481390336_545781551177041_738940.jpg', 'Christian Eduardo', 'Salazar Fuentes', '2005-12-29', 0, 118, 2147483647, 'DrippKing', 'christiansalazar2005@gmail.com', '5545'),
(3, 2, 'Imagen de WhatsApp 2025-10-08 a las 23.50.46_39d3e0ed.jpg', 'Danna Yamileth', 'Hernández Soto', '2004-02-08', 0, 118, 2147483647, 'donnita', 'dannahernandezsoto4@gmail.com', '1111'),
(45, 2, 'default.jpg', 'África', 'Oliver', '1981-01-17', 0, 138, 2113123235, 'llorente.daniel', 'valentina04@example.org', '1234'),
(46, 2, 'default.jpg', 'Miguel Ángel', 'Atencio', '1972-06-12', 0, 15, 1243355688, 'carvajal.pol', 'raul.carbonell@example.com', '1234'),
(47, 2, 'default.jpg', 'Celia', 'Delrío', '1999-09-24', 1, 123, 1179837625, 'irene.requena', 'brosales@example.com', '1234'),
(48, 2, 'default.jpg', 'Luis', 'Miramontes', '1980-11-20', 2, 11, 1161747333, 'hugo.polanco', 'raguado@example.net', '1234'),
(49, 2, 'default.jpg', 'Juan', 'Mota', '1997-09-18', 0, 53, 1867085628, 'isaac80', 'vaca.diego@example.com', '1234'),
(50, 2, 'default.jpg', 'David', 'Zayas', '1974-12-10', 1, 26, 1810265197, 'francisca.hernadez', 'gzamora@example.com', '1234'),
(51, 2, 'default.jpg', 'Jimena', 'Rivas', '1991-05-05', 1, 136, 1581228096, 'gonzalo33', 'carmenta@example.org', '1234'),
(52, 2, 'default.jpg', 'Cristina', 'Abeyta', '1990-05-15', 1, 171, 1587303601, 'arredondo.pol', 'ismael94@example.com', '1234'),
(53, 2, 'default.jpg', 'Eva', 'Piña', '1992-01-20', 0, 67, 1176706158, 'wmoran', 'antonio.sandoval@example.com', '1234'),
(54, 2, 'default.jpg', 'Luis', 'Banda', '2000-10-12', 1, 176, 1105290897, 'carlos57', 'sergio.alaniz@example.net', '1234'),
(55, 2, 'default.jpg', 'Noa', 'Carreón', '1984-07-17', 2, 104, 2112468298, 'alba.saavedra', 'biel.vicente@example.com', '1234'),
(56, 2, 'default.jpg', 'Ana María', 'Montenegro', '1980-01-05', 0, 155, 1349946100, 'raquel89', 'moran.paula@example.org', '1234'),
(57, 2, 'default.jpg', 'Gabriela', 'Marrero', '1989-09-28', 1, 133, 1420066098, 'natalia45', 'fernando21@example.org', '1234'),
(58, 2, 'default.jpg', 'Olga', 'Camarillo', '1985-07-08', 0, 115, 1399387005, 'valverde.carla', 'svidal@example.net', '1234'),
(59, 2, 'default.jpg', 'Claudia', 'Pacheco', '1979-04-13', 2, 87, 1875568273, 'azarate', 'lrincon@example.com', '1234'),
(60, 2, 'default.jpg', 'Aitor', 'Alaniz', '1990-05-13', 1, 26, 2132723194, 'antonia17', 'rayan60@example.com', '1234'),
(61, 2, 'default.jpg', 'Raquel', 'Madrigal', '1994-10-27', 0, 61, 1211180869, 'nmacias', 'victor.valladares@example.org', '1234'),
(62, 2, 'default.jpg', 'Guillermo', 'Luján', '1989-03-10', 1, 125, 1969346118, 'juan10', 'zserrato@example.org', '1234'),
(63, 2, 'default.jpg', 'Vera', 'Cotto', '1996-12-14', 2, 95, 1609593468, 'alicia87', 'tpartida@example.com', '1234'),
(64, 2, 'default.jpg', 'Sandra', 'Polo', '1996-05-17', 2, 6, 1148986785, 'bravo.ursula', 'viera.vera@example.com', '1234'),
(65, 2, '65_1762387917_379e001d.jpg', 'Danna', 'Soto', '2010-02-08', 1, 118, 2147483647, 'Donnita', 'dannahernandezsoto4@gmail.com', '2222'),
(66, 2, 'default.jpg', 'Fernando', 'Soto', '2008-02-05', 0, 118, 2147483647, 'Fersho', 'dannahernandezsoto4@gmail.com', '3333'),
(67, 2, 'default.jpg', 'Fernando', 'Soto', '2008-02-05', 0, 118, 2147483647, 'Fersho', 'dannahernandezsoto4@gmail.com', '3333');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `worldcup_editions`
--

CREATE TABLE `worldcup_editions` (
  `ID_WorldCup_Year_PK` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `ID_Hashtag_FK` int(11) NOT NULL,
  `Official_Artwork_Multimedia` varchar(100) NOT NULL,
  `Final_Winner` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `worldcup_editions`
--

INSERT INTO `worldcup_editions` (`ID_WorldCup_Year_PK`, `Name`, `ID_Hashtag_FK`, `Official_Artwork_Multimedia`, `Final_Winner`) VALUES
(1930, 'URUGUAY 1930', 1, 'Uruguay_1930_WC.jpg', 'Uruguay'),
(1934, 'ITALY 1934', 2, 'Italy_1934_WC.jpg', 'Italia'),
(1938, 'FRANCE 1938', 3, 'France_1938_WC.jpg', 'Italia'),
(1950, 'BRAZIL 1950', 4, 'Brazil_1950_WC.jpg', 'Uruguay'),
(1954, 'SWITZERLAND 1954', 5, 'Switzerland_1954_WC.jpg', 'Alemania Federal'),
(1958, 'SWEDEN 1958', 6, 'Sweden_1958_WC.jpg', 'Brasil'),
(1962, 'CHILE 1962', 7, 'Chile_1962_WC.jpg', 'Brasil'),
(1966, 'ENGLAND 1966', 8, 'England_1966_WC.jpg', 'Inglaterra'),
(1970, 'MEXICO 1970', 9, 'Mexico_1970_WC.jpg', 'Brasil'),
(1974, 'GERMANY 1974', 10, 'Germany_1974_WC.jpg', 'Alemania Federal'),
(1978, 'ARGENTINA 1978', 11, 'Argentina_1978_WC.jpg', 'Argentina'),
(1982, 'SPAIN 1982', 12, 'Spain_1982_WC.jpg', 'Italia'),
(1986, 'MEXICO 1986', 13, 'Mexico_1986_WC.jpg', 'Argentina'),
(1990, 'ITALY 1990', 14, 'Italy_1990_WC.jpg', 'Alemania Federal'),
(1994, 'USA 1994', 15, 'UnitedStatesOfAmerica_1994_WC.jpg', 'Brasil'),
(1998, 'FRANCE 1998', 16, 'France_1998_WC.jpg', 'Francia'),
(2002, 'KOREA/JAPAN 2002', 17, 'Japan_2002_WC.jpg', 'Brasil'),
(2006, 'GERMANY 2006', 18, 'Germany_2006_WC.jpg', 'Italia'),
(2010, 'SOUTH AFRICA 2010', 19, 'SouthAfrica_2010_WC.jpg', 'España'),
(2014, 'BRAZIL 2014', 20, 'Brazil_2014_WC.jpg', 'Alemania'),
(2018, 'RUSSIA 2018', 21, 'Russia_2018_WC.jpg', 'Francia'),
(2022, 'QATAR 2022', 22, 'Qatar_2022_WC.jpg', 'Argentina'),
(2026, 'MÉXICO 2026', 9, '2026_WC.jpg', '');

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
  MODIFY `ID_Category_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  MODIFY `ID_Post_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1398;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `ID_Role_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `ID_User_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

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
