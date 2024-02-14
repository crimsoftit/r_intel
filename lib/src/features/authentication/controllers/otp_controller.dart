import 'package:get/get.dart';
import 'package:r_intel/src/features/core/screens/dashboard/dashboard.dart';
import 'package:r_intel/src/repository/auth_repository/auth_repo.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthRepo.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const Dashboard()) : Get.back();
  }
}
