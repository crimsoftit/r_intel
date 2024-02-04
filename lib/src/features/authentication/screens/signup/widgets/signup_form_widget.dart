import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/textfield_style.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: rFormHeight - 10,
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RTextfield(
              inputDecoration: InputDecoration(
                label: Text('Full Name'),
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                ),
              ),
            ),
            const SizedBox(
              height: rFormHeight - 20,
            ),
            const RTextfield(
              inputDecoration: InputDecoration(
                label: Text('Email'),
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
              ),
            ),
            const SizedBox(
              height: rFormHeight - 20,
            ),
            const RTextfield(
              inputDecoration: InputDecoration(
                label: Text('Phone number'),
                prefixIcon: Icon(
                  Icons.numbers_outlined,
                ),
              ),
            ),
            const SizedBox(
              height: rFormHeight - 20,
            ),
            const RTextfield(
              inputDecoration: InputDecoration(
                label: Text('Password'),
                prefixIcon: Icon(
                  Icons.fingerprint,
                ),
              ),
            ),
            const SizedBox(
              height: rFormHeight - 20,
            ),
            const RTextfield(
              inputDecoration: InputDecoration(
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
                onPressed: () {},
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
