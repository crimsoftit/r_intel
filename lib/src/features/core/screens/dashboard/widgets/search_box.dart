import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/text_strings.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
