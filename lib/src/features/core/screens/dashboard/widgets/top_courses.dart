import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/features/core/models/dashboard/top_courses_model.dart';

class TopCourses extends StatelessWidget {
  const TopCourses({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final list = TopCoursesModel.list;
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: list[index].onPress,
          child: SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 5,
                right: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: rCardBgColor,
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            list[index].title,
                            style: txtTheme.bodyMedium?.apply(
                              fontSizeFactor: 0.8,
                              fontWeightDelta: -1,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Flexible(
                          child: Image(
                            image: AssetImage(rBannerImg1),
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                          ),
                          onPressed: () {},
                          child: Icon(Icons.play_arrow,
                              color: context.isDarkMode
                                  ? Colors.brown
                                  : Colors.white),
                        ),
                        const SizedBox(
                          width: rDashboardCardPadding,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[index].heading,
                              style: txtTheme.labelMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              list[index].subHeading,
                              style: txtTheme.labelSmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
