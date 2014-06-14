<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Portfolio Information</title>
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
<H3>Portfolio Information</H3>
<b>Here is your stock information</b><br />
<?php
require_once('nusoap.php'); 
	$c = new nusoap_client('http://loki.ist.unomaha.edu/~groyce/ws/stockquoteservice.php');
		
	//Open Connection
	$conn = mysql_connect("127.2.39.130","adminwcrXfPW","vitria1976");
	//Select DB
	mysql_select_db("efs",$conn);
	//Specify Customer
	$customer = $_POST['id'];
	//SQL Statement
	$sql = "SELECT * from stock_table where cust_id = $customer";
	//Execute SQL Statement
	$result = mysql_query($sql,$conn) or die(mysql_error());
	print ("<table border=1>\n");
	print ("<tr>");
	print ("<th>Ticker Symbol</th>");
	print ("<th>Company</th>");
	print ("<th>Shares</th>");
	print ("<th>Price</th>");
	print ("<th>Total</th>");
	print ("<th>Purchase Date</th>");
	print ("</tr>");
	$gtotal = 0;
	while($newArray = mysql_fetch_array($result))
	{
		//Define Variables
		$ticker = $newArray['st_symbol'];
		$comp = $newArray['st_name'];
		$shares = $newArray['no_shares'];
		$price = $newArray['purch_price'];
		$pur = $newArray['purch_date'];
		$total = 0;
		//Print Results
		print ("<tr>");
		print ("<td>$ticker</td>");
		print ("<td>$comp</td>");
		print ("<td>$shares</td>");
		print ("<td>\$$price</td>");
		$total = $shares * $price;
		$gtotal += $total;
		print ("<td>\$$total</td>");
		print ("<td>$pur</td>");
		print ("</tr>");
	}
	print ("</table>");
	$ftotal = number_format($gtotal,2,'.',',');
	print ("<center><b>Portfolio Value: \$$ftotal</b></center>");
	print ("<br /><br />");
	print ("<center><b>Current Stock Information</b></center>");
	print ("<table border=1>\n");
	print ("<tr>");
	print ("<th>Stock Name</th>");
	print ("<th>Stock Symbol</th>");
	print ("<th>No of Shares</th>");
	print ("<th>Purchase Price (X)</th>");
	print ("<th>Original Total</th>");
	print ("<th>Current Price (Y)</th>");
	print ("<th>Current Total</th>");
	print ("<th>Price Difference (Y-X)</th>");
	print ("<th>Purchase Date</th>");
	print ("</tr>");
    $ngtotal = 0;
	//SQL Statement
	$sql2 = "SELECT * from stock_table where cust_id = $customer";
	//Execute SQL Statement
	$result2 = mysql_query($sql2,$conn) or die(mysql_error());
	while($newArray2 = mysql_fetch_array($result2))
	{
		//Define Variables
		$ticker2 = $newArray2['st_symbol'];
		$comp2 = $newArray2['st_name'];
		$shares2 = $newArray2['no_shares'];
		$price2 = $newArray2['purch_price'];
		$pur2 = $newArray2['purch_date'];
		$stockprice = $c->call('getStockQuote',array('symbol' => $ticker2));
		//Print Results
		print ("<tr>");
		print ("<td>$comp2</td>");
		print ("<td>$ticker2</td>");
		print ("<td>$shares2</td>");
		print ("<td>\$$price2</td>");
		$total = $shares2 * $price2;
		print ("<td>\$$total</td>");
		print ("<td>\$$stockprice</td>"); //Current price (y)		
		$ctotal = $shares2 * $stockprice;
		print ("<td>\$$ctotal</td>"); //Current Total
		$ngtotal += $ctotal;
		$diff = $ctotal - $total;
		print ("<td>\$$diff</td>"); //Price difference (y-x)
		print ("<td>$pur2</td>");
		print ("</tr>");
	}
	print ("</table>");
	print ("<br />");
	$ftotal = number_format($gtotal,2,'.',',');
	print ("Original Portfolio Value: <b>\$$ftotal</b>");
	print ("<br />");
	$ftotal = number_format($ngtotal,2,'.',',');
	print ("Current Portfolio Value: <b>\$$ftotal</b>");
?>
<br /><br />
  <form action="insurance.php" method="post">
	<input name="id" type="hidden" value="<?php echo $customer; ?>"/>
  	<input type="submit" value="Click To View Insurance" />
  </form>
  

  
  <br />
  <a href="index.php">Return to Welcome Screen</a>
</center>
</body>
</html>