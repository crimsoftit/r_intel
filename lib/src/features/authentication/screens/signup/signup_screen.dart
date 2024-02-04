import 'package:flutter/material.dart';
import 'package:r_intel/src/common_widgets/form/form_header_widget.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/features/authentication/screens/signup/widgets/signup_footer_widget.dart';
import 'package:r_intel/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(rDefaultSize),
          child: const Column(
            children: [
              FormHeaderWidget(
                image: rSignupImg,
                title: rSignUpTitle,
                subTitle: rSignUpSubTitle,
              ),
              SignUpFormWidget(),
              SignupFooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
