

 <?php 

class bolsista {
  public $d;
  public $w;
  
}
require 'admin/config.php';

  require 'funciones.php';
  $conexion = conexion($bd_config);
 $id = $_POST['usuario'];
$consulta = $conexion->query('SELECT fecha ,idtrabajador FROM asistencia ORDER BY fecha ASC');
 
    $arr = array();
    while ($registro = $consulta->fetch()) {

     $ris = new bolsista();
      $ris->d = $registro['fecha'];
      $ris->w = $registro['idtrabajador'];
      array_push($arr ,$ris);
    }

    //header('Content-type: application/json; charset=utf-8');
          print json_encode($arr);
          
          exit();
?>


