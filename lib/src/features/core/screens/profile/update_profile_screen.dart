import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/textfield_style.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/constants/text_strings.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();

    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            LineAwesomeIcons.angle_left,
            color: isDarkMode ? Colors.white : rBrown,
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
              color: isDarkMode ? Colors.white : rBrown,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(rDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                        image: AssetImage(rUserProfileImg),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        //color: rAccentColor.withOpacity(0.1),
                        color: Colors.brown,
                      ),
                      child: const Icon(
                        LineAwesomeIcons.camera,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              Form(
                key: _formKey,
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
                    IntlPhoneField(
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
                      onChanged: (phone) {},
                      onCountryChanged: (country) {
                        //print('country changed to: ${country.name}');
                      },
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
                    const SizedBox(
                      height: rFormHeight - 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: rBrown,
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
                        child: Text(
                          'update profile'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: rFormHeight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: rJoined,
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.normal,
                            ),
                            children: [
                              TextSpan(
                                text: rJoinedAt,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10.0),
                            backgroundColor: Colors.redAccent.withOpacity(0.1),
                            elevation: 0,
                            foregroundColor: Colors.red,
                            shape: const StadiumBorder(),
                            side: BorderSide.none,
                          ),
                          child: const PrimaryText(
                            text: rDelete,
                            size: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
