import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../shared/utils/supabase.dart';

class LoginModel {
  static Uri url = Uri.parse('https://nodejsdeployowl.et.r.appspot.com/login');

  static Future<bool> loginEmail(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://nodejsdeployowl.et.r.appspot.com/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final session = result['session'];

      final refreshToken = session['refresh_token'];

      await SupabaseManager.supabase.auth.setSession(refreshToken);
      return true;
    } else {
      return false;
    }
  }
}
