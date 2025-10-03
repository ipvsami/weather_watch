import 'package:dio/dio.dart';

import '../../data/models/coordinates_model.dart';

class CoordinatesApi {
  Future<List<CoordinatesModel>> fetchCoordinates(String searchQuery) async {
    Dio dio = Dio();

    try {
      Response response = await dio.get(
        'https://geocoding-api.open-meteo.com/v1/search?',
        queryParameters: {
          'name': searchQuery,
          'count': '10',
          'language': 'en',
          'format': 'json',
        },
      );

      return CoordinatesModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
