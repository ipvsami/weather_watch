import 'package:get/get.dart';

import '../../features/search_page/view/search_page.dart';
import '../../features/weather_page/view/weather_page.dart';
import '../bindings/search_bar_controller_binding.dart';
import '../bindings/weather_controller_binding.dart';

List<GetPage> routes = [
  GetPage(
    name: SearchPage.route,
    page: () => SearchPage(),
    binding: SearchBarControllerBinding(),
  ),
  GetPage(
    name: WeatherPage.route,
    page: () => WeatherPage(),
    binding: WeatherControllerBinding(),
  ),
];
