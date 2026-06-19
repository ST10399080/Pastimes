include "DBConn.php";

$query = "SELECT * FROM tblproduct";
$result = mysqli_query($conn, $query);

while($row = mysqli_fetch_assoc($result)) {
    echo $row['name'];
    echo $row['price'];

<a href="cart_add.php?id=1">Add to Cart</a>

}