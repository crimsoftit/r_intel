
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/repository/auth_repository/auth_repo.dart';
import 'package:r_intel/src/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  // textfield controllers to get user's input data from textfields
  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  GlobalKey<FormState> updateProfileFormKey = GlobalKey<FormState>();
  

  final _authRepo = Get.put(AuthRepo());
  final _userRepo = Get.put(UserRepository());

  // -- fetch user email and pass it to UserRepository to fetch user record
  getUserDetails() {
    final email = _authRepo.firebaseUser?.email;
    if (email != null) {
      return _userRepo.fetchUserDetails(email);
    } else {
      Get.snackbar("ERROR!!", 'sign in to proceed...');
    }
  }
}
