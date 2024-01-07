import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/features/authentication/models/onboarding_model.dart';

class OnboardingPageWidget extends StatelessWidget {
  const OnboardingPageWidget({
    super.key,
    required this.model,
  });

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(rDefaultSize),
      color: context.isDarkMode ? model.bgColorDark : model.bgColorLight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.2,
          ),
          Column(
            children: [
              PrimaryText(
                text: model.title,
                size: 16,
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryText(
                text: model.subTitle,
                size: 12,
                txtAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryText(
                text: model.sliderText,
                size: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
