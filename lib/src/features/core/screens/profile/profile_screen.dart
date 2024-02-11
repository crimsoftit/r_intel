import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/features/core/screens/profile/update_profile_screen.dart';
import 'package:r_intel/src/features/core/screens/profile/widgets/profile_menu.dart';
import 'package:r_intel/src/repository/auth_repo.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
          icon: Icon(
            LineAwesomeIcons.angle_left,
            color: isDarkMode ? Colors.white : rBrown,
          ),
        ),
        title: const PrimaryText(
          text: rProfile,
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
                        LineAwesomeIcons.alternate_pencil,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const PrimaryText(
                text: rProfileHeading,
                size: 12,
                fontWeight: FontWeight.w500,
              ),
              const PrimaryText(
                text: rProfileSubHeading,
                size: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: rBrown,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    rEditProfile.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),

              // -- menu section
              ProfileMenuWidget(
                title: 'settings',
                icon: LineAwesomeIcons.cog,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: 'billing details',
                icon: LineAwesomeIcons.wallet,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: 'manage users',
                icon: LineAwesomeIcons.user_check,
                onPress: () {},
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                title: 'profile details',
                icon: LineAwesomeIcons.info,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: 'logout',
                icon: LineAwesomeIcons.alternate_sign_out,
                txtColor: Colors.red,
                endIcon: false,
                onPress: () {
                  AuthRepo.instance.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
