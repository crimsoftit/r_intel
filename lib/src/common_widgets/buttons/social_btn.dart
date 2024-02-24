import 'package:flutter/material.dart';
import 'package:r_intel/src/common_widgets/buttons/button_loading_widget.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';

class DSocialButton extends StatelessWidget {
  const DSocialButton({
    super.key,
    required this.text,
    required this.image,
    required this.foreground,
    required this.background,
    required this.onPressed,
    required this.isLoading,
  });

  final String text;
  final String image;
  final Color foreground, background;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: foreground,
          backgroundColor: background,
          side: BorderSide.none,
        ),
        icon: isLoading
            ? const SizedBox()
            : Image(
                image: AssetImage(image),
                width: 24.0,
                height: 24.0,
              ),
        label: isLoading
            ? const RButtonLoadingWidget()
            : PrimaryText(
                text: text,
                color: foreground,
                size: 10.0,
              ),
      ),
    );
  }
}
