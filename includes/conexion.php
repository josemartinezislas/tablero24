<?php
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
    //echo 'conexion estabecida...!!!';
}

?>