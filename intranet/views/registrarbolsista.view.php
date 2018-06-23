<div class="container">
  <div class="jumbotron">
    <h2 align="center">Registrar Bolsista</h2>

   

     <div class="container">
     <div class="row">
	 
        <div class="col-sm-4" >
            <label for="exampleInputEmail1">Codigo</label>
            <input class="form-control"  aria-describedby="emailHelp" type="text" name="codigo" id="codigo" placeholder="Escribir codigo">         
	      </div>
        <div class="col-sm-4" >
            <label for="exampleInputEmail1">Nombre</label>
            <input class="form-control"  aria-describedby="emailHelp" type="text" name="codigo" id="nombre" placeholder="Escribir nombre">         
        </div>
        <div class="col-sm-4" >
            <label for="exampleInputEmail1">DNI</label>
            <input class="form-control"  aria-describedby="emailHelp" type="text" name="codigo" id="dni" placeholder="Escribir dni">         
        </div>
	 
	  </div>
    <div class="row">
   
        <div class="col-sm-4">
            <p >Cumpleaños</p>
            <input class="form-control"  aria-describedby="emailHelp" type="text" name="codigo" id="cumpleaños" placeholder="Escribir cumpleaños">         
        </div>
        <div class="col-sm-4" >
            <label for="exampleInputEmail1">Usuario</label>
            <input class="form-control" aria-describedby="emailHelp" type="text" name="codigo" id="usuario" placeholder="Escribir usuario">         
        </div>
        <div class="col-sm-4" >
            <label for="exampleInputEmail1">Contraseña</label>
            <input class="form-control"  aria-describedby="emailHelp" type="password" name="codigo" id="contraseña" placeholder="Escribir Contraseña">         
        </div>
   
    </div>
       
	 </div>
   <div class="container">
    <button align = "center" type="button" class="btn btn-success" id="bu" >Aceptar</button>
   </div>
	</div> 
</div>

 <script>

$(document).ready(function(){
    $("#bu").click(function(){
        
         var parametros = {
                "codigo2" : $("#codigo").val(),
                "nombre"  : $("#nombre").val(),
                "dni" : $("#dni").val(),
                "cumpleaños":$("#cumpleaños").val(),
                "usuario":$("#usuario").val(),
                "contraseña" : $("#contraseña").val()
        };
        $.ajax({
                data:  parametros, //datos que se envian a traves de ajax
                url:   'respuestaregistro.php', //archivo que recibe la peticion
                type:  'post', //método de envio
                success:  function (response) { //una vez que el archivo recibe el request lo procesa y lo devuelve

                   
                    var num = parseInt(response);
                    
                   alert(num);
                }
        });
    });

    
});

</script>