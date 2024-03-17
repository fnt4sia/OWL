import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool hidden;
  final TextEditingController controller;
  final String hint;
  final String label;
  const CustomTextField({
    super.key,
    required this.hidden,
    required this.controller,
    required this.hint,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
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
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
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
}
