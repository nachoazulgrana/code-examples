<?php
require_once ('mercadopago.php');

$mp = new MP('CLIENT_ID', 'CLIENT_SECRET');

$preference_data = array(
	"items" => array(
		array(
			"title" => "Multicolor kite",
			"quantity" => 1,
			"currency_id" => "CURRENCY_ID", // Available currencies at: https://api.mercadopago.com/currencies
			"unit_price" => 10.00,
			"dimensions" => "30x30x30,500"
		)
	),
	"shipments" => array(
		"mode" => "me2",
		"local_pickup" => true,
		"free_methods" => array(
			array(
				"id" => 100009
			)
		)
	)
);

$preference = $mp->create_preference($preference_data);
?>

<!DOCTYPE html>
<html>
	<head>
		<title>Pay</title>
	</head>
	<body>
		<a href="<?php echo $preference['response']['init_point']; ?>">Pay</a>
	</body>
</html>