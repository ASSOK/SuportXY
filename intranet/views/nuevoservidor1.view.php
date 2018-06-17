<?php require 'intranet.view.php'; ?>

	<div class="contenedor3">
		<div class="post">
				<article>
					<h2 class="titulo">Nuevo Servidor</h2>
					<form class="formulario" method ="post" enctype="multipart/form-data" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>">
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
						<label for="">SBN:</label>
						<input type="text" name="sbn" placeholder="SBN">
						<label for="">Serie:</label>
						<input type="text" name="serie" placeholder="SERIE">
						<label for="">Tipo:</label>
						<input type="text" name="tipo" placeholder="TIPO">
						<label for="">LUGAR: </label>
						<select name="lugar" id="lugar">
							  <option value="laboratorio 1">laboratorio 1</option>
							  <option value="laboratorio 2">laboratorio 2</option>
							  <option value="laboratorio 3">laboratorio 3</option>
							  <option value="laboratorio 4">laboratorio 4</option>
							  <option value="laboratorio 5">laboratorio 5</option>
							  <option value="laboratorio 6">laboratorio 6</option>
							  <option value="laboratorio 7">laboratorio 7</option>
							  <option value="laboratorio 8">laboratorio 8</option>
							  <option value="laboratorio 9">laboratorio 9</option>
							  <option value="salones">salones</option>
							  <option value="decanato">Decanato</option>
							  <option value="area de matricula">Area de Matricula</option>
						</select>
						<label for="">Descripcion:</label>
						<input type="text" name="descripcion" placeholder="DESCRIPCION">
						<input type="submit" value="Crear ">
	
					</form>		
				</article>
				
		</div>
	</div>


<?php require 'footer.php' ?>