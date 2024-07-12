<?php
#Declaración de variables para conexión
$usuario ="root";
$password =""; #Aquí se coloca la contraseña con la inicia sesión en xampp
$servidor= "localhost";
$BD = "Juzgado"; #Nombre de la base de datos

#Conexión de Servidor
$Conexion = mysqli_connect ($servidor, $usuario, $password) or die
("Nose puede conectar al servidor, revisar la contraseña o usuario;");

#Conexión a la base de datos
$ConsultaBase = mysqli_select_db ($Conexion,$BD) or die ("Nos se establecio accesoa a la base de datos");

#JAVIER VALENTÍN LÓPEZ TAPIA
#7SCG2

?>
