import 'package:flutter/material.dart';

class ResetPswdWidget extends StatelessWidget {
  const ResetPswdWidget({
    super.key,
    required this.btnIcon,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(
              btnIcon,
              size: 50.0,
              color: Colors.brown,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.brown,
                    fontFamily: 'Poppins',
                    fontSize: 10,
                  ),
                ),
                Text(
                  subTitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w100,
                    fontSize: 8.0,
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
