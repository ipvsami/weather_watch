import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/colors/constant_colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 80.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: ConstantColors.searchBarColor,
              borderRadius: BorderRadius.circular(
                30.r,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: ConstantColors.searchBarColor,
                  borderRadius: BorderRadius.circular(
                    30.r,
                  ),
                ),
              ),
              CircularProgressIndicator(
                color: ConstantColors.searchBarQueryColor,
                backgroundColor: ConstantColors.backgroundGradiant,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
