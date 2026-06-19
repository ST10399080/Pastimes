<?php

include "DBConn.php";


$query = "SELECT * FROM tbluser WHERE status='pending'";

$result = mysqli_query($conn, $query);

while($user = mysqli_fetch_assoc($result)){

    echo $user['userName'];
    echo " | ";
    echo $user['userEmail'];

    echo "
    <a href='approve_user.php?id={$user['userID']}'>Approve</a>

    <a href='reject_user.php?id={$user['userID']}'>Reject</a>

    <br><br>
    ";
}

?>