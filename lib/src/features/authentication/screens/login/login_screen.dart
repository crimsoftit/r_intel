import 'package:flutter/material.dart';
import 'package:r_intel/src/common_widgets/form/form_header_widget.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/features/authentication/screens/login/widgets/login_footer_widget.dart';

import 'package:r_intel/src/features/authentication/screens/login/widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(rDefaultSize),
            child: Column(
              children: [
                const FormHeaderWidget(
                  image: rLoginImg,
                  title: rLoginTitle,
                  subTitle: rLoginSubTitle,
                ),
                LoginForm(),
                const LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
