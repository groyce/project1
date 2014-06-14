<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insurance Policy Information</title>
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
<H3>Insurnace Policy Information</H3>
<br />
<?php
	//Open Connection
	$conn = mysql_connect("127.2.39.130","adminwcrXfPW","vitria1976");
	//Select DB
	mysql_select_db("efs",$conn);
	//Specify Customer
	$customer = $_POST['id'];
	//SQL Statement
	$sql = "SELECT * from insurance where cust_id = $customer";
	//Execute SQL Statement
	$result = mysql_query($sql,$conn) or die(mysql_error());
	print ("<table border=1>\n");
	print ("<tr>");
	print ("<th>Customer ID</th>");
	print ("<th>Policy No</th>");
	print ("<th>Policy Type</th>");
	print ("<th>Last Pay Date</th>");
	print ("<th>Value of Coverage</th>");
	print ("<th>Cash Value</th>");
	print ("</tr>");
	$total = 0;
	while($newArray = mysql_fetch_array($result))
	{
		//Define Variables
		$cust_id = $newArray['cust_id'];
		$policy_no = $newArray['policy_no'];
		$policy_type = $newArray['policy_type'];
		$last_pay_date = $newArray['last_pay_date'];
		$value_of_coverage = $newArray['value_of_coverage'];
		$current_cash_value = $newArray['current_cash_val'];
		
		//Print Results
		print ("<tr>");
		print ("<td>$cust_id</td>");
		print ("<td>$policy_no</td>");
		print ("<td>$policy_type</td>");
		print ("<td>$last_pay_date</td>");
		print ("<td>$value_of_coverage</td>");
		print ("<td>$current_cash_value</td>");
		print ("</tr>");
	}
	print ("</table>");
	print ("<br />");
	

?>
<br />
<br />
  <form action="portfolio.php" method="post">
	<input name="id" type="hidden" value="<?php echo $cust_id; ?>"/>
  	<input type="submit" value="Click To View Stock Portfolio Info" />
  </form>
  <br />
  
  <br />
  <a href="index.php">Return to Welcome Screen</a>
</center>
</body>
</html>