class UvIndexes {
  static String uvRange(double uvIndex) {
    switch (uvIndex) {
      case < 2:
        return "Low";
      case < 5 && >= 2:
        return "Moderate";
      case < 7 && >= 5:
        return "High";
      case < 10 && >= 7:
        return "Very High";
      case >= 10:
        return "Extreme";
      default:
        return 'Unknown';
    }
  }
}
