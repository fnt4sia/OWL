import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt', jwtToken);
      return true;
    } else {
      return false;
    }
  }
}
