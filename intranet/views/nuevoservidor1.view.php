<?php require 'intranet.view.php'; ?>

	<div class="contenedor3">
		<div class="post">
				<article>
					<h2 class="titulo">Nuevo Servidor</h2>
					<form class="formulario" method ="post" enctype="multipart/form-data" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>">
						<input type="text" name="tipo" placeholder="TIPO">
						<input type="text" name="nombre" placeholder="NOMBRE">
						<input type="submit" value="Crear ">
	
					</form>		
				</article>
				
		</div>
	</div>


<?php require 'footer.php' ?>