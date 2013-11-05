<html>
<head>
<title>Your NeverMelt Product Selection</title>
<link rel="shortcut icon" href="images/favicon.ico" />
</head>
<body>
<table border="1" bordercolor="#ffffff" align="center" cellpadding="10" cellspacing="0" 
	style="background-color:#B3E7FF; width: 960px; height: 300px;">
	<tr>
		<td><div align="center"><img src="images/main-banner.gif"></div></td>
	</tr>
	<tr>
		<td><div align="center">
				<table width="960" border="0" bordercolor="#ffffff" align="center" cellpadding="5" cellspacing="0">
					<tr>
						<th><div align="center"></div></th>
						<th><div align="center">Treat Name</div></th>
						<th><div align="center">What Is It?</div></th>
						<th><div align="center">Flavor</div></th>
						<th><div align="center">Number Of Scoops</div></th>
						<th><div align="center">Price</div></th>
					</tr>
					<tr>
						<?php
							$pid = $_GET['pid'];

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
							$selectCommand = "SELECT pname, descrip, flavor, scoops, price, stock, image FROM nevermelt WHERE pid = $pid;";
							$result = mysqli_query($conn, $selectCommand) or die ("Couldn't execute query.");

							$row = mysqli_fetch_assoc($result);
							extract($row);
							$priceF = number_format("$price", 2);

							echo "<td><div align='center'><img src='$image' alt='' width='70' height='70' /></div></td>";
							echo "<td><div align='center'>$pname</div></td>";
							echo "<td><div align='center'>$descrip</div></td>";
							echo "<td><div align='center'>$flavor</div></td>";
							echo "<td><div align='center'>$scoops</div></td>";
							echo "<td><div align='center'>$$priceF</div></td>";
						?>
					</tr>
				</table>
			</div></td>
	</tr>
	<tr>
		<td><h4>
			<div align="center">Quantity in stock:&nbsp;
				<?php
				echo "<font color='red'>$stock</font></h4>";
				?>
			</div></td>
	</tr>
	<tr>
		<td><h4 align="center">How many would you like?:</h4>
			<form action='buyDone.php' method='GET'>
				<div align="center"> <img src="images/buy.gif"><br />
					<br />
					<select name='quant'>
						<option value='1' selected='selected'>1</option>
						<option value='2'>2</option>
						<option value='3'>3</option>
						<option value='4'>4</option>
						<option value='5'>5</option>
						<option value='6'>6</option>
					</select>
					<?php
						echo "<input type='hidden' name='pid' value='$pid' />";
						echo "<input type='hidden' name='stock' value='$stock' />";
						mysqli_close($conn);
					?>
					<input type='submit' name='myButton' value='Purchase'/>
					&nbsp;
					<input type='submit' name='myButton' value='Back To Treats'/>
				</div>
			</form></td>
	</tr>
	<tr>
		<td><div align="center"><img src="images/bottom-banner.gif"></div></td>
	</tr>
</table>
</body>
</html>
