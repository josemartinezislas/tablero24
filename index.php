<?php
//comentario
$host="localhost";
$usuario="jose";
$password="302976";
$db="tablero24";
//$db="db_tablero";
//$db="api";

$conexion= new mysqli($host,$usuario,$password,$db);
if($conexion ->connect_error){
    die ("conexion establecida".$conexion->connect_error);
    echo 'Fallo en la conexion !!!';
}else{
    //echo 'conexion!! ';
}
//include 'includes/conexion.php';


header("Content-type: application/json");

$metodo=$_SERVER['REQUEST_METHOD'];
//print_r($metodo);
$path= isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '/';
$buscarId = explode('/', $path);
$id = ($path!=='/') ? end($buscarId) : null;

switch($metodo){
    case 'GET':
        consulta($conexion, $id); //echo "Consulta registros - GET -> READ";
        break;
    case 'POST':
        insertar($conexion); //echo "Insertar registros - POST -> CREATE";
        break;
    case 'PUT':
        actualiza($conexion, $id); //echo "Actualiza registros - PUT -> UPDATE";
        break;
    case 'DELETE':
        borrar($conexion, $id);//echo "Elimina registros - DELETE -> DELETE";
        break;         
    default:
        echo "metodo NO permitido";
        break;
}

function consulta($conexion, $id){
    $sql= ($id===null)  ? "SELECT * FROM t_general" 
                        : "SELECT * FROM t_general WHERE id_proy = '$id'";
    $resultado=$conexion->query($sql);
    
    if($resultado){
        $datos=array();
        while($fila=$resultado->fetch_assoc()){
            $datos[]=$fila;
        }
        echo json_encode($datos);
        //echo 'mensaaje ==> '.$id;
    }
}
function insertar($conexion){
    $dato=json_decode(file_get_contents('php://input'),true);
    $id_proy=$dato['id_proy'];
    $proy_nom=  $dato['proy_nom'];
    $proy_sect= $dato['proy_sect'];
    $proy_tipo= $dato['proy_tipo'];
    $proy_desc= $dato['proy_desc'];
    $proy_mpio= $dato['proy_mpio'];
    $proy_inver=$dato['proy_inver'];
    $proy_e_dir=$dato['proy_e_dir'];
    $proy_e_ind=$dato['proy_e_ind'];
    $proy_fase= $dato['proy_fase'];
    $proy_estat=$dato['proy_estat'];
    $proy_seg=  $dato['proy_seg'];
    $proy_stat= $dato['proy_stat'];
    echo 'El Id -> '.$id_proy.' <- fue creado!! '. PHP_EOL;
    echo 'Con el proyecto -> '.$proy_nom. PHP_EOL;

    $sql="INSERT INTO t_general(id_proy, proy_nom, proy_sect, proy_tipo, proy_desc, proy_mpio, proy_inver, proy_e_dir, proy_e_ind, proy_fase, proy_estat, proy_seg, proy_stat) VALUES('$id_proy','$proy_nom','$proy_sect','$proy_tipo','$proy_desc','$proy_mpio','$proy_inver','$proy_e_dir','$proy_e_ind','$proy_fase','$proy_estat','$proy_seg','$proy_stat')";  
       $resultado=$conexion->query($sql);

    if($resultado){
        $dato['id_proy'] = $conexion->insert_id_proy;
        echo json_encode($dato);
     }else{
        echo json_encode(array('error'=>'Error al crear usuario'));
     }
}
function borrar($conexion, $id){
    $sql= "DELETE FROM t_general WHERE id_proy = $id";
    $resultado=$conexion->query($sql);
    echo 'El Id -> '.$id.' <- fue Eliminado!! '. PHP_EOL;
    //echo 'Con el proyecto -> '.$proy_nom. PHP_EOL;

    if($resultado){
        echo json_encode(array('mensaje'=>'Usuario Eliminado'));
    }else{
        echo json_encode(array('error'=>'Error al eliminar usuario'));
    }

}
function actualiza($conexion, $id){
    $dato=json_decode(file_get_contents('php://input'),true);
    $proy_nom=$dato['proy_nom'];
    echo 'El Id -> '.$id.' <- fue actualizado!! '. PHP_EOL;
    echo 'Con el proyecto -> '.$proy_nom. PHP_EOL;

    $sql= "UPDATE t_general
    SET proy_nom = '$proy_nom' WHERE id_proy = '$id'";
    $resultado=$conexion->query($sql);

    if($resultado){
        echo json_encode(array('mensaje'=>'Usuario Actualizado'));
    }else{
        echo json_encode(array('error'=>'Error al Actualizar usuario'));
    }
}

?>