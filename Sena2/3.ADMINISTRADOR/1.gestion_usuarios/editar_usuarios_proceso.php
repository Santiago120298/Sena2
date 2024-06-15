<?php
   include "4.Conexion.php";

   $numero_doc =$_POST['txtnumero_doc'];
   $tipo_doc =$_POST['txttipo_doc'];
   $nombre =$_POST['txtnombre'];
   $apellidos =$_POST['txtapellidos'];
   $direccion =$_POST['txtdireccion'];
   $telefono =$_POST['txttelefono'];
   $fecha_nacimiento=$_POST['txtfecha_nacimiento'];
   $correo =$_POST['txtcorreo'];
   $contraseña=$_POST['txtcontraseña'];
   $contraseña_confirmada =$_POST['txtcontraseña_confirmada'];

mysqli_query($conexion,"UPDATE usuarios SET tipo_doc='$tipo_doc',nombre='$nombre',apellidos='$apellidos',direccion='$direccion',telefono='$telefono',
fecha_nacimiento='$fecha_nacimiento',correo='$correo',contraseña='$contraseña',contraseña_confirmada='$contraseña_confirmada' WHERE`numero_doc`='$numero_doc'") or die ("error al editar");
mysqli_close($conexion);
header("Location: Gestionar_usuarios.php"); 


?>