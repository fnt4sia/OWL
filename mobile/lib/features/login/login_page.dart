import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/login_theme.dart';
import 'login_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String errorText = '';

  void handleLogin() {
    LoginModel.loginEmail(emailController.text, passwordController.text)
        .then((value) {
      if (value) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        setState(() {
          errorText = 'Incorrect Credentials Information';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: LoginTheme(
        main: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Text(
                    'Masuk ke ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'OWL.',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
              const Text(
                'Silahkan masukkan informasi akun kamu.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 30),
              inputForm(false, emailController, 'Email'),
              const SizedBox(height: 15),
              inputForm(true, passwordController, 'Password'),
              const SizedBox(height: 5),
              errorText.isNotEmpty
                  ? const Text(
                      'Wrong Credentials Information',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : const SizedBox(),
              const SizedBox(height: 5),
              const Text(
                'Forgot Password ?',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  handleLogin();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'OR',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              buttonLoginWith('Google'),
              const SizedBox(height: 15),
              buttonLoginWith('Facebook'),
              const SizedBox(height: 15),
              const Text(
                'Belum punya akun? Daftar disini',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget inputForm(bool hidden, TextEditingController controller, String hint) {
    return TextField(
      obscureText: hidden,
      controller: controller,
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
        hintText: hint,
        contentPadding: const EdgeInsets.all(15),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonLoginWith(String text) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          width: 1,
          color: Colors.blue,
        ),
      ),
      child: Text(
        'Login With $text',
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
