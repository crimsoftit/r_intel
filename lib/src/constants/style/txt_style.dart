import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/constants/colors.dart';

class PrimaryText extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final Color color;
  final String text;
  final double height;
  final TextAlign txtAlign;

  const PrimaryText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.fontStyle = FontStyle.italic,
    this.color = rSecondaryColor,
    this.size = 20,
    this.height = 1.3,
    this.txtAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: context.isDarkMode ? Colors.white : rSecondaryColor,
        height: height,
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
