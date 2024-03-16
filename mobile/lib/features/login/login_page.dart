import 'package:flutter/material.dart';
import 'package:mobile/shared/widgets/background.dart';
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
        child: BackgroundColor(
          main: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Silahkan masukkan informasi akun kamu.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                inputForm(false, emailController, 'Enter username or email',
                    'Username'),
                const SizedBox(height: 15),
                inputForm(
                    true, passwordController, 'Enter password', 'Password'),
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
                // const Text(
                //   'Forgot Password ?',
                //   style: TextStyle(
                //     fontWeight: FontWeight.w300,
                //     color: Colors.blue,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    handleLogin();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xff387ADF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Atau masuk dengan',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                buttonLoginWith('Google', 'googleIcon'),
                const SizedBox(height: 15),
                buttonLoginWith('GitHub', 'githubIcon'),
                const SizedBox(height: 15),
                const Text(
                  'Belum punya akun? Daftar disini',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          splash: false,
        ),
      ),
    );
  }

  Widget inputForm(bool hidden, TextEditingController controller, String hint,
      String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: hidden,
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  30,
                ),
              ),
            ),
            fillColor: const Color(0xffffffff),
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 27),
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            hintText: hint,
          ),
        ),
      ],
    );
  }

  Widget buttonLoginWith(String text, String icon) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        border: Border.all(
          width: 1,
          color: Colors.transparent,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/$icon.png'),
          const SizedBox(width: 10),
          Text(
            'Masuk dengan $text',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
