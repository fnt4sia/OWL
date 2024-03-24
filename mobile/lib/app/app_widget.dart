import 'package:flutter/material.dart';
import 'package:mobile/features/main/main.dart';
import 'package:mobile/features/register/register_page.dart';
import 'package:mobile/features/splash/splash_screen.dart';
import 'package:mobile/features/verif/verification_page.dart';
import 'app_routes.dart';
import '../features/login/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.main: (context) => const MainPage(),
        AppRoutes.register: (context) => const RegisterPage(),
        AppRoutes.verif: (context) => const VerificationPage(),
      },
    );
  }
}
