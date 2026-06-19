<?php
session_start();
?>

<!DOCTYPE html>
<html>

<head>

<title>Clothing Store</title>

<link rel="stylesheet" href="css/style.css">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body>

<!-- Navigation Bar -->
<nav class="navbar">

    <!-- Left Side -->
    <div class="nav-left">

        <a href="admin_login.php" class="nav-btn">
            Admin
        </a>

    </div>

    <!-- Right Side -->
    <div class="nav-right">

        <button onclick="toggleContact()" class="nav-btn">
            +
        </button>

        <div class="dropdown">

    <button class="nav-btn">
        User
    </button>

    <div class="dropdown-content">

        <a href="index.php">
            Login
        </a>

        <a href="register.php">
            Register
        </a>

    </div>

</div>

        <a href="cart.php" class="nav-btn">
            Cart
        </a>

        <a href="search.php" class="nav-btn">
            Search
        </a>

        <a href="categories.php" class="nav-btn">
            Menu
        </a>

    </div>

</nav>

<!-- Contact Information -->
<div id="contactInfo" style="display:none;">

    <h3>Contact Information</h3>

    <p>Email: support@clothingstore.com</p>

    <p>Phone: 011 123 4567</p>

</div>

<!-- Hero Section -->
<section class="hero">

    <h1>Welcome To Clothing Store</h1>

    <p>Browse our latest fashion collections.</p>

</section>

<!-- Products Section -->
<section>

<a href="shop.php">
Shop Now
</a>

<a href="shop.php?category=Men">Men</a>
<a href="shop.php?category=Women">Women</a>
<a href="shop.php?category=Kids">Kids</a>
<a href="shop.php?category=Accessories">Accessories</a>
<a href="shop.php?category=Footwear">Footwear</a>

</section>

<script>

function toggleContact()
{
    let contact =
        document.getElementById("contactInfo");

    if(contact.style.display === "none")
    {
        contact.style.display = "block";
    }
    else
    {
        contact.style.display = "none";
    }
}


</script>

</body>
</html>