import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/image_strings.dart';
import 'package:r_intel/src/constants/size.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/constants/text_strings.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // variables
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.brown,
        ),
        title: const PrimaryText(
          text: rAppName,
          size: 12,
          color: rBrown,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(
              right: 20,
              top: 7,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: rCardBgColor,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                image: AssetImage(rProfileImg),
              ),
            ),
          ),
        ],
      ),
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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 3,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 4,
                      color: rBrown,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      rDashboardSearch,
                      style: txtTheme.bodySmall?.apply(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    const Icon(
                      Icons.mic,
                      size: 20,
                      color: rBrown,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: rDashboardPadding,
              ),

              // -- categories
              const PrimaryText(
                text: 'Top Sellers',
                size: 13,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 45,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 170,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: rBrown,
                            ),
                            child: const Center(
                              child: PrimaryText(
                                text: 'RC',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Royco cooking cubes',
                                  style: txtTheme.labelMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '2000 units',
                                  style: txtTheme.labelSmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: rBrown,
                            ),
                            child: const Center(
                              child: PrimaryText(
                                text: 'RC',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Royco cooking cubes',
                                  style: txtTheme.labelMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '2000 units',
                                  style: txtTheme.labelSmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: rBrown,
                            ),
                            child: const Center(
                              child: PrimaryText(
                                text: 'RC',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Royco cooking cubes',
                                  style: txtTheme.labelMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '2000 units',
                                  style: txtTheme.labelSmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: rDashboardPadding,
              ),

              // -- banners
              Row(
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
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Icon(
                                  Icons.bookmark,
                                ),
                              ),
                              Flexible(
                                child: Image(
                                  image: AssetImage(rBannerImg1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
