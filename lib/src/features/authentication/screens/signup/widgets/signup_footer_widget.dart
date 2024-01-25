import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/features/authentication/screens/login/login_screen.dart';

class SignupFooterWidget extends StatelessWidget {
  const SignupFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PrimaryText(
          text: 'OR',
          size: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(rGoogleLogo),
              width: 20.0,
            ),
            onPressed: () {},
            label: PrimaryText(
              text: rGoogleSignUp.toUpperCase(),
              size: 10,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Get.to(const LoginScreen());
          },
          style: ButtonStyle(
            alignment: Alignment.centerRight,
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.zero,
            ),
          ),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: rAccAvailable,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: rLogin,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
