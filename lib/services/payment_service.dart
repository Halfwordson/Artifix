import 'dart:convert';
import 'package:http/http.dart' as http;

class PaymentService {
  static Future<String?> createPaymentIntent(int amountInOre) async {
    const url = 'http://localhost:4242/create-payment-intent';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'amount': amountInOre}),
      );

      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        return jsonBody['clientSecret'];
      } else {
        print('❌ Serverfel: ${response.body}');
        return null;
      }
    } catch (e) {
      print('❌ Nätverksfel: $e');
      return null;
    }
  }
}
