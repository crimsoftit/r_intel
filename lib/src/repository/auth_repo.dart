import 'package:firebase_auth/firebase_auth.dart';
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
    Future.delayed(
      const Duration(
        seconds: 10,
      ),
    );
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

  // -- phone verification
  Future<void> phoneAuth(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, forceResendingToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('error!', 'invalid phone number!');
        } else {
          Get.snackbar('error!', 'something went wrong... try again');
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

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final exception = SignupExceptions.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${exception.message}');
      throw exception;
    } catch (_) {
      const exception = SignupExceptions();
      print('EXCEPTION - ${exception.message}');
      throw exception;
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
