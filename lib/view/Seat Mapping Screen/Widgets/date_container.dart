import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/colors.dart';

class DateContainer extends StatelessWidget {
  const DateContainer(
      {super.key,
      required this.date,
      required this.selectedValue,
      required this.callback});

  final String date;
  final ValueNotifier<String> selectedValue;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: GestureDetector(
        onTap: callback,
        child: Container(
          height: 32.h,
          width: 67.w,
          decoration: BoxDecoration(
            color: selectedValue.value == date
                ? turquoiseColor
                : lightGreyColor.withOpacity(.5),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              date,
              style: TextStyle(
                color:
                    selectedValue.value == date ? whiteColor : darkPurpleColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
