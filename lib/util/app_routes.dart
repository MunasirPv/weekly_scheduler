import 'package:flutter/material.dart';
import 'package:weekly_scheduler/screens/landing_page.dart';

Map<String, WidgetBuilder> appRoutes() => {
      LandingPage.route: (_) => const LandingPage(),
    };
