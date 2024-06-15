
<?php
include "4.Conexion.php";

$numero_doc = $_POST['txtnumero_doc'];
mysqli_query($conexion,"DELETE FROM usuarios where numero_doc='$numero_doc'") or die ("error al eliminar");
mysqli_close($conexion);
header("Location: Gestionar_usuarios.php"); 
exit();
?>

