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

  Future<WeatherResponse> getWeatherResponse(String city) async {
    final queryParameter = {
      'q': city,
      'appid': '683a928354e9a6a491bf5e5e8f6cdc2d'
    };
    final uri =
        Uri.https('api.openweathermap.org', 'data/2.5/weather', queryParameter);

    final response = await http.get(uri);
    
    if(response.statusCode == 200){
      return WeatherResponse.toJson(json.decode(response.body));
    }

    throw "error";
  }
}
