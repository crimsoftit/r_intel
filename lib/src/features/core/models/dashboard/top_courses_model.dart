import 'package:flutter/material.dart';

class TopCoursesModel {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  TopCoursesModel({
    required this.title,
    required this.heading,
    required this.subHeading,
    this.onPress,
  });

  static List<TopCoursesModel> list = [
    TopCoursesModel(
      title: 'flutter crash course',
      heading: '3 sections',
      subHeading: 'programming languages',
      onPress: null,
    ),
    TopCoursesModel(
      title: 'Android beginners tutorial',
      heading: 'Android',
      subHeading: '12 lessons',
      onPress: null,
    ),
    TopCoursesModel(
      title: 'HTML5 crash course',
      heading: 'HTML',
      subHeading: '8 lessons',
      onPress: null,
    ),
  ];
}
