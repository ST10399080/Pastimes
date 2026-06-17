<?php
//Declaring All Variable For Server Details

//Getting The Server Name
$server =(string) "localhost";
//The Username
$username =(string) "root";
//The Password
$password=(string) "";
//The Database
$database =(string) "ClothingStore";
//Then Port Number
$port = int 3306;

//Executing The Connection
$connect = mysqli_connect($server, $username, $password, $database, $port);

//Checking If The Connection Works
if($connect){
//If It Is Connected
echo "connected";   
}
else{
    //When It Is Not Connected
    echo "not connected";
}
?>