import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../shared/utils/token_handler.dart';

class LoginModel {
  static Uri url = Uri.parse('https://nodejsdeployowl.et.r.appspot.com/login');

  static Future<bool> loginEmail(String email, String password) async {
    final loginResponse = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
    );

    if (loginResponse.statusCode == 200) {
      String jwtToken =
          jsonDecode(loginResponse.body)['session']['access_token'];

      await Token.setToken(jwtToken);
      return true;
    } else {
      return false;
    }
  }
}
