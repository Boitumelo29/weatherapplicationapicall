import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapplicationapicall/models.dart';

class DataServices {
  Future getWeather(String city) async {
    final queryParameter = {
      'q': city,
      'appid': '8c8f8923313f68c43178b3dc5ba084a8'
    };
    final uri =
        Uri.https('api.openweathermap.org', 'data/2.5/weather', queryParameter);

    final response = await http.get(uri);

    print("Weather data for city: $city");
    print("Response body: ${response.body}");

    var jsonData = jsonDecode(response.body);

    final weatherData = jsonData['weather'][0];

    final test = WeatherResponse(
        description: weatherData['description'], main: weatherData['main']);
    print(test.toString());
  }
}
