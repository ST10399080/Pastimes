$orderNumber = rand(10000,99999);

INSERT INTO tblorder (orderNumber) VALUES ($orderNumber);

UPDATE tblproduct
SET quantity = quantity - ?

unset($_SESSION['cart']);

header("Location: login.php");