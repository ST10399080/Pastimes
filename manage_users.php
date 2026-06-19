<?php
session_start();
include "DBConn.php";

if (!isset($_SESSION['adminID'])) {
    header("Location: admin_login.php");
    exit();
}

$query = "SELECT * FROM tbluser WHERE role='customer' AND status='pending'";
$result = mysqli_query($conn, $query);

while ($user = mysqli_fetch_assoc($result)) {

    echo $user['userName'] . " - " . $user['userEmail'];

    echo " <a href='approve.php?id={$user['userID']}'>Approve</a>";
    echo " <a href='reject.php?id={$user['userID']}'>Reject</a>";

    echo "<br>";
}
?>