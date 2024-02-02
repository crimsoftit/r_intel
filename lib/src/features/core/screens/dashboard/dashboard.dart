import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/constants/text_strings.dart';
import 'package:r_intel/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:r_intel/src/features/core/screens/dashboard/widgets/best_sellers.dart';
import 'package:r_intel/src/features/core/screens/dashboard/widgets/search_box.dart';
import 'package:r_intel/src/features/core/screens/dashboard/widgets/top_courses.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // variables
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const DashboardAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(rDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrimaryText(
                text: rDashboardTitle,
                size: 13,
              ),
              const PrimaryText(
                text: rDashboardHeading,
                size: 11,
              ),
              const SizedBox(
                height: rDashboardPadding,
              ),

              // -- search box
              SearchBox(txtTheme: txtTheme),

              const SizedBox(
                height: rDashboardPadding,
              ),

              // -- categories
              const PrimaryText(
                text: 'Top Sellers',
                size: 13,
                fontWeight: FontWeight.w500,
              ),
              BestSellers(txtTheme: txtTheme),

              const SizedBox(
                height: rDashboardPadding,
              ),

              // -- banners
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: rCardBgColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Icon(
                                  Icons.bookmark,
                                  color: rBrown,
                                ),
                              ),
                              Flexible(
                                child: Image(
                                  image: AssetImage(rBannerImg1),
                                  width: 20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            rDashboardBannerTitle1,
                            style: txtTheme.bodySmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            rDashboardBannerSubTitle,
                            style: txtTheme.labelMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: rDashboardCardPadding,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: rCardBgColor,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Icon(
                                      Icons.bookmark,
                                      color: rBrown,
                                    ),
                                  ),
                                  Flexible(
                                    child: Image(
                                      image: AssetImage(rBannerImg1),
                                      width: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                rDashboardBannerTitle2,
                                style: txtTheme.bodySmall,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                rDashboardBannerSubTitle,
                                style: txtTheme.labelMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: const PrimaryText(
                              text: rDashboardBtn,
                              size: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: rDashboardPadding,
              ),

              // top courses
              Text(
                rDashboardTopCourses,
                style: txtTheme.bodyMedium?.apply(
                  fontSizeFactor: 1.2,
                ),
              ),
              TopCourses(txtTheme: txtTheme),
            ],
          ),
        ),
      ),
    );
  }
}
