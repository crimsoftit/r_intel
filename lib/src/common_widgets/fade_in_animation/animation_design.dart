import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:r_intel/src/features/authentication/models/fade_in_animation_model.dart';

class RFadeInAnimation extends StatelessWidget {
  RFadeInAnimation({
    super.key,
    required this.durationInMs,
    this.animate,
    required this.child,
  });

  final splashController = Get.put(FadeInAnimationController());

  final int durationInMs;

  final RAnimatePosition? animate;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: durationInMs),
        top: splashController.animate.value ? animate!.topAfter : -30,
        left: splashController.animate.value ? animate!.leftAfter : -30,
        bottom: splashController.animate.value ? animate!.bottomAfter : -30,
        right: splashController.animate.value ? animate!.rightAfter : -30,
        child: AnimatedOpacity(
          opacity: splashController.animate.value ? 1 : 0,
          duration: Duration(milliseconds: durationInMs),
          child: child,
        ),
      ),
    );
  }
}
