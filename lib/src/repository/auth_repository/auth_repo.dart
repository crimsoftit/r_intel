import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:r_intel/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:r_intel/src/features/core/screens/dashboard/dashboard.dart';
import 'package:r_intel/src/repository/auth_repository/exceptions/signup_exceptions.dart';

class AuthRepo extends GetxController {
  static AuthRepo get instance => Get.find();

  // firebase variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  // -- loads upon app launch - function will be called to set firebaseUser state
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 20));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  // -- sets initial screen onLoad
  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const OnboardingScreen())
        : Get.offAll(() => const Dashboard());
  }

  // -- create user with email & password
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final exception = SignupExceptions.code(e.code);
      Get.snackbar(
        'FIREBASE AUTH EXCEPTION',
        exception.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
        duration: const Duration(seconds: 30),
      );
      print('FIREBASE AUTH EXCEPTION - ${exception.message}');
      throw exception;
    } catch (_) {
      const exception = SignupExceptions();
      Get.snackbar(
        'EXCEPTION',
        exception.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      print('EXCEPTION - ${exception.message}');
      throw exception;
    }
  }

  // -- sign in with email & password
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Get.snackbar("ERROR!!", 'invalid email address');
      } else if (e.code == 'invalid-password') {
        Get.snackbar("ERROR!!", 'invalid password!');
      }
    } catch (_) {}
  }

  // -- login with phone number
  loginWithPhoneNo(String phoneNumber) async {
    try {
      await _auth.signInWithPhoneNumber(phoneNumber);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-phone-number') {
        Get.snackbar("ERROR!!", 'invalid phone number');
      }
    } catch (_) {
      Get.snackbar("ERROR!!", "something went wrong. try again later");
    }
  }

  // -- phone verification
  Future<void> phoneAuth(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      timeout: const Duration(seconds: 120),
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar(
            'error!',
            'invalid phone number!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
          );
        } else {
          final exception = SignupExceptions.code(e.code);
          Get.snackbar(
            'error!',
            exception.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
          );
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials =
        await _auth.signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId.value,
      smsCode: otp,
    ));
    return credentials.user != null ? true : false;
  }

  // -- log out user
  Future<void> logout() async {
    await _auth.signOut();
  }
}
