import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ten_twenty_test_project/core/constants/styles.dart';

import '../colors.dart';

class GenreContainer extends StatelessWidget {
  const GenreContainer({super.key, required this.color, required this.genre});
  final Color color;
  final String genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      margin: EdgeInsets.only(
        right: 5.w,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: poppinsMediumText(
          text: genre,
          color: whiteColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
