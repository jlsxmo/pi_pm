<?php
  include('Conexion.php');

#Inicializamos nuestras variables/
  $UsuarioL=$_POST['Correo'];
  $Password=$_POST['Pass'];

  #Hacemos una consulta con las variables que se han declarado arriba, con nuestras columnas de nuestra tabla cliente/
  $Busqueda=mysqli_query($Conexion, "SELECT correo_electronico, contra from  Administrador
  where correo_electronico='$UsuarioL' and contra='$Password'") ;#Usamos el condicional and, si usuario y contraseña coinciden, accedemos/
  $filas = mysqli_num_rows($Busqueda);
      if($filas>0){#En el caso de ser correcto nos dirige a la página principal/
      require("Inicio_2.HTML");
    }else {
      echo 'Verficar su usuario o contraseña';
    }
    mysqli_free_result($Busqueda);
    mysqli_close($Conexion);
?>