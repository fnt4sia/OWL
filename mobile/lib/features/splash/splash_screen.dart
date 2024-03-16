import 'package:flutter/material.dart';
import '../../shared/widgets/background.dart';
import '../../shared/utils/token_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final nav = Navigator.of(context);
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        final jwt = await Token.getToken();
        if (jwt == null) {
          nav.pushReplacementNamed('/login');
        } else {
          nav.pushReplacementNamed('/main');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: BackgroundColor(
        main: Center(
          child: Image.asset(
            'assets/splash.png',
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
        splash: true,
      ),
    );
  }
}
