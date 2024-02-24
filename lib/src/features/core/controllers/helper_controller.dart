import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/size.dart';

class DHelper extends GetxController {
  /* -- ======= validations ======= -- */
  static String? validateEmail(value) {}

  static String? validatePassword(value) {}

  /* -- ======= snack bars ======= -- */
  static errorSnackBar({required title, message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.red,
      backgroundColor: Colors.redAccent.withOpacity(0.2),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 10),
      margin: const EdgeInsets.all(rDefaultSpace - 10),
      icon: const Icon(
        LineAwesomeIcons.ambulance,
        color: rWhiteColor,
      ),
    );
  }

  static modernSnackBar({required title, message}) {}

  static successSnackBar({required title, message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: rWhiteColor,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 10),
      margin: const EdgeInsets.all(rDefaultSpace - 10),
      icon: const Icon(
        LineAwesomeIcons.check_circle,
        color: rWhiteColor,
      ),
    );
  }

  static warningSnackBar({required title, message}) {}
}
