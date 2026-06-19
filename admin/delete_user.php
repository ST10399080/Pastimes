<?php

include "DBConn.php";

$id = $_GET['id'];

mysqli_query($conn, "DELETE FROM tbluser WHERE userID=$id");

header("Location: manage_users.php");
exit();
?>