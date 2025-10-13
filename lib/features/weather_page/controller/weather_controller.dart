import 'package:get/get.dart';

import '../../../core/services/weather_api.dart';
import '../../../data/models/coordinates_model.dart';
import '../../../data/models/weather_model.dart';

class WeatherController extends GetxController {
  CoordinatesModel? coordinates;
  WeatherModel? weather;
  RxBool isloading = true.obs;
  RxInt selectedDay = 0.obs;
  RxDouble sheetExtent = 0.38.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      setCoordinates(Get.arguments);
      setWeather();
    }
  }

  void setCoordinates(CoordinatesModel coordinate) {
    coordinates = coordinate;
  }

  void setWeather() async {
    weather = await WeatherApi().fetchWeather(coordinates!);
    isloading.value = false;
  }

  void setDay(int index) {
    selectedDay.value = index;
  }

  void resetWeather() {
    weather = null;
    isloading.value = true;
    selectedDay.value = 0;
  }
}
