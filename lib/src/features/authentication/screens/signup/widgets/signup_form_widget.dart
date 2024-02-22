// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/textfield_style.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/features/authentication/controllers/signup_controller.dart';
import 'package:r_intel/src/repository/auth_repository/auth_repo.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    final auth = AuthRepo.instance;

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
            // -- error message is displayed here
            Obx(
              () => Container(
                padding: controller.errorMsg.value != ''
                    ? const EdgeInsets.all(rDefaultSize)
                    : const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.redAccent.withOpacity(0.1),
                ),
                child: PrimaryText(
                  text: controller.errorMsg.value,
                  color: Colors.red,
                  size: 10.0,
                ),
              ),
            ),

            const SizedBox(
              height: rFormHeight - 15,
            ),

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

            TextFormField(
              obscureText: false,
              controller: controller.email,
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

            TextFormField(
              obscureText: true,
              controller: controller.password,
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
              () => SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
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
                      : const Icon(LineAwesomeIcons.lock_open),
                  label: Text(
                    'Sign up'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 11,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  onPressed: controller.isLoading.value
                      ? () {}
                      : () {
                          if (controller.signUpFormKey.currentState!
                              .validate()) {
                            controller.createUser();
                          }
                        },
                ),
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
