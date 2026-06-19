<?php
session_start();

if (!isset($_SESSION['adminID'])) {
    header("Location: admin_login.php");
    exit();
}
?>

<h1>Welcome Admin</h1>

<a href="manage_users.php">Manage Customers</a>
<a href="logout.php">Logout</a>