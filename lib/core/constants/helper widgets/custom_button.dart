import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';
import '../styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.width,
      this.height,
      this.color,
      this.borderColor,
      this.radius,
      this.fontWeight,
      this.fontSize,
      this.textColor,
      this.shadowColor});
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final Color? borderColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? textColor;
  final String text;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 243.w,
      height: height ?? 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
          color: color ?? turquoiseColor,
          border: Border.all(color: borderColor ?? turquoiseColor)),
      child: Center(
        child: poppinsNormalText(
          text: text,
          fontSize: fontSize ?? 14.sp,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: textColor ?? whiteColor,
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      required this.text,
      this.width,
      this.height,
      this.color,
      this.borderColor,
      this.radius,
      this.fontWeight,
      this.fontSize,
      this.textColor,
      this.shadowColor});
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final Color? borderColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? textColor;
  final String text;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 243.w,
      height: height ?? 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
          color: color ?? turquoiseColor,
          border: Border.all(color: borderColor ?? turquoiseColor, width: 2.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.play_arrow, color: whiteColor),
          SizedBox(width: 8.w),
          poppinsNormalText(
            text: text,
            fontSize: fontSize ?? 14.sp,
            fontWeight: fontWeight ?? FontWeight.w600,
            color: textColor ?? whiteColor,
          ),
        ],
      ),
    );
  }
}
