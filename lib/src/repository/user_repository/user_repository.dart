// ignore_for_file: body_might_complete_normally_catch_error

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // -- create user (signup)
  createUser(UserModel user) async {
    await _db
        .collection("users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar(
            'success!!',
            'account created successfully...',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
            duration: const Duration(seconds: 10),
          ),
        )
        .catchError((error, stackTrace) {
      Get.snackbar(
        'ERROR!!',
        'something went wrong. please try again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
        duration: const Duration(seconds: 10),
      );
      print(error.toString());
    });
  }

  // -- fetch user details by email
  Future<UserModel> fetchUserDetails(String email) async {
    final snapshot =
        await _db.collection("users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  // -- fetch all users
  Future<List<UserModel>> fetchAllUsers() async {
    final snapshot = await _db.collection("users").get();
    final allUsers =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return allUsers;
  }
}
