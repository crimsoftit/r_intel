import 'package:flutter/material.dart';

class CategoriesModel {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  CategoriesModel({
    required this.title,
    required this.heading,
    required this.subHeading,
    this.onPress,
  });

  static List<CategoriesModel> list = [
    CategoriesModel(
      title: 'JS',
      heading: 'JavaScript',
      subHeading: '10 lessons',
      onPress: null,
    ),
    CategoriesModel(
      title: 'F',
      heading: 'Flutter',
      subHeading: '12 lessons',
      onPress: null,
    ),
    CategoriesModel(
      title: 'H',
      heading: 'HTML',
      subHeading: '8 lessons',
      onPress: null,
    ),
    CategoriesModel(
      title: 'K',
      heading: 'Kotlin',
      subHeading: '18 lessons',
      onPress: null,
    ),
  ];
}
