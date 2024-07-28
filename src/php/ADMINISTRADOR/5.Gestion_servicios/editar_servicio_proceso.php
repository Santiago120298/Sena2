<?php
   include "4.Conexion.php";

   $id =$_POST['txtid'];
   $tipo_servicio =$_POST['txttipo_servicio'];
   $caracteristicas_servicio =$_POST['txtcaracteristicas_servicio'];



mysqli_query($conexion,"UPDATE servicios SET tipo_servicio='$tipo_servicio',caracteristicas_servicio='$caracteristicas_servicio' WHERE`id`='$id'") or die ("error al editar");
mysqli_close($conexion);
header("Location: Gestionar_servicios.php"); 


?>