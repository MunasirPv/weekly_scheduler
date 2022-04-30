import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_scheduler/provider/scheduling_provider.dart';
import 'package:weekly_scheduler/screens/landing_page.dart';
import 'package:weekly_scheduler/util/app_routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SchedulingProvider>(
            create: (_) => SchedulingProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weekly Scheduler',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: LandingPage.route,
      routes: appRoutes(),
    );
  }
}
