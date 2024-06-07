class WeatherResponse {
  final String description;

  WeatherResponse({required this.description});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    // Add a null check for the 'weather' key
    if (json['weather'] != null && json['weather'].isNotEmpty) {
      return WeatherResponse(
        description: json['weather'][0]['description'] ?? 'No description',
      );
    } else {
      throw "Invalid weather data";
    }
  }
}