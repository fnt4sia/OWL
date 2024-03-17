import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterModel {
  static Future<bool> registerEmail(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://nodejsdeployowl.et.r.appspot.com/register/mobile'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
