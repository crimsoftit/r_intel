import 'dart:ui';

class OnboardingModel {
  final String image;
  final String title;
  final String subTitle;

  final Color bgColorDark;
  final Color bgColorLight;
  final String sliderText;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.bgColorDark,
    required this.bgColorLight,
    required this.sliderText,
  });
}
