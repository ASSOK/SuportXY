<?php require 'intranet.view.php'; ?>
	
	<div class="contenedor2">
		<div class="post">
				<article>
					<h2 class="titulo">NUEVO SERVICIO</h2>
					<form method ="post" enctype="multipart/form-data" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>">				
						
						<label>Bolsista: </label>
						<select name="trabajador" id="trabajador">
							<?php 
								$sentencia = $conexion -> prepare ("SELECT * FROM trabajador");
								$sentencia->execute();
								$rec=$sentencia->fetchAll();
								foreach($rec as $row){
									echo "<option value ='".$row['codigo']."'";
									echo ">";
									echo $row['Nombre'];
									echo "</option>";
								}				
							 ?>
						</select>
							
						<label>Cliente: </label>				
						<input type="text" name="usuario" placeholder="Usuario">
				
						<label>Tipo Cliente: </label>
								<select nombre="Tipo">
									<option value="Administrativo">Administrativo</option>
									<option value="Alumno">Alumno</option>
									<option value="Docente">Docente</option>				
								</select>

						<label for="">Servicio a realizar: </label>
						<select name="servicio" id="servicio">
							<?php 
								$sentencia = $conexion -> prepare ("SELECT * FROM servicio");
								$sentencia->execute();
								$rec=$sentencia->fetchAll();
								foreach($rec as $row){
									echo "<option value ='".$row['nombre']."'";
									echo ">";
									echo $row['nombre'];
									echo "</option>";
								}				
							 ?>
						</select>

						<label for="">Detalle del servicio: </label>
						<input type="text" name="detalle" placeholder="Detalle">

						<label for="">Lugar: </label>
						<input type="text" name="lugar" placeholder="Lugar">
						<input type="submit" value="Crear Servicio">
					</form>		
				</article>
				
		</div>
		<?php require 'footer.php';?>
	</div>
