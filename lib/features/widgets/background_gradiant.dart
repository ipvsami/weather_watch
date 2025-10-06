import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors/constant_colors.dart';

class BackgroundGradiant extends StatelessWidget {
  const BackgroundGradiant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topLeft,

          colors: [
            ConstantColors.backgroundGradiant.withAlpha(200),
            ConstantColors.backgroundGradiant.withAlpha(255),
          ],
        ),
      ),
    );
  }
}
