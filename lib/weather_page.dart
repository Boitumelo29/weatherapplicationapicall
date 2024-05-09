import 'package:flutter/material.dart';
import 'package:weatherapplicationapicall/data_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final DataServices dataServices = DataServices();
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            TextField(
              controller: search,
            ),
            const SizedBox(),
            ElevatedButton(
                onPressed: () {
                  dataServices.getWeather(search.text);
                  print(search.text);
                },
                child: Text("Search"))
          ],
        ),
      ),
    );
  }
}
