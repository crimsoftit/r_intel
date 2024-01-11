import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: const AssetImage(rLoginImg),
          height: size.height * 0.3,
        ),
        const PrimaryText(
          text: rLoginTitle,
          size: 18,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(
          height: 10,
        ),
        const PrimaryText(
          text: rLoginSubTitle,
          size: 11,
        ),
      ],
    );
  }
}
