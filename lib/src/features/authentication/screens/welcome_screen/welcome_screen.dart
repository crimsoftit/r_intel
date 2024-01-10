import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:r_intel/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/features/authentication/models/fade_in_animation_model.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? rSecondaryColor : rPrimaryColor,
      body: Stack(
        children: [
          RFadeInAnimation(
            durationInMs: 1200,
            animate: RAnimatePosition(
              topBefore: 0,
              topAfter: 0,
              leftBefore: 0,
              leftAfter: 0,
              rightBefore: 0,
              rightAfter: 0,
              bottomBefore: -100,
              bottomAfter: 0,
            ),
            child: Container(
              padding: const EdgeInsets.all(rDefaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: const AssetImage(rWelcomeScreenImg1),
                    height: height * 0.6,
                  ),
                  const Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      PrimaryText(
                        text: rWelcomeTitle,
                        size: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      PrimaryText(
                        text: rWelcomeSubTitle,
                        size: 13,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            'Login'.toUpperCase(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Sign up'.toUpperCase(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
