import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/repository/auth_repo.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // textfield controllers to get user's input data from textfields
  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  // call this function from ui and it'll do the rest
  void registerUser(String email, String password) {
    AuthRepo.instance.createUserWithEmailAndPassword(email, password);
  }
}
