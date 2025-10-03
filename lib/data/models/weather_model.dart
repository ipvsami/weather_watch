class WeatherModel {
  int? currentWeatherCode;
  double? currentTemperature;
  double? currentApparentTemperature;

  List<int>? dailyWeatherCodes;
  List<double>? dailyMaxTemperatures;
  List<double>? dailyMinTemperatures;
  List<double>? dailyUvIndexes;
  List<double>? dailyRainSums;

  WeatherModel({
    required this.currentApparentTemperature,
    required this.currentTemperature,
    required this.currentWeatherCode,

    required this.dailyMaxTemperatures,
    required this.dailyMinTemperatures,
    required this.dailyRainSums,
    required this.dailyUvIndexes,
    required this.dailyWeatherCodes,
  });

  factory WeatherModel.fromJson(json) {
    int currentWeatherCode = json['current'][['weather_code']];
    double currentTemperature = json['current'][['temperature_2m']];
    double currentApparentTemperature =
        json['current'][['apparent_temperature']];

    List<int> dailyWeatherCodes = json['daily']['weather_code'];
    List<double> dailyMaxTemperatures = json['daily']['temperature_2m_max'];
    List<double> dailyMinTemperatures = json['daily']['temperature_2m_min'];
    List<double> dailyUvIndexes = json['daily']['uv_index_max'];
    List<double> dailyRainSums = json['daily']['rain_sum'];

    return WeatherModel(
      currentApparentTemperature: currentApparentTemperature,
      currentTemperature: currentTemperature,
      currentWeatherCode: currentWeatherCode,
      dailyMaxTemperatures: dailyMaxTemperatures,
      dailyMinTemperatures: dailyMinTemperatures,
      dailyRainSums: dailyRainSums,
      dailyUvIndexes: dailyUvIndexes,
      dailyWeatherCodes: dailyWeatherCodes,
    );
  }
}
