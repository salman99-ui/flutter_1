import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/detail.dart';
import 'package:flutter_application_1/screens/main.dart';

import 'data/model/restaurant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/main', routes: {
      '/main': (context) => Main(),
      '/detail': (context) =>
          Detail(ModalRoute.of(context)?.settings.arguments as restaurant)
    });
  }
}
