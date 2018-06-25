<?php session_start();

require '../admin/config.php';
require 'funciones.php';

$conexion = conexion($bd_config);

if(!$conexion){
	header('Location: error.php');
}

if($_SERVER['REQUEST_METHOD']=='POST'){
	$usuario=limpiarDatos($_POST['usuario']);
	$trabajador=limpiarDatos($_POST['trabajador']);
	$servicio=limpiarDatos($_POST['servicio']);
	$lugar=limpiarDatos($_POST['lugar']);
	$detalle=limpiarDatos($_POST['detalle']);
	$Tipo=limpiarDatos($_POST['Tipo']);

	$statement=$conexion->prepare(
		'INSERT INTO solicitud_servicio(id,trabajador,usuario,servicio,lugar,detalle)
		VALUES (null,:trabajador,:usuario,:servicio,:lugar,:detalle)'
		);

	$statement2=$conexion->prepare(
		'INSERT INTO usuario(IdUsuario,Nombre,Tipo)
		VALUES (null,:usuario,:tipo)'
		);

	$statement->execute(array(
		':trabajador'=>$trabajador,
		':usuario'=>$usuario,
		':servicio'=>$servicio,
		':lugar'=>$lugar,
		':detalle'=>$detalle,
		));

	$statement2->execute(array(
		':usuario'=>$usuario,
		':Tipo'=>$Tipo,
		));

	header('Location: orden_servicio.php');
}

require '../views/nuevo_servicio.view.php';

 ?>