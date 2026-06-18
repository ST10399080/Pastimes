<!--Opening The Form Tag-->
<form method="post" action="data.php">
   
<!--Asking User For Username-->
<label>Enter Username: </label> <br>
<input type="username" name="username" required> <br>

<!--Asking User For Email-->
<label>Email: </label> <br>
<input type="email" name="email" required> <br>

<!--Asking User For Password-->
<label>Password: </label> <br>
<input type="password" name="password" required minlength="8"> <br><br>

<!--Submit Button-->
<input type="submit" name="register" value="Register">

<!--Link For The Login Page If The User Already Has An Account-->
<br>
<a href="index.php" >Already Have An Account? Login </a>

<!--Closing Form Tag-->
</form>