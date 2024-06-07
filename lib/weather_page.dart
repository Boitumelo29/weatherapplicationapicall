import 'package:flutter/material.dart';
import 'package:weatherapplicationapicall/data_service.dart';
import 'package:weatherapplicationapicall/models.dart';

class WeatherPage extends StatefulWidget {
  final String? city;

  const WeatherPage({super.key, this.city});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final DataServices dataServices = DataServices();
  final TextEditingController search = TextEditingController();

  late Future<WeatherResponse> dataService;
  bool _isLoading = false;
  WeatherResponse? weatherResponse;

  @override
  void initState() {
    super.initState();
    dataService = dataServices.getWeatherResponse(widget.city ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherResponse>(
      future: dataService,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final weather = snapshot.data!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.sunny,
                  size: 30,
                  color: Colors.yellow,
                ),
                Text(weather.description),
                const SizedBox(height: 10),
                TextField(
                  controller: search,
                  decoration: const InputDecoration(
                    hintText: 'Enter city',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _loadWeather(search.text);
                  },
                  child: const Text("Search"),
                ),
                _isLoading
                    ? const CircularProgressIndicator()
                    : weatherResponse != null
                        ? Text(weatherResponse!.description)
                        : Container(
                            color: Colors.amber,
                            height: 50,
                            width: 50,
                          ),
              ],
            ),
          );
        }
        return const Text('No data');
      },
    );
  }

  Future<void> _loadWeather(String city) async {
    setState(() {
      _isLoading = true;
    });

    try {
      var weather = await dataServices.getWeatherResponse(city);
      setState(() {
        weatherResponse = weather;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print(e);
    }
  }
}
