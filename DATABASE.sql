-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.21 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla soportel.asistencia
CREATE TABLE IF NOT EXISTS `asistencia` (
  `idasistencia` int(10) unsigned NOT NULL,
  `idTrabajador` int(10) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `asistencia` varchar(45) DEFAULT NULL,
  `idturno` int(10) DEFAULT NULL,
  PRIMARY KEY (`idasistencia`),
  KEY `Trabajador_idTrabajador` (`idTrabajador`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soportel.asistencia: 0 rows
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
INSERT INTO `asistencia` (`idasistencia`, `idTrabajador`, `fecha`, `hora`, `asistencia`, `idturno`) VALUES
	(142001405, 14200140, '2018-06-05', '16:16:00', 'Tarde', 102);
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;

-- Volcando estructura para tabla soportel.inventario_equipo
CREATE TABLE IF NOT EXISTS `inventario_equipo` (
  `idInventario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(12) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idInventario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soportel.inventario_equipo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `inventario_equipo` DISABLE KEYS */;
INSERT INTO `inventario_equipo` (`idInventario`, `tipo`, `nombre`) VALUES
	(1, 'maquina', 'gerson'),
	(2, 'jcgj', 'chjcg');
/*!40000 ALTER TABLE `inventario_equipo` ENABLE KEYS */;

-- Volcando estructura para tabla soportel.servicio
CREATE TABLE IF NOT EXISTS `servicio` (
  `idServicio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idServicio`),
  KEY `titulo` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soportel.servicio: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` (`idServicio`, `nombre`) VALUES
	(4, 'Instalacion'),
	(1, 'Mantenimiento PC'),
	(3, 'Reparacion');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;

-- Volcando estructura para tabla soportel.solicitud_equipo
CREATE TABLE IF NOT EXISTS `solicitud_equipo` (
  `Trabajador_idTrabajador` int(10) unsigned NOT NULL,
  `Inventario_equipo_idInventario` int(10) unsigned NOT NULL,
  `Usuario_IdUsuario` int(10) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `comentario` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Trabajador_idTrabajador`,`Inventario_equipo_idInventario`),
  KEY `Inventario_equipo_idInventario` (`Inventario_equipo_idInventario`),
  KEY `Usuario_IdUsuario` (`Usuario_IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soportel.solicitud_equipo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `solicitud_equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_equipo` ENABLE KEYS */;

-- Volcando estructura para tabla soportel.solicitud_servicio
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soportel.solicitud_servicio: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `solicitud_servicio` DISABLE KEYS */;
INSERT INTO `solicitud_servicio` (`id`, `trabajador`, `usuario`, `servicio`, `lugar`, `detalle`, `fecha`, `estado`) VALUES
	(4, '110', 'dsfadfsad', 'Instalacion', 'sdafsadfsadf', 'fsadf', '2018-06-05 02:31:41', 'Realizado'),
	(5, '120', 'asdfsdaf', 'Mantenimiento PC', 'fdsafsdfasd', 'sadfasd', '2018-06-05 02:41:42', 'Realizado'),
	(7, '120', 'Jhon Macazana', 'Mantenimiento PC', 'FISI', 'SDFSFGFG', '2018-06-05 03:32:54', 'Realizado'),
	(8, '110', 'carlos', 'Reparacion', 'dfgdfhfgh', 'sadfasdf', '2018-06-05 03:36:31', 'Realizado'),
	(9, '14200141', 'fsdfsdfsdf', 'Instalacion', 'sdfsadfsaad', 'fdsdfasdf', '2018-06-05 13:18:51', 'Realizado'),
	(10, '14200145', 'SALINAS', 'Mantenimiento PC', 'FISI', 'COSA', '2018-06-05 13:29:23', 'Realizado'),
	(11, '14200143', 'Salinas', 'Mantenimiento PC', 'Laboratorio 10', '', '2018-06-05 14:33:38', 'Pendiente'),
	(12, '14200143', 'Mota', 'Mantenimiento PC', 'Laboratorio 10', 'No prende la Pc', '2018-06-05 14:36:38', 'Pendiente');
/*!40000 ALTER TABLE `solicitud_servicio` ENABLE KEYS */;

-- Volcando estructura para tabla soportel.trabajador
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
) ENGINE=InnoDB AUTO_INCREMENT=14200144 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soportel.trabajador: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` (`codigo`, `Nombre`, `DNI`, `FechaNacimiento`, `usuario`, `TipoDeTrabajador`, `pass`) VALUES
	(14200140, 'Ronald Dante Lindo Jaimes', '76188250', '1994-04-19', 'ronald', 'Bolsista', '1234'),
	(14200141, 'Gustavo Jose Lloclle Quipesivana', '76188250', '1996-01-02', 'gustavo', 'Bolsista', '1234'),
	(14200143, 'Jhon Macazana Romero', '76654165', '1993-06-05', 'jhon', 'Bolsista', '1234');
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;

-- Volcando estructura para tabla soportel.turno
CREATE TABLE IF NOT EXISTS `turno` (
  `idturno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idTrabajador` int(10) unsigned NOT NULL,
  `horai` time NOT NULL,
  `horaf` time NOT NULL,
  `dia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idturno`),
  KEY `idTrabajador` (`idTrabajador`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soportel.turno: 2 rows
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
INSERT INTO `turno` (`idturno`, `idTrabajador`, `horai`, `horaf`, `dia`) VALUES
	(101, 14200141, '09:00:00', '19:00:00', 'martes'),
	(102, 14200140, '13:00:00', '19:00:00', 'martes');
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;

-- Volcando estructura para tabla soportel.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `IdUsuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  KEY `NombreCompleto` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soportel.usuario: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`IdUsuario`, `Nombre`, `Tipo`) VALUES
	(1, 'Juan Gutierrez', 'Estudiante'),
	(2, 'Jhon Macazana', 'Profesor'),
	(3, 'Salinas', 'Docente');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
