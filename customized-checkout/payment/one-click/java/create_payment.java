import mercadopago.MP;
import org.codehaus.jettison.json.JSONObject;

public class MyClass {
	public static void main (String args[]) {
		MP mp = new MP("ACCESS_TOKEN");

		JSONObject payment = mp.post("/v1/payments", "{"+
			"'transaction_amount': 100,"+
			"'token': 'ff8080814c11e237014c1ff593b57b4d',"+
			"'description': 'Title of what you are paying for',"+
			"'installments': 1,"+
			"'payer': {"+
				"'id': '12345678'"+
			"}"+
		"}");
	}
}
