<html>
<head>
<title>Eric Tobin - ECT 436 - Assignment #4</title>
</head>

<body>
<?php
	$field = key($_POST);
	$value = $_POST[$field];
	
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
	$sqlAll = "SELECT empno, ename, deptno FROM emp ORDER BY ename";
	$sql = "SELECT empno, ename, deptno FROM emp WHERE deptno = '$value' ORDER BY ename";
	
	echo "<p>";
	echo "<h3>Here's the data I received from the first page:</h3>\n";
	
	echo "The <strong>field</strong> name is: $field<br />\n";
	echo "And it's <strong>value</strong> is: $value<br />\n";
	echo "</p>";

	$result = mysqli_query($cxn,$sqlAll) or die ("Couldn't execute query.");
	
	echo "<h3>Here's all the employees in the emp table:</h3>\n";

	echo "<table border = '1'>\n";
		echo "<tr>\n";
			echo "<th>EMPNO</th>\n";
			echo "<th>ENAME</th>\n";
			echo "<th>DEPTNO</th>\n";
		echo "</tr>\n";
		
	while($row = mysqli_fetch_assoc($result))
	{
		extract($row);

			echo "<tr>\n";
				echo "<td>$empno</td>\n";
				echo "<td>$ename</td>\n";
				echo "<td>$deptno</td>\n";
			echo "</tr>\n";
		}

	echo "</table>\n";
	
	$result = mysqli_query($cxn,$sql) or die ("Couldn't execute query.");
	
	echo "<h3>Last, here's all the employees in $field $value:</h3>\n";

	echo "<table border = '1'>\n";
		echo "<tr>\n";
			echo "<th>EMPNO</th>\n";
			echo "<th>ENAME</th>\n";
			echo "<th>DEPTNO</th>\n";
		echo "</tr>\n";
		
	while($row = mysqli_fetch_assoc($result))
	{
		extract($row);
		
			echo "<tr>\n";
				echo "<td>$empno</td>\n";
				echo "<td>$ename</td>\n";
				echo "<td>$deptno</td>\n";
			echo "</tr>\n";
		}

	echo "</table>\n";
	
	mysqli_free_result($result);
	
?>
<h3>Bye!</h3>
</body>
</html>
