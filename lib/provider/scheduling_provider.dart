import 'package:flutter/material.dart';
import 'package:weekly_scheduler/model/weekly_hours.dart';

enum AvailableTime { morning, afternoon, evening }

class SchedulingProvider extends ChangeNotifier {
  List<WeeklyHours> availability = [
    WeeklyHours(day: 'Sunday', availableTimes: []),
    WeeklyHours(day: 'Monday', availableTimes: []),
    WeeklyHours(day: 'Tuesday', availableTimes: []),
    WeeklyHours(day: 'Wednesday', availableTimes: []),
    WeeklyHours(day: 'Thursday', availableTimes: []),
    WeeklyHours(day: 'Friday', availableTimes: []),
    WeeklyHours(day: 'Saturday', availableTimes: []),
  ];

  List<WeeklyHours> tempList = [
    WeeklyHours(day: 'Sunday', availableTimes: []),
    WeeklyHours(day: 'Monday', availableTimes: []),
    WeeklyHours(day: 'Tuesday', availableTimes: []),
    WeeklyHours(day: 'Wednesday', availableTimes: []),
    WeeklyHours(day: 'Thursday', availableTimes: []),
    WeeklyHours(day: 'Friday', availableTimes: []),
    WeeklyHours(day: 'Saturday', availableTimes: []),
  ];

  init() {
    tempList = availability;
  }

  setDayActive({required int index, required bool value}) {
    tempList.elementAt(index).isActive = value;
    notifyListeners();
  }

  setAvailableTime({
    required int index,
    required String selectedTime,
  }) {
    List<String> currentAvailability = tempList.elementAt(index).availableTimes;
    if (currentAvailability.contains(selectedTime)) {
      currentAvailability.remove(selectedTime);
    } else {
      currentAvailability.add(selectedTime);
    }
    tempList.elementAt(index).availableTimes = currentAvailability;
    notifyListeners();
  }

  Future<void> saveAvailability() async {
    availability = tempList;
    notifyListeners();
  }

  String getAvailability() {
    StringBuffer availableTime = StringBuffer();
    for (var weeklyHours in availability) {
      if (weeklyHours.isActive && weeklyHours.availableTimes.isNotEmpty) {
        availableTime.write(weeklyHours.day + ' ');
        if (weeklyHours.availableTimes.length == 3) {
          availableTime.write('whole day ');
        } else {
          availableTime.write(weeklyHours.availableTimes.join(' and ') + ' ');
        }
      }
    }
    return availableTime.toString();
  }
}
