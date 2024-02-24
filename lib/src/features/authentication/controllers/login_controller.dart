import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/features/core/controllers/helper_controller.dart';
import 'package:r_intel/src/repository/auth_repository/auth_repo.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // -- textfield controllers to get user input data from textfields
  final showPassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();

  final auth = AuthRepo.instance;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  RxString errorMsg = ''.obs;

  // -- loader
  final isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;

  // -- login with email & password
  Future<void> login() async {
    try {
      isLoading.value = true;

      final auth = AuthRepo.instance;

      await AuthRepo.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      auth.setInitialScreen(auth.firebaseUser);

      errorMsg.value = '';
    } on FirebaseAuthException catch (error) {
      isLoading.value = false;
      errorMsg.value = error.message!;
    }
  }

  // -- sign in with google - [GoogleSignInAuthentication]
  Future<void> googleSignIn() async {
    try {
      isGoogleLoading.value = true;
      await AuthRepo.instance.signInWithGoogle();
      isGoogleLoading.value = false;
      auth.setInitialScreen(auth.firebaseUser);
    } catch (e) {
      isGoogleLoading.value = false;
      DHelper.errorSnackBar(
        title: rOhSnap,
        message: e.toString(),
      );
    }
  }

  // -- sign in with facebook - [FacebookSignInAuthentication]
  Future<void> fbSignIn() async {}
}
