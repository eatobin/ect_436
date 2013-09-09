<html>
<head>
	<title>Eric Tobin - ECT 436 - Assignment #2</title>
</head>
<body>
<?php
$forwardString = $_GET["forwardString"];
echo "<h3>Here's the sentence you sent from the first page:</h3>";
echo $forwardString;
$forwardArray = explode(" ", $forwardString);
$count = count($forwardArray);
echo "<h3>And here's the sentence changed to an array:</h3>";
echo "<pre>";
print_r($forwardArray);
echo "</pre>";
$backwardArray = array_reverse($forwardArray);
echo "<h3>Now the array reversed:</h3>";
echo "<pre>";
print_r($backwardArray);
echo "</pre>";
$backwardString = implode("*", $backwardArray);
echo "<h3>And \"glued\" back together (reversed) using your $count words and \"*\":</h3>";
echo $backwardString;
?>
</body>
</html>