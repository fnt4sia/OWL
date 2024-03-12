import 'package:flutter/material.dart';
import 'package:mobile/features/home/HomePage.dart';
import 'package:mobile/features/splash/splash_screen.dart';
import 'app_routes.dart';
import '../features/login/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
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
        AppRoutes.home: (context) => const HomePage(),
      },
    );
  }
}
