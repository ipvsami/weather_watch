import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/colors/constant_colors.dart';
import '../../widgets/background_gradiant.dart';
import '../controller/search_bar_controller.dart';

class SearchPage extends StatelessWidget {
  static final route = '/search';
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundGradiant(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
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
              TextField(
                onChanged: (value) {
                  Get.find<SearchBarController>().searchQuery.value = value;
                },
                style: GoogleFonts.roboto(
                  color: ConstantColors.searchBarQueryColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  filled: true,
                  hint: Text(
                    'Search for a city or airport . . .',
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
                ),
              ),
              Obx(
                () {
                  if (Get.find<SearchBarController>().coordinates.isEmpty) {
                    return Get.find<SearchBarController>().isLoading.value
                        ? CircularProgressIndicator()
                        : SizedBox();
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount:
                            Get.find<SearchBarController>().coordinates.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Text(
                              Get.find<SearchBarController>()
                                  .coordinates[index]
                                  .country!,
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
