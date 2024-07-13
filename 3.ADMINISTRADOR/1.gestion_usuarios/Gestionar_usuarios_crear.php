<html>
<head>
<title>Registro </title>
</head>
<body>
<?php
$conexion1 = mysqli_connect("localhost:3306", "root","", "maxiofertas_la_38") or
die("Problemas con la conexión");
mysqli_query($conexion1, "insert into usuarios(numero_doc, tipo_doc, nombre, apellidos, direccion, telefono,fecha_nacimiento, correo,contraseña,contraseña_confirmada) values(
'$_REQUEST[numero_doc]',
'$_REQUEST[tipo_doc]',
'$_REQUEST[nombre]',
'$_REQUEST[apellidos]',
'$_REQUEST[direccion]',
'$_REQUEST[telefono]',
'$_REQUEST[fecha_nacimiento]',
'$_REQUEST[correo]',
'$_REQUEST[contraseña]',
'$_REQUEST[contraseña_confirmada]'
)")or die("Problemas en el select".
mysqli_error($conexion1));
mysqli_close($conexion1);
header("Location: /Sena2/3.ADMINISTRADOR/1.gestion_usuarios/Gestionar_usuarios.php"); 
exit();

?>
</body>
</html>