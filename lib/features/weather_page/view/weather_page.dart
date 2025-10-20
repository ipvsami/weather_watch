import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_slider/gradient_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_watch/data/informations/weather_codes.dart';

import '../../../core/constants/colors/constant_colors.dart';
import '../../../data/informations/dates.dart';
import '../../../data/informations/rain_sum.dart';
import '../../../data/informations/temperatures.dart';
import '../../../data/informations/uv_indexes.dart';
import '../../../data/models/coordinates_model.dart';
import '../../widgets/custom_information_card.dart';
import '../../widgets/custom_progress_indicator.dart';
import '../controller/weather_controller.dart';

class WeatherPage extends GetView<WeatherController> {
  static final String route = '/weather';
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Obx(
              () => DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: controller.isloading.value
                      ? CustomProgressIndicator()
                      : Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 101.h,
                                    bottom: 12.h,
                                  ),
                                  child: Text(
                                    controller.coordinates!.name!,
                                    style: GoogleFonts.roboto(
                                      color: ConstantColors.textColor,
                                      fontSize: 42.sp,
                                      height: 0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      '${(controller.weather!.currentTemperature!.round())}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 96.sp,
                                        height: 0.75,
                                        fontWeight: FontWeight.w200,
                                        color: ConstantColors.textColor,
                                      ),
                                    ),
                                    Text(
                                      '°',
                                      style: GoogleFonts.poppins(
                                        fontSize: 56.sp,
                                        height: 0.75,
                                        fontWeight: FontWeight.w300,
                                        color: ConstantColors.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  WeatherCodes
                                      .weatherCodes[controller
                                          .weather!
                                          .currentWeatherCode]
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                    height: 2,
                                    fontWeight: FontWeight.w500,
                                    color: ConstantColors.weatherCode,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'H: ${controller.weather!.dailyMaxTemperatures![0]}°   L: ${controller.weather!.dailyMinTemperatures![0]}°',
                                      style: GoogleFonts.poppins(
                                        fontSize: 20.sp,
                                        height: 0.75,
                                        fontWeight: FontWeight.w600,
                                        color: ConstantColors.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Image.asset('assets/images/house.png'),
                                SizedBox(
                                  height: 230.h,
                                ),
                              ],
                            ),
                            Obx(
                              () => Positioned.fill(
                                child: IgnorePointer(
                                  ignoring: true,
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX:
                                          30 *
                                          (controller.sheetExtent.value - 0.38),
                                      sigmaY:
                                          30 *
                                          (controller.sheetExtent.value - 0.38),
                                    ),
                                    child: Container(color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ),
                            NotificationListener<
                              DraggableScrollableNotification
                            >(
                              onNotification: (notification) {
                                controller.sheetExtent.value =
                                    notification.extent;
                                return true;
                              },
                              child: DraggableScrollableSheet(
                                expand: false,
                                minChildSize: 0.38,
                                maxChildSize: 0.85,
                                initialChildSize: 0.38,
                                builder: (context, scrollController) {
                                  return SingleChildScrollView(
                                    controller: scrollController,
                                    child: ClipRRect(
                                      borderRadius: BorderRadiusGeometry.only(
                                        topLeft: Radius.circular(40.r),
                                        topRight: Radius.circular(40.r),
                                      ),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 25,
                                          sigmaY: 25,
                                        ),
                                        child: Container(
                                          width: Get.width,
                                          height: Get.height * 0.87,
                                          decoration: BoxDecoration(
                                            color: ConstantColors
                                                .backgroundGradiant
                                                .withAlpha(120),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 8.0.h,
                                                ),
                                                child: SizedBox(
                                                  width: 70.w,
                                                  child: Divider(
                                                    color: ConstantColors
                                                        .searchBarColor
                                                        .withAlpha(180),
                                                    thickness: 5,
                                                    radius:
                                                        BorderRadius.circular(
                                                          30.r,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 22.0.h,
                                                ),
                                                child: Text(
                                                  'Weekly Forecast',
                                                  style: GoogleFonts.roboto(
                                                    color: ConstantColors
                                                        .appBarText
                                                        .withAlpha(200),
                                                    fontSize: 22.sp,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 10.h,
                                                  horizontal: 70.w,
                                                ),
                                                child: Divider(
                                                  thickness: 2,
                                                  radius: BorderRadius.circular(
                                                    40,
                                                  ),
                                                  color: ConstantColors
                                                      .appBarText
                                                      .withAlpha(100),
                                                ),
                                              ),

                                              SizedBox(
                                                height: 200.h,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 5.w,
                                                  ),
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: 7,
                                                    itemBuilder: (context, index) {
                                                      return InkWell(
                                                        onTap: () {
                                                          controller.setDay(
                                                            index,
                                                          );
                                                        },
                                                        child: SizedBox(
                                                          height: 200.h,
                                                          width: 90.w,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadiusGeometry.circular(
                                                                  40.r,
                                                                ),
                                                            child: BackdropFilter(
                                                              filter:
                                                                  ImageFilter.blur(
                                                                    sigmaX: 20,
                                                                    sigmaY: 20,
                                                                  ),
                                                              child: Obx(
                                                                () => Card(
                                                                  color:
                                                                      index ==
                                                                          controller
                                                                              .selectedDay
                                                                              .value
                                                                      ? ConstantColors
                                                                            .appBarText
                                                                            .withAlpha(
                                                                              30,
                                                                            )
                                                                      : ConstantColors
                                                                            .backgroundGradiant
                                                                            .withAlpha(
                                                                              140,
                                                                            ),
                                                                  shape: RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                      color: ConstantColors
                                                                          .textColor
                                                                          .withAlpha(
                                                                            50,
                                                                          ),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadiusGeometry.circular(
                                                                          40.r,
                                                                        ),
                                                                  ),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.only(
                                                                          top: 22.0
                                                                              .h,
                                                                          bottom:
                                                                              15.h,
                                                                        ),
                                                                        child: Text(
                                                                          Dates.todayDate(
                                                                            controller.weather!.dates![index],
                                                                          ),
                                                                          style: GoogleFonts.poppins(
                                                                            color:
                                                                                ConstantColors.textColor,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                16.sp,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            70,
                                                                        child: Lottie.asset(
                                                                          'assets/animations/weathers/${controller.weather!.dailyWeatherCodes![index]}.json',
                                                                          fit: BoxFit
                                                                              .fitHeight,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.only(
                                                                          top: 10.0
                                                                              .h,
                                                                        ),
                                                                        child: Text(
                                                                          '${Temperatures.averageTemperature(
                                                                            controller.weather!.dailyMaxTemperatures![index],
                                                                            controller.weather!.dailyMinTemperatures![index],
                                                                          )}°',
                                                                          style: GoogleFonts.poppins(
                                                                            color:
                                                                                ConstantColors.textColor,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontSize:
                                                                                22.sp,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 420.h,
                                                width: Get.width - 40.w,
                                                child: GridView(
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                      ),
                                                  children: [
                                                    Obx(
                                                      () => CustomInformationCard(
                                                        icon: Icons.sunny,
                                                        text: 'UV INDEX',
                                                        child: Column(
                                                          children: [
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets.only(
                                                                      left:
                                                                          30.w,
                                                                      top: 10.h,
                                                                    ),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      controller
                                                                          .weather!
                                                                          .dailyUvIndexes![controller
                                                                              .selectedDay
                                                                              .value]
                                                                          .toString(),
                                                                      style: GoogleFonts.poppins(
                                                                        color: ConstantColors
                                                                            .appBarText,
                                                                        fontSize:
                                                                            32.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      UvIndexes.uvRange(
                                                                        controller
                                                                            .weather!
                                                                            .dailyUvIndexes![controller
                                                                            .selectedDay
                                                                            .value],
                                                                      ),

                                                                      style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            22.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        color: ConstantColors
                                                                            .appBarText,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            GradientSlider(
                                                              thumbAsset:
                                                                  'assets/images/pointer.png',
                                                              thumbWidth: 10.w,
                                                              thumbHeight: 10.h,
                                                              slider: Slider.adaptive(
                                                                allowedInteraction:
                                                                    SliderInteraction
                                                                        .tapOnly,
                                                                value:
                                                                    controller
                                                                            .weather!
                                                                            .dailyUvIndexes![controller
                                                                            .selectedDay
                                                                            .value] <
                                                                        10
                                                                    ? controller
                                                                              .weather!
                                                                              .dailyUvIndexes![controller
                                                                              .selectedDay
                                                                              .value] /
                                                                          10
                                                                    : 1,
                                                                onChanged:
                                                                    (value) {},
                                                              ),
                                                              activeTrackGradient: LinearGradient(
                                                                colors: [
                                                                  ConstantColors
                                                                      .uvBlue,
                                                                  ConstantColors
                                                                      .uvPurple,
                                                                  ConstantColors
                                                                      .uvRed,
                                                                ],
                                                              ),
                                                              inactiveTrackGradient: LinearGradient(
                                                                colors: [
                                                                  ConstantColors
                                                                      .uvBlue,
                                                                  ConstantColors
                                                                      .uvPurple,
                                                                  ConstantColors
                                                                      .uvRed,
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Obx(
                                                      () => CustomInformationCard(
                                                        icon: Icons.water_drop,
                                                        text: 'RAIN SUM',
                                                        child: Column(
                                                          children: [
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets.only(
                                                                      left:
                                                                          30.w,
                                                                      top: 10.h,
                                                                    ),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          controller
                                                                              .weather!
                                                                              .dailyRainSums![controller.selectedDay.value]
                                                                              .toString(),
                                                                          style: GoogleFonts.poppins(
                                                                            color:
                                                                                ConstantColors.appBarText,
                                                                            fontSize:
                                                                                32.sp,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          ' mm',
                                                                          style: GoogleFonts.poppins(
                                                                            height:
                                                                                2.3,
                                                                            color:
                                                                                ConstantColors.appBarText,
                                                                            fontSize:
                                                                                21.sp,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      RainSum.describeRainSum(
                                                                        controller
                                                                            .weather!
                                                                            .dailyRainSums![controller
                                                                            .selectedDay
                                                                            .value],
                                                                      ),
                                                                      style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            20.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        color: ConstantColors
                                                                            .appBarText,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Obx(
                                                      () => CustomInformationCard(
                                                        icon: Icons.water_drop,
                                                        text: 'FEELS LIKE ...',
                                                        child: Column(
                                                          children: [
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets.only(
                                                                      left:
                                                                          30.w,
                                                                      top: 10.h,
                                                                    ),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          '${Temperatures.averageTemperature(
                                                                            controller.weather!.dailyApperantTemperaturesMax![controller.selectedDay.value],
                                                                            controller.weather!.dailyApperantTemperaturesMin![controller.selectedDay.value],
                                                                          )} °',
                                                                          style: GoogleFonts.poppins(
                                                                            color:
                                                                                ConstantColors.appBarText,
                                                                            fontSize:
                                                                                32.sp,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      Temperatures.describeApperantTemperature(
                                                                        Temperatures.averageTemperature(
                                                                          controller
                                                                              .weather!
                                                                              .dailyMaxTemperatures![controller
                                                                              .selectedDay
                                                                              .value],
                                                                          controller
                                                                              .weather!
                                                                              .dailyMinTemperatures![controller
                                                                              .selectedDay
                                                                              .value],
                                                                        ),
                                                                        Temperatures.averageTemperature(
                                                                          controller
                                                                              .weather!
                                                                              .dailyApperantTemperaturesMax![controller
                                                                              .selectedDay
                                                                              .value],
                                                                          controller
                                                                              .weather!
                                                                              .dailyApperantTemperaturesMin![controller
                                                                              .selectedDay
                                                                              .value],
                                                                        ),
                                                                      ),
                                                                      style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            18.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        color: ConstantColors
                                                                            .appBarText,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: box.read('bookmarks').toString(),
                        );
                      },
                      icon: Icon(
                        Icons.list,
                        color: ConstantColors.appBarText,
                        size: 28.sp,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.resetWeather();
                        Get.offAndToNamed('/search');
                      },
                      icon: Icon(
                        Icons.search,
                        color: ConstantColors.appBarText,
                        size: 28.sp,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.dialog(
                          Center(
                            child: SizedBox(
                              height: 200.h,
                              width: 400.w,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: ConstantColors.appBarText.withAlpha(
                                      60,
                                    ),
                                  ),
                                  borderRadius: BorderRadiusGeometry.circular(
                                    30.r,
                                  ),
                                ),
                                color: ConstantColors.backgroundGradiant
                                    .withAlpha(100),
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
                                          height: 10.h,
                                        ),
                                        Text(
                                          'Add to bookmarks',
                                          style: GoogleFonts.poppins(
                                            color: ConstantColors.appBarText,
                                            fontSize: 24.sp,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10.w,
                                            right: 10.w,
                                            top: 20.h,
                                          ),
                                          child: Text(
                                            'Are you sure you want to add this location to your bookmarks?',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              color: ConstantColors.appBarText,
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20.w,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                width: 100.w,
                                                height: 40.h,
                                                child: MaterialButton(
                                                  color: ConstantColors.uvRed
                                                      .withAlpha(30),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      color: ConstantColors
                                                          .appBarText,
                                                    ),
                                                    borderRadius:
                                                        BorderRadiusGeometry.circular(
                                                          20.r,
                                                        ),
                                                  ),
                                                  child: Text(
                                                    'No',
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 20.sp,
                                                      color: ConstantColors
                                                          .appBarText,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 100.w,
                                                height: 40.h,
                                                child: MaterialButton(
                                                  color: ConstantColors.uvBlue
                                                      .withAlpha(30),
                                                  onPressed: () {
                                                    controller.addToBookmarks(
                                                      CoordinatesModel.toJson(
                                                        controller.coordinates!,
                                                      ),
                                                    );
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      color: ConstantColors
                                                          .appBarText,
                                                    ),
                                                    borderRadius:
                                                        BorderRadiusGeometry.circular(
                                                          20.r,
                                                        ),
                                                  ),
                                                  child: Text(
                                                    'Yes',
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 20.sp,
                                                      color: ConstantColors
                                                          .appBarText,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.bookmark,
                        color: ConstantColors.appBarText,
                        size: 28.sp,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.0.w),
                  child: Divider(
                    thickness: 2,
                    radius: BorderRadius.circular(30.r),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
