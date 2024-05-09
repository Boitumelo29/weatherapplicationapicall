import 'package:flutter/material.dart';
import 'package:weatherapplicationapicall/data_service.dart';
import 'package:weatherapplicationapicall/weather_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}
