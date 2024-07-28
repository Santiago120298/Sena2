<?php
include "4.Conexion.php";

$id = $_POST['txtid'];
mysqli_query($conexion,"DELETE FROM producto where id='$id'") or die ("error al eliminar");
mysqli_close($conexion);
header("Location: Gestionar_productos.php"); 
exit();
?>