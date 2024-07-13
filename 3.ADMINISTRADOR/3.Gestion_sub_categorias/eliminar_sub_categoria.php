<?php
include "4.Conexion.php";

$id = $_POST['txtid'];
mysqli_query($conexion,"DELETE FROM sub_categorias where id='$id'") or die ("error al eliminar");
mysqli_close($conexion);
header("Location: Gestionar_sub_categorias.php"); 
exit();
?>