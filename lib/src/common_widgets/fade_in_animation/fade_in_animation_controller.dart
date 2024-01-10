import 'package:get/get.dart';
import 'package:r_intel/src/features/authentication/screens/onboarding/onboarding_screen.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );

    animate.value = true;

    await Future.delayed(const Duration(milliseconds: 3000));

    animate.value = false;

    await Future.delayed(const Duration(milliseconds: 2000));

    Get.offAll(() => const OnboardingScreen());
    //Get.to(const WelcomeScreen());
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }

  Future startAnimation() async {
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );

    animate.value = true;
  }
}
