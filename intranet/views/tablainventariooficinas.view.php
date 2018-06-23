<?php require 'intranet.view.php'; ?>
<div class="contenedor3">
    <h2>Lista de Inventarios de Aulas</h2> 
    <table border="1">
      <thead>
        <tr>
          <th>SBN</th>
          <th>Serie</th>
          <th>Tipo</th>
          <th>Descripcion</th>
        </tr>
      </thead>
          
      <?php foreach($solicitudes as $post): ?>

        <tr>
          <td><?php  echo $post['SBN']?></td>
          <td><?php  echo $post['SERIE']?></td>
          <td><?php  echo $post['TIPO']?></td>
          <td><?php  echo $post['DESCRIPCION']?></td>
        </tr> 
      <?php endforeach;?>
      
    </table>

    <?php require 'footer.php';?>
  </div>
