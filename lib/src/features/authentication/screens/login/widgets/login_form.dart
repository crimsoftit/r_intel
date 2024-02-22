// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/features/authentication/controllers/login_controller.dart';
import 'package:r_intel/src/repository/auth_repository/auth_repo.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    final auth = AuthRepo.instance;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: rFormHeight - 10,
      ),
      child: Form(
        key: loginController.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- error message is displayed here
            Obx(
              () => Container(
                padding: loginController.errorMsg.value != ''
                    ? const EdgeInsets.all(rDefaultSize)
                    : const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.redAccent.withOpacity(0.1),
                ),
                child: PrimaryText(
                  text: loginController.errorMsg.value,
                  color: Colors.red,
                  size: 10.0,
                ),
              ),
            ),

            const SizedBox(
              height: rFormHeight - 15,
            ),

            TextFormField(
              obscureText: false,
              controller: loginController.email,
              validator: auth.validateEmail,
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'Poppins',
                height: 0.8,
              ),
              decoration: const InputDecoration(
                label: Text('Email'),
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
              ),
            ),

            const SizedBox(
              height: rFormHeight - 20,
            ),

            TextFormField(
              obscureText: true,
              controller: loginController.password,
              validator: auth.validatePassword,
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'Poppins',
                height: 0.8,
              ),
              decoration: InputDecoration(
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
              ),
            ),

            const SizedBox(
              height: rFormHeight - 10,
            ),

            Obx(
              () => SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
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
                      : const Icon(LineAwesomeIcons.alternate_sign_in),
                  label: Text(
                    'Login'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 11,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  onPressed: loginController.isLoading.value
                      ? () {}
                      : () {
                          if (loginController.loginFormKey.currentState!
                              .validate()) {
                            loginController.login();
                          }
                        },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
