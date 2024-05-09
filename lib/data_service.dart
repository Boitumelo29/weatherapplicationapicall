import 'package:http/http.dart' as http;

class DataServices {
  getWeather() {
    var response = http.get(Uri.https(''));
  }
}
