import 'package:get/get.dart';
import 'package:r_intel/src/features/authentication/screens/onboarding/onboarding_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );

    animate.value = true;

    await Future.delayed(const Duration(milliseconds: 5000));
    Get.to(const OnboardingScreen());
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }
}
