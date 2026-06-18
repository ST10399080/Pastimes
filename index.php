<!--Open Tag For The Form-->
<form method="post" action="data.php">

<!--Asking The User For Username, Creating The Username Label And Input-->
<label>Username: </label> <br>
<input type="username" name="username" required> <br>

<!--Asking The User For Email, Creating The Email Label And Input Field-->
<label>Email: </label> <br>
<input type="email" name="email" required> <br>

<!--Asking The User For Password, Creating The Password Label And Input Field-->
<label>Password: </label>
<input type="password" name="password" required minlength="8"> <br><br>

<!--Button For Input-->
<input type="submit" name="login" value="Login">

<!--Create A Link To Register Page-->
<a href="register.php" >Don't Have An Account Yet? Sign Up</a>

<!--Close Tag-->
</form>

