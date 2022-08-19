import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration buildInputDecoration(String label, String hint, context) {
    return InputDecoration(
      border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(90),
            borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
            ),
        ),
      fillColor: Color(0XFFF1F1F1),
      filled: true,
      // focusedBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(12),
      //   borderSide: BorderSide(color: Theme.of(context).primaryColorDark),
      // ),
      // disabledBorder: UnderlineInputBorder(
      //     borderSide: BorderSide(color: Color(0XFF1a1955), width: 2)),
      // enabledBorder: UnderlineInputBorder(
      //     borderSide:
      //         BorderSide(color: Color(0XFF1a1955), width: 2)),
      // labelText: label,
      // labelStyle: TextStyle(color: Color(0XFF777499), fontSize: 19),
      hintText: hint,
      // hintStyle: TextStyle(color: Color(0XFF777499), fontSize: 50.sp),
      // contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20.h),
      hintStyle: TextStyle(color: Color(0XFF777499), fontSize: 10),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    );
  }