class RainSum {
  static String describeRainSum(rainsum) {
    switch (rainsum) {
      case <= 0.1:
        return 'No rain expected';
      case > 0.1 && < 2:
        return 'Slight chance of rain';
      case >= 2 && < 5:
        return 'Light rain expected';
      case >= 5 && < 10:
        return 'Moderate rain ahead';
      case >= 10 && < 20:
        return 'Heavy rain coming';
      case >= 20 && < 40:
        return 'Very heavy rain likely';
      case >= 40 && < 70:
        return 'Torrential rain forecast';
      case > 70:
        return 'Extreme weather alert';
      default:
        return 'No information provided';
    }
  }
}
