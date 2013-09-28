<html>
<head>
<title>Eric Tobin - ECT 436 - Assignment #4</title>
</head>

<body>
<p><strong><u>Please note:</u></strong><br />
	<br />
	I built this site using PHP's:<br />
	<a href="http://php.net/manual/en/function.odbc-connect.php">"DSN-less connection - odbc_connect()"<br />
	</a> <br />
	Not PHP's:<br />
	<a href="http://www.php.net/manual/en/class.com.php">"COM()"<br />
	</a> <br />
	Hope that's okay ;-)
</p>
<p>Ok... let's build a drop-down list.<br />
	<br />
	And let's use the contents of this database<br />
	to populate the list (ORDER BY dname):<br />
</p>
<?php

	// settings for local server

/*	$host = "localhost";
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
	$query = "SELECT deptno, dname, loc FROM dept ORDER BY dname";
	$result = mysqli_query($cxn,$query) or die ("Couldn't execute query.");

	echo "<table border = '1'>\n";
		echo "<tr>\n";
			echo "<th>DEPTNO</th>\n";
			echo "<th>DNAME</th>\n";
			echo "<th>LOC</th>\n";
		echo "</tr>\n";

	while($row = mysqli_fetch_assoc($result))
	{
		extract($row);

		echo "<tr>\n";
		echo "<td>$deptno</td>\n";
		echo "<td>$dname</td>\n";
		echo "<td>$loc</td>\n";
		echo "</tr>\n";
	}

	echo "</table>\n";
	
	echo "<h3>And here's the drop down list<br />\n";
	echo "constructed from the table above:</h3>\n";

	echo "<form action='hw4p2.php' method='POST'>\n";
	
		echo "<select name='deptno'>\n";

			mysqli_data_seek($result, 0);

			while($row = mysqli_fetch_assoc($result))
			{
				extract($row);
				echo "<option value='$deptno'>$dname</option>\n";
			}

		echo "</select>";

		echo "<input type='submit' value='Select Department'/>";

	echo "</form>";

	mysqli_close($cxn);
?>
</body>
</html>
