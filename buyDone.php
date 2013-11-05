<?php
	if (IsSet($_GET['myButton']) && ($_GET['myButton'] == "Back To Treats"))
	{
		header("Location: http://eatobin.com/final/neverMelt.php");
		exit;
	}
		
	if (IsSet($_GET['quant']) && IsSet($_GET['stock']) && (($_GET['stock'] - $_GET['quant']) < 0))
	{
		$pid = $_GET['pid'];
		header("Location: http://eatobin.com/final/badQuant.php?pid=$pid");
		exit;
	}
?>
<html>
<head>
<title>New NeverMelt Product Quantities</title>
<link rel="shortcut icon" href="images/favicon.ico" />
</head>
<body>
<table border="1" bordercolor="#ffffff" align="center" cellpadding="10" cellspacing="0" 
		style="background-color:#B3E7FF; width: 960px; height: 300px;">
	<tr>
		<td><div align="center"><img src="images/main-banner.gif"></div></td>
	</tr>
	<tr>
		<td><h4 align="center"><font color='red'>Revised inventory (post purchase):</font></h4></td>
	</tr>
	<tr>
		<td><div align="center">
				<table width="960" border="0" bordercolor="#ffffff" align="center" cellpadding="5" cellspacing="0">
					<tr>
						<th><div align="center">Treat Name</div></th>
						<th><div align="center">What Is It?</div></th>
						<th><div align="center">Flavor</div></th>
						<th><div align="center">Number Of Scoops</div></th>
						<th><div align="center">Price</div></th>
						<th><div align="center">Stock</div></th>
					</tr>
					<tr>
						<?php
							// settings for local server

							/*$host = "localhost";
							$user = "root";
							$passwd = "adv26479";
							$dbname = "csc452";*/

							// settings for production server

							$host = "csc452.db.7578476.hostedresource.com";
							$user = "csc452";
							$passwd = "Adv26479!1956";
							$dbname = "csc452";

							// rest of program

							$conn = mysqli_connect($host,$user,$passwd,$dbname) or die ("Couldn't connect to csc452");

							$sentPID = $_GET['pid'];

							if (!IsSet($_GET['adminButton']))
							{
								$quant = $_GET['quant'];
								$stock = $_GET['stock'];
								
								$newStock = $stock - $quant;
								$updateCommand = "UPDATE nevermelt SET stock = '$newStock' WHERE pid = $sentPID;";
								
								$rs = mysqli_query($conn, $updateCommand) or die ("Couldn't execute query.");
							}

							$selectCommand = "SELECT pid, pname, descrip, flavor, scoops, price, stock FROM nevermelt ORDER BY pid;";

							$rs = mysqli_query($conn,$selectCommand) or die ("Couldn't execute query.");

							while($row = mysqli_fetch_assoc($rs))
							{
								extract($row);

								if($sentPID == $pid)
								{
									echo "<td><div align='center'><font color='red'>$pname</font></div></td>";
								}
								else
								{
									echo "<td><div align='center'>$pname</div></td>";
								}

								if($sentPID == $pid)
								{
									echo "<td><div align='center'><font color='red'>$descrip</font></div></td>";
								}
								else
								{
									echo "<td><div align='center'>$descrip</div></td>";
								}

								if($sentPID == $pid)
								{
									echo "<td><div align='center'><font color='red'>$flavor</font></div></td>";
								}
								else
								{
									echo "<td><div align='center'>$flavor</div></td>";
								}

								if($sentPID == $pid)
								{
									echo "<td><div align='center'><font color='red'>$scoops</font></div></td>";
								}
								else
								{
									echo "<td><div align='center'>$scoops</div></td>";
								}

								$priceF = number_format("$price", 2);
								if($sentPID == $pid)
								{
									echo "<td><div align='center'><font color='red'>$$priceF</font></div></td>";
								}
								else
								{
									echo "<td><div align='center'>$$priceF</div></td>";
								}

								if($sentPID == $pid)
								{
									echo "<td><div align='center'><font color='red'>$stock</font></div></td>";
								}
								else
								{
									echo "<td><div align='center'>$stock</div></td>";
								}
								
					echo "</tr>";

							}
						?>
				</table>
			</div></td>
	</tr>
	<tr>
		<td><div align="center">
				<?php
						if (!IsSet($_GET['adminButton']))
						{
							echo "<h4 align='center'>Wanna be an administrator?:</h4>";

							$selectPIDCommand = "SELECT pid, pname FROM nevermelt ORDER BY pid;";

							$rs2 = mysqli_query($conn,$selectPIDCommand) or die ("Couldn't execute query 1.");
							
							echo "<form action='' method='GET'>\n";

							echo "<select name='pid'>\n";

							while($row = mysqli_fetch_assoc($rs2))
							{
								extract($row);

								echo "<option value='$pid'>$pname</option>\n";
							}

							echo "</select>";

							echo "&nbsp;";

							echo "<input type='submit' name = 'adminButton' value='Restock'/>";

							echo "&nbsp;<input type='submit' name='myButton' value='Back To Treats'/>";

							echo "</form>";
						}

						if (IsSet($_GET['adminButton']) && ($_GET['adminButton'] == "Restock"))
						{
							$pid = $_GET['pid'];
				
							$selectCommand = "SELECT pname, image, stock FROM nevermelt WHERE pid = $pid;";

							$rs3 = mysqli_query($conn,$selectCommand) or die ("Couldn't execute query.");
				
							while($row = mysqli_fetch_assoc($rs3))
							{
								extract($row);
							}
							
							echo "<table border='0' bordercolor='#ffffff' align='center' cellpadding='0' cellspacing='0'
							style='background-color:#B3E7FF;'>";
								echo "<tr>";
									echo "<td><div align='center'>Restock:</div></td>";
									echo "<td><div align='center'></div></td>";
								echo "</tr>";
								echo "<tr>";
									echo "<td><div align='center'><img src='$image' alt='' width='70' height='70' /></div></td>";
									echo "<td><div align='center'><form action='inventory.php' method='GET'><input type='submit' name = 'restockButton'
									value='Restock'/><input type='hidden' name='pid' value='$pid' /><input type='hidden' name='stock' value='$stock' /></form></div></td>";
								echo "</tr>";
								echo "<tr>";
									echo "<td><div align='center'>$pname?</div></td>";
									echo "<td><div align='center'></div></td>";
								echo "</tr>";
							echo "</table>";
						}

						mysqli_close($conn);
					?>
			</div></td>
	</tr>
	<tr>
		<td><div align="center"> <img src="images/bottom-banner.gif"> </div></td>
	</tr>
</table>
</body>
</html>
