import 'package:clean_arc/core/recourses/color_manager/color_manager.dart';
import 'package:clean_arc/core/recourses/styles_manger/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onTap;

  const SectionHeader({
    Key? key,
    required this.title,
    this.actionText = "See More",
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: getBoldStyle(
              color: MyColors.white,
              fontSize: 18.sp,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    actionText,
                    style: getRegularStyle(
                      color: MyColors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                  const SizedBox(width: 2),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: MyColors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
