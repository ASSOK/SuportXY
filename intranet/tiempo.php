<?php //Ejemplo curso PHP aprenderaprogramar.com
require 'admin/config.php';
require 'funciones.php';
$hoy = date("Y-n-j");
echo date('Y-n-j h:i:s');
echo $hoy;

$conexion= conexion($bd_config);

if(!$conexion){
	header('Location: error.php');
}

$statement1=$conexion->prepare(
		'SELECT * FROM trabajador'
		);


$sentencia = $conexion -> prepare ("SELECT * FROM trabajador where Nombre='Mario Arturo Masias Vilca'");
								$aa=$sentencia->execute();
								
								$rec=$sentencia->fetchAll();
								$cod=1;

								 foreach($rec as $post): 

										$cod=$post['codigo'];
										  echo $post['codigo'];
									
								 endforeach;



								 echo $cod;
								?>