<?
session_start();

include "4.Conexion.php";

if(isset($_POST ['Correo_electronico']) && isset($_POST['contraseña']))
function validate ($data){
    $data= trim ($data);
    $data= stripslashes($data);
    $data= htmlspecialchars ($data);

    return $data;

}
    $correo = validate ($_POST['Correo_electronico']);
    $contraseña = validate ($_POST['contraseña']);

   if (empty($correo))( {
    header("Location: Inicio-sesion/inicio-sesion.php?error= El usuario es requerido");
    exit ();
   }elseif (empty($contraseña)){
    header( "Location: Inicio-sesion/inicio-sesion.php?error= El contraseña es requerida");
    exit ();
   }else{
        $contraseña = md5($contraseña);
   
        $sql = "select * from  usuarios where correo = '$correo' AND  contraseña='$contraseña'";
        $result = mysqli_query ($conexion,$sql);

        if (mysqli_num_rows($result)=== 1) {
            $row = mysqli_fetch_assoc($result);
            if ($row ['Correo_electronico'] === $correo && $row['contraseña'] === $contraseña){
                $_SESSION['Correo_electronico'] = $row ['Correo_electronico'];

                header("Location: Inicio-sesion/Inicio_sesion_login/inicio_sesion_home.php");
                exit()
            
            }else{
                header("Location: Inicio-sesion/inicio-sesion.php?error= El usuario o la clave son incorrectas");
                exit();
            }
        }else{
            header("Location: Inicio-sesion/inicio-sesion.php?error= El usuario o la clave son incorrectas");
                exit();
        }

   }
   )else{
    header("Location: Inicio-sesion/Inicio_sesion_login/inicio_sesion_home.php");
            exit();
   }

?>