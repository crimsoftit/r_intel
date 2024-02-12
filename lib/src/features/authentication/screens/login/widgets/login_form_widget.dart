import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/constants/style/textfield_style.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';

import 'package:r_intel/src/features/authentication/screens/pswd_reset/reset_pswd_options/reset_pswd_modal.dart';
import 'package:r_intel/src/features/core/screens/dashboard/dashboard.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RTextfield(
              inputDecoration: const InputDecoration(
                label: Text('Email'),
                hintText: 'Email',
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            RTextfield(
              inputDecoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: 'Password',
                hintText: 'Password',
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),

            // -- RESET PASSWORD BUTTON
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ResetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const PrimaryText(
                  text: 'Forgot password?',
                  size: 10,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            // --LOGIN BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(const Dashboard());
                },
                child: Text(
                  'Login'.toUpperCase(),
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
