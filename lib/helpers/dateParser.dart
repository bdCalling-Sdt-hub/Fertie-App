class DateParser {
  // Parse date string to DateTime object
  DateTime parseDate(String dateString) {

    List<String> parts = dateString.split('-');
    int year = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int day = int.parse(parts[2]);


    return DateTime(year, month, day);
  }


  // Generate date parser calls
  static List<String> generateDateParserCalls(List<dynamic> data) {
    List<String> dateCalls = [];

    for (var item in data) {
      DateTime startDate = DateTime.parse(item['startDate']);
      DateTime endDate = DateTime.parse(item['endDate']);

      while (startDate.isBefore(endDate) || startDate.isAtSameMomentAs(endDate)) {
        dateCalls.add('DateParser().parseDate("${startDate.toIso8601String().split('T')[0]}")');
        startDate = startDate.add(Duration(days: 1));
      }
    }

    return dateCalls;
  }

}


