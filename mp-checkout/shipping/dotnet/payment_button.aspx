<%@ Page Language="c#" %>
<%@ Import Namespace="mercadopago" %>
<%@ Import Namespace="System.Collections" %>

<%
	MP mp = new MP("CLIENT_ID", "CLIENT_SECRET");
	
	String preferenceData = "{'items':"+
		"[{"+
			"'title':'Multicolor kite',"+
			"'quantity':1,"+
			"'currency_id':'CURRENCY_ID',"+ <%-- Available currencies at: https://api.mercadopago.com/currencies --%>
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

	Hashtable preference = mp.createPreference(preferenceData);    
%>
	
<!DOCTYPE html>
<html>
	<head>
		<title>Pay</title>
	</head>
	<body>
		<a href="<% Response.Write(preference["response"]["init_point"]); %>">Pay</a>
	</body>
</html>