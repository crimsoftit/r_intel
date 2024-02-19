// ignore_for_file: unused_field

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/repository/auth_repository/auth_repo.dart';

class MailVerificationController extends GetxController {
  late Timer _redirectTimer;

  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();
  }

  // -- send OR resend email verification link
  Future<void> sendVerificationEmail() async {
    try {
      await AuthRepo.instance.sendEmailVerification();
    } catch (e) {
      // Helper.errorSnackBar(
      //   title: rOhSnap,
      //   message: e.toString(),
      // );
      Get.snackbar(
        rOhSnap,
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
        duration: const Duration(seconds: 10),
      );
    }
  }

  // -- set timer to check if email verification completed successfully then redirect
  Future<void> setTimerForAutoRedirect() async {
    _redirectTimer = Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        FirebaseAuth.instance.currentUser?.reload();

        final user = FirebaseAuth.instance.currentUser;

        if (user!.emailVerified) {
          timer.cancel();
          AuthRepo.instance.setInitialScreen(user);
        }
      },
    );
  }

  // -- manually check if verification completed successfully then redirect
  void manuallyCheckEmailVerificationStatus() {
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;

    if (user!.emailVerified) {
      AuthRepo.instance.setInitialScreen(user);
    }
  }
}
