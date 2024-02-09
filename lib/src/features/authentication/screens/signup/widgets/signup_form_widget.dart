// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/textfield_style.dart';
import 'package:r_intel/src/features/authentication/controllers/signup_controller.dart';
import 'package:r_intel/src/features/authentication/screens/pswd_reset/reset_pswd_otp/otp_screen.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    final _formKey = GlobalKey<FormState>();
    FocusNode focusNode = FocusNode();

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: rFormHeight - 10,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RTextfield(
              txtController: controller.fullName,
              inputDecoration: const InputDecoration(
                label: Text('Full Name'),
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                ),
              ),
            ),
            const SizedBox(
              height: rFormHeight - 20,
            ),
            RTextfield(
              txtController: controller.email,
              inputDecoration: const InputDecoration(
                label: Text('Email'),
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
              ),
            ),
            const SizedBox(
              height: rFormHeight - 20,
            ),
            IntlPhoneField(
              controller: controller.phoneNo,
              focusNode: focusNode,
              dropdownTextStyle: const TextStyle(
                fontSize: 10,
                fontFamily: 'Poppins',
                height: 0.8,
              ),
              decoration: const InputDecoration(
                counterText: '',
                label: Text('Phone number'),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                    color: rBrown,
                  ),
                ),
              ),
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'Poppins',
                height: 0.8,
              ),
              keyboardType: TextInputType.phone,
              languageCode: "en",
              onChanged: (phone) {
                controller.cell_no.value = phone.completeNumber;

                //print(controller.cell_no.value);
              },
              onCountryChanged: (country) {
                //print('country changed to: ${country.name}');
              },
            ),
            const SizedBox(
              height: rFormHeight - 20,
            ),
            RTextfield(
              txtController: controller.password,
              inputDecoration: const InputDecoration(
                label: Text('Password'),
                prefixIcon: Icon(
                  Icons.fingerprint,
                ),
              ),
            ),
            const SizedBox(
              height: rFormHeight - 20,
            ),
            RTextfield(
              txtController: controller.confirmPassword,
              inputDecoration: const InputDecoration(
                label: Text('Confirm password'),
                prefixIcon: Icon(
                  Icons.fingerprint,
                ),
              ),
            ),
            const SizedBox(
              height: rFormHeight - 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // SignupController.instance.registerUser(
                    //   controller.email.text.trim(),
                    //   controller.password.text.trim(),
                    // );

                    SignupController.instance
                        .phoneAuthentication(controller.phoneNo.text.trim());
                    Get.to(const OTPScreen());
                  }
                },
                child: Text(
                  'Sign Up'.toUpperCase(),
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
