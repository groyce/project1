 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Eagle Financial: Customer Info</title>
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
<H3>Customer Information</H3>
<p>
  <?php
	//Open Connection
	$conn = mysql_connect("127.2.39.130","adminwcrXfPW","vitria1976");
	//Select DB
	mysql_select_db("efs",$conn);
	//Specify Customer
	$customer = $_POST['Cust_ID'];
	if ($customer == '')
	{
		print ("Please enter a customer ID. <a href=\"index.php\">Return To Welcome Screen</a>");
	}
	else
	{
		//SQL Statement
		$sql = "SELECT * from customer where cust_id = $customer";
		//Execute SQL Statement
		$result = mysql_query($sql,$conn) or die(mysql_error());
		//Iterate Through Each Row
		while($newArray = mysql_fetch_array($result))
		{
			//Define Variables
			$CustID = $newArray['cust_id'];
			$FName = $newArray['cust_fname'];
			$MName = $newArray['cust_mname'];
			$LName = $newArray['cust_lname'];
			$StAddress = $newArray['cust_street'];
			$City = $newArray['cust_city'];
			$State = $newArray['cust_stateabbr'];
			$Zip = $newArray['cust_zip'];
			$HNum = $newArray['cust_home_phone'];
			$WNum = $newArray['cust_work_phone'];
			
			//Print Results
			print ("<table border=2>\n");
			print ("<tr>");
			print ("<th>Customer Number: </th>");
			print ("<th>$CustID</th>");
			print ("</tr>");
			
			print ("<tr>");
			print ("<th>First Name: </th>");
			print ("<th>$FName</th>");
			print ("</tr>");	
			
			print ("<tr>");
			print ("<th>Middle Name: </th>");
			print ("<th>$MName</th>");
			print ("</tr>");	
			
			print ("<tr>");
			print ("<th>Last Name: </th>");
			print ("<th>$LName</th>");
			print ("</tr>");
			
			print ("<tr>");
			print ("<th>Street Address: </th>");
			print ("<th>$StAddress</th>");
			print ("</tr>");	
			
			print ("<tr>");
			print ("<th>City: </th>");
			print ("<th>$City</th>");
			print ("</tr>");	
			
			print ("<tr>");
			print ("<th>State: </th>");
			print ("<th>$State</th>");
			print ("</tr>");
			
			print ("<tr>");
			print ("<th>Zip: </th>");
			print ("<th>$Zip</th>");
			print ("</tr>");	
			
			print ("<tr>");
			print ("<th>Home Number: </th>");
			print ("<th>$HNum</th>");
			print ("</tr>");
			
			print ("<tr>");
			print ("<th>Work Number: </th>");
			print ("<th>$WNum</th>");
			print ("</tr>");	
			
			
		}
	}
  ?>
  <br />
  <form action="insurance.php" method="post">
	<input name="id" type="hidden" value="<?php echo $CustID; ?>"/>
  	<input type="submit" value="Click To View Insurance" />
  </form>
  <form action="portfolio.php" method="post">
	<input name="id" type="hidden" value="<?php echo $CustID; ?>"/>
  	<input type="submit" value="Click To View Stock Portfolio Info" />
  </form>
   <form action="lead.php" method="post">
	<input name="id" type="hidden" value="<?php echo $CustID; ?>"/>
  	<input type="submit" value="Click To Enter a Lead" />
  </form>
  

  
  <br />
  <a href="index.php">Return to Welcome Screen</a>
</center>
</body>
</html>