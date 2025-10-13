class Temperatures {
  static int averageTemperature(maxTemperature, minTemperature) {
    double temperature = (maxTemperature + minTemperature) / 2;
    return temperature.round();
  }

  static String describeApperantTemperature(
    realTemperature,
    apperantTemperature,
  ) {
    int difference = realTemperature - apperantTemperature;
    switch (difference.round()) {
      case < -1:
        return '${difference.abs().round()} degrees higher than reality';
      case == -1:
        return '${difference.abs().round()} degree higher than reality ';
      case > 1:
        return '${difference.abs().round()} degrees lower than reality ';
      case == 1:
        return '${difference.abs().round()} degree lower than reality ';
      case == 0:
        return 'Exactly like reality ';
      default:
        return '';
    }
  }
}
