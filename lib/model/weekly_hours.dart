class WeeklyHours {
  String day;
  bool isActive;
  List<String> availableTimes;
  WeeklyHours(
      {required this.day, this.isActive = false, required this.availableTimes});
}
