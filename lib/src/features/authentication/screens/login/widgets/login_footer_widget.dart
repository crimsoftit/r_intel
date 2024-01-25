import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/features/authentication/screens/signup/signup_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
              text: rGoogleSignin.toUpperCase(),
              size: 10,
            ),
          ),
        ),
        const SizedBox(
          height: rFormHeight - 20,
        ),
        TextButton(
          onPressed: () {
            Get.to(SignUpScreen());
          },
          child: Text.rich(
            TextSpan(
              text: rNoAccount,
              style: Theme.of(context).textTheme.bodySmall,
              children: const [
                TextSpan(
                  text: rSignUp,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    color: Colors.blue,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
