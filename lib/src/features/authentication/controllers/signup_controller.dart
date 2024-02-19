import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/features/authentication/models/user_model.dart';
import 'package:r_intel/src/repository/auth_repository/auth_repo.dart';
import 'package:r_intel/src/repository/user_repository/user_repository.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // ignore: non_constant_identifier_names
  RxString cell_no = ''.obs;

  final userRepo = Get.put(UserRepository());

  // -- loader
  final isLoading = false.obs;

  // textfield controllers to get user's input data from textfields
  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  // call this function from ui and it'll do the rest
  void registerUser(String email, String password) {
    AuthRepo.instance.createUserWithEmailAndPassword(email, password);
  }

  // get phone number from user and pass it to auth repo for firebase authentication
  void phoneAuthentication(String phoneNo) {
    phoneNo = cell_no.toString();
    print("**********");
    print(phoneNo);
    print("**********");
    AuthRepo.instance.phoneAuth(phoneNo);
  }

  // -- create new user using either [Email&Password] or [PhoneNumber]
  Future<void> createUser() async {
    try {
      isLoading.value = true;

      if (!signUpFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }

      // -- get User model Object and pass it to SignupController Object
      final user = UserModel(
        fullName: fullName.text.trim(),
        email: email.text.trim(),
        phoneNo: phoneNo.text,
        password: password.text.trim(),
      );

      // -- authenticate user first
      final auth = AuthRepo.instance;
      final userRepo = UserRepository.instance;

      await auth.createUserWithEmailAndPassword(user.email, user.password);

      await userRepo.createUser(user);

      auth.setInitialScreen(auth.firebaseUser);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'ERROR!!',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
        duration: const Duration(seconds: 15),
      );
    }
  }
}
