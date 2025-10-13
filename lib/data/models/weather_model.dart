class WeatherModel {
  int? currentWeatherCode;
  double? currentTemperature;

  List? dailyWeatherCodes;
  List? dailyMaxTemperatures;
  List? dailyMinTemperatures;
  List? dailyApperantTemperaturesMin;
  List? dailyApperantTemperaturesMax;
  List? dailyUvIndexes;
  List? dailyRainSums;
  List? dates;

  WeatherModel({
    required this.currentTemperature,
    required this.currentWeatherCode,

    required this.dailyMaxTemperatures,
    required this.dailyMinTemperatures,
    required this.dailyApperantTemperaturesMin,
    required this.dailyApperantTemperaturesMax,

    required this.dailyRainSums,
    required this.dailyUvIndexes,
    required this.dailyWeatherCodes,
    required this.dates,
  });

  factory WeatherModel.fromJson(json) {
    int currentWeatherCode = json['current']['weather_code'];
    double currentTemperature = json['current']['temperature_2m'];

    List dailyWeatherCodes = json['daily']['weather_code'];
    List dailyMaxTemperatures = json['daily']['temperature_2m_max'];
    List dailyMinTemperatures = json['daily']['temperature_2m_min'];
    List dailyApperantTemperaturesMin =
        json['daily']['apparent_temperature_min'];
    List dailyApperantTemperaturesMax =
        json['daily']['apparent_temperature_max'];

    List dailyUvIndexes = json['daily']['uv_index_max'];
    List dailyRainSums = json['daily']['rain_sum'];
    List dates = json['daily']['time'];
    return WeatherModel(
      dailyApperantTemperaturesMax: dailyApperantTemperaturesMax,
      dailyApperantTemperaturesMin: dailyApperantTemperaturesMin,
      currentTemperature: currentTemperature,
      currentWeatherCode: currentWeatherCode,
      dailyMaxTemperatures: dailyMaxTemperatures,
      dailyMinTemperatures: dailyMinTemperatures,
      dailyRainSums: dailyRainSums,
      dailyUvIndexes: dailyUvIndexes,
      dailyWeatherCodes: dailyWeatherCodes,
      dates: dates,
    );
  }
}
