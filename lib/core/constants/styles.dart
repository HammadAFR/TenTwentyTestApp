import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

//////////////////////

//poppins Text Style

Text poppinsTitleText({
  required String text,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  int? maxLines,
  TextOverflow? textOverflow,
}) {
  return Text(
    text,
    maxLines: maxLines ?? 3,
    overflow: textOverflow,
    textAlign: textAlign ?? TextAlign.start,
    style: GoogleFonts.poppins(
      color: color,
      fontSize: fontSize ?? 24.sp,
      fontWeight: fontWeight ?? FontWeight.bold,
    ),
  );
}

Text poppinsMediumText({
  required String text,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  int? maxLines,
  TextOverflow? textOverflow,
}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    maxLines: maxLines ?? 3,
    overflow: textOverflow,
    style: GoogleFonts.poppins(
      color: color,
      fontSize: fontSize ?? 15.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
    ),
  );
}

Text poppinsNormalText({
  required String text,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  int? maxLines,
  TextOverflow? textOverflow,
}) {
  return Text(
    text,
    maxLines: maxLines ?? 3,
    overflow: textOverflow,
    textAlign: textAlign ?? TextAlign.start,
    style: GoogleFonts.poppins(
      color: color,
      fontSize: fontSize ?? 14.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    ),
  );
}

Text poppinsNormalUnderLineText({
  required String text,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  int? maxLines,
  TextOverflow? textOverflow,
  Color? underlineColor,
}) {
  return Text(
    text,
    maxLines: maxLines ?? 3,
    overflow: textOverflow,
    textAlign: textAlign ?? TextAlign.start,
    style: GoogleFonts.poppins(
      color: color,
      fontSize: fontSize ?? 14.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
      decoration: TextDecoration.underline,
      decorationColor: underlineColor,
    ),
  );
}

TextStyle poppinsStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
}) {
  return GoogleFonts.poppins(
    color: color,
    fontSize: fontSize ?? 20.sp,
    fontWeight: fontWeight ?? FontWeight.w500,
  );
}
