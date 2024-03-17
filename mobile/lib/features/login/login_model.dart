import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../../shared/utils/supabase.dart';

class LoginModel {
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

  static Future<void> loginOauth(String provider) async {
    final response = await http.post(
      Uri.parse(
          'https://nodejsdeployowl.et.r.appspot.com/oauth/$provider/mobile'),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final url = Uri.parse(result['url']);
      print(url);

      await launchUrl(url);
    }
  }
}
