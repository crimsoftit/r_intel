// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/textfield_style.dart';
import 'package:r_intel/src/features/authentication/controllers/signup_controller.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    FocusNode focusNode = FocusNode();

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: rFormHeight - 10,
      ),
      child: Form(
        key: controller.signUpFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RTextfield(
              obscureText: false,
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
            // TextFormField(
            //   controller: controller.email,
            //   readOnly: true,
            //   decoration: InputDecoration(
            //       labelText: 'Email',
            //       labelStyle: textStyle,
            //       hintStyle: const TextStyle(fontStyle: FontStyle.italic)),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'please type in your email address...';
            //     }
            //     return null;
            //   },
            // ),
            RTextfield(
              obscureText: false,
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
              initialCountryCode: 'KE',
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
                print('country changed to: ${country.name}');
              },
            ),
            const SizedBox(
              height: rFormHeight - 20,
            ),
            RTextfield(
              //inkwell for toggle password
              obscureText: true,
              txtController: controller.password,
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
            RTextfield(
              obscureText: true,
              txtController: controller.confirmPassword,
              inputDecoration: InputDecoration(
                label: const Text('Confirm password'),
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
              height: rFormHeight - 10,
            ),

            Obx(
              () => ElevatedButton.icon(
                icon: controller.isLoading.value
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
                  'Sign up'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 11,
                    fontFamily: 'Poppins',
                  ),
                ),
                onPressed: controller.isLoading.value
                    ? () {}
                    : () => controller.createUser(),
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
