import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/features/authentication/models/onboarding_model.dart';
import 'package:r_intel/src/features/authentication/screens/onboarding/onboarding_page_widget.dart';

class OnboardingController extends GetxController {
  final liquidController = LiquidController();

  RxInt currentPage = 0.obs;

  final pages = [
    OnboardingPageWidget(
      model: OnboardingModel(
        image: rOnboardingImg1,
        title: rOnbaordingTitle1,
        subTitle: rOnbaordingSubTitle1,
        bgColorDark: rOnboardingPage1ColorDark,
        bgColorLight: rOnboardingPage1ColorLight,
        sliderText: rOnbaordingCounter1,
      ),
    ),
    OnboardingPageWidget(
      model: OnboardingModel(
        image: rOnboardingImg2,
        title: rOnbaordingTitle2,
        subTitle: rOnbaordingSubTitle2,
        bgColorDark: rOnboardingPage2ColorDark,
        bgColorLight: rOnboardingPage2ColorLight,
        sliderText: rOnbaordingCounter2,
      ),
    ),
    OnboardingPageWidget(
      model: OnboardingModel(
        image: rOnboardingImg3,
        title: rOnbaordingTitle3,
        subTitle: rOnbaordingSubTitle3,
        bgColorDark: rOnboardingPage3ColorDark,
        bgColorLight: rOnboardingPage3ColorLight,
        sliderText: rOnbaordingCounter3,
      ),
    ),
  ];

  onPageChangedCallBack(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  skip() => liquidController.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = liquidController.currentPage + 1;
    liquidController.animateToPage(page: nextPage);
  }
}
