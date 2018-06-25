<?php 
session_start();

	require '../admin/config.php';

	require 'funciones.php';

	$conexion = conexion($bd_config);
	if(!$conexion){
		echo 'ERROR CONEXION';
		
	}

	if($_SERVER['REQUEST_METHOD']=='GET'){
	$id=$_GET['id'];


	$statement=$conexion->prepare(
		 "UPDATE objetos_perdidos SET estado='Encontrado' WHERE id='".$id."'"
		 );
	$statement->execute();

	$statement2=$conexion->prepare(
		 "UPDATE objetos_perdidos SET fecha= CURRENT_TIMESTAMP WHERE id='".$id."'"
		 );
	$statement2->execute();
	
	header('Location: lista_objetos_perdidos.php');
}
 ?>

 </body>
 </html>