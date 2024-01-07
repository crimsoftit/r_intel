import 'dart:ui';

class OnboardingModel {
  final String image;
  final String title;
  final String subTitle;
  final String sliderText;
  final Color bgColorDark;
  final Color bgColorLight;
  final double height;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.sliderText,
    required this.bgColorDark,
    required this.bgColorLight,
    required this.height,
  });
}
