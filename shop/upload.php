<?php
//Get All The Collected Details Of The Product
$name= $_POST["name"];
$desc = $_POST["description"];
$price =$_POST["price"];

//Check If We Got The Information About The Item
echo $name ."<br>";
echo $desc ."<br>";
echo $price ."<br>";

//The Image
echo $_FILES["image"]["name"];

echo "<br>" .$_FILES["image"]["tmp_name"];

//Moving The File To The Upload Folder
move_uploaded_file($_FILES["image"]["tmp_name"] ,  "upload/".$_FILES["image"]["name"]  );

//Store The Product Into The Tables Goods
include("connect.php");

//Temp Variable For The Image Path
$image_path = "upload/".$_FILES["image"]["name"];

//Then Store The Details
$query ="insert into goods values(null,'$name','$desc','$price','$image_path');";

$stored = mysqli_query($conn , $query);

//Check If Failed Or Not
if($stored){
echo "Product Is Stored......No Error";
echo "<script>  window.location.href='index.php'; </script>" ;
}else{
    //Error Message
    echo "Failed To Store The Product";
}