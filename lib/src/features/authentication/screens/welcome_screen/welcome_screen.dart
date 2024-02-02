import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/features/authentication/screens/login/login_screen.dart';
import 'package:r_intel/src/features/authentication/screens/signup/signup_screen.dart';

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
      backgroundColor:
          isDarkMode ? rSecondaryColor : rOnboardingPage2ColorLight,
      body: Stack(
        children: [
          Container(
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
                      size: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PrimaryText(
                      text: rWelcomeSubTitle,
                      size: 11,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Get.to(const LoginScreen());
                        },
                        child: Text(
                          'Login'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 10,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(SignUpScreen());
                        },
                        child: Text(
                          'Sign up'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 10,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
