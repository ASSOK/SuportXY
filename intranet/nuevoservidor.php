
<?php session_start();

require 'admin/config.php';
require 'funciones.php';

$conexion = conexion($bd_config);

if(!$conexion){
	header('Location: error.php');
}

if($_SERVER['REQUEST_METHOD']=='POST'){
	$tipo=limpiarDatos($_POST['tipo']);
	$nombre=limpiarDatos($_POST['nombre']);

	$statement=$conexion->prepare(
		'INSERT INTO inventario_equipo(idInventario,tipo,nombre)
		VALUES (null,:tipo,:nombre)'
		);


	$statement->execute(array(
		':tipo'=>$tipo,
		':nombre'=>$nombre,
		));

	echo 'vas bien';
		header('Location: servidor_registro.php');

	//header('Location: orden_servicio.php');
}

require 'views/nuevoservidor1.view.php';

 ?>