import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/constants/text_strings.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            LineAwesomeIcons.angle_left,
            color: rBrown,
          ),
        ),
        title: const PrimaryText(
          text: rEditProfile,
          size: 12,
          color: rBrown,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
                isDarkMode ? LineAwesomeIcons.sun_1 : LineAwesomeIcons.moon_1,
                color: rBrown),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
