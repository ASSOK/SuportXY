<?php require 'intranet.view.php'; ?>
<div class="container contenido">
   <div class="row">
      <div class="col-md-12 text-center">
        <h1>INVENTARIO DE LABORATORIOS</h1>
        <hr>
      </div>
    </div>
  <div class="row">
      <div class="col-md-12">
        <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
               <tr>
               <th>SBN</th>
                <th>Serie</th>
               <th>Tipo</th>
               <th>Descripcion</th>
             </tr>
           </thead>
          <tbody>
           <?php foreach($solicitudes as $post): ?>

        <tr>
          <td><?php  echo $post['SBN']?></td>
          <td><?php  echo $post['SERIE']?></td>
          <td><?php  echo $post['TIPO']?></td>
          <td><?php  echo $post['DESCRIPCION']?></td>
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
