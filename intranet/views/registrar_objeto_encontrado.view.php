<?php require 'intranet.view.php'; ?>
	
	<div class="contenedor2">
		<div class="row">
			<div class="col-md-12 text-center">
				<h1>REGISTRO DE ENTREGA </h1>
				<hr>
			</div>
		</div>
		<div class="post">
				<article>
					<form method ="post" enctype="multipart/form-data" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>">				
						
						<label>Bolsista que entrega: </label>
						<select name="entregador" id="entregador">
							<?php 
								$sentencia = $conexion -> prepare ("SELECT * FROM trabajador");
								$sentencia->execute();
								$rec=$sentencia->fetchAll();
								foreach($rec as $row){
									echo "<option value ='".$row['codigo']."'";
									echo ">";
									echo $row['nombre'];
									echo "</option>";
								}				
							 ?>
						</select>
						<label>Objeto a entregar: </label>
						<select name="id_objeto" id="id_objeto">
							<?php 
								$sentencia = $conexion -> prepare ("SELECT * FROM objetos_perdidos WHERE estado='Perdido'");
								$sentencia->execute();
								$rec=$sentencia->fetchAll();
								foreach($rec as $row){
									echo "<option value ='".$row['id']."'";
									echo ">";
									echo $row['objeto']." ".$row['descripcion'];
									echo "</option>";
								}				
							 ?>
						</select>
							
	
						<label>Nombre de Dueño:  </label>
						<input type="text" name="nombre" placeholder="Nombre">
										
						<input type="submit" value="Registar Entrega">
					</form>		
				</article>			
		</div>
	</div>
