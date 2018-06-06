<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Soporte FISI</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
  <div >
    <div class="card card-login mx-auto mt-5">
      <div class="fecha">Login</div>
      <div >
        <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="POST" class="formulario" name="login">
          <div class="form-group">
            <label for="exampleInputEmail1">Usuario</label>
            <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" type="text" name="usuario" class="usuario" placeholder="Usuario">
          </div>
          <div class="form-group">
            <label for="">Contraseña</label>
            <input class="form-control" id="exampleInputPassword1" type="password" name="password" class="password"
         placeholder="Contraseña">
          </div>
          <a class="btn btn-primary btn-block" onclick ="login.submit()" >Ingresar</a>

          <?php if(!empty($errores)): ?>
        <div class="error">
          <ul>
            <?php echo $errores; ?>
          </ul>     
        </div>
      <?php endif; ?>
        </form>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>
