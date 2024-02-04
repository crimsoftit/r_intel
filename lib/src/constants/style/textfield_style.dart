import 'package:flutter/material.dart';

class RTextfield extends StatelessWidget {
  const RTextfield({
    super.key,
    required this.inputDecoration,
  });

  final InputDecoration inputDecoration;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 10,
        fontFamily: 'Poppins',
        height: 0.8,
      ),
      decoration: inputDecoration,
    );
  }
}
