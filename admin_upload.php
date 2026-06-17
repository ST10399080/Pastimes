<!--- Form To Upload An Image and Details Of The Project -->
<form method="post" encytype="multipart/form-data" action="upload.php" >
<!-- Collect The Product Info --->
 <input type="text" name="name"  />
<br>
<input type="text" name="description"  />
<br>
<input  type="number" name="price" />
<br>
<input type="file" name="image" accept=".jpg,.jpeg,.png "/>
<br>
<input type="submit" value="upload product" />

</form>