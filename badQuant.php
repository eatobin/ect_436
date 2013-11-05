<?php
	$pid = $_GET['pid'];
?>
<html>
<head>
<title>A Small NeverMelt Problem!</title>
<link rel="shortcut icon" href="images/favicon.ico" />
</head>
<body>
<table border="1" bordercolor="#ffffff" align="center" cellpadding="10" cellspacing="0" 
		style="background-color:#B3E7FF; width: 960px; height: 300px;">
	<tr>
		<td><div align="center"> <img src="images/main-banner.gif"> </div></td>
	</tr>
	<tr>
		<td><h4 align="center"> Sorry, but you have requested more items than we have in stock.<br />
				<br />
				Please purchase fewer items. Thanks! </h4></td>
	</tr>
	<tr>
		<td><form action='prodDetail.php' method='GET'>
				<div align="center">
					<?php
							echo "<input type='hidden' name='pid' value='$pid' />";
							echo "<input type='submit' name='myButton' value='Return To Item'/>";
					?>
				</div>
			</form></td>
	</tr>
	<tr>
		<td><div align="center"> <img src="images/bottom-banner.gif"> </div></td>
	</tr>
</table>
</body>
</html>
