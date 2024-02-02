import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/style/txt_style.dart';
import 'package:r_intel/src/features/core/models/dashboard/best_sellers_model.dart';

class BestSellers extends StatelessWidget {
  const BestSellers({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final list = CategoriesModel.list;
    return SizedBox(
      height: 45,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: list[index].onPress,
          child: SizedBox(
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
                  child: Center(
                    child: PrimaryText(
                      text: list[index].title,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
