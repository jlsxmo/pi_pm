<?php
#Función para llamar el archivo conexión.php/
include('Conexion.php');

#Variables del formulario/
$nombre_ad = $_POST['nombre'];
$paterno_ad = $_POST['paterno'];
$materno_ad = $_POST['materno'];
$cargo_ad = $_POST['cargo'];
$usuario_ad = $_POST['usuario'];
$contra_ad = $_POST['contra'];
$contraa_ad = $_POST['contra_2'];  


  #Variable de consulta con la función del insert into/
  $consulta = mysqli_query ($Conexion,"CALL InsertarAdministrador('$nombre_ad', 
  '$paterno_ad', '$materno_ad', '$cargo_ad', '$usuario_ad', '$contra_ad', '$contraa_ad')");
 if (!$consulta) {#Si hay error en los datos no se realiza la inserción/
   echo "Error al realizar un registro";
 }else {
   require("Registro_Admin.html");
 }

mysqli_close($Conexion);#Cierre de la variable de conexión/
?>