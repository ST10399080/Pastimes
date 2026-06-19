<?php

// Include database connection
include "DBConn.php";

/* =========================================================
   REGISTRATION SECTION
========================================================= */

if (isset($_POST['register'])) {

    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Check if user already exists
    $check = "SELECT * FROM tbluser WHERE userEmail='$email'";
    $result = mysqli_query($conn, $check);

    if (mysqli_fetch_assoc($result)) {
        echo "User already has an account!";
        exit();
    }

    // Hash password
    $hash = password_hash($password, PASSWORD_DEFAULT);

    // Insert user as pending
    $insert = "
        INSERT INTO tbluser
        (userName, userEmail, userPassword, role, status)
        VALUES
        ('$name', '$email', '$hash', 'customer', 'pending')
    ";

    if (mysqli_query($conn, $insert)) {
        echo "Registration successful! Await admin approval.";
    } else {
        echo "Registration failed.";
    }
}


/* =========================================================
   LOGIN SECTION
========================================================= */

if (isset($_POST['login'])) {

    $email = $_POST['email'];
    $password = $_POST['password'];

    // Get user from database
    $query = "SELECT * FROM tbluser WHERE userEmail='$email'";
    $result = mysqli_query($conn, $query);

    $user = mysqli_fetch_assoc($result);

    // Check if user exists
    if (!$user) {
        echo "User not found!";
        exit();
    }

    // CHECK STATUS FIRST (IMPORTANT FOR YOUR ASSIGNMENT)
    if ($user['status'] != 'active') {
        echo "Your account is awaiting admin approval.";
        exit();
    }

    // Verify password
    if (password_verify($password, $user['userPassword'])) {
        echo "Login successful!";
    } else {
        echo "Incorrect password!";
    }
}

?>