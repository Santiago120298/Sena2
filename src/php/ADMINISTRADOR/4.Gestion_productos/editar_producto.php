<!DOCTYPE html>
<html lang="es">
<head> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Administrativo Usuarios</title>
    
    <!-- Incluye Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <?php
    include "4.Conexion.php";
    ?>
    <header style="color: yellow;" class="bg-success text-center p-4 border-bottom-2">
        <nav class="fixed-top bg-success navbar navbar-expand-lg">
            <h1 style="text-align:left;">MAXIOFERTAS LA 38</h1>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a style="color: yellow;" class="nav-link" href="#inicio">Inicio</a></li>
                <li class="nav-item"><a style="color: yellow;" class="nav-link" href="#productos">Productos</a></li>
                <li class="nav-item"><a style="color: yellow;" class="nav-link" href="#carrito">Carrito</a></li>
                <li class="nav-item"><a style="color: yellow;" class="nav-link" href="registro.html">Registro</a></li>
                <li class="nav-item"><a style="color: yellow;" class="nav-link" href="inicio-sesion.html">Inicio de Sesión</a></li>
            </ul>
        </nav>
    </header>
    <!-- Cuadro para CRUD-->
    <div class="d-flex justify-content-center container-fluid border-success mt-5">
        <div class="col-3">
            <div class="col-12">
                <div class="d-flex align-items-center justify-content-center h-100">
                    <a href="/2771446-G2/PHP/Gestionar_productos.php" class="btn btn-success">Ir a Gestionar Productos</a>
                </div>
            </div>
    
            <!-- Función: Gestionar Categorías y Subcategorías -->
            <div class="col-12 mt-3">
                <div class="d-flex align-items-center justify-content-center h-100">
                    <a href="/2771446-G2/PHP/Gestionar_categorias.php" class="btn btn-success">Ir a Gestionar Categorías</a>
                </div>
            </div>
    
            <!-- Función: Gestionar Ventas -->
            <div class="col-12 mt-3">
                <div class="d-flex align-items-center justify-content-center h-100">
                    <a href="gestion-ventas.html" class="btn btn-success">Ir a Gestionar Ventas</a>
                </div>
            </div>
    
            <!-- Función: Gestionar Servicios -->
            <div class="col-12 mt-3">
                <div class="d-flex align-items-center justify-content-center h-100">
                    <a href="gestion-servicios.html" class="btn btn-success">Ir a Gestionar Servicios</a>
                </div>
            </div>
        </div>
        <div class="col-9 border border-success">
           
                    <?php
                    $id = $_GET['id'];
                    $sql = "SELECT * FROM producto WHERE id = $id";
                    $result = mysqli_query($conexion, $sql);
                    while ($mostrar = mysqli_fetch_array($result)) {
                    ?>
                        <tr>
                            <form action="editar_producto_proceso.php" method="POST">
                                <input type="hidden" value="<?php echo $mostrar['id']?>" name="txtid">
                                <input type="text" value="<?php echo $mostrar['nombre']?>" name="txtnombre">
                                <input type="text" value="<?php echo $mostrar['lote']?>" name="txtlote">
                                <input type="text" value="<?php echo $mostrar['tamaño']?>" name="txttamaño">
                                <input type="text" value="<?php echo $mostrar['precio']?>" name="txtprecio">
                                <input type="text" value="<?php echo $mostrar['disponibilidad']?>" name="txtdisponibilidad">
                                <input type="text" value="<?php echo $mostrar['caracteristicas']?>" name="txtcaracteristicas">
                                <input type="hidden" value="<?php echo $mostrar['sub_categorias_id']?>" name="txtsub_categorias_id">
                                <input type="hidden" value="<?php echo $mostrar['sub_categorias_categoria_id_categoria']?>" name="txtsub_categorias_categoria_id_categoria">
                                <input type="submit" value="Actualizar">
                            </form>
                        </tr>
                    <?php
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
    </div>
    <footer class="bg-dark text-white text-center p-3 mt-5">
        <p>&copy; 2024 Tu Tienda Online - Panel Administrativo</p>
    </footer>

    <!-- Incluye Bootstrap JS y Popper.js al final del archivo body para mejorar la velocidad de carga -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384
