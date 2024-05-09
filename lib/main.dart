import 'package:flutter/material.dart';
import 'package:weatherapplicationapicall/data_service.dart';
import 'package:weatherapplicationapicall/weather_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DataServices dataServices = DataServices();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    dataServices.getWeather("pretoria");
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}
