<?php
#Función para llamar el archivo conexión.php/
include('Conexion.php');

#Variables del formulario/
$nombre = $_POST['nombre'];
$correo = $_POST['correo'];
$telefono = $_POST['telefono'];
$estado = $_POST['estado'];
$municipio = $_POST['municipio'];
$asunto = $_POST['asunto'];
$mensaje = $_POST['mensaje'];



  #Variable de consulta con la función del insert into/
  $consulta = mysqli_query ($Conexion,"CALL InsertarContactoCliente('$nombre', '$correo', '$telefono', 
  '$estado', '$municipio', '$asunto', '$mensaje')");
 if (!$consulta) {#Si hay error en los datos no se realiza la inserción/
   echo "Error al realizar un registro";
 }else {
   require("Contacto.html");
 }

mysqli_close($Conexion);#Cierre de la variable de conexión/
?>