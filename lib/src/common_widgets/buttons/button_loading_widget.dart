import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';

class RButtonLoadingWidget extends StatelessWidget {
  const RButtonLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20.0,
          height: 20.0,
          child: CircularProgressIndicator.adaptive(),
        ),
        SizedBox(
          width: 10.0,
        ),
        PrimaryText(
          text: 'loading...',
          size: 10.0,
        ),
      ],
    );
  }
}
