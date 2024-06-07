class WeatherResponse {
  final String main;
  final String description;

  WeatherResponse({required this.main, required this.description});

  factory WeatherResponse.toJson(Map<String, dynamic> json) {
    var weather = json['weather'];
    return WeatherResponse(
        main: weather['main'], description: weather['description']);
  }

  @override
  String toString() {
    return 'WeatherResponse(description: $description, main: $main)';
  }
}
