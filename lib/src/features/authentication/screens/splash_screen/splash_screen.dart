// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:r_intel/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:r_intel/src/features/authentication/models/fade_in_animation_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = Get.put(FadeInAnimationController());
    splashController.startSplashAnimation();
    return Scaffold(
      body: Stack(
        children: [
          RFadeInAnimation(
            durationInMs: 2400,
            animate: RAnimatePosition(
              bottomBefore: 0,
              bottomAfter: 200,
            ),
            child: const Image(
              image: AssetImage(rSplashImage1),
            ),
          ),
          // Obx(
          //   () => AnimatedPositioned(
          //     duration: const Duration(milliseconds: 2400),
          //     bottom: splashController.animate.value ? 400 : 0,
          //     right: splashController.animate.value ? 70 : 0,
          //     child: AnimatedOpacity(
          //       opacity: splashController.animate.value ? 1 : 0,
          //       duration: const Duration(milliseconds: 2000),
          //       child:
          //     ),
          //   ),
          // ),
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
