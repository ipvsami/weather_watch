import 'package:dio/dio.dart';

import '../../data/models/coordinates_model.dart';
import '../../data/models/weather_model.dart';

class WeatherApi {
  Dio dio = Dio();

  Future<WeatherModel> fetchWeather(CoordinatesModel coordinates) async {
    try {
      Response response = await dio.get(
        'https://api.open-meteo.com/v1/forecast?',
        queryParameters: {
          'latitude': coordinates.latitude,
          'longitude': coordinates.longitude,
          'daily': [
            'weather_code',
            'temperature_2m_min',
            'temperature_2m_max',
            'uv_index_max',
            'rain_sum',
            'apparent_temperature_max',
            'apparent_temperature_min',
          ],
          'current': [
            'weather_code',
            'temperature_2m',
            'apparent_temperature',
          ],
        },
      );
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
