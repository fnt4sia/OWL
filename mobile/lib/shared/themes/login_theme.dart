import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginTheme extends StatelessWidget {
  final Widget main;

  const LoginTheme({
    super.key,
    required this.main,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: const Color(0xffefefef),
        ),
        Positioned(
            child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/ellipseTop.png'),
            fit: BoxFit.cover,
          )),
        )),
        Positioned(
          top: -590,
          bottom: 0,
          left: 178,
          right: 0,
          child: Container(
            // width: MediaQuery.of(context).size.width * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logoLogin.png'),
                // fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        main,
        Positioned(
            child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/ellipseBottom.png'),
            fit: BoxFit.cover,
          )),
        )),
      ],
    );
  }
}
