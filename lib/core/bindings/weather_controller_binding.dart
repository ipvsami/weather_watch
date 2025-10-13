import 'package:get/get.dart';

import '../../features/weather_page/controller/weather_controller.dart';

class WeatherControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherController());
  }
}
