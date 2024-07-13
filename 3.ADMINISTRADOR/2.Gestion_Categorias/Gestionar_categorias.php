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
    <header style="color: yellow;" class=" bg-success text-center p-4 border-b-2">
        <nav class="fixed-top bg-success navbar navbar-expand-lg ">
            <h1 style="text-align:left;">MAXIOFERTAS LA 38</h1>
            <ul  class="navbar-nav ml-auto">
                <li class="nav-item"><a  style="color: yellow;" class="nav-link" href="#inicio">Inicio</a></li>
                <li class="nav-item"><a style="color: yellow;" class="nav-link" href="#productos">Productos</a></li>
                <li class="nav-item"><a style="color: yellow;" class="nav-link" href="#carrito">Carrito</a></li>
                <li class="nav-item"><a style="color: yellow;" class="nav-link" href="registro.html">Registro</a></li>
                <li class="nav-item"><a style="color: yellow;" class="nav-link" href="inicio-sesion.html">Inicio de Sesión</a></li>
            </ul>
        </nav>
    </header>
    <!-- Cuadro para CRUD-->
    <div  class="d-flex justify-content-center container-fluid border-success mt-5">
        <div  class="col-3">
            <div class="col-12">
                <div style="margin-top: 115px;" class="d-flex align-items-center justify-content-center h-100 ">
                    <a  style="width:250px" href="/Sena2/3.ADMINISTRADOR/1.gestion_usuarios/Gestionar_usuarios.php" class="btn btn-success">Ir a Gestion de usuarios</a>
                </div>
            </div>
            <div class="col-12 mt-3">
                <div class="d-flex align-items-center justify-content-center h-100">
                    <a style="width:250px;" href="/Sena2/3.ADMINISTRADOR/3.Gestion_sub_categorias/Gestionar_sub_categorias.php" class="btn btn-success">Ir a Gestionar Sub categorias</a>
                </div>
            </div>
            
            <!-- Función: Gestionar Categorías y Subcategorías -->
            <div class="col-12 mt-3">
                <div class="d-flex align-items-center justify-content-center h-100">
                    <a style="width:250px;" href="/Sena2/3.ADMINISTRADOR/4.Gestion_productos/Gestionar_productos.php" class="btn btn-success">Ir a Gestionar Productos</a>
                </div>
            </div>
            
    
            <!-- Función: Gestionar Ventas -->
            
            <div class="col-12 mt-3">
                <div class="d-flex align-items-center justify-content-center h-100">
                    <a style="width:250px;" href="/Sena2/3.ADMINISTRADOR/5.Gestion_servicios/Gestionar_servicios.php" class="btn btn-success">Ir a Gestionar Servicios</a>
                </div>
            </div>
        </div>
        <div  class="col-9  ">
            
        <!-- CRUD de Usuarios -->
            <div class="container mt-4">
                <h2 style="color: green;" class="text-center">Gestión de Categorias</h2>
                <a style="width:250px;" href="usuarios_crear.php" class="btn btn-success">Crear Nueva categoria</a>

        
                <table  class="table table-bordered table-striped mt-2 table-responsive">
                    <thead>
                        <tr style="background-color: #28A745;color: #FFFF00;">
                            <th >Id categoria</th>
                            <th >Nombre categoria</th>
                            <th >Acciones</th>
                            

                        </tr>
                    </thead>
                    <tbody>
                       
                <?php
                $sql = "SELECT * FROM  categoria";
                $result = mysqli_query($conexion,$sql);

                while($mostrar = mysqli_fetch_array($result)){

                ?>
                    <thead>
                        <tr>
                            <th style="background-color: #EAEDED;"><?php echo $mostrar['id_categoria']?></th>
                            <th style="background-color: #EAEDED;"><?php echo $mostrar['nombre']?></th>
                          
                            <td style="background-color: #EAEDED;">
                                <a  style="width: 100px;" class="btn btn-success"href="editar_categoria.php?id_categoria=<?php echo $mostrar['id_categoria'] ?>">Editar</a>


                               <form  action="eliminar_categoria.php" method="post">
                               <input type="hidden" value=<?php echo $mostrar['id_categoria'] ?> name="txtid_categoria" readonly> 
                               <input  style="width: 100px;" class="btn btn-danger" type="submit" value="Eliminar" name="btnEliminar">

                               </form>
                            </td>
                           
                        </tr>
                <?php
                }
                ?>
                    </tbody>
                </table>
             
            </div>
        </div>
    </div>
    </div>
    </div>
    <footer  class="bg-dark text-white text-center p-3  mt-5 ">
        <p>&copy; 2024 Tu Tienda Online - Panel Administrativo</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
