<?php 

function conexion($bd_config){
	try {
		$conexion = new PDO('mysql:host=localhost;dbname='.$bd_config['basedatos'],$bd_config['usuario'],$bd_config['pass']);
		return $conexion;
	} catch (PDOException $e) {
		return false;
	}
}

function limpiarDatos($datos){
	$datos=trim($datos);//elimina espacios
	$datos=stripcslashes($datos);//quita las barras //
	$datos=htmlspecialchars($datos);
	return $datos;
}

function datos_solicitud($conexion){
	//$inicio = (pagina_actual()>1) ? pagina_actual()*$post_por_pagina-$post_por_pagina:0;
	$sentencia = $conexion -> prepare ("SELECT * FROM solicitud_servicio where estado='Pendiente' ");
	$sentencia->execute();
	return $sentencia->fetchAll();
}

function datos_realizado($conexion){
	//$inicio = (pagina_actual()>1) ? pagina_actual()*$post_por_pagina-$post_por_pagina:0;
	$sentencia = $conexion -> prepare ("SELECT * FROM solicitud_servicio where estado='Realizado' ");
	$sentencia->execute();
	return $sentencia->fetchAll();
}

/*function numero_paginas($post_por_pagina,$conexion){
	$total_post=$conexion->prepare('SELECT FOUND_ROWS() as total');
	$total_post->execute();
	$total_post=$total_post->fetch();

	$numero_paginas=ceil($total_post/$post_por_pagina);
	return $numero_paginas;
}*/

function pagina_actual(){
	return isset($_GET['p']) ? (int)$_GET['p'] : 1;
}

function id_articulo($id){
	return (int)limpiarDatos($id);
}

function obtener_post_por_id($conexion,$id){
	$resultado= $conexion->query("SELECT *FROM articulos WHERE id= $id LIMIT 1");
	$resultado= $resultado->fetchAll();
	return ($resultado) ? $resultado : false;
}

function insertarAsistencia($hora , $codigoUsuario ,$codigoEmpleado){
	$statement=$conexion->prepare(
		'INSERT INTO servicios(id,titulo,extracto)
		VALUES (null,:titulo,:extracto)'
		);

	$statement->execute(array(
		':titulo'=>$titulo,
		':extracto'=>$extracto
		));
}

function fecha($fecha){
	$timestamp= strtotime($fecha);
	$meses = ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Agosto','Setiembre','Octubre','Noviembre','Diciembre'];
	$dia = date('d',$timestamp);
	$mes =date('m',$timestamp)-1;
	$year = date('Y',$timestamp);

	$fecha = "$dia de ".$meses[$mes]. " del $year";
	return $fecha;
}

function datos_realizado2($conexion){
	//$inicio = (pagina_actual()>1) ? pagina_actual()*$post_por_pagina-$post_por_pagina:0;
	$sentencia = $conexion -> prepare ("SELECT * FROM inventario_equipo; ");
	$sentencia->execute();
	return $sentencia->fetchAll();
}

 ?>