import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/features/authentication/screens/pswd_reset/reset_pswd_mail/reset_pswd_mail.dart';
import 'package:r_intel/src/features/authentication/screens/pswd_reset/reset_pswd_options/reset_pswd_btn_widget.dart';

class ResetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(rDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rResetPswdTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              rResetPswdSubTitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: rDefaultSize - 10,
            ),
            ResetPswdWidget(
              btnIcon: Icons.mail_outline_rounded,
              title: 'E-mail',
              subTitle: rResetViaEmail,
              onTap: () {
                Navigator.pop(context);
                Get.to(ResetPasswordMailScreen());
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            ResetPswdWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              title: 'Phone No.',
              subTitle: rResetViaPhone,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
