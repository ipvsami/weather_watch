import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/colors/constant_colors.dart';
import '../../widgets/background_gradiant.dart';
import '../../widgets/custom_progress_indicator.dart';
import '../../widgets/decorations.dart';
import '../controller/search_bar_controller.dart';

class SearchPage extends GetView<SearchBarController> {
  static final route = '/search';
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            BackgroundGradiant(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 40.h,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Weather Watch',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: ConstantColors.appBarText,
                            fontSize: 24.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextField(
                    onChanged: (value) {
                      controller.searchQuery.value = value;
                    },
                    style: GoogleFonts.roboto(
                      color: ConstantColors.searchBarQueryColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: textFieldDecoration(
                      'Search for a city or airport . . .  ',
                    ),
                  ),
                ),
                Obx(
                  () {
                    if (controller.coordinates.isEmpty) {
                      return controller.isLoading.value
                          ? Padding(
                              padding: EdgeInsets.only(top: 40.0.h),
                              child: CustomProgressIndicator(),
                            )
                          : SizedBox();
                    } else {
                      return SizedBox(
                        width: Get.width - 40.w,
                        height: controller.coordinates.length * 56.h + 20.h,
                        child: Card(
                          color: ConstantColors.searchBarColor,
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 10.h),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.coordinates.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                    ),
                                    child: InkWell(
                                      splashColor:
                                          ConstantColors.searchBarColor,
                                      onTap: () {
                                        Get.offAndToNamed(
                                          '/weather',
                                          arguments:
                                              controller.coordinates[index],
                                        );
                                      },
                                      child: ListTile(
                                        title: Text(
                                          '''${controller.coordinates[index].name!} / ${controller.coordinates[index].country!}''',
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                              color: ConstantColors.appBarText,
                                              fontSize: 24.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  index + 1 != controller.coordinates.length
                                      ? SizedBox(
                                          width: Get.width - 140.w,
                                          child: Divider(
                                            color: ConstantColors.appBarText
                                                .withAlpha(70),
                                            height: 0,
                                            thickness: 2,
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
