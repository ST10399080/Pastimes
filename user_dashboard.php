session_start();
include "DBConn.php";

if (!isset($_SESSION['userID'])) {
    header("Location: login.php");
    exit();
}

$userID = $_SESSION['userID'];

/* PROFILE */
$user = mysqli_fetch_assoc(mysqli_query($conn,
"SELECT * FROM tbluser WHERE userID=$userID"
));

echo "<h2>My Profile</h2>";
echo $user['userName'];
echo $user['userEmail'];

/* ORDERS */
echo "<h2>My Orders</h2>";

$orders = mysqli_query($conn,
"SELECT * FROM tblorder WHERE userID=$userID"
);

while ($order = mysqli_fetch_assoc($orders)) {

    echo $order['orderNumber'];
    echo $order['total'];
}

/* PURCHASE HISTORY */
echo "<h2>Purchase History</h2>";

$history = mysqli_query($conn,"
SELECT ol.*, p.name
FROM tblorderline ol
JOIN tblproduct p ON ol.productID = p.productID
JOIN tblorder o ON ol.orderID = o.orderID
WHERE o.userID = $userID
");

while ($row = mysqli_fetch_assoc($history)) {

    echo $row['name'];
    echo $row['quantity'];
    echo $row['price'];
}