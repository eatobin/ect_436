<?php
	if (IsSet($_GET['myButton']) && ($_GET['myButton'] == "Back To Treats"))
	{
		header("Location: http://eatobin.com/final/neverMelt.php");
		exit;
	}
?>
<html>
<head>
<title>Updated NeverMelt Inventory</title>
<link rel="shortcut icon" href="images/favicon.ico" />
</head>
<body>
<table border="1" bordercolor="#ffffff" align="center" cellpadding="10" cellspacing="0" 
		style="background-color:#B3E7FF; width: 960px; height: 300px;">
	<tr>
		<td><div align="center"><img src="images/main-banner.gif"></div></td>
	</tr>
	<tr>
		<td><?php
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

					$selectCommand = "SELECT pname, image, stock FROM nevermelt WHERE pid = $sentPID;";

					$rs = mysqli_query($conn, $selectCommand) or die ("Couldn't execute query.");

					while($row = mysqli_fetch_assoc($rs))
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
							echo "<td>
								<div align='center'>
									<form action='' method='GET'>
										<div align='center'>
											<select name='quant'>
												<option value='1' selected='selected'>1</option>
												<option value='2'>2</option>
												<option value='3'>3</option>
												<option value='4'>4</option>
												<option value='5'>5</option>
												<option value='6'>6</option>
												<option value='7'>7</option>
												<option value='8'>8</option>
												<option value='9'>9</option>
												<option value='10'>10</option>
											</select>
											
											<input type='hidden' name='pid' value='$sentPID' />
											<input type='submit' name='addInvButton' value='Add Inventory'/>&nbsp;
											<input type='submit' name='myButton' value='Back To Treats'/>
										</div>
								</form>
							</div>
						</td>";
						echo "</tr>";
						echo "<tr>";
							echo "<td><div align='center'>$pname</div></td>";
							echo "<td><div align='center'></div></td>";
						echo "</tr>";
					echo "</table>";
					
					mysqli_close($conn);
				?></td>
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
								$conn = mysqli_connect($host,$user,$passwd,$dbname) or die ("Couldn't connect to csc452");
								
								if (IsSet($_GET['addInvButton']))
								{
									$selectCommand = "SELECT pname, image, stock FROM nevermelt WHERE pid = $sentPID;";

									$rs4 = mysqli_query($conn, $selectCommand) or die ("Couldn't execute query1.");
									
									while($row = mysqli_fetch_assoc($rs4))
									{
										extract($row);
									}
									
									$quant = $_GET['quant'];
									$newStock = $stock + $quant;
									$updateCommand = "UPDATE nevermelt SET stock = '$newStock' WHERE pid = $sentPID;";
									
									$rs1 = mysqli_query($conn, $updateCommand) or die ("Couldn't execute query2.");
								}

								$selectCommand = "SELECT pid, pname, descrip, flavor, scoops, price, stock FROM nevermelt ORDER BY pid;";

								$rs = mysqli_query($conn,$selectCommand) or die ("Couldn't execute query3.");

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
							
							mysqli_close($conn);
						?>
				</table>
			</div></td>
	</tr>
	<tr>
		<td><div align="center"> <img src="images/bottom-banner.gif"> </div></td>
	</tr>
</table>
</body>
</html>
