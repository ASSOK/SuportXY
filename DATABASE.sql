
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `soportel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE IF NOT EXISTS `asistencia` (
  `idasistencia` int(10) unsigned NOT NULL,
  `idTrabajador` int(10) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `asistencia` varchar(45) DEFAULT NULL,
  `idturno` int(10) DEFAULT NULL,
  PRIMARY KEY (`idasistencia`),
  KEY `Trabajador_idTrabajador` (`idTrabajador`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`idasistencia`, `idTrabajador`, `fecha`, `hora`, `asistencia`, `idturno`) VALUES
(142001405, 14200140, '2018-06-05', '16:16:00', 'Tarde', 102),
(142001415, 14200141, '2018-06-05', '16:45:00', 'Tarde', 101);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE IF NOT EXISTS `equipo` (
  `ID_EQUIPO` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SBN` varchar(14) DEFAULT NULL,
  `SERIE` varchar(13) DEFAULT NULL,
  `TIPO` varchar(120) DEFAULT NULL,
  `DESCRIPCION` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ID_EQUIPO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE IF NOT EXISTS `inventario` (
  `EQUIPO_ID_EQUIPO` int(10) unsigned NOT NULL,
  `Trabajador_codigo` int(10) unsigned NOT NULL,
  `LUGAR` varchar(100) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EQUIPO_ID_EQUIPO`,`Trabajador_codigo`),
  KEY `Trabajador_codigo` (`Trabajador_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE IF NOT EXISTS `servicio` (
  `idServicio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idServicio`),
  KEY `titulo` (`nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idServicio`, `nombre`) VALUES
(5, 'Abrir LAboratorio'),
(6, 'Cierre de Laboratorio'),
(4, 'Instalacion'),
(1, 'Mantenimiento PC'),
(3, 'Reparacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_servicio`
--

CREATE TABLE IF NOT EXISTS `solicitud_servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador` varchar(50) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `servicio` varchar(50) DEFAULT NULL,
  `lugar` varchar(100) DEFAULT NULL,
  `detalle` varchar(100) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(100) DEFAULT 'Pendiente',
  PRIMARY KEY (`id`),
  KEY `FK_solicitud_servicio_servicio` (`servicio`),
  KEY `FK_solicitud_servicio_usuario` (`usuario`),
  KEY `FK_solicitud_servicio_trabajador` (`trabajador`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `solicitud_servicio`
--

INSERT INTO `solicitud_servicio` (`id`, `trabajador`, `usuario`, `servicio`, `lugar`, `detalle`, `fecha`, `estado`) VALUES
(4, '110', 'dsfadfsad', 'Instalacion', 'sdafsadfsadf', 'fsadf', '2018-06-05 07:31:41', 'Realizado'),
(5, '120', 'asdfsdaf', 'Mantenimiento PC', 'fdsafsdfasd', 'sadfasd', '2018-06-05 07:41:42', 'Realizado'),
(7, '120', 'Jhon Macazana', 'Mantenimiento PC', 'FISI', 'SDFSFGFG', '2018-06-05 08:32:54', 'Realizado'),
(8, '110', 'carlos', 'Reparacion', 'dfgdfhfgh', 'sadfasdf', '2018-06-05 08:36:31', 'Realizado'),
(9, '14200141', 'fsdfsdfsdf', 'Instalacion', 'sdfsadfsaad', 'fdsdfasdf', '2018-06-05 18:18:51', 'Realizado'),
(10, '14200145', 'SALINAS', 'Mantenimiento PC', 'FISI', 'COSA', '2018-06-05 18:29:23', 'Realizado'),
(11, '14200143', 'Salinas', 'Mantenimiento PC', 'Laboratorio 10', '', '2018-06-05 19:33:38', 'Realizado'),
(14, '14200140', 'Aldo', 'Reparacion', 'USGOM', 'Fallo en placa madre', '2018-06-05 22:39:33', 'Realizado'),
(15, '14200141', 'Moquillaza', 'Mantenimiento PC', 'Soporte', 'limpieza de pc', '2018-06-05 22:43:13', 'Pendiente'),
(16, '14200140', 'Aldo', 'Instalacion', '', '', '2018-06-12 22:28:49', 'Pendiente'),
(17, '14200140', 'Salinas', 'Cierre de Laboratorio', 'Laboratorio NÂ° 8', 'Cierre del laboratorio del curso Algoritmica III', '2018-06-12 22:34:10', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE IF NOT EXISTS `trabajador` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `DNI` varchar(50) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `TipoDeTrabajador` varchar(30) NOT NULL,
  `pass` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `NombreCompleto` (`Nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14200144 ;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`codigo`, `Nombre`, `DNI`, `FechaNacimiento`, `usuario`, `TipoDeTrabajador`, `pass`) VALUES
(14200140, 'Ronald Dante Lindo Jaimes', '76188250', '1994-04-19', 'ronald', 'Bolsista', '1234'),
(14200141, 'Gustavo Jose Lloclle Quipesivana', '76188250', '1996-01-02', 'gustavo', 'Bolsista', '1234'),
(14200143, 'Jhon Macazana Romero', '76654165', '1993-06-05', 'jhon', 'Bolsista', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE IF NOT EXISTS `turno` (
  `idturno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idTrabajador` int(10) unsigned NOT NULL,
  `horai` time NOT NULL,
  `horaf` time NOT NULL,
  `dia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idturno`),
  KEY `idTrabajador` (`idTrabajador`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=103 ;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`idturno`, `idTrabajador`, `horai`, `horaf`, `dia`) VALUES
(101, 14200141, '09:00:00', '19:00:00', 'martes'),
(102, 14200140, '13:00:00', '19:00:00', 'martes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `IdUsuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  KEY `NombreCompleto` (`Nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IdUsuario`, `Nombre`, `Tipo`) VALUES
(1, 'Juan Gutierrez', 'Estudiante'),
(2, 'Jhon Macazana', 'Profesor'),
(3, 'Salinas', 'Docente');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`Trabajador_codigo`) REFERENCES `trabajador` (`codigo`),
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`EQUIPO_ID_EQUIPO`) REFERENCES `equipo` (`ID_EQUIPO`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
