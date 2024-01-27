import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    this.image,
    required this.title,
    required this.subTitle,
    this.imgColor,
    this.imgHeight = 0.2,
    this.heightBetween,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final Color? imgColor;
  final double imgHeight;
  final double? heightBetween;
  final CrossAxisAlignment crossAxisAlignment;

  final String? image;
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image!),
          color: imgColor,
          height: size.height * imgHeight,
        ),
        PrimaryText(
          text: title,
          size: 18,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(
          height: 10,
        ),
        PrimaryText(
          text: subTitle,
          size: 11,
        ),
      ],
    );
  }
}
