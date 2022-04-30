import 'package:flutter/material.dart';
import 'package:weekly_scheduler/screens/landing_page.dart';
import 'package:weekly_scheduler/screens/scheduling_page.dart';

Map<String, WidgetBuilder> appRoutes() => {
      LandingPage.route: (_) => const LandingPage(),
      SchedulingPage.route: (_) => const SchedulingPage(),
    };
