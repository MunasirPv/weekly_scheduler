import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_scheduler/model/availability_select_buttons.dart';
import 'package:weekly_scheduler/model/weekly_hours.dart';
import 'package:weekly_scheduler/provider/scheduling_provider.dart';

class SchedulingPage extends StatelessWidget {
  static const route = '/schedulingPage';
  const SchedulingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<SchedulingProvider>(context).init();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set your weekly hours'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Consumer<SchedulingProvider>(
            builder: (context, provider, _) {
              return ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                itemCount: provider.tempList.length,
                itemBuilder: (context, index) {
                  WeeklyHours weeklyHours = provider.tempList.elementAt(index);
                  return Row(
                    children: [
                      IconButton(
                        onPressed: () => provider.setDayActive(
                          index: index,
                          value: !weeklyHours.isActive,
                        ),
                        icon: const Icon(Icons.check_circle),
                        color:
                            weeklyHours.isActive ? Colors.green : Colors.grey,
                      ),
                      Text(
                        weeklyHours.day.substring(0, 3).toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      weeklyHours.isActive
                          ? AvailabilitySelectButtons(
                              weeklyHours: weeklyHours,
                              index: index,
                              provider: provider,
                            )
                          : const Text(
                              'Unavailable',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton(
              onPressed: () async {
                await Provider.of<SchedulingProvider>(context, listen: false)
                    .saveAvailability();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Saved successfully')),
                );
                Navigator.pop(context);
              },
              child: const Text('Save'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                shape: const StadiumBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
