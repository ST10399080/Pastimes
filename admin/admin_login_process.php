<?php

session_start();
include "DBConn.php";

$email = $_POST['email'];
$password = $_POST['password'];

$query = "SELECT * FROM tbluser WHERE userEmail='$email'";
$result = mysqli_query($conn, $query);

$user = mysqli_fetch_assoc($result);

if (!$user) {
    die("User not found");
}

if ($user['role'] != 'admin') {
    die("Access denied. Not an admin account.");
}

if ($user['status'] != 'active') {
    die("Admin account not active.");
}

if (password_verify($password, $user['userPassword'])) {

    $_SESSION['adminID'] = $user['userID'];
    $_SESSION['adminName'] = $user['userName'];
    $_SESSION['role'] = $user['role'];

    header("Location: admin_dashboard.php");
    exit();

} else {
    echo "Incorrect password";
}
?>