import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/colors/constant_colors.dart';

InputDecoration textFieldDecoration(String text) {
  return InputDecoration(
    filled: true,
    hint: Text(
      text,
      style: GoogleFonts.roboto(
        color: ConstantColors.searchBarQueryHintColor,
        fontSize: 17.sp,
      ),
    ),
    prefixIcon: Padding(
      padding: EdgeInsetsGeometry.only(left: 15.w),
      child: Icon(
        Icons.search,
        color: ConstantColors.searchBarQueryHintColor,
      ),
    ),
    fillColor: ConstantColors.searchBarColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide.none,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide.none,
    ),
  );
}
