import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/features/authentication/screens/login/login_footer_widget.dart';

import 'package:r_intel/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:r_intel/src/features/authentication/screens/login/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(rDefaultSize),
            child: Column(
              children: [
                LoginHeaderWidget(size: size),
                const LoginForm(),
                const LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
