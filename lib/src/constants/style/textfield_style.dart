// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RTextfield extends StatelessWidget {
  RTextfield({
    super.key,
    required this.inputDecoration,
    this.txtController,
    this.obscureText = false,
  });

  final InputDecoration inputDecoration;
  final TextEditingController? txtController;
  late bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: txtController,
      style: const TextStyle(
        fontSize: 10,
        fontFamily: 'Poppins',
        height: 0.8,
      ),
      decoration: inputDecoration,
    );
  }
}
