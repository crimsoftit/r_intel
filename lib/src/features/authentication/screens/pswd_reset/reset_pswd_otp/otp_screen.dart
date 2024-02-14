import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/features/authentication/controllers/otp_controller.dart';
import 'package:r_intel/src/features/authentication/controllers/signup_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    Get.put(OTPController());
    var otp;

    final signupController = Get.put(SignupController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(rDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PrimaryText(
              text: rOtpTitle,
              size: 60,
              fontWeight: FontWeight.w600,
            ),
            PrimaryText(
              text: rOtpSubTitle.toUpperCase(),
              size: 13,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 40.0,
            ),
            PrimaryText(
              text: rOtpMsg + signupController.cell_no.toString(),
              size: 10,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 20.0,
            ),
            OtpTextField(
              numberOfFields: 6,
              filled: true,
              fillColor: isDarkMode
                  ? Colors.white.withOpacity(0.8)
                  : Colors.brown.withOpacity(0.1),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: false,
              ),
              onSubmit: (code) {
                otp = code;
                OTPController.instance.verifyOTP(otp);
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  OTPController.instance.verifyOTP(otp);
                },
                child: Text(
                  'Next'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
