import 'package:flutter/material.dart';
import 'package:mobile/shared/widgets/background.dart';
import 'login_model.dart';
import '../../shared/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  final String message;
  const LoginPage({super.key, this.message = ''});

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
      if (value['status'] == "success") {
        Navigator.of(context).pushReplacementNamed('/main');
      } else {
        setState(() {
          errorText = value['message'];
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
                CustomTextField(
                  hidden: false,
                  controller: emailController,
                  hint: 'Enter email',
                  label: 'Email',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hidden: true,
                  controller: passwordController,
                  hint: 'Enter Password',
                  label: 'Password',
                ),
                const SizedBox(height: 5),
                errorText.isNotEmpty
                    ? Text(
                        errorText,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : const SizedBox(),
                widget.message.isNotEmpty
                    ? Text(
                        "${widget.message}, Check Your Email",
                        style: const TextStyle(
                          color: Colors.green,
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
                    setState(() {
                      errorText = '';
                    });
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Belum punya akun? ',
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: const Text(
                        ' Daftar disini',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonLoginWith(String text, String icon) {
    return InkWell(
      onTap: () {
        LoginModel.loginOauth(text.toLowerCase()).then((value) => {
              if (value) {Navigator.of(context).pushReplacementNamed('/main')}
            });
      },
      child: Container(
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
      ),
    );
  }
}
