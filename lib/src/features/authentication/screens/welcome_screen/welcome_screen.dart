import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/constants/text_strings.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(rDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: const AssetImage(rWelcomeScreenImg1),
              height: height * 0.6,
            ),
            const Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                PrimaryText(
                  text: rWelcomeTitle,
                  size: 22,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 10,
                ),
                PrimaryText(
                  text: rWelcomeSubTitle,
                  size: 16,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: PrimaryText(
                      text: 'Login'.toUpperCase(),
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: PrimaryText(
                      text: 'Sign up'.toUpperCase(),
                      size: 16,
                      color: rWhiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
