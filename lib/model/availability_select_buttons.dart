import 'package:flutter/material.dart';
import 'package:weekly_scheduler/model/weekly_hours.dart';
import 'package:weekly_scheduler/provider/scheduling_provider.dart';
import 'package:weekly_scheduler/widgets/availability_outlined_button.dart';

class AvailabilitySelectButtons extends StatelessWidget {
  final WeeklyHours weeklyHours;
  final int index;
  final SchedulingProvider provider;
  const AvailabilitySelectButtons({
    required this.weeklyHours,
    required this.index,
    required this.provider,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AvailabilityOutlinedButton(
            isActive: weeklyHours.availableTimes.contains('Morning'),
            title: 'Morning',
            onPressed: () => provider.setAvailableTime(
              index: index,
              selectedTime: 'Morning',
            ),
          ),
          AvailabilityOutlinedButton(
            isActive: weeklyHours.availableTimes.contains('Afternoon'),
            title: 'Afternoon',
            onPressed: () => provider.setAvailableTime(
              index: index,
              selectedTime: 'Afternoon',
            ),
          ),
          AvailabilityOutlinedButton(
            isActive: weeklyHours.availableTimes.contains('Evening'),
            title: 'Evening',
            onPressed: () => provider.setAvailableTime(
              index: index,
              selectedTime: 'Evening',
            ),
          ),
        ],
      ),
    );
  }
}
