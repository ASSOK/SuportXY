-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2018 a las 20:38:18
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`ID_EQUIPO`, `SBN`, `SERIE`, `TIPO`, `DESCRIPCION`) VALUES
(1, '2421212', 'Macintosh', 'computadora', 'Maquina del decano'),
(2, '11425678', 'LG', 'mouse', 'mouse del decano'),
(3, '12452212', 'LG', 'teclado', 'teclado del decano'),
(4, '947347404', 'EPSON', 'Laptop LG', 'Laptop plegable'),
(5, '14752142', 'Autobot', 'Optimus', 'Autobot lider'),
(6, '7531596482', 'Decepticon', 'Megatron', 'Decepticon lider'),
(7, '1420048', 'Androide', 'Gerson', 'Machine'),
(8, '362481', 'Androide', 'Androide 16', 'Maquina fabricada por el doctor Makigero'),
(9, '275454641', 'impresora EPS', 'Impresora multiscaner', 'Impresora nueva'),
(10, '12217465424', 'Impresora Mac', 'Impresora multifuncional', 'Impresora de salones'),
(11, '4455723449', 'Monitor LDS', 'Monitor 3D', 'Monitor nuevo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE IF NOT EXISTS `inventario` (
  `EQUIPO_ID_EQUIPO` int(10) unsigned NOT NULL,
  `Trabajador_codigo` int(10) unsigned NOT NULL,
  `lugar` varchar(100) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EQUIPO_ID_EQUIPO`,`Trabajador_codigo`),
  KEY `Trabajador_codigo` (`Trabajador_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`EQUIPO_ID_EQUIPO`, `Trabajador_codigo`, `lugar`, `fecha`) VALUES
(1, 14200022, 'Area de Decanato', '2018-06-25 16:59:43'),
(2, 14200022, 'laboratorio 1', '2018-06-25 18:04:06'),
(3, 14200022, 'laboratorio 1', '2018-06-25 18:05:13'),
(4, 14200022, 'laboratorio 7', '2018-06-25 18:06:43'),
(5, 14200022, 'laboratorio 1', '2018-06-25 18:07:51'),
(6, 14200143, 'salones', '2018-06-25 18:11:38'),
(7, 14200143, 'salones', '2018-06-25 18:14:59'),
(8, 14200022, 'laboratorio 1', '2018-06-25 18:16:48'),
(9, 14200022, 'laboratorio 1', '2018-06-25 18:18:09'),
(10, 14200022, 'Salon', '2018-06-25 18:19:06'),
(11, 14200022, 'salones', '2018-06-25 18:19:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetos_perdidos`
--

CREATE TABLE IF NOT EXISTS `objetos_perdidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador` int(11) DEFAULT '0',
  `usuario` varchar(50) DEFAULT '0',
  `objeto` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT '0',
  `lugar` varchar(50) DEFAULT '0',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,//fecha de recepcion
  `estado` varchar(50) DEFAULT 'Perdido',
  `entregado_por` int(11) DEFAULT NULL,
  `entregado_a_nombre` varchar(50) DEFAULT 'SIN REGISTRAR',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soportel.objetos_perdidos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `objetos_perdidos` DISABLE KEYS */;
INSERT INTO `objetos_perdidos` (`id`, `trabajador`, `usuario`, `objeto`, `descripcion`, `lugar`, `fecha`, `estado`, `entregado_por`, `entregado_a_nombre`) VALUES
	(9, 14200140, 'servidores', NULL, 'Cuaderno', 'Salon 207', '2018-06-24 23:32:52', 'Perdido', 14200141, 'Andres'),
	(11, 14200140, 'Grecia', 'Celular', 'J5 negro', 'Laboratorio 3', '2018-06-25 00:10:05', 'Encontrado', 14200144, 'PRUEBA'),
	(12, 14200141, 'Andrea', 'USB', 'Kingston 16Gb', 'Laboratorio 8', '2018-06-25 00:04:45', 'Perdido', NULL, 'SIN REGISTRAR'),
	(13, 14200142, 'Miguel', 'Mousepad', 'Imagen dota 2', 'Laboratorio 7', '2018-06-25 00:13:27', 'Encontrado', 14200144, 'Miguel Grau');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `solicitud_servicio`
--

INSERT INTO `solicitud_servicio` (`id`, `trabajador`, `usuario`, `servicio`, `lugar`, `detalle`, `fecha`, `estado`) VALUES
(9, '14200141', 'fsdfsdfsdf', 'Instalacion', 'sdfsadfsaad', 'fdsdfasdf', '2018-06-05 18:18:51', 'Realizado'),
(10, '14200145', 'SALINAS', 'Mantenimiento PC', 'FISI', 'COSA', '2018-06-05 18:29:23', 'Realizado'),
(11, '14200143', 'Salinas', 'Mantenimiento PC', 'Laboratorio 10', '', '2018-06-05 19:33:38', 'Realizado'),
(14, '14200140', 'Aldo', 'Reparacion', 'USGOM', 'Fallo en placa madre', '2018-06-05 22:39:33', 'Realizado'),
(15, '14200141', 'Moquillaza', 'Mantenimiento PC', 'Soporte', 'limpieza de pc', '2018-06-05 22:43:13', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE IF NOT EXISTS `trabajador` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `DNI` varchar(50) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `TipoDeTrabajador` varchar(30) NOT NULL DEFAULT 'Bolsista',
  `pass` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `NombreCompleto` (`nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14200145 ;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`codigo`, `nombre`, `DNI`, `fechaNacimiento`, `usuario`, `TipoDeTrabajador`, `pass`) VALUES
(14200022, 'Mario Masias Vilca', '74804428', '1995-06-06', 'mario', 'Bolsista', '1234'),
(14200140, 'Ronald Dante Lindo Jaimes', '76188250', '1994-04-19', 'ronald', 'Bolsista', '1234'),
(14200141, 'Gustavo Jose Lloclle Quipesivana', '76188250', '1996-01-02', 'gustavo', 'Bolsista', '1234'),
(14200143, 'Jhon Macazana Romero', '76654165', '1993-06-05', 'jhon', 'Bolsista', '1234'),
(14200144, 'Saul Pampa Lobon', '76544522', '1996-06-24', 'saul', 'Bolsista', '1234');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=107 ;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`idturno`, `idTrabajador`, `horai`, `horaf`, `dia`) VALUES
(101, 14200141, '09:00:00', '19:00:00', 'martes'),
(102, 14200140, '13:00:00', '19:00:00', 'martes'),
(103, 14200022, '08:00:00', '19:00:00', 'martes'),
(104, 14200022, '13:00:00', '19:00:00', 'miercoles'),
(105, 14200022, '08:00:00', '19:00:00', 'jueves'),
(106, 14200022, '13:00:00', '19:00:00', 'sabado');

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
