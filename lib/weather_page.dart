import 'package:flutter/material.dart';
import 'package:weatherapplicationapicall/data_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final DataServices dataServices = DataServices();

  @override
  Widget build(BuildContext context) {
    dataServices.getWeather;
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.sunny,
              size: 30,
              color: Colors.yellow,
            ),
            Text("The date"),
            SizedBox(),
            TextField(),
            SizedBox(),
            // ElevatedButton(
            //     onPressed: () => DataServices.getWeather(""),
            //     child: Text("Search"))
          ],
        ),
      ),
    );
  }
}
