import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/textfield_style.dart';
import 'package:r_intel/src/features/authentication/controllers/signup_controller.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    final _formKey = GlobalKey<FormState>();

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
            RTextfield(
              txtController: controller.phoneNo,
              inputDecoration: const InputDecoration(
                label: Text('Phone number'),
                prefixIcon: Icon(
                  Icons.numbers_outlined,
                ),
              ),
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
                    SignupController.instance.registerUser(
                      controller.email.text.trim(),
                      controller.password.text.trim(),
                    );
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
