<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Provide A Lead</title>
<style type="text/css">
<!--
body {
	background-color: #FFC;
}
-->
</style></head>

<body>
<center>
<H1>Eagle Financial Services</H1>
<H3>Refer A Friend</H3>
<form action="lead.php" method="post">
    <TABLE BORDER = "1">
	<TR>
	<TD>First Name</TD>
	<TD><input name="fname" type="text" maxlength="30" </TD></TR>
	<TD>Last Name</TD>
	<TD><input name="lname" type="text" maxlength="30" </TD></TR>
	<TD>Address Name</TD>
	<TD><input name="address" type="text" maxlength="30" </TD></TR>
	<TD>City</TD>
	<TD><input name="city" type="text" maxlength="20" </TD></TR>
	<TD>State</TD>
	<TD><input name="state" type="text" maxlength="20" </TD></TR>
	<TD>Zip</TD>
	<TD><input name="zip" type="text" maxlength="10" </TD></TR>
	<TD>Email Address</TD>
	<TD><input name="email" type="text" maxlength="30" </TD></TR>
	<TD>Phone Number</TD>
	<TD><input name="phone" text" maxlength="15" </TD></TR>
	</TABLE>
    Please tell us what your friend is looking for in a financial services company. (Limit 200 Characters)<br />
    <textarea name="needs" cols="60" rows="5"></textarea><br /><br />
    <input name="submit" type="submit" /><input name="reset" type="reset" />
</form>
<?php
if (isset($_POST['fname']))
{
	$fname = $_POST['fname'];
	$lname = $_POST['lname'];
	$addr = $_POST['address'];
	$city = $_POST['city'];
	$state = $_POST['state'];
	$zip = $_POST['zip'];
	$email = $_POST['email'];
	$phone = $_POST['phone'];
	$needs = $_POST['needs'];
	//Establish Connection
	$conn = mysql_connect("localhost","root","vitria1976");
	//Pick DB
	mysql_select_db("efs",$conn);
	//Crease SQL Statement
	$sql = "INSERT INTO lead (lead_fname,lead_lname,lead_street,lead_city,lead_stateabbr,lead_zip,lead_email,lead_home_phone,needs) VALUES('$fname','$lname','$addr','$city','$state','$zip','$email','$phone','$needs');";
	//Execute SQL Statement
	mysql_query($sql,$conn) or die(mysql_error());
	print ("<H2>Entry submitted. Thank You!</H2>");
	
}
?>
<br />
<a href="index.php">Return to welcome page</a><br />
</center>
</body>
</html>