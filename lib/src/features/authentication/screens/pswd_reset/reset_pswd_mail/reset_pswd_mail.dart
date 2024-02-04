import 'package:flutter/material.dart';
import 'package:r_intel/src/common_widgets/form/form_header_widget.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/textfield_style.dart';

class ResetPasswordMailScreen extends StatelessWidget {
  const ResetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(rDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: rDefaultSize * 4,
                ),
                const FormHeaderWidget(
                  image: rPswdResetImg,
                  title: 'Reset Password',
                  subTitle: 'Enter your email address and select "NEXT"',
                  heightBetween: 30.0,
                ),
                const SizedBox(
                  height: rFormHeight,
                ),
                Form(
                  child: Column(
                    children: [
                      const RTextfield(
                        inputDecoration: InputDecoration(
                          label: Text('Email'),
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.mail_lock_outlined),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Next'.toUpperCase(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
