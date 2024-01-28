import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/constants/text_strings.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 40.0,
            ),
            const PrimaryText(
              text: "$rOtpMsg+254 746 683 785",
              size: 10,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 20.0,
            ),
            OtpTextField(
              numberOfFields: 6,
              filled: true,
              fillColor: Colors.brown.withOpacity(0.1),
              keyboardType: TextInputType.number,
              onSubmit: (code) {
                print("OTP code is $code");
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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
