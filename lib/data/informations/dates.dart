class Dates {
  static final dates = {
    '1': 'Jan',
    '2': 'Feb',
    '3': 'Mar',
    '4': 'Apr',
    '5': 'May',
    '6': 'Jun',
    '7': 'Jul',
    '8': 'Aug',
    '9': 'Sep',
    '10': 'Oct',
    '11': 'Nov',
    '12': 'Dec',
  };
  static String todayDate(String date) {
    List parsedDate = date.split('-');
    String day = parsedDate.last;
    String month = parsedDate[1];
    return '${dates[month.toString()]} $day';
  }
}
