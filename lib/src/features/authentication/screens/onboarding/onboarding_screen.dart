import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/features/authentication/models/onboarding_model.dart';
import 'package:r_intel/src/features/authentication/screens/onboarding/onboarding_page_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final pages = [
      OnboardingPageWidget(
        model: OnboardingModel(
          image: rOnboardingImg1,
          title: rOnbaordingTitle1,
          subTitle: rOnbaordingSubTitle1,
          sliderText: rOnbaordingCounter1,
          bgColorDark: rOnboardingPage1ColorDark,
          bgColorLight: rOnboardingPage1ColorLight,
          height: size.height,
        ),
      ),
      OnboardingPageWidget(
        model: OnboardingModel(
          image: rOnboardingImg2,
          title: rOnbaordingTitle2,
          subTitle: rOnbaordingSubTitle2,
          sliderText: rOnbaordingCounter2,
          bgColorDark: rOnboardingPage2ColorDark,
          bgColorLight: rOnboardingPage2ColorLight,
          height: size.height,
        ),
      ),
      OnboardingPageWidget(
        model: OnboardingModel(
          image: rOnboardingImg3,
          title: rOnbaordingTitle3,
          subTitle: rOnbaordingSubTitle3,
          sliderText: rOnbaordingCounter3,
          bgColorDark: rOnboardingPage3ColorDark,
          bgColorLight: rOnboardingPage3ColorLight,
          height: size.height,
        ),
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: pages,
          ),
        ],
      ),
    );
  }
}
