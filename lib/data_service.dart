import 'package:http/http.dart' as http;

class DataServices {
// here is an example from the documantion on how to create a reponse
//Example: var uri = Uri.https('example.org', '/path', {'q': 'dart'});
//print(uri); // https://example.org/path?q=dart

  //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

  getWeather(String city) async {
    final queryParameter = {
      'q': city,
      'appid': '8c8f8923313f68c43178b3dc5ba084a8'
    };
    final uri =
        Uri.https('api.openweathermap.org', 'data/2.5/weather', queryParameter);

    final response = await http.get(uri);

    print("my response ${response.body}");
  }
}
