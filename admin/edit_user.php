<link rel="stylesheet" href="../css/style.css">

<?php
include "DBConn.php";

$id = $_GET['id'];

$result = mysqli_query($conn, "SELECT * FROM tbluser WHERE userID=$id");
$user = mysqli_fetch_assoc($result);
?>

<form method="post">
<input type="text" name="name" value="<?= $user['userName'] ?>">
<input type="email" name="email" value="<?= $user['userEmail'] ?>">
<button name="update">Update</button>
</form>

<?php

if (isset($_POST['update'])) {

    $name = $_POST['name'];
    $email = $_POST['email'];

    mysqli_query($conn,
        "UPDATE tbluser SET userName='$name', userEmail='$email' WHERE userID=$id"
    );

    header("Location: manage_users.php");
}
?>