import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/repository/auth_repo.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // ignore: non_constant_identifier_names
  RxString cell_no = ''.obs;

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

  // get phone number from user and pass it to auth repo for firebase authentication
  void phoneAuthentication(String phoneNo) {
    phoneNo = cell_no.toString();
    print("**********");
    print(phoneNo);
    print("**********");
    AuthRepo.instance.phoneAuth(phoneNo);
  }
}
