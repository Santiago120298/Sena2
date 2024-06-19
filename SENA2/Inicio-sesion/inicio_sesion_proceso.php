<?php
include ('4.Conexion.php');

$correo_electronico=$_POST['correo_electronico'];
$contraseña=$_POST['contraseña'];

$consulta = "select * from usuarios where correo='$correo_electronico' and contraseña='$contraseña'";
$resultado = mysqli_query($conexion,$consulta);

$filas =mysqli_num_rows($resultado);

if ($filas){
    header("Location: /Sena2/Inicio-sesion/inicio_sesion_home.html ");

}else {
    header("Location: /Sena2/Inicio-sesion/inicio-sesion.html ");
    ?>
    <H1>ERROR DE AUTENTICACION</H1>
    <?php
}
mysqli_free_result($resultado);
mysqli_close($conexion);

?>