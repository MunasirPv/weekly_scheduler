import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  static const route = '/';
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Scheduler'),
      ),
    );
  }
}
