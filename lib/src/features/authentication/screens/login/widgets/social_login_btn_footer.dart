import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/common_widgets/buttons/social_btn.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/features/authentication/controllers/login_controller.dart';

class SocialLoginFooterWidget extends StatelessWidget {
  const SocialLoginFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Container(
      padding: const EdgeInsets.only(
        top: rDefaultSpace * 1.5,
        bottom: rDefaultSpace,
      ),
      child: Column(
        children: [
          Obx(
            () => DSocialButton(
              text: 'Connect with Google',
              image: rGoogleLogo,
              foreground: Colors.brown,
              background: rBrown.withOpacity(0.1),
              isLoading: loginController.isGoogleLoading.value ? true : false,
              onPressed: loginController.isFacebookLoading.value ||
                      loginController.isLoading.value
                  ? () {}
                  : loginController.isGoogleLoading.value
                      ? () {}
                      : () {
                          loginController.googleSignIn();
                        },
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Obx(
            () => DSocialButton(
              text: 'Connect with Facebook',
              image: dFbLogo,
              foreground: Colors.brown,
              background: rBrown.withOpacity(0.1),
              isLoading: loginController.isFacebookLoading.value ? true : false,
              onPressed: loginController.isGoogleLoading.value ||
                      loginController.isLoading.value
                  ? () {}
                  : loginController.isFacebookLoading.value
                      ? () {}
                      : () {
                          loginController.fbSignIn();
                        },
            ),
          ),
        ],
      ),
    );
  }
}
