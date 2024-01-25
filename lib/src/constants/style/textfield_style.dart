import 'package:flutter/material.dart';

class RTextfield extends StatelessWidget {
  const RTextfield({
    super.key,
    required this.inputDecoration,
    required this.txtController,
  });

  final InputDecoration inputDecoration;
  final TextEditingController txtController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
