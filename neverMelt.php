﻿<html>
<head>
<title>NeverMelt Ice Cream - By Eric</title>
<link rel="shortcut icon" href="images/favicon.ico" />
</head>
<body>
<table border="1" bordercolor="#FFFFFF" align="center" cellpadding="10" cellspacing="0"
		style="background-color: #B3E7FF; width: 960px; height: 700px;">
	<tr>
		<td colspan="3"><div align="center"><img src="images/main-banner.gif"></div></td>
	</tr>
	<tr>
		<td colspan="3"><div align="center"><font color="#800000">NeverMelt ice cream was discovered accidently during the Great Depression (1929… not 2009…) by chemists researching the heat transfer properties of dairy products. Hoping to use cottage cheese as inexpensive building insulation, scientists gave up after mice repeatedly ate every speck of product out of several test homes. Today, we thank those far-sighted rodents for NeverMelt, the first (and only) ice cream that doesn't melt.</font></div></td>
	</tr>
	<tr>
		<td valign="top" align="center"><h1>NeverMelt Menu</h1>
			(# scoops)<br>
			<br>
			<h2>Chocolate</h2>
			<img src="images/choc1.gif" align="center" style="height: 50px; width: 50px"><img
				src="images/choc2.gif" align="center" style="height: 50px; width: 50px"><img src="images/choc3.gif"
					align="center" style="height: 50px; width: 50px"><br>
			(1) Brown Derby<br>
			(2) Fudge Slide<br>
			(3) Chocozilla<br />
			<br />
			<h2>Strawberry</h2>
			<img src="images/straw1.gif" align="center" style="height: 50px; width: 50px"><img
				src="images/straw2.gif" align="center" style="height: 50px; width: 50px"><img src="images/straw3.gif"
					align="center" style="height: 50px; width: 50px"><br>
			(1) Little Red<br>
			(2) Berry Fields<br>
			(3) Red Giant<br>
			<br>
			<h2>Vanilla</h2>
			<img src="images/vanilla1.gif" align="center" style="height: 50px; width: 50px"><img
				src="images/vanilla2.gif" align="center" style="height: 50px; width: 50px"><img src="images/vanilla3.gif"
					align="center" style="height: 50px; width: 50px"><br>
			(1) Plain Jane<br>
			(2) Moe Betta<br>
			(3) Mt. Everest<br>
			<br /></td>
		<td valign="top" width="330" align="center"><h1> Make Your NeverMelt Selection!</h1>
			<br />
			Chocolate? Strawberry? Vanilla?<br />
			Choose items from our database of treats!<br />
			<br />
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

				$cxn = mysqli_connect($host,$user,$passwd,$dbname) or die ("Couldn't connect to csc452");
				$sqlAll = "SELECT pid, pname, price FROM nevermelt ORDER BY pid ASC;";
				$sqlFlavor = "SELECT DISTINCT flavor FROM nevermelt ORDER BY flavor ASC;";
				$sqlScoops = "SELECT DISTINCT scoops FROM nevermelt ORDER BY scoops ASC;";

				$resultAll = mysqli_query($cxn,$sqlAll) or die ("Couldn't execute query 1.");
				$resultFlavor = mysqli_query($cxn,$sqlFlavor) or die ("Couldn't execute query 2.");
				$resultScoops = mysqli_query($cxn,$sqlScoops) or die ("Couldn't execute query 3.");

				echo "<form action='' method='POST'>\n";

					if ($_POST["myButton"] == "Reset")
					{
						unset($_POST['ddl1'], $_POST['ddl2'], $_POST['ddl3'], $_POST['myDDL1'], $_POST['myDDL2'], $_POST['myDDL3'], $_POST['myButton']);
					}

					// show ddl2
					if (isset($_POST['ddl2']))
					{
						echo "<font size='3' color='red'>$_POST[ddl2]&nbsp;</font>";
					}

					// show myDDL2
					if (isset($_POST['myDDL2']))
					{
						echo "<font size='3' color='red'>$_POST[myDDL2]&nbsp;</font>";
					}

					// show ddl3
					if (isset($_POST['ddl3']))
					{
						echo "<font size='3' color='red'>$_POST[ddl3]&nbsp;</font>";
					}

					// if first pass or reset
					if (!isset($_POST['ddl1']) and !isset($_POST['myDDL1']))
					{
						$tableList = $resultAll;
						echo "<select name='ddl1'>\n";
							echo "<option value='Flavor' selected='selected'>Choose By Flavor</option>\n";
							echo "<option value='Scoops'>Choose By Scoops</option>\n";		
						echo "</select>";
						echo "&nbsp;";
						echo "<input type='submit' value='Select' />";
					}

					// DDL2: if DDL1 = Flavor
					if (!isset($_POST['ddl2']) and !isset($_POST['myDDL2']) and $_POST["ddl1"] == "Flavor")
					{
						$myDDL1 = $_POST[ddl1];
						$tableList = $resultAll;
						
						echo "<select name='ddl2'>\n";

							while($row = mysqli_fetch_assoc($resultFlavor))
							{
								extract($row);

								echo "<option value='$flavor'>$flavor</option>\n";
							}

						echo "</select>";
						
						echo "&nbsp;";
						echo "<input type='hidden' name='myDDL1' value='$myDDL1' />";
						echo "<input type='submit' name='myButton' value='Select'/>\n";
						echo "&nbsp;";
						echo "<input type='submit' name='myButton' value='Reset'/>\n";
					}

					// DDL2: if DDL1 = Scoops
					if (!isset($_POST['ddl2']) and !isset($_POST['myDDL2']) and $_POST["ddl1"] == "Scoops")
					{
						$myDDL1 = $_POST[ddl1];
						$tableList = $resultAll;
						
						echo "<select name='ddl2'>\n";

							while($row = mysqli_fetch_assoc($resultScoops))
							{
								extract($row);

								echo "<option value='$scoops'>$scoops</option>\n";
							}

						echo "</select>";
						
						echo "&nbsp;";
						echo "<input type='hidden' name='myDDL1' value='$myDDL1' />";
						echo "<input type='submit' name='myButton' value='Select'/>\n";
						echo "&nbsp;";
						echo "<input type='submit' name='myButton' value='Reset'/>\n";
					}

					// DDL3: if DDL1 = Flavor
					if (!isset($_POST['ddl3']) and !isset($_POST['myDDL3']) and $_POST["myDDL1"] == "Flavor")
					{
						$myDDL1 = $_POST[myDDL1];
						$myDDL2 = $_POST[ddl2];
						$sqlTableFlavor = "SELECT pid, pname, price FROM nevermelt WHERE Flavor = '$myDDL2' ORDER BY pid ASC;";
						$tableList = mysqli_query($cxn, $sqlTableFlavor) or die ("Couldn't execute query 4.");
						
						echo "<select name='ddl3'>\n";

							while($row = mysqli_fetch_assoc($resultScoops))
							{
								extract($row);

								echo "<option value='$scoops'>$scoops</option>\n";
							}
							
						echo "</select>";

						echo "&nbsp;";
						echo "<input type='hidden' name='myDDL1' value='$myDDL1' />";
						echo "<input type='hidden' name='myDDL2' value='$myDDL2' />";
						echo "<input type='submit' name='myButton' value='Select'/>\n";
						echo "&nbsp;";
						echo "<input type='submit' name='myButton' value='Reset'/>\n";
					}

					// DDL3: if DDL1 = Scoops
					if (!isset($_POST['ddl3']) and !isset($_POST['myDDL3']) and $_POST["myDDL1"] == "Scoops")
					{
						$myDDL1 = $_POST[myDDL1];
						$myDDL2 = $_POST[ddl2];
						$sqlTableScoops = "SELECT pid, pname, price FROM nevermelt WHERE Scoops = '$myDDL2' ORDER BY pid ASC;";
						$tableList = mysqli_query($cxn, $sqlTableScoops) or die ("Couldn't execute query 5.");
						
						echo "<select name='ddl3'>\n";

							while($row = mysqli_fetch_assoc($resultFlavor))
							{
								extract($row);

								echo "<option value='$flavor'>$flavor</option>\n";
							}
							
						echo "</select>";
						
						echo "&nbsp;";
						echo "<input type='hidden' name='myDDL1' value='$myDDL1' />";
						echo "<input type='hidden' name='myDDL2' value='$myDDL2' />";
						echo "<input type='submit' name='myButton' value='Select'/>\n";
						echo "&nbsp;";
						echo "<input type='submit' name='myButton' value='Reset'/>\n";
					}

					// grand reset
					if (isset($_POST['ddl3']) or isset($_POST['myDDL3']))
					{
						$field1 = "Flavor";
						$field2 = "Scoops";
						$myDDL1 = $_POST[myDDL1];
						$myDDL2 = $_POST[myDDL2];
						$myDDL3 = $_POST[ddl3];

						if ($myDDL1 == "Scoops")
						{
							$field1 = "Scoops";
							$field2 = "Flavor";
						}
						
						$sqlTableBoth = "SELECT pid, pname, price FROM nevermelt WHERE $field1 = '$myDDL2' AND $field2 = '$myDDL3' ORDER BY pid ASC;";
						$tableList = mysqli_query($cxn, $sqlTableBoth) or die ("Couldn't execute query 6.");
						
						
						echo "&nbsp;";
						echo "<input type='hidden' name='myDDL1' value='$myDDL1' />";
						echo "<input type='hidden' name='myDDL2' value='$myDDL2' />";
						echo "<input type='hidden' name='myDDL3' value='$myDDL3' />";
						echo "<input type='submit' name='myButton' value='Reset'/>\n";
					}

					echo "<br/>";

					echo "<h3> Please make a selection<br />
						from our menu!</h3>\n";

					echo "<table border='0' align='center' cellpadding='10' cellspacing='10'>\n";
					echo "<tr>\n";
						echo "<th>Name</th>\n";
						echo "<th>Price</th>\n";
					echo "</tr>\n";

					
					// restart reading $resultAll from row 1
					mysqli_data_seek($tableList, 0);
					$row = mysqli_fetch_assoc($tableList);
					extract($row);

					$priceF = number_format($price, 2);

					echo "<tr>\n";
						echo "<td><a href='prodDetail.php?pid=$pid'>$pname</a></td>\n";
						echo "<td>$$priceF</td>\n";
					echo "</tr>\n";

					// continue reading $resultAll from row 2 to end
					while($row = mysqli_fetch_assoc($tableList))
					{
						extract($row);

						$priceF = number_format($price, 2);
						
						echo "<tr>\n";
							echo "<td><a href='prodDetail.php?pid=$pid'>$pname</a></td>\n";
							echo "<td>$$priceF</td>\n";
						echo "</tr>\n";
					}
					echo "</table>\n";
				echo "</form>";
				mysqli_close($cxn);
			?></td>
		<td valign="top" align="center"><h1> NeverMelt Labs - 1930</h1>
			Sweet indeed! <br />
			<br />
			<img src="images/discovery.gif" align="center"><br /></td>
	</tr>
	<tr>
		<td colspan="3"><div align="center"><img src="images/bottom-banner.gif"></div></td>
	</tr>
</table>
</body>
</html>
