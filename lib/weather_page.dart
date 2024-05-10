import 'package:flutter/material.dart';
import 'package:weatherapplicationapicall/data_service.dart';
import 'package:weatherapplicationapicall/models.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

bool _isLoading = false;
WeatherResponse? weatherResponse;

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
            Text(search.text),
            const SizedBox(),
            TextField(
              controller: search,
            ),
            const SizedBox(),
            ElevatedButton(
                onPressed: () {
                  _loadWeather(search.text);
                  print(search.text);
                },
                child: Text("Search")),
            _isLoading
                ? const CircularProgressIndicator()
                : weatherResponse != null
                    ? Text(weatherResponse!.description)
                    : Container(
                        color: Colors.amber,
                      ),
          ],
        ),
      ),
    );
  }

  Future<void> _loadWeather(String city) async {
    setState(() {
      _isLoading = true;
    });
    DataServices dataServices = DataServices();

    try {
      var weather = await dataServices.getWeather(city);
      setState(() {
        weatherResponse = weather;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }
}

  // Future<void> _loadWeather(String city) async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   DataServices dataServices = DataServices();

  //   try {
  //     var weather = await dataServices.getWeather(city);
  //     setState(() {
  //       weatherResponse = weather;
  //       _isLoading = false;
  //     });
  //   } catch (e) {
  //     print('Failed to load weather: $e'); // Log the error
  //     setState(() {
 
  //     });
  //   }
  // }