<?php session_start();

require '../admin/config.php';
require 'funciones.php';

$conexion = conexion($bd_config);

if(!$conexion){
	header('Location: error.php');
}

$error='';

if($_SERVER['REQUEST_METHOD']=='POST'){
	
	$codigo=$_POST['codigo'];
	$nombre=limpiarDatos($_POST['nombre']);
	$DNI=limpiarDatos($_POST['DNI']);
	$tipo=limpiarDatos($_POST['tipo']);
	$fechaNacimiento=$_POST['fecha'];
	$usuario=limpiarDatos($_POST['usuario']);
	$pass1=limpiarDatos($_POST['contraseña1']);
	$pass2=limpiarDatos($_POST['contraseña2']);

	if(empty($codigo) or empty($nombre) or empty($DNI) or empty($fechaNacimiento) or empty($usuario) or  empty($pass1) or  empty($pass2)){
		$error.='<li>Por favor rellene todos los campos</li>';
	}else{
		
		$statement = $conexion->prepare('SELECT * FROM trabajador WHERE codigo=:codigo LIMIT 1' );
		$statement->execute(array(':codigo'=>$codigo));
		$resultado=$statement->fetch();

		if($resultado!=false){
			$error.='<li> El codigo ya existe </li>';
		}

		/*$pass1 = hash('sha512', $pass1);
		  $pass2 = hash('sha512', $pass2);*/

		if($pass1!=$pass2){
			$error.='<li> Las contraseñas son distintas </li>';
		}

	}

	if($error==''){
		$statement=$conexion->prepare(
		'INSERT INTO trabajador(codigo,nombre,DNI,TipoDeTrabajador,fechaNacimiento,usuario,pass)
		VALUES (:codigo,:nombre,:DNI,:tipo,:fechaNacimiento,:usuario,:pass)'
		);

		$statement->execute(array(
			':codigo'=>$codigo,
			':nombre'=>$nombre,
			':DNI'=>$DNI,
			':tipo'=>$tipo,
			':fechaNacimiento'=>$fechaNacimiento,
			':usuario'=>$usuario,
			':pass'=>$pass1,
		));

		header('Location: lista_usuarios.php');
	}

}
require '../views/registrar_trabajador.view.php';

 ?>