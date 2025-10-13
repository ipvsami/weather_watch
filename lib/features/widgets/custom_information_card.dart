import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/colors/constant_colors.dart';

class CustomInformationCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget child;

  const CustomInformationCard({
    super.key,
    required this.icon,
    required this.text,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ConstantColors.backgroundGradiant,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ConstantColors.appBarText.withAlpha(60),
        ),
        borderRadius: BorderRadiusGeometry.circular(
          30.r,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(
          30.r,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Icon(
                    icon,
                    color: ConstantColors.weatherCode,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    text,
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: ConstantColors.weatherCode,
                    ),
                  ),
                ],
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
