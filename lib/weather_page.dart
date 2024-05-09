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
            const Icon(
              Icons.sunny,
              size: 30,
              color: Colors.yellow,
            ),
            const Text("The date"),
            const SizedBox(),
            const TextField(),
            const SizedBox(),
            // ElevatedButton(
            //     onPressed: () => DataServices.getWeather(""),
            //     child: Text("Search"))
          ],
        ),
      ),
    );
  }
}
