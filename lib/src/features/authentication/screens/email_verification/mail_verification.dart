import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/features/authentication/controllers/mail_verification_controller.dart';
import 'package:r_intel/src/repository/auth_repository/auth_repo.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final mailVerificationController = Get.put(MailVerificationController());
    return Scaffold(
      body: SingleChildScrollView(
        //controller: Contro,
        child: Padding(
          padding: const EdgeInsets.only(
            top: rDefaultSpace * 5,
            left: rDefaultSpace,
            right: rDefaultSpace,
            bottom: rDefaultSpace * 2,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                LineAwesomeIcons.envelope_open,
                size: 100,
              ),
              const SizedBox(
                height: rDefaultSpace * 2,
              ),
              PrimaryText(
                text: rEmailVerificationTitle.tr,
                size: 13.0,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: rDefaultSpace,
              ),
              PrimaryText(
                text: rEmailVerificationSubTitle.tr,
                size: 11,
                txtAlign: TextAlign.center,
              ),
              const SizedBox(
                height: rDefaultSpace * 2,
              ),
              SizedBox(
                width: 200,
                child: OutlinedButton(
                  onPressed: () => mailVerificationController
                      .manuallyCheckEmailVerificationStatus(),
                  child: PrimaryText(
                    text: rContinue.tr,
                    size: 10.0,
                  ),
                ),
              ),
              const SizedBox(
                height: rDefaultSpace * 2,
              ),
              TextButton(
                onPressed: () =>
                    mailVerificationController.sendVerificationEmail(),
                child: PrimaryText(
                  text: rResendEmailLink.tr,
                  size: 10.0,
                  color: rBrown,
                ),
              ),
              TextButton(
                onPressed: () => AuthRepo.instance.logout(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      LineAwesomeIcons.alternate_long_arrow_left,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    PrimaryText(
                      text: rBackToLogin.tr.toLowerCase(),
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
