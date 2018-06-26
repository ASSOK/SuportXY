<?php session_start();

require '../admin/config.php';
require 'funciones.php';

$conexion = conexion($bd_config);

if(!$conexion){
	header('Location: error.php');
}

if($_SERVER['REQUEST_METHOD']=='POST'){
	$id=$_POST['id_objeto'];
	$entregador=limpiarDatos($_POST['entregador']);
	$nombre=limpiarDatos($_POST['nombre']);


	$statement2=$conexion->prepare(
		 "UPDATE objetos_perdidos SET estado='Encontrado',entregado_por= :entregador,entregado_a_nombre=:nombre WHERE id='".$id."'"
		 );
	$statement2->execute(array(
		':entregador'=>$entregador,
		':nombre'=>$nombre));

	$statement3=$conexion->prepare(
		 "UPDATE objetos_perdidos SET fecha= CURRENT_TIMESTAMP WHERE id='".$id."'"
		 );
	$statement3->execute();
	
	header('Location: lista_objetos_encontrados.php');
}

require '../views/registrar_objeto_encontrado.view.php';

 ?>