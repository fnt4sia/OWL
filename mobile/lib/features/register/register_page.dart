import 'package:flutter/material.dart';
import 'package:mobile/features/register/register_model.dart';
import '../../shared/widgets/background.dart';
import '../../shared/widgets/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  String errorText = '';
  String successText = '';

  void handleRegister() {
    String emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';

    if (RegExp(emailRegex).hasMatch(emailController.text)) {
      if (passwordController.text != confirmController.text) {
        setState(() {
          errorText = "Password Doesn't Match";
        });
        return;
      } else if (passwordController.text.length < 6) {
        setState(() {
          errorText = "Password Must Contains More Than 6 Letters";
        });
      } else {
        RegisterModel.registerEmail(
                emailController.text, passwordController.text)
            .then((value) {
          if (value['status'] == "success") {
            Navigator.of(context).pushReplacementNamed('/verif');
          } else {
            setState(() {
              errorText = value["message"];
            });
          }
        });
      }
    } else {
      setState(() {
        errorText = 'Please Enter A Valid Email';
      });
      return;
    }
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Buat Akun',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
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
                  hint: "Enter Email",
                  label: "Email",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hidden: false,
                  controller: passwordController,
                  hint: "Enter Password",
                  label: "Password",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hidden: false,
                  controller: confirmController,
                  hint: "Confirm Password",
                  label: "Confirm Password",
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    setState(() {
                      errorText = '';
                      successText = '';
                    });
                    handleRegister();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xff387ADF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                errorText.isNotEmpty
                    ? Text(
                        errorText,
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w400),
                      )
                    : const SizedBox(),
                successText.isNotEmpty
                    ? Text(
                        successText,
                        style: const TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w400),
                      )
                    : const SizedBox(),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sudah punya akun? ',
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: const Text(
                        ' Masuk disini',
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
}
