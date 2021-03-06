<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mercadopago.MP"%>
<%@page import="org.codehaus.jettison.json.JSONObject"%>

<%
	MP mp = new MP("CLIENT_ID", "CLIENT_SECRET");

	String preferenceData = "{'items':"+
		"[{"+
			"'title':'Multicolor kite',"+
			"'quantity':1,"+
			"'currency_id':'CURRENCY_ID',"+ // Available currencies at: https://api.mercadopago.com/currencies
			"'unit_price':10.0,"+
			"'dimensions':'30x30x30,500'"+
		"}],"+
		"'shipments':{"+
			"'mode':'me2',"+
			"'local_pickup':true,"+
			"'free_methods':["+
				"{'id':100009}"+
			"]"+
		"}"+
	"}";

	JSONObject preference = mp.createPreference(preferenceData);

	String initPoint = preference.getJSONObject("response").getString("init_point");
%>

<!DOCTYPE html>
<html>
	<head>
		<title>Pay</title>
	</head>
	<body>
		<a href="<%= initPoint %>">Pay</a>
	</body>
</html>
