<?php
include "4.Conexion.php";

$id_categoria = $_POST['txtid_categoria'];
mysqli_query($conexion,"DELETE FROM categoria where id_categoria='$id_categoria'") or die ("error al eliminar");
mysqli_close($conexion);
header("Location: Gestionar_categorias.php"); 
exit();
?>