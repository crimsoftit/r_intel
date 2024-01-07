// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/features/authentication/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2000),
              top: 80,
              left: splashController.animate.value ? rDefaultSize : -80,
              child: AnimatedOpacity(
                opacity: splashController.animate.value ? 1 : 0,
                duration: const Duration(milliseconds: 2000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rAppName,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(
                      rAppTagLine,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: splashController.animate.value ? 400 : 0,
              right: splashController.animate.value ? 70 : 0,
              child: AnimatedOpacity(
                opacity: splashController.animate.value ? 1 : 0,
                duration: const Duration(milliseconds: 2000),
                child: const Image(
                  image: AssetImage(rSplashImage1),
                ),
              ),
            ),
          ),
          // Obx(
          //   () => AnimatedPositioned(
          //     duration: const Duration(milliseconds: 2400),
          //     bottom: 100,
          //     right: rDefaultSize,
          //     child: Container(
          //       width: rSplashContainerSize,
          //       height: rSplashContainerSize,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(100),
          //         color: AppColors.primaryColor,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
