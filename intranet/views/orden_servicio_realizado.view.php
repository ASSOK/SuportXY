<?php require 'intranet.view.php'; ?>
<div class="contenedor3">
		<h2>Lista de Servicios Realizados</h2>	
		<table border="1">
			<thead>
				<tr>
					<th>Trabajador</th>
					<th>Usuario</th>
					<th>Servicio</th>
					<th>Lugar</th>
					<th>Detalle</th>
					<th>Fecha</th>		
				</tr>
			</thead>
					
			<?php foreach($solicitudes as $post): ?>

				<tr>
					<td><?php  echo $post['trabajador']?></td>
					<td><?php  echo $post['usuario']?></td>
					<td><?php  echo $post['servicio']?></td>
					<td><?php  echo $post['lugar']?></td>
					<td><?php  echo $post['detalle']?></td>
					<td><?php  echo $post['fecha']?></td>
				</tr>	
			<?php endforeach;?>
			
		</table>

		<?php require 'footer.php';?>
	</div>
