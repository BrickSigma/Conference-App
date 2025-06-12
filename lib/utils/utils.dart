String dateToString(DateTime date) {
  int day = date.day;
  String dayPosition;

  switch (day % 10) {
    case 1:
      dayPosition = "st";
      break;
    case 2:
      dayPosition = "nd";
      break;
    case 3:
      dayPosition = "rd";
      break;
    default:
      dayPosition = "th";
      break;
  }

  final List<String> months = [
    "January",
    "Febuary",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "Semptember",
    "October",
    "November",
    "December",
  ];

  String month = months[date.month - 1];

  return "$month $day$dayPosition";
}

String formatTime(DateTime date) {
  String hour = date.hour.toString().padLeft(2, '0');
  String min = date.minute.toString().padLeft(2, '0');
  String ampm = date.hour >= 12 ? "pm" : "am";

  return "$hour:$min $ampm";
}
