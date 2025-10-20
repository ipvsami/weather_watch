import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'weather_watch.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  runApp(WeatherWatch());
}
