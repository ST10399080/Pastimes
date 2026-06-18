<?php
//Including The db_connect Script To Help Execute Queries
include "db_connect.php";

//Checking If The Login Button Was Clicked
if(isset($_POST['login'])){

$name =(string) $_POST['name'];
$email =(string) $_POST['email'];
$password =(string) $_POST['password'];

//Declaring A Variable To Assign With Our Query
$query = "select * from users where email='$email'";
//Executing The Query
$execute = mysqli_query($conn , $query);

//Checking If The Email Does Not Have An Account By Fetching The Row
//O Means False Then 1 Means True
if(mysqli_fetch_row($execute) > 0){

//If The Email Is Found, Check The Hashed Password
$hashed_password = mysqli_fetch_assoc($execute);

if(password_verify($password , $hashed_password['password']) > 0){

    //If The User Is Found
    echo "User is found";

}else{

    //If The User's Password Is Not Correct Or Is Dubious
    echo "User not found, incorrect email or password";
}

}
else{
    //When The Email Does Not Have An Account
    echo "User not found, incorrect email or password !!";
}

}

//Checking When The Button Register Is Clicked
if(isset($_POST['register'])){

//Declaring Variable And Assigning Them
$name = (string) $_POST['name'];
$email = (string) $_POST['email'];
$password = (string) $_POST['password'];

//Check If Email Trying To Register Does Have An Account Or Not

$query_check = "select * from users where email='$email'";
//Executing The Query
$checking = mysqli_query($conn ,$query_check);

if(mysqli_fetch_row($checking) > 0){
echo "User already have an account !!";

}
else{
//When It Return The 0, We Register The User
//Query To Insert the User Values
$hash = password_hash($password, PASSWORD_DEFAULT);
//Passing The Hashed Password
$user_store = "INSERT INTO users VALUES (NULL, '$name', '$email', '$hash')";
//Executing The Query
$done =mysqli_query($conn ,$user_store);

if($done){

    //Outputting A Message
    echo "User account created !!"; 

}else{

    //When Not Executed
    echo "User account failed to be created!!";
}

}

}

?>