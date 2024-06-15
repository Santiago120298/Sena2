<?php
   include "4.Conexion.php";

   $id_categoria =$_POST['txtid_categoria'];
   $nombre =$_POST['txtnombre'];


mysqli_query($conexion,"UPDATE categoria SET nombre='$nombre' WHERE`id_categoria`='$id_categoria'") or die ("error al editar");
mysqli_close($conexion);
header("Location: Gestionar_categorias.php"); 


?>