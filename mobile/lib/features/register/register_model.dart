import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterModel {
  static Future registerEmail(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://nodejsdeployowl.et.r.appspot.com/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
    );

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }
}
