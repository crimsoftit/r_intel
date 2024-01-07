import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/constants/text_strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: [
              OnboardingPage(size: size),
              Container(
                color: rOnboardingPage2Color,
                child: const Column(
                  children: [
                    Image(
                      image: AssetImage(rOnboardingImg2),
                    ),
                    Text(rOnbaordingTitle2),
                    Text(rOnbaordingSubTitle2),
                    Text(rOnbaordingCounter2),
                  ],
                ),
              ),
              Container(
                color: rOnboardingPage3Color,
                child: const Column(
                  children: [
                    Image(
                      image: AssetImage(rOnboardingImg3),
                    ),
                    Text(rOnbaordingTitle3),
                    Text(rOnbaordingSubTitle3),
                    Text(rOnbaordingCounter3),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(rDefaultSize),
      color: context.isDarkMode
          ? rOnboardingPage1ColorDarkColor
          : rOnboardingPage1ColorLightColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: const AssetImage(rOnboardingImg1),
            height: size.height * 0.5,
          ),
          const Column(
            children: [
              PrimaryText(
                text: rOnbaordingTitle1,
                size: 16,
                color: Colors.white30,
              ),
              SizedBox(
                height: 20,
              ),
              PrimaryText(
                text: rOnbaordingSubTitle1,
                size: 12,
                txtAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
          const PrimaryText(
            text: rOnbaordingCounter1,
            size: 10,
          ),
        ],
      ),
    );
  }
}
