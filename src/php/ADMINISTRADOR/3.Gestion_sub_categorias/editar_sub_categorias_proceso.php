<?php
   include "4.Conexion.php";

   $id =$_POST['txtid'];
   $nombre =$_POST['txtnombre'];
   $categoria_id_categoria =$_POST['txtcategoria_id_categoria'];


mysqli_query($conexion,"UPDATE sub_categorias SET nombre='$nombre',categoria_id_categoria='$categoria_id_categoria'  WHERE`id`='$id'") or die ("error al editar");
mysqli_close($conexion);
header("Location: Gestionar_sub_categorias.php"); 


?>