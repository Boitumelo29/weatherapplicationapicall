class WeatherResponse {
  final String main;
  final String description;

  WeatherResponse({required this.main, required this.description});

  @override
  String toString() {
    return 'WeatherResponse(description: $description, main: $main)';
  }
}
