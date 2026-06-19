<?php

include "DBConn.php";

$id = $_GET['id'];

$query = "
UPDATE tbluser
SET status='active'
WHERE userID=$id
";

mysqli_query($conn, $query);

header("Location: admin_users.php");

exit();

?>