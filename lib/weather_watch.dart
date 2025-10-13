import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_watch/core/bindings/search_bar_controller_binding.dart';

import 'core/routes/routes.dart';

class WeatherWatch extends StatelessWidget {
  const WeatherWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      child: GetMaterialApp(
        initialRoute: '/search',
        getPages: routes,
        initialBinding: SearchBarControllerBinding(),
      ),
    );
  }
}
