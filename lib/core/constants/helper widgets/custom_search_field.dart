import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';
import '../styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.validator,
    this.onChanged,
    this.onComplete,
    this.onTap,
    required this.controller,
    this.hintext,
    this.labeltext,
    this.maxlines,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    this.width,
    this.focusNode,
    this.radius,
    this.hintColor,
    this.filled,
    this.fillColor,
    this.enabled,
    this.verticalPadding,
    this.disabledFillColor,
  });

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(String)? onComplete;

  final String? labeltext;
  final String? hintext;
  final String? label;
  final int? maxlines;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? width;

  final Color? borderColor;
  final FocusNode? focusNode;
  final double? radius;
  final Color? hintColor;
  final bool? filled;
  final Color? fillColor;
  final bool? enabled;
  final double? verticalPadding;
  final Color? disabledFillColor;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      // height: 80.h,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          labelText: widget.labeltext,
          hintText: 'TV shows, movies and more',
          hintStyle: poppinsStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: textColor.withOpacity(0.3),
          ),
          filled: true,
          fillColor: offWhiteColor,
          contentPadding: EdgeInsets.only(
            left: 15.w,
            top: widget.verticalPadding ?? 15.h,
            bottom: widget.verticalPadding ?? 15.w,
            right: 15.w,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 30.r),
            borderSide: BorderSide(
              color: widget.borderColor ?? offWhiteColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 30.r),
            borderSide: BorderSide(
              color: widget.borderColor ?? offWhiteColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 30.r),
            borderSide: BorderSide(
              color: widget.borderColor ?? offWhiteColor,
            ),
          ),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ),
        enabled: widget.enabled ?? true,
        autocorrect: false,
        maxLines: widget.maxlines,
        obscuringCharacter: '*',
        textCapitalization: TextCapitalization.none,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        onFieldSubmitted: widget.onComplete,
        keyboardType: TextInputType.text,
      ),
    );
  }
}
