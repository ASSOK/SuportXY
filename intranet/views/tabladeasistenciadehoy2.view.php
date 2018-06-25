<?php require 'intranet.view.php'; ?>
<div class="container contenido">
   <div class="row">
      <div class="col-md-12 text-center">
        <h3 align="center">Asistencia por fecha</h3>
      <div class="container">
        

        <form name="busqueda" class="buscar" action="tabladeasistenciadehoy2.php" method="get">
          <input type="text" name="busqueda" placeholder="Buscar">
          <button type="submit" class="icono fa fa-search"></button>
        </form>
      
      </div>
        <hr>
      </div>
    </div>
  <div class="row">
      <div class="col-md-12">
        <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
        <tr>
          <th>Nombre</th>
          <th>Turno</th>
          <th>Hora de Ingreso</th>
          <th>Asistencia</th>
        </tr>
      </thead>
     <tbody>   
      <?php foreach($resultados as $post): ?>
     <!--<?php /*var_dump($post);*/ ?>--> 
        <tr>
          <td><?php  echo $post['nombre']?></td>
          <td><?php  echo $post['dia']?></td>
          <td><?php  echo $post['hora']?></td>
          <td><?php  echo $post['fecha']?></td>
        </tr> 
      <?php endforeach;?>  
     </tbody>
    </table>
  </div>
 </div>
  </div>
  <script src="../js/jquery.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/jquery.dataTables.min.js"></script>
  <script src="../js/script.js"></script>
  <script src="../js/dataTables.bootstrap.min.js"></script>
</body>
</html>
