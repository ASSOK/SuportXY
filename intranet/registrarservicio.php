<?php 
session_start();

if(isset($_SESSION['usuario'])){
	

	
	  require 'views/servicio.view.php';


	}
	else {
		header('Location: login.php');
	}
 ?>


 </body>
 </html>