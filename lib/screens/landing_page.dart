import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_scheduler/provider/scheduling_provider.dart';
import 'package:weekly_scheduler/screens/scheduling_page.dart';

class LandingPage extends StatelessWidget {
  static const route = '/';
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Scheduler'),
      ),
      body: Center(
        child: Consumer<SchedulingProvider>(builder: (context, provider, _) {
          String text = provider.getAvailability();
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hi Jose ${text.isNotEmpty ? 'you are available in $text' : 'no schedule found'}',
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, SchedulingPage.route),
                child: Text(text.isNotEmpty ? 'Edit schedule' : 'Add Schedule'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
