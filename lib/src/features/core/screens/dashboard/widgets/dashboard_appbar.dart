import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/repository/auth_repo.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.menu,
        color: Colors.brown,
      ),
      title: const PrimaryText(
        text: rAppName,
        size: 12,
        color: rBrown,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Container(
          margin: const EdgeInsets.only(
            right: 20,
            top: 7,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: rCardBgColor,
          ),
          child: IconButton(
            onPressed: () {
              AuthRepo.instance.logout();
            },
            icon: const Image(
              image: AssetImage(rProfileImg),
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
