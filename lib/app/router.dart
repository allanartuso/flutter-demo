import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/counter.component.dart';

import 'home.dart';

class RouteNames {
  static const String counter = 'counter';
  static const String homeScreen = 'homeScreen';
}

class RouterClass {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.counter:
        return MaterialPageRoute(
            builder: (_) => const CounterComponent(
                  counter: 1,
                ));
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
