import 'package:flutter/material.dart';
import 'package:r_intel/src/common_widgets/form/form_header_widget.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/features/authentication/screens/signup/widgets/signup_footer_widget.dart';
import 'package:r_intel/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _txtName = TextEditingController();
  final TextEditingController _txtEmail = TextEditingController();
  final TextEditingController _txtPhone = TextEditingController();
  final TextEditingController _txtPassword = TextEditingController();
  final TextEditingController _retypePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(rDefaultSize),
          child: Column(
            children: [
              const FormHeaderWidget(
                image: rSignupImg,
                title: rSignUpTitle,
                subTitle: rSignUpSubTitle,
              ),
              SignUpFormWidget(
                txtName: _txtName,
                txtEmail: _txtEmail,
                txtPhone: _txtPhone,
                txtPassword: _txtPassword,
                retypePassword: _retypePassword,
              ),
              const SignupFooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
