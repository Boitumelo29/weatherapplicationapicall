import 'package:http/http.dart' as http;

class DataServices {
// here is an example from the documantion on how to create a reponse
//Example: var uri = Uri.https('example.org', '/path', {'q': 'dart'});
//print(uri); // https://example.org/path?q=dart

  //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

  getWeather() async {
    // final query = {
    //   'q': city,
    // };

    var uri = Uri.https('api.openweathermap.org',
        'data/2.5/weather?q={pretoria}&appid={0f358f8ead9086a975c9b39a8e5c24ac}');

    final response = await http.get(uri);

    print(response.body);
  }
}
