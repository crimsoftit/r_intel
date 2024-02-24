import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:r_intel/src/features/authentication/screens/email_verification/mail_verification.dart';
import 'package:r_intel/src/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:r_intel/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:r_intel/src/features/core/screens/dashboard/dashboard.dart';
import 'package:r_intel/src/repository/auth_repository/exceptions/duara_exceptions.dart';
import 'package:r_intel/src/repository/auth_repository/exceptions/signup_exceptions.dart';

class AuthRepo extends GetxController {
  static AuthRepo get instance => Get.find();

  // -- firebase variables
  late final Rx<User?> _firebaseUser;
  final _auth = FirebaseAuth.instance;
  var verificationId = ''.obs;

  //late final GoogleSignInAccount _googleUser;

  // -- getters
  User? get firebaseUser => _firebaseUser.value;

  String get getUserId => firebaseUser?.uid ?? "";

  String get getUserEmail => firebaseUser?.email ?? "";

  // -- loads upon app launch - function will be called to set firebaseUser state
  @override
  void onReady() {
    //Future.delayed(const Duration(seconds: 20));
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    FlutterNativeSplash.remove();
    setInitialScreen(_firebaseUser.value);
    //ever(_firebaseUser, _setInitialScreen);
  }

  // -- sets initial screen onLoad
  setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const OnboardingScreen())
        : user.emailVerified
            ? Get.offAll(() => const Dashboard())
            : Get.offAll(() => const MailVerification());
  }

  // -- sign in with email & password (login)
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> loginWithEmailNPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Get.snackbar("ERROR!!", 'invalid email address');
        return;
      } else if (e.code == 'invalid-password') {
        Get.snackbar("ERROR!!", 'invalid password!');
        return;
      } else {
        const exception = DExceptions();
        Get.snackbar(
          'LOGIN EXCEPTION',
          exception.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );
        return;
        //print('EXCEPTION - ${exception.message}');
      }
    }
  }

  // -- email verification [EmailVerification] (verification)
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final exception = DExceptions.fromCode(e.code);
      throw exception.message;
    } catch (_) {
      const exception = DExceptions();
      throw exception;
    }
  }

  // -- create user with email & password
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
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
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar(
            'error!',
            'invalid phone number!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
            duration: const Duration(seconds: 30),
          );
        } else {
          final exception = SignupExceptions.code(e.code);
          Get.snackbar(
            'error!',
            exception.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
            duration: const Duration(seconds: 30),
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

  // -- [GoogleAuthentication] - sign in with google
  Future<UserCredential> signInWithGoogle() async {
    try {
      // trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // once signed in, return the UserCredential Object(class)
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      final exception = DExceptions.fromCode(e.code);
      throw exception.message;
    } catch (_) {
      const exception = DExceptions();
      throw exception.message;
    }
  }

  // ## FORM VALIDATIONS
  // -- validate email address
  String? validateEmail(String? loginEmail) {
    if (loginEmail == null || loginEmail.isEmpty) {
      return 'e-mail address is required!';
    } else if (!loginEmail.isEmail) {
      return 'invalid e-mail address format';
    }
    return null;
  }

  // -- validate password
  String? validatePassword(String? formPassword) {
    String pswdPattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&%~]).{8,}$';

    RegExp reqex = RegExp(pswdPattern);

    if (formPassword == null || formPassword.isEmpty) {
      return 'password is required!';
    }

    if (!reqex.hasMatch(formPassword)) {
      return '''
        password must be;
        - at least 8 characters long and,
        include:
        - an uppercase letter,
        - a number, and
        - a symbol!
      ''';
    }
    return null;
  }

  // -- log out user
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      //await FacebookAuth.instance.logout();
      await _auth.signOut();
      Get.offAll(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } on FormatException catch (e) {
      throw e.message;
    } catch (e) {
      throw 'unable to log out! please try again';
    }
  }
}
