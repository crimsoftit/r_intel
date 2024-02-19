// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/textfield_style.dart';
import 'package:r_intel/src/features/authentication/controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: rFormHeight - 10,
      ),
      child: Form(
        key: loginController.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RTextfield(
              obscureText: false,
              txtController: loginController.email,
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

            RTextfield(
              //inkwell for toggle password
              obscureText: true,
              txtController: loginController.password,
              inputDecoration: InputDecoration(
                label: const Text('Password'),
                prefixIcon: const Icon(
                  Icons.fingerprint,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_off,
                  ),
                ),
                alignLabelWithHint: false,
                filled: true,
              ),
            ),
            const SizedBox(
              height: rFormHeight - 20,
            ),

            Obx(
              () => ElevatedButton.icon(
                icon: loginController.isLoading.value
                    ? Container(
                        width: 24.0,
                        height: 24.0,
                        padding: const EdgeInsets.all(2.0),
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : const Icon(Icons.feedback),
                label: Text(
                  'Login'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 11,
                    fontFamily: 'Poppins',
                  ),
                ),
                onPressed: loginController.isLoading.value
                    ? () {}
                    : () => loginController.login(),
              ),
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: Text(
            //       'Sign Up'.toUpperCase(),
            //       style: const TextStyle(
            //         fontSize: 10,
            //         fontFamily: 'Poppins',
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
