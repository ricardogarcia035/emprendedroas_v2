import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration buildDefaultInputDecoration(String hint, BuildContext context,
    {Widget? prefixIcon, Widget? suffixIcon}) {
  double rightContentPadding = 0;
  double leftContentPadding = 0;

  if (prefixIcon != null && suffixIcon == null) {
    leftContentPadding = 20;
    rightContentPadding = 0;
  }

  if (prefixIcon == null && suffixIcon != null) {
    leftContentPadding = 20;
    rightContentPadding = 0;
  }

  if (prefixIcon != null && suffixIcon != null) {
    leftContentPadding = 20;
    rightContentPadding = -20;
  }

  if (prefixIcon == null && suffixIcon == null) {
    leftContentPadding = 20;
    rightContentPadding = 20;
  }

  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(90),
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    prefixIconConstraints: BoxConstraints(minHeight: 30, minWidth: 30),
    prefixIcon: (prefixIcon != null)
        ? Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: SizedBox(height: 30, width: 30, child: prefixIcon),
          )
        : null,
    fillColor: Color(0XFFF1F1F1),
    filled: true,
    hintText: hint,
    //hintStyle: TextStyle(color: Color(0XFF777499), fontSize: 50.sp),
    hintStyle: TextStyle(color: Color(0XFF777499), fontSize: 20),
    contentPadding: EdgeInsets.only(
        // top: 20.h,
        // bottom: 20.h,
        top: 20,
        bottom: 20,
        right: rightContentPadding,
        left: leftContentPadding),
    suffixIcon: (suffixIcon != null)
        ? Padding(
            padding: const EdgeInsets.only(right: 9, left: 0),
            child: SizedBox(height: 30, width: 30, child: suffixIcon),
          )
        : null,
  );
}
