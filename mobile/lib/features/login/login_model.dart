import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginModel {
  static Uri url = Uri.parse('https://nodejsdeployowl.et.r.appspot.com/login');

  static Future<bool> loginEmail(String email, String password) async {
    final loginResponse = await http.post(
      url,
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
    );

    if (loginResponse.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
