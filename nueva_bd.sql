-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.26-MariaDB - mariadb.org binary distribution
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soportel.asistencia: 2 rows
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
INSERT INTO `asistencia` (`idasistencia`, `idTrabajador`, `fecha`, `hora`, `asistencia`, `idturno`) VALUES
	(142001405, 14200140, '2018-06-05', '16:16:00', 'Tarde', 102),
	(142001415, 14200141, '2018-06-05', '16:45:00', 'Tarde', 101);
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;

-- Volcando estructura para tabla soportel.equipo
CREATE TABLE IF NOT EXISTS `equipo` (
  `ID_EQUIPO` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SBN` varchar(14) DEFAULT NULL,
  `SERIE` varchar(13) DEFAULT NULL,
  `TIPO` varchar(120) DEFAULT NULL,
  `DESCRIPCION` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ID_EQUIPO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soportel.equipo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;

-- Volcando estructura para tabla soportel.inventario
CREATE TABLE IF NOT EXISTS `inventario` (
  `EQUIPO_ID_EQUIPO` int(10) unsigned NOT NULL,
  `Trabajador_codigo` int(10) unsigned NOT NULL,
  `lugar` varchar(100) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EQUIPO_ID_EQUIPO`,`Trabajador_codigo`),
  KEY `Trabajador_codigo` (`Trabajador_codigo`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`Trabajador_codigo`) REFERENCES `trabajador` (`codigo`),
  CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`EQUIPO_ID_EQUIPO`) REFERENCES `equipo` (`ID_EQUIPO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soportel.inventario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;

-- Volcando estructura para tabla soportel.objetos_perdidos
CREATE TABLE IF NOT EXISTS `objetos_perdidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trabajador` int(11) DEFAULT '0',
  `usuario` varchar(50) DEFAULT '0',
  `descripcion` varchar(50) DEFAULT '0',
  `lugar` varchar(50) DEFAULT '0',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(50) DEFAULT 'Perdido',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soportel.objetos_perdidos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `objetos_perdidos` DISABLE KEYS */;
INSERT INTO `objetos_perdidos` (`id`, `trabajador`, `usuario`, `descripcion`, `lugar`, `fecha`, `estado`) VALUES
	(6, 14200140, 'ronald', 'celular', 'Salon 108', '2018-06-24 16:57:05', 'Encontrado'),
	(8, 14200141, 'Jhon Macazana', 'mp3', 'Salon 106', '2018-06-24 16:55:31', 'Encontrado'),
	(9, 14200140, 'servidores', 'Cuaderno', 'Salon 207', '2018-06-24 16:53:51', 'Encontrado'),
	(10, 14200141, 'Salinas', 'mp4', 'Salon 206', '2018-06-24 16:23:57', 'Perdido');
/*!40000 ALTER TABLE `objetos_perdidos` ENABLE KEYS */;

-- Volcando estructura para tabla soportel.servicio
CREATE TABLE IF NOT EXISTS `servicio` (
  `idServicio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idServicio`),
  KEY `titulo` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soportel.servicio: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` (`idServicio`, `nombre`) VALUES
	(5, 'Abrir LAboratorio'),
	(6, 'Cierre de Laboratorio'),
	(4, 'Instalacion'),
	(1, 'Mantenimiento PC'),
	(3, 'Reparacion');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soportel.solicitud_servicio: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `solicitud_servicio` DISABLE KEYS */;
INSERT INTO `solicitud_servicio` (`id`, `trabajador`, `usuario`, `servicio`, `lugar`, `detalle`, `fecha`, `estado`) VALUES
	(9, '14200141', 'fsdfsdfsdf', 'Instalacion', 'sdfsadfsaad', 'fdsdfasdf', '2018-06-05 13:18:51', 'Realizado'),
	(10, '14200145', 'SALINAS', 'Mantenimiento PC', 'FISI', 'COSA', '2018-06-05 13:29:23', 'Realizado'),
	(11, '14200143', 'Salinas', 'Mantenimiento PC', 'Laboratorio 10', '', '2018-06-05 14:33:38', 'Realizado'),
	(14, '14200140', 'Aldo', 'Reparacion', 'USGOM', 'Fallo en placa madre', '2018-06-05 17:39:33', 'Realizado'),
	(15, '14200141', 'Moquillaza', 'Mantenimiento PC', 'Soporte', 'limpieza de pc', '2018-06-05 17:43:13', 'Pendiente');
/*!40000 ALTER TABLE `solicitud_servicio` ENABLE KEYS */;

-- Volcando estructura para tabla soportel.trabajador
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
) ENGINE=InnoDB AUTO_INCREMENT=14200145 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla soportel.trabajador: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` (`codigo`, `nombre`, `DNI`, `fechaNacimiento`, `usuario`, `TipoDeTrabajador`, `pass`) VALUES
	(14200140, 'Ronald Dante Lindo Jaimes', '76188250', '1994-04-19', 'ronald', 'Bolsista', '1234'),
	(14200141, 'Gustavo Jose Lloclle Quipesivana', '76188250', '1996-01-02', 'gustavo', 'Bolsista', '1234'),
	(14200142, 'Mario Masias Vilca', '76488885', '1995-02-05', 'mario', 'Bolsista', '1234'),
	(14200143, 'Jhon Macazana Romero', '76654165', '1993-06-05', 'jhon', 'Bolsista', '1234'),
	(14200144, 'Saul Pampa Lobon', '76544522', '1996-06-24', 'saul', 'Bolsista', '1234');
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
