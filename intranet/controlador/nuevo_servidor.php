
<?php session_start();

require '../admin/config.php';
require 'funciones.php';

$conexion = conexion($bd_config);

if(!$conexion){
	header('Location: error.php');
}

if($_SERVER['REQUEST_METHOD']=='POST'){
	$sbn=limpiarDatos($_POST['sbn']);
	$serie=limpiarDatos($_POST['serie']);
	$tipo=limpiarDatos($_POST['tipo']);
	$descripcion=limpiarDatos($_POST['descripcion']);
	$lugar=limpiarDatos($_POST['lugar']);
	$trabajador=limpiarDatos($_POST['trabajador']);

	$statement1=$conexion->prepare(
		'INSERT INTO equipo(ID_EQUIPO,sbn,serie,tipo,descripcion)
		VALUES (null,:sbn,:serie,:tipo,:descripcion)'
		);

	$statement1->execute(array(
		':sbn'=>$sbn,
		':serie'=>$serie,
		':tipo'=>$tipo,
		':descripcion'=>$descripcion,
		));
	
	$sentencia=$conexion->prepare ("SELECT * FROM equipo where SBN='$sbn'");
								$sentencia->execute();
								$rec=$sentencia->fetchAll();
								$EQUIPO_ID_EQUIPO=1;
								 foreach($rec as $post): 

											echo "codigo adentro"; 
										  $EQUIPO_ID_EQUIPO=$post['ID_EQUIPO'];											
										  echo $post['ID_EQUIPO'];
									
								 endforeach;

	$statement2=$conexion->prepare(
		'INSERT INTO inventario(EQUIPO_ID_EQUIPO,Trabajador_codigo,LUGAR)
		VALUES (:EQUIPO_ID_EQUIPO,:Trabajador_codigo,:LUGAR)'
		);


	



	$statement2->execute(array(
		':EQUIPO_ID_EQUIPO'=>$EQUIPO_ID_EQUIPO,
		':Trabajador_codigo'=>$trabajador,
		':LUGAR'=>$lugar,
		));
	/****************************************************ESTO ES UNA PRUEBA*/

	/*$statement3=$conexion->prepare(
		'INSERT INTO lugarinventario(id,lugar)
		VALUES (null,:lugar)'
		);

	$statement4=$conexion->prepare(
		'INSERT INTO pruebaEquipo(id,codigo_prueba)
		VALUES (null,:EQUIPO_ID_EQUIPO)'
		);

	$statement5=$conexion->prepare(
		'INSERT INTO prueba_trabajador(id,trabajador)
		VALUES (null,:trabajador)'
		);

	$statement3->execute(array(
		':lugar'=>$lugar,
		));

	$statement4->execute(array(
		':EQUIPO_ID_EQUIPO'=>$EQUIPO_ID_EQUIPO,
		));
	$statement5->execute(array(
		':trabajador'=>$trabajador,
		));*/


	/*************************************************************************************/
	echo 'vas bien';
		/*header('Location: servidor_registro.php');*/

	//header('Location: orden_servicio.php');
}

require '../views/nuevo_servidor.view.php';

 ?>