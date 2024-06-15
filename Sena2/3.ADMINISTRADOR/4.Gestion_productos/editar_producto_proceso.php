<?php
   include "4.Conexion.php";

   $id =$_POST['txtid'];
   $nombre =$_POST['txtnombre'];
   $lote =$_POST['txtlote'];
   $tamaño =$_POST['txttamaño'];
   $precio =$_POST['txtprecio'];
   $disponibilidad =$_POST['txtdisponibilidad'];
   $caracteristicas =$_POST['txtcaracteristicas'];
   $sub_categorias_id =$_POST['txtsub_categorias_id'];
   $sub_categorias_categoria_id_categoria =$_POST['txtsub_categorias_categoria_id_categoria'];


mysqli_query($conexion,"UPDATE producto SET nombre='$nombre',lote='$lote',tamaño='$tamaño',precio='$precio',disponibilidad='$disponibilidad',
caracteristicas='$caracteristicas',sub_categorias_id='$sub_categorias_id',sub_categorias_categoria_id_categoria='$sub_categorias_categoria_id_categoria'  WHERE`id`='$id'") or die ("error al editar");
mysqli_close($conexion);
header("Location: Gestionar_productos.php"); 


?>