import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/repository/auth_repository/auth_repo.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // -- textfield controllers to get user input data from textfields
  final showPassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // -- loader
  final isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;

  // -- email & password login
  Future<void> login() async {
    try {
      isLoading.value = true;

      if (!loginFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }

      final auth = AuthRepo.instance;

      await AuthRepo.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      auth.setInitialScreen(auth.firebaseUser);
    } catch (e) {
      isLoading.value = false;
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
}
